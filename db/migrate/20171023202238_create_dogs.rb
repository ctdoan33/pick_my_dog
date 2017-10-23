class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :size
      t.string :weight
      t.string :energy_needs
      t.string :grooming_per_month
      t.string :pet_compatibility
      t.string :feed_cost_weekly
      t.text :description

      t.timestamps null: false
    end
  end
end
