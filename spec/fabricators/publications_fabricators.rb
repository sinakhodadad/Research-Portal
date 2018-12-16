Fabricator(:publication) do
  page { Faker::Number.number(4) }
  pageend { Faker::Number.number(4) }
  volume { Faker::Number.number(4) }
  year { Date.today.year.to_i - 1 }
  title { Faker::Book.title }

  journal
end