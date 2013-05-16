require 'factory_girl'

FactoryGirl.define do
  factory :concern do
    name 'No service delivery in Kliptown'
    description 'We are tired of not receiving basic services in our town.'
    reference_code
    location 'Kliptown, Soweto, Johannesburg'
    longitude
    latitude
  end
end