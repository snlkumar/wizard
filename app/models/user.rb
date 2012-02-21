class User < ActiveRecord::Base
  has_many :awards
  validates :name, :presence => true
  accepts_nested_attributes_for :awards
  # attr_accessible :awards_attributes
end
