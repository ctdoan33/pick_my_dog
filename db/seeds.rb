require 'csv'

csv_text = File.read(Rails.root.join('db', 'API.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
	d = DogApi.new
	d.breed = row['breed']
	d.size = row['size']
	d.weight = row['weight']
	d.height = row['height']
	d.life_span = row['life_span']
	d.aka = row['aka']
	d.group = row['group']
	d.origin = row['origin']
	d.role = row['role']
	d.facts = row['facts']
	d.behavior = row['behavior']
	d.health_concerns = row['health_concerns']
	d.activity = row['activity']
	d.grooming = row['grooming']
	d.save
end

csv_text = File.read(Rails.root.join('db', 'Survey.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
	d = Survey.new
	d.breed = row['breed']
	d.size = row['size']
	d.weight = row['weight']
	d.height = row['height']
	d.life_span = row['life_span']
	d.aka = row['aka']
	d.group = row['group']
	d.origin = row['origin']
	d.role = row['role']
	d.facts = row['facts']
	d.behavior = row['behavior']
	d.health_concerns = row['health_concerns']
	d.activity = row['activity']
	d.grooming = row['grooming']
	d.pic_available = row['pic_available']
	d.pic_name = row['pic_name']
	d.friendly = row['friendly']
	d.novice = row['novice']
	d.shelter_name = row['shelter_name']
	d.save
end
