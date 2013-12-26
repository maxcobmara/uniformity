class KitUniform < ActiveRecord::Base
  belongs_to :uniform_item,  :foreign_key => 'uniform_id'
  belongs_to :kit
end
