Faker::Config.locale = :ja

# データ---------------------------------------------------------------
fake_date = Faker::Date.between(from: 5.days.ago, to: Date.today)
roles = ['leader', 'priest', 'follower']

cults = [
  {name: '太陽の暁団', founded_on: fake_date, description: Faker::Lorem.sentence},
  {name: '月影の審問会', founded_on: fake_date, description: Faker::Lorem.sentence},
]

locations = [
  {name: '廃墟の地下聖堂', address: Faker::Address.full_address, indoor: true},
  {name: '森の開けた場所', address: Faker::Address.full_address, indoor: false}
]

offerings = [
  {name: '黒いロウソク', dangerous_level: 1},
  {name: '古代の血液', dangerous_level: 4},
  {name: '禁断の果実', dangerous_level: 2},
  {name: '銀の短剣', dangerous_level: 3}
]

artifacts = [
  {name: 'ひび割れた仮面', power_level: 5},
  {name: '星読みの水晶', power_level: 3},
  {name: '古代の書', power_level: 4}
]

# 場所、供物、呪物をcreate--------------------------------------------------
location_records = locations.map { |attrs| Location.create!(attrs) }
offering_records = offerings.map { |attrs| Offering.create!(attrs) }
artifact_records = artifacts.map { |attrs| Artifact.create!(attrs) }

# create開始---------------------------------------------------------------
cults.each do |attrs|
  cultobj = Cult.create!(attrs)

  # メンバー
  roles.each do |role|
    cultobj.members.create!(
      name: Faker::Name.name,
      role: role,
      joined_on: fake_date
    )
  end

  # 儀式親テーブル
  ritualobj = cultobj.rituals.create!(
    location: location_records.sample,
    title: Faker::Lorem.sentence,
    scheduled_at: fake_date
  )

  # 儀式子テーブル
   3.times do |n|
    ritualobj.ritual_steps.create!(
      position: n + 1,
      description: Faker::Lorem.sentence
    )
  end

  # 儀式供物
  offering_records.sample(2).each do |offering|
    ritualobj.ritual_offerings.create!(
      offering: offering,
      quantity: Faker::Number.between(from: 1, to: 3)
    )
  end

  artifact_records.sample(2).each do |artifact|
    ritualobj.ritual_artifacts.create!(
      artifact: artifact
    )
  end

  2.times do
    ritualobj.chants.create!(
      content: Faker::Lorem.sentence,
      language: %w[Latin Ancient Greek Unknown].sample
    )
  end
end