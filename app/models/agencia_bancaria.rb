class AgenciaBancaria < ApplicationRecord
  validates :numero, presence: true
  validates :endereco, presence: true
end
