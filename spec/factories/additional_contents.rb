FactoryGirl.define do
  factory :additional_content do
    area 'banner_text'
    title 'MyString'
    content '<p>MyText</p>'
    display true
  end
end
