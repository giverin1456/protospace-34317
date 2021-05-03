class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.references :user, foreign_key: true
      # userを参照するために追加
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.timestamps
    end
  end
end