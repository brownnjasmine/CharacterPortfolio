FactoryBot.define do
    factory :user_tester do
      id {1}
      email {"test@user.com"}
      password {"password"}
      # Add additional fields as required via your User model
    end
end
