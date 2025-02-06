FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'john'}
    last_name             {'Doe'}
    first_name_kana       {'ジョン'}
    last_name_kana        {'ドウ'}
    birthday              {'2000-01-01'}
  end
end