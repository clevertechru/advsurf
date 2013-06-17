require 'mongoid'
class User
  include Mongoid::Document
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable
  field :name
  field :email
  field :password
  field :encrypted_password
  field :remember_me
  field :confirmed_at
  field :confirmation_sent_at
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip
  field :sign_in_count
  field :all_of

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :encrypted_password
  attr_accessible :role_ids, :as => :admin

  has_many :authentications, :dependent => :delete

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
