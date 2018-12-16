Fabricator (:add_user) do
    email {Faker::Internet.email}
    name {Faker::Name::name}
    family {Faker::Name::last_name}
    role {'guest'}
end