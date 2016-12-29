class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :articles, :upeated_at, :updated_at
  end
end
