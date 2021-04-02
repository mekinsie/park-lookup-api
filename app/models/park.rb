class Park < ApplicationRecord
  belongs_to :state
  validates :name, :presence => true
  validates :park_type, :presence => true
end