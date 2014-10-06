FactoryGirl.define do
  factory :ticket do

    trait :provider1 do
      department_id "1"
      priority_id "2"
      subject "support"
      message "support message"
    end
    
    trait :provider2 do
      department_id "1"
      priority_id "2"
      subject "tech support"
      message "tech support message"
    end
    
    trait :provider2 do
      department_id "1"
      priority_id "2"
      subject "java support"
      message "java support message"
    end
  end
end