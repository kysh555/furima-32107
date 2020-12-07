FactoryBot.define do
  factory :purchase_address do
    post_code {'111-1111'}
    prefecture_id {2}
    city {'世田谷区太子堂'}
    address {'住所'}
    building {'建物名'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {FactoryBot.create(:user).id}
    item_id {FactoryBot.create(:item).id}
  end
end