class Concern < ActiveRecord::Base
	
	validates :location, :description, presence: true
	validates :name, presence: true, length: { maximum: 80 }

	geocoded_by :location

  before_save :generate_reference_code

  private

  def generate_reference_code
  	self.reference_code = rand(36**10).to_s(36) if self.reference_code.nil?
  end

end
