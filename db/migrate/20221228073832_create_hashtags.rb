class CreateHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags do |t|
      t.string :name

      t.timestamps
      t.index ["name"], name: "index_hashtags_on_name", unique: true
    end
  end
end
