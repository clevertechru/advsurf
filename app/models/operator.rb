class Operator
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  field :id,          type: Integer
  field :title,       type: String
  field :comment,     type: String
  field :site_url,    type: String
  field :rating,      type: Integer
  field :controller,  type: String
end
