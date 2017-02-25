class ChangeTemperatureToIntegerOnSteepInstruction < ActiveRecord::Migration
  def change
    remove_column :steep_instructions, :temperature
    add_column :steep_instructions, :temperature, :integer
  end
end
