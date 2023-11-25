# This Class handles operations related to Entity
class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id' # Ensure correct association with the User model
  # has_and_belongs_to_many :groups
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
