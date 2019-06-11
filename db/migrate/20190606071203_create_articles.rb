class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :spa_name
      t.date :date
      t.string :article_image_id
      t.text :impression
      t.integer :value
      t.string :spa_address
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
