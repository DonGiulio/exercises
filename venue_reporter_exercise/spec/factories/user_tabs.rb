FactoryGirl.define do
  factory :user_tab do
    tab nil
    user nil
    
    after(:create) do |ut|
      create_list :payment, 5, user_tab: ut
    end
  end

end
