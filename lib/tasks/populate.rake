namespace :db do
  desc 'Erase and Fill database'
  task populate: :environment do
    [
        Activity,
        Project,
        User
    ].each(&:delete_all)
    100.times do
      Project.create!(
          name: Faker::Name.name,
          start_date: Faker::Date.backward(days: 23),
          end_date: Faker::Date.forward(days: 14)
      )
    end
    Project.all.each do |p|
      10.times do
        Activity.create!(
            project: p,
            name: Faker::Name.name,
            start_date: Faker::Date.backward(days: 23),
            end_date: Faker::Date.forward(days: 14)
        )
      end
    end
  end
end
