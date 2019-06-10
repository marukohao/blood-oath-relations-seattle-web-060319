class Cult

	attr_accessor :name, :location, :founding_year, :slogan
	attr_reader :minimum_age
	@@all = []

	def initialize(name, location, founding_year, slogan, minimum_age)
		@name = name
		@location = location
		@founding_year = founding_year
		@slogan = slogan
		@minimum_age = minimum_age
		@@all << self
	end

	def self.all
		@@all
	end

	def recruit_follower(follower, initiation_date)
		if follower.age < self.minimum_age
			return "Thank you for considering joining us. You are still too young. Please try again when you are #{minimum_age}."
		else
			BloodOath.new(self, follower, initiation_date)
		end
	end

	def cult_population
		BloodOath.all.select { |bloodoath| bloodoath.cult == self }.length
	end

	def self.find_by_name(name)
		Cult.all.select { |cult| cult.name == name }
	end

	def self.find_by_location(location)
		Cult.all.select { |cult| cult.location == location }
	end

	def self.find_by_founding_year(founding_year)
		Cult.all.select { |cult| cult.founding_year == founding_year }
	end

	def average_age
		total_age = 0

		all_bloodoath = BloodOath.all.select { |bloodoath| bloodoath.cult == self }
		all_bloodoath.map { |bloodoath| bloodoath.follower.age }.each do |follower_age|
			total_age += follower_age
		end
		total_age.to_f / all_bloodoath.count.to_f
	end

	def my_followers_mottos
		BloodOath.all.select { |bloodoath| bloodoath.cult == self }.map { |bloodoath| bloodoath.follower.life_motto }
	end


#map is like each, but instead of having to create and populate an array to hold the results of the iteration, map does it all in one step!
	def self.least_popular
		population = Cult.all[0].cult_population
		least_popular_cult = nil
		
		Cult.all.each do |cult|
			if cult.cult_population <=  population
				population = cult.cult_population
				least_popular_cult = cult
			end
		end
		least_popular_cult
	end	

	def self.most_common_location
		cult_locations = Hash.new(0)
		Cult.all.each {|cult| cult_locations[cult.location] += 1}
		cult_locations.sort_by{ |key, value| value }[-1][0]
	end

	


end















