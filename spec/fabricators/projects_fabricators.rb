Fabricator(:project) do
    goal { Faker::Hipster.sentence }
    title { Faker::Book.title }
    start_date 1.days.ago
    end_time Date.today
    sponsor
end