FactoryGirl.define do
  factory :authentication do
    user_id   1
    provider  'provider'
    uid       'provider_uid'
  end
end