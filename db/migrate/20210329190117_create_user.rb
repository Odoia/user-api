class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :cpf
      t.integer :age

      t.timestamps
    end
  end
end
