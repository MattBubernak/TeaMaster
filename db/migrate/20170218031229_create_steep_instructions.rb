class CreateSteepInstructions < ActiveRecord::Migration
  def change
    create_table :steep_instructions do |t|
      t.string :temperature
      t.integer :time
      t.belongs_to :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
