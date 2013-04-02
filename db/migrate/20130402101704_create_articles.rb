class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.datetime :published_at
      t.references :blog

      t.timestamps
    end
    add_index :articles, :blog_id
  end
end
