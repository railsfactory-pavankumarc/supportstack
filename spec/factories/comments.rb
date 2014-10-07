# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :comment do
  		trait :comment1 do
  			user_id 1
  			ticket_id 1
  			comment "comment"
  		end
	end
end
