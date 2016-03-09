class PinCategory < ActiveRecord::Base 
  belongs_to :pin
  belongs_to :category 
end