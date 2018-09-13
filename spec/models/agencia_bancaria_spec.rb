#Fonte de exemplos: https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
require "rails_helper"

RSpec.describe AgenciaBancaria, :type => :model do
  subject {
    described_class.new(numero: "123", endereco: "Rua Sem Nome")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without numero" do
    subject.numero = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without endereco" do
    subject.endereco = nil
    expect(subject).to_not be_valid
  end

end