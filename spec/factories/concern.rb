require 'factory_girl'

FactoryGirl.define do
  factory :concern do
    name 'No service delivery in Kliptown'
    description 'We are tired of not receiving basic services in our town.'
    reference_code nil
    location 'Kliptown, Soweto, Johannesburg'
    longitude nil
    latitude nil
  end
end