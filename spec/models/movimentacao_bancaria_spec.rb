#Fonte de exemplos: https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
require "rails_helper"

RSpec.describe MovimentacaoBancaria, :type => :model do
  subject {
    described_class.new(numero_conta: 123, valor: 150, tipo_movimentacao: 'Transferência', usuario: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without valor" do
    subject.valor = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without tipo_movimentacao" do
    subject.tipo_movimentacao = nil
    expect(subject).to_not be_valid
  end

end