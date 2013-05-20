class ConcernsController < ApplicationController
  def index
  	@concerns = Concern.all
  end

  def new
  	@concern = Concern.new
  end

  def edit
  	@concern = Concern.find_by_id(params[:id])
  end

  def create
  	@concern = Concern.new(params[:concern])
  	
  	if @concern.save
  		redirect_to concerns_path, :success => "A new concern has been saved."
  	else
  		flash[:error] = "The concern could not be saved."
  		render 'new'
  	end
  end

  def update
  	@concern = Concern.find_by_id(params[:id])
  	if @concern.update_attributes(params[:concern])
  		redirect_to concerns_path, :success => "A new concern has been saved."
  	else
  		flash[:error] = "The concern could not be updated."
  		render 'edit'
  	end
  end

  def destroy
  	@concern = Concern.find_by_id(params[:id])
    @concern.destroy
    flash[:success] = "Concern removed."
    redirect_to concerns_path
  end
end
