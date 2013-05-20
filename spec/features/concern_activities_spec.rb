require 'spec_helper'

describe 'Concern Activities' do
  
  describe 'index' do
    it 'should show a list of concerns' do
      visit concerns_path
      page.should have_content('Recent concerns')
    end
  end

  describe 'new' do
  	before(:each) do
  		visit new_concern_path
  	end

  	it 'should render a "new" form' do
  	  page.should have_content('Raise a Concern')
  	  page.should have_selector('form')
  	end

  	it 'should not make a new concern with the wrong details' do
  		lambda do
  			click_button 'Submit'
  			page.should have_selector('div.error')
  		end.should_not change(Concern, :count)
    end

    it 'should make a new concern' do
  		lambda do
  			fill_in :name, with: 'No service delivery in Braamfontein'
  			fill_in :description, with: 'We are tired of not receiving basic services in our town.'
  			fill_in :location, with: 'Braamfontein, Johannesburg, South Africa'
  			click_button 'Submit'
  			page.should have_selector('div.success')
  		end.should change(Concern, :count).by(1)
    end
  end

  describe 'edit' do
  	before(:each) do
  		@concern = FactoryGirl.create(:concern)
  		visit edit_concern_path(@concern)
  	end

  	it 'should render an "edit" form' do
  	  page.should have_content('Edit a Concern')
  	  page.should have_selector('form')
  	end
		
		it 'should not make a new concern with the wrong details' do
			lambda do
				fill_in :name, with: ''
				fill_in :description, with: ''
				fill_in :location, with: ''
				click_button 'Submit'
				page.should have_selector('div.error')
			end.should_not change(Concern, :count)
	  end

	  it 'should make a new concern' do
			lambda do
				visit new_concern_path
				fill_in :name, with: 'No service delivery in Sandhurst'
				fill_in :description, with: 'OH.. MY... GOD.. The laaaights are aaout doll.'
				fill_in :location, with: 'Sandhurst, Sandton, South Africa'
				click_button 'Submit'
				page.should have_selector('div.success')
			end.should change(Concern, :count).by(1)
	  end
	end

	describe 'delete' do
	  it 'should delete a concern' do
	  	visit concerns_path
	  	find('#concern-item').click_link('Delete')
	    page.should have_content('Raise a Concern')
	  end
	end
end
