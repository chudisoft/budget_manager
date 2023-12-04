# frozen_string_literal: true

# This Class handles operations related to Entity Migration
class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount

      t.timestamps
    end

    create_join_table :entities, :groups do |t|
      t.index [:entity_id, :group_id]
      t.index [:group_id, :entity_id]
    end
  end
end
