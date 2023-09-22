class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|
      t.text :description
      t.integer :time

      t.timestamps
    end
  end
end
