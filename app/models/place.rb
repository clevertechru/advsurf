class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  field :id,              type: Integer
  field :hash,            type: String
  field :operator_id,     type: Integer
  field :address,         type: String
  field :address_orig,    type: String
  field :side,            type: String
  field :region,          type: String
  field :gid,             type: String
  field :illumination,    type: Integer
  field :grp,             type: Float
  field :ots,             type: Float
  field :type,            type: String
  field :price,           type: Float
  field :price_rub,       type: Float
  field :price_usd,       type: Float
  field :nds,             type: Integer
  field :photo,           type: String
  field :latitude,        type: Float
  field :longitude,       type: Float
  field :date,            type: String
  field :year_current_1,  type: Integer
  field :year_current_2,  type: Integer
  field :year_current_3,  type: Integer
  field :year_current_4,  type: Integer
  field :year_current_5,  type: Integer
  field :year_current_6,  type: Integer
  field :year_current_7,  type: Integer
  field :year_current_8,  type: Integer
  field :year_current_9,  type: Integer
  field :year_current_10, type: Integer
  field :year_current_11, type: Integer
  field :year_current_12, type: Integer
  field :year_next_1,     type: Integer
  field :year_next_2,     type: Integer
  field :year_next_3,     type: Integer
  field :year_next_4,     type: Integer
  field :year_next_5,     type: Integer
  field :year_next_6,     type: Integer
  field :year_next_7,     type: Integer
  field :year_next_8,     type: Integer
  field :year_next_9,     type: Integer
  field :year_next_10,    type: Integer
  field :year_next_11,    type: Integer
  field :year_next_12,    type: Integer
end
