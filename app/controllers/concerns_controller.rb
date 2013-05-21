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
  	@concern = Concern.new(concern_params)
  	
  	if @concern.save
  		flash[:success] = "A new concern has been saved."
  		redirect_to concerns_path
  	else
  		flash[:error] = "The concern could not be saved."
  		render 'new'
  	end
  end

  def update
  	@concern = Concern.find_by_id(params[:id])
  	if @concern.update_attributes(concern_params)
  		flash[:success] = "A new concern has been saved."
  		redirect_to concerns_path
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

  private

  def concern_params
    params.required(:concern).permit(:name, :description, :location)
  end

end
