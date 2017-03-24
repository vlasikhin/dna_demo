require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :name }
  it { should validate_presence_of :surname }
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :city }
  it { should validate_presence_of :address }

  it { should validate_length_of(:name).is_at_least(2).is_at_most(20) }
  it { should validate_length_of(:surname).is_at_least(2).is_at_most(30) }
  it { should validate_length_of(:phone_number).is_at_least(3).is_at_most(20) }
  it { should validate_length_of(:city).is_at_least(3).is_at_most(20) }
  it { should validate_length_of(:address).is_at_least(3).is_at_most(150) }

  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
end
