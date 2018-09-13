class CreateContaBancaria < ActiveRecord::Migration[5.2]
  def change
    create_table :conta_bancaria do |t|
      t.integer :numero_agencia, null: false
      t.integer :numero, null: false
      t.integer :limite, null: false
    end
    add_index :conta_bancaria, :numero, unique: true
    add_foreign_key :conta_bancaria, :agencia_bancaria, column: :numero_agencia, primary_key: :numero
  end
end
