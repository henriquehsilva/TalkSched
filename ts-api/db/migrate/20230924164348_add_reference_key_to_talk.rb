class AddReferenceKeyToTalk < ActiveRecord::Migration[7.0]
  def change
    add_reference :talks, :track, index: false, foreign_key: true
  end
end
