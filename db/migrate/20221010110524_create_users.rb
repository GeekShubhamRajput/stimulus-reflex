class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :age, default: 18

      t.timestamps
    end
  end
end
