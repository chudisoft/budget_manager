class Entity < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id',class_name: 'User' # Ensure correct association with the User model
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true
end
