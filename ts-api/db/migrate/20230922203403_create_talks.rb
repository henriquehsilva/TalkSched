class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|
      t.text :description
      t.datetime :time
      t.integer :duration

      t.timestamps
    end
  end
end
