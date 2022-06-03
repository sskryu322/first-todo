class CreateMylists < ActiveRecord::Migration[6.0]
  def change
    create_table :mylists do |t|
      t.string :title, null: false
      t.datetime :start_time
      t.string :text, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
