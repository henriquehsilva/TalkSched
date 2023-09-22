class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.string :speakers
      t.date :date
      t.integer :time
      t.integer :duration
      t.string :room

      t.timestamps
    end
  end
end
