require 'spec_helper'

describe Concern do
  it 'should have a valid factory' do
  	FactoryGirl.create(:concern).should be_valid
  end

  it 'should have a location' do
    @concern = FactoryGirl.build(:concern, location: nil).should_not be_valid
  end

  it 'should have a name' do
    FactoryGirl.build(:concern, name: nil).should_not be_valid
  end

  it 'should have a description' do
    FactoryGirl.build(:concern, description: nil).should_not be_valid
  end

  it 'should auto-generate a reference' do
  	@concern = FactoryGirl.create(:concern)
  	@concern.reference_code.should_not eq ('' || nil)
  end

  it 'should geolocate based on the location field' do
  	@concern = FactoryGirl.create(:concern)
  	@concern.longitude.should_not eq ('' || nil)
    
  end

end
