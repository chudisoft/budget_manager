# This Class handles operations related to Group
class Group < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :entities
  has_many :entities

  validates :name, presence: true
end
