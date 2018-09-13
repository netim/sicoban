class ContaBancaria < ApplicationRecord
  validates :numero, presence: true
  validates :limite, presence: true
end
