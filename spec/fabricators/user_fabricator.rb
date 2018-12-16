Fabricator (:user) do
    email {Faker::Internet.email}
    password {'password'}
    password_confirmation {'password'}
    first_name {Faker::Name::name}
    last_name {Faker::Name::last_name}
    
    # first_name {'Nooshin'}
    # last_name {'Zamiri'}
    # confirmed_at {Date.today}

end