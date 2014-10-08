FactoryGirl.define do
	factory :user do 
		
		trait :client do
    		first_name             "client"
    		email                  "client@example.com"
    		password               "password"
    		password_confirmation  "password"
    		mobile_no              "9901787857"
    		company_name		   "sedin"
            role_id                 1
		end

        trait :staff do
            first_name              "staff"
            email                   "staff@example.com"
            password                "password"
            password_confirmation   "password"
            mobile_no               "9901787857"
            department_id           1
            role_id                 2
        end
	end
end