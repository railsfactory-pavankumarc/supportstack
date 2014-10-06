FactoryGirl.define do
	factory :user do |user|
    	user.first_name             "Test User"
    	user.email                  "user@example.com"
    	user.password               "password"
    	user.password_confirmation  "password"
    	user.mobile_no              "9901787857"
	end
end