FactoryBot.define do
  factory :notice do
    notice_type { "MyString" }
    message { "MyString" }
    event_time { "2019-03-27 13:16:24" }
  end
end
