if %w[development test].include?(Rails.env)
  50.times do
    title = Faker::ProgrammingLanguage.unique.name
    next if title.include?('+')

    Tag.create(title:)
  end

  Admin.create(
    firstname: 'Tuncay',
    lastname: 'Dinler',
    username: 'Wormer',
    email: 'tuncaydinleroffical@gmail.com',
    password: 'WormerWormer09',
    password_confirmation: 'WormerWormer09'
  )

  Category.create(
    name: 'Ruby'
  )

  Category.create(
    name: 'Web development'
  )

  Aboutme.create(
    body: "Merhaba! Ben Tuncay Dinler, 20 yaşında bir junior developer'ım. Aydın'da yaşıyorum ve linux, backend gibi teknolojileri ile uğraşmayı seviyorum. Hayatımda iyi bir yazılımcı olmak benim için çok önemli. Bu konuda daha fazla bilgi edinmek ve deneyim paylaşmak için buradayım. Ayrıca, açık kaynak projeler, seminerler ve konferanslar gibi etkinliklerde yer almayı da çok seviyorum. Eğer benimle iletişime geçmek isterseniz, iletişim sayfası üzerinden ulaşabilirsiniz. Tanıştığımıza memnun oldum!"
  )

  Communication.create(
    telephone_number: '5445444343',
    github: 'https://github.com/WormerKing',
    email: 'tuncaydinleroffical@gmail.com',
    instagram: 'https://www.instagram.com/wormer_king_',
    linkedin: 'https://www.linkedin.com/in/tuncay-dinler-a314b9260'
  )

  8.times do
    Project.create(
      title: Faker::Team.unique.name,
      header: Faker::Lorem.words(number: 10).join(' '),
      body: Faker::Lorem.paragraphs(number: 3).join,
      url: Faker::Avatar.image,
      start_date: DateTime.now - 365,
      end_date: DateTime.now,
      category: Category.first,
      tags: Tag.order(created_at: :desc).limit(6)
    )
  end

  8.times do
    Article.create(
      title: Faker::Team.unique.name,
      header: Faker::Lorem.words(number: 10).join(' '),
      body: Faker::Lorem.paragraphs(number: 3).join,
      category: Category.last,
      tags: Tag.order(created_at: :desc).limit(6)
    )
  end
end
