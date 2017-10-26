class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :breed
      t.string :size
      t.string :weight
      t.string :height
      t.string :life_span
      t.string :aka
      t.string :group
      t.string :origin
      t.string :role
      t.text :facts
      t.text :behavior
      t.text :health_concerns
      t.string :activity
      t.string :grooming
      t.boolean :pic_available
      t.string :pic_name
      t.boolean :friendly
      t.boolean :novice
      t.string :shelter_name

      t.timestamps null: false
    end
  end
end
