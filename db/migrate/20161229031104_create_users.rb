class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.timestamps # 增加新增時間及更動時間
    end
  end
end
