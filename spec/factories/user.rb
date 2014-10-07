FactoryGirl.define do
	factory :user do 
		
		trait :client do
    		first_name             "client"
    		email                  "client@example.com"
    		password               "password"
    		password_confirmation  "password"
    		mobile_no              "9901787857"
    		company_name		   "sedin"
		end
	end
end