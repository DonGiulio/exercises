FactoryGirl.define do
  factory :tab do
    venue nil
    
    after :create do |v|
      5.times.each do 
        u = create :user
        create :user_tab, user: u, tab: v
      end
    end
  end

end
