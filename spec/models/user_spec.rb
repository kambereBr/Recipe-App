require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Bruno', email: 'brunokambere@gmail', password: 123_456, password_confirmation: 123_456) }

  before { subject.save }

  it 'Should have a valid name' do
    expect(subject.name).to be_present
  end
  it 'Should have a valid email' do
    expect(subject.email).to be_present
  end
  it 'Should have a valid password' do
    expect(subject.password).to be_present
  end
end
