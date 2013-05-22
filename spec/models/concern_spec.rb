require 'spec_helper'
require 'vcr'

describe Concern do
  it 'should have a valid factory' do
    VCR.use_cassette 'features/concern_model/concern' do
  	 FactoryGirl.create(:concern).should be_valid
    end
  end

  it 'should have a location' do
    FactoryGirl.build(:concern, location: nil).should_not be_valid
  end

  it 'should have a name' do
    FactoryGirl.build(:concern, name: nil).should_not be_valid
  end

  it 'should have a description' do
    FactoryGirl.build(:concern, description: nil).should_not be_valid
  end

  it 'should auto-generate a reference' do
    VCR.use_cassette 'features/concern_model/concern' do
    	@concern = FactoryGirl.create(:concern)
    	@concern.reference_code.should_not eq nil
    end
  end

  it 'should geolocate based on the location field' do
    VCR.use_cassette 'features/concern_model/concern' do
    	@concern = FactoryGirl.create(:concern)
    	@concern.longitude.should_not eq nil
    end
  end

end
