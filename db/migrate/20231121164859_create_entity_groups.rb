# frozen_string_literal: true

# This Class handles operations related to Entity Migration
class CreateEntityGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_groups do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      # Add any additional attributes related to the relationship

      t.timestamps
    end
  end
end
