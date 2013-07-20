class User
  include Mongoid::Document
  #extend Rolify
  rolify

  include Mongoid::Paranoia
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable

  field :name,                type: String
  field :email,               type: String, default: ''
  field :encrypted_password,  type: String, default: ''
  field :remember_me,         type: Boolean, default: true
  field :remember_created_at, type: Time
  field :confirmed_at,        type: Time
  field :confirmation_sent_at,type: Time
  field :sign_in_count,       type: Integer, default: 0
  field :current_sign_in_at,  type: Time
  field :last_sign_in_at,     type: Time
  field :current_sign_in_ip,  type: String
  field :last_sign_in_ip,     type: String
  field :reset_password_token,type: String, default: ''
  field :reset_password_sent_at,type: Time
  field :role_ids


  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :encrypted_password
  attr_accessible :role_ids, :as => :admin

  has_many :authentications, :dependent => :delete
  embeds_one :role, validate: false
  validates :role, :presence => true

  index({ email: 1 }, { background: true })
  index({ 'role.name' => 1 }, { background: true })
  index({ 'role.role_id' => 1 }, { background: true })

  delegate \
    :admin?,
    :subscriber?,
    :visitor?, to: :role

  Reference::Role::TYPES.each do |name|

    # Get all the users for the application for this role.
    #
    # @example Get the administrators.
    #   User.admins
    #
    # @example Get the subscribers.
    #   User.subscribers
    #
    # @return [ Array<User> ] The matching users.
    scope "#{name}s", where("role.name" => name.to_s)
  end

  # Does the user have the ability to perform the supplied action?
  #
  # @example Can the user act?
  #   user.able_to?("manage.users")
  #
  # @param [ String ] action The action to check.
  #
  # @return [ true, false ] If the user can act.
  def able_to?(action)
    role.able_to?(action, self)
  end

  # Gets the name of this user. If a handle was provided it uses that,
  # otherwise returns the first and last names.
  #
  # @example Get the user's name.
  #   user.name
  #
  # @return [ String ] The user name.
  #def name
  #  self.handle ||= "#{first_name} #{last_name}".strip
  #end


  # ===================================== #
  # ===================================== #
  # ==========  USER METHODS  =========== #
  # ===================================== #
  # ===================================== #
  def apply_omniauth(omniauth, confirmation)
    self.email = omniauth['info']['email'] if email.blank?
    # Check if email is already into the database => user exists
    apply_trusted_services(omniauth, confirmation) if self.new_record?
  end

  # Create a new user
  def apply_trusted_services(omniauth, confirmation)
    # Merge user_info && extra.user_info
    user_info = omniauth['info']
    if omniauth['extra'] && omniauth['extra']['user_hash']
      user_info.merge!(omniauth['extra']['user_hash'])
    end
    # try name or nickname
    if self.name.blank?
      self.name   = user_info['name']   unless user_info['name'].blank?
      self.name ||= user_info['nickname'] unless user_info['nickname'].blank?
      self.name ||= (user_info['first_name']+" "+user_info['last_name']) unless \
        user_info['first_name'].blank? || user_info['last_name'].blank?
    end
    if self.email.blank?
      self.email = user_info['email'] unless user_info['email'].blank?
    end
    # Set a random password for omniauthenticated users
    self.password, self.password_confirmation = Devise.friendly_token
    if (confirmation)
      self.confirmed_at, self.confirmation_sent_at = Time.now
    end
  end


  # ===================================== #
  # ===================================== #
  # ========  OVERWRITE METHODS  ======== #
  # ===================================== #
  # ===================================== #
  def update_with_password(params={})
    current_password = params.delete(:current_password)
    check_password = true
    if params[:password].blank?
      params.delete(:password)
      if params[:password_confirmation].blank?
        params.delete(:password_confirmation)
        check_password = false
      end
    end
    result = if valid_password?(current_password) || !check_password
               update_attributes(params)
             else
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               self.attributes = params
               false
             end
    clean_up_passwords
    result
  end
end
