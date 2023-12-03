# This Class handles operations related to Entity
class EntityGroup < ApplicationRecord
  belongs_to :entity
  belongs_to :group
end
