class CreateMovimentacaoBancaria < ActiveRecord::Migration[5.2]
  def change
    create_table :movimentacao_bancaria do |t|
      t.integer :numero_conta, null: false
      t.datetime :data_movimentacao, null: false
      t.decimal :valor, null: false, default: 0
      t.string :tipo_movimentacao, null: false
      t.integer :usuario, null: false
    end
    add_foreign_key :movimentacao_bancaria, :conta_bancaria, column: :numero_conta, primary_key: :numero
    add_foreign_key :movimentacao_bancaria, :usuarios, column: :usuario, primary_key: :id
  end
end
