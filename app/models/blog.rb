class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :edition, type: String

  has_and_belongs_to_many :users

  




end
