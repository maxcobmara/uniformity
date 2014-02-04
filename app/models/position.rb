class Position < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
end
