class Import
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id,        type: Integer
  field :file_name, type: String
  field :file_size, type: String
  field :file_hash, type: String
  field :file_items,type: Integer
  field :file_type, type: String

  attr_accessible :file_name, :file_size, :file_hash, :file_type, :file_items

end
