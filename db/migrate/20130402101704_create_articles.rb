class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :blog

      t.timestamps
    end
    add_index :articles, :blog_id
  end
end
