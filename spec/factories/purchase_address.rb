FactoryBot.define do
  factory :purchase_address do
    post_code {'111-1111'}
    prefecture_id {2}
    city {'世田谷区太子堂'}
    address {'1'}
    building {'建物名'}
    phone_number {'09012345678'}
    item_id {1}
    user_id {1}
  end
end