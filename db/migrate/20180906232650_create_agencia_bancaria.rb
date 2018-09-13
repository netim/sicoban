class CreateAgenciaBancaria < ActiveRecord::Migration[5.2]
  def change
    create_table :agencia_bancaria do |t|
      t.integer :numero
      t.text :endereco
    end
    add_index :agencia_bancaria, :numero, unique: true
  end
end
