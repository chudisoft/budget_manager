# This Class handles operations related to User Record
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :entities

  validates :fname, presence: true, length: { minimum: 3, maximum: 50 }
  validate :fullname

  def fullname
    return unless fname.present? && fname.split.size != 2

    errors.add(:fname, 'must contain two names separated by a space')
  end
end
