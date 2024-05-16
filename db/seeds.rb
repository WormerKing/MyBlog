50.times do
	Tag.create(title:Faker::ProgrammingLanguage.unique.name)
end