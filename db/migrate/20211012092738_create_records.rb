class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :day
      t.time :begin
      t.time :finish
      t.time :break
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
