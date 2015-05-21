FactoryGirl.define do
  factory :payment do
    amount {rand * 100}
    
    date { Time.now - rand(1..5).days }
    user_tab nil
  end

end
