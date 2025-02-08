FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.unique.email }
    password              { 'a00000' }
    password_confirmation { password }
    first_name            { '陸太郎' }
    last_name             { '山田' }
    first_name_kana       { 'リクタロウ' }
    last_name_kana        { 'ヤマダ' }
    birthday              { '2000-01-01' }
  end
end
