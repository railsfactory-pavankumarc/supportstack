FactoryGirl.define do
  factory :ticket do

    trait :ticket1 do
      department_id 1
      user_id 1
      priority_id 1
      subject "support"
      message "support message"
    end
    
    trait :ticket2 do
      department_id 1
      user_id 1
      priority_id 1
      subject "tech support"
      message "tech support message"
    end
    
  
  end
end