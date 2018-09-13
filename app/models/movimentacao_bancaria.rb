class MovimentacaoBancaria < ApplicationRecord
  validates :valor, presence: true
  validates :tipo_movimentacao, presence: true
end
