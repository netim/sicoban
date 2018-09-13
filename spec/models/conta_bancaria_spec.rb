#Fonte de exemplos: https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
require "rails_helper"

RSpec.describe ContaBancaria, :type => :model do
  subject {
    described_class.new(numero_agencia: 15, numero: 199, limite: 500)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without numero" do
    subject.numero = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without limite" do
    subject.limite = nil
    expect(subject).to_not be_valid
  end

end