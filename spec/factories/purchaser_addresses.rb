FactoryBot.define do
  factory :purchaser_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567'}
    prefecture_id { 3 }
    city { '横浜市緑区' }
    address { '3-4' }
    building { '横浜ビル' }
    tel { '1111111111' }

    
  end
end
