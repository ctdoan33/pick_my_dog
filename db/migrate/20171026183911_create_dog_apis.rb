class CreateDogApis < ActiveRecord::Migration
  def change
    create_table :dog_apis do |t|
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

      t.timestamps null: false
    end
  end
end
