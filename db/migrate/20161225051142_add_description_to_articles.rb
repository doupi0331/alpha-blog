class AddDescriptionToArticles < ActiveRecord::Migration[5.0]
  def change
  	# table name, column name, column type
  	add_column :articles, :description, :text
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :upeated_at, :datetime
  end
end
