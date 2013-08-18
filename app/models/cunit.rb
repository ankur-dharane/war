class Cunit < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :points
end
