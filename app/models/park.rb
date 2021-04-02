class Park < ApplicationRecord
  belongs_to :state
  validates :name, :presence => true
  validates :type, :presence => true
end