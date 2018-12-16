Fabricator(:news) do
  body {Faker::Hipster.sentence}
  title {Faker::Book.title}
end