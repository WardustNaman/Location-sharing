require 'rails_helper'

RSpec.describe Status, type: :model do
  before(:each) do 
    @status = build(:status)
  end
  
  describe '#new' do
    it 'should initialize a status with valid attributes' do
      expect(@status.name).to eq('Public')
    end
  end

  describe '#create' do
    it 'should create a status with valid attributes' do
      expect(@status.name).to eq('Public')
    end
  end

  context '#validation' do
    describe '#type' do
      it 'should invalidate null value' do
        status = build(:status, :missing_access_type)
        status.valid?

        expect(status.errors[:name]).to include("can't be blank")
      end

      it 'should invalidate empty string input' do
        status = build(:status, :empty_string_as_access_type)
        status.valid?

        expect(status.errors[:name]).to include("can't be blank")
      end
      it 'should invalidate special characters string' do
        status = build(:status, :invalidate_access_type_with_special_characters)
        status.valid?

        expect(status.errors[:name]).to include("is invalid")
      end
    end
  end
end