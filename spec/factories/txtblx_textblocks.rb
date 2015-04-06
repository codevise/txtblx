FactoryGirl.define do
  factory :textblock, :class => 'Txtblx::Textblock' do
    perma_id 1
    key "some.key"
    description ""
    text ""
    text_html ""
    path "MyString"

    trait :published do
      after :create do |textblock|
        textblock.publish
      end
    end
  end
end
