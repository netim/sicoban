#Fonte de exemplos: https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
require "rails_helper"

RSpec.describe Usuario, :type => :model do
  subject {
    described_class.new(nome: "João Ninguém", email: "joao@ninguem.com", password: '123456')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without nome" do
    subject.nome = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without valid email" do
    subject.email = "abc"
    expect(subject).to_not be_valid
  end

  it "is not valid without password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end