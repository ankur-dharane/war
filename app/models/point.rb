class Point < ActiveRecord::Base
  attr_accessible :attack_speed, :accuracy, :speed, :attack_damage, :defense

  belongs_to :unit
end
