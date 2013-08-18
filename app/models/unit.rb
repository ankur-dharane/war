class Unit < ActiveRecord::Base
  attr_accessible :name, :clicked_id
  belongs_to :user
  has_many :points
end
