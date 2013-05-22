require 'spec_helper'

describe 'Concern Activities' do
  
  describe 'index' do
    
    before(:each) do
      @concern = FactoryGirl.create(:concern)
      visit concerns_path
    end

    it 'should show a list of concerns' do
      page.should have_content('Recent Concerns')
      page.should have_link('Edit')
    end

    it 'should delete a concern' do
      find('#concern-item').click_link('Delete')
      page.should have_content('Recent Concerns')
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
      fill_in 'Name', with: ''
      fill_in 'Description', with: ''
      fill_in 'Location', with: ''
			click_button 'Submit'
      page.should have_content('Raise a Concern')
      page.should have_selector('form')
    end

    it 'should make a new concern' do
			fill_in 'Name', with: 'No service delivery in Braamfontein'
			fill_in 'Description', with: 'We are tired of not receiving basic services in our town.'
			fill_in 'Location', with: 'Braamfontein, Johannesburg, South Africa'
			click_button 'Submit'
			page.should have_selector('div#success')
      page.should have_content('Recent Concerns')
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
		
		it 'should not save edits to a concern with the wrong details' do
			fill_in 'Name', with: ''
			fill_in 'Description', with: ''
			fill_in 'Location', with: ''
			click_button 'Submit'
			page.should have_content('Edit a Concern')
	  end

	  it 'should save edits to a concern' do
			fill_in 'Name', with: 'No service delivery in Sandhurst'
			fill_in 'Description', with: 'OH.. MY... GOD.. The laaaights are aaout doll.'
			fill_in 'Location', with: 'Sandhurst, Sandton, South Africa'
			click_button 'Submit'
			page.should have_selector('div#success')
      page.should have_content('Recent Concerns')
	  end
	end


end
