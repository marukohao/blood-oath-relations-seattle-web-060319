class Follower

attr_accessor :name, :age, :life_motto
	@@all = []

	def initialize(name, age, life_motto)
		@name = name
		@age = age
		@life_motto = life_motto
		@@all << self
	end

	def self.all
		@@all
	end

	def cults
		personal_cults = []
		BloodOath.all.each do |bloodoath|
			if bloodoath.follower == self
			personal_cults << bloodoath.cult
			end
		end
		personal_cults
	end

	def join_cult(cult, initiation_date)
		if self.age < cult.minimum_age
			return "Thank you for considering joining us. You are still too young. Please try again when you are #{cult.minimum_age}."
		else
			BloodOath.new(cult, self, initiation_date)
		end
	end

	def self.of_a_certain_age(age)
		Follower.all.select { |follower| follower.age >= age }
	end

	def my_cults_slogans
		BloodOath.all.select { |bloodoath| bloodoath.follower == self }.map { |bloodoath| bloodoath.cult.slogan}
	end

	def self.most_active
		cult_count = 0
		most_active_follower = nil

		Follower.all.each do |follower|
			if follower.cults.length > cult_count
				cult_count = follower.cults.length
				most_active_follower = follower
			end
		end
		most_active_follower
	end

	def self.top_ten
		top_ten_followers = []
		hash = Hash.new(0)


		Follower.all.each do |follower|
			hash[follower] = follower.cults.length
		end

		hash.sort_by{ |key, value| value }[-10..-1].each do |follower|
			top_ten_followers << follower[0] 
		end

		top_ten_followers
	end

#remove the argument of "cult" to return all fellow members-see below.
	def fellow_cult_members(cult)
		cult_followers = []
#keep in the following "self" line to return fellow members of ALL cults without reference to which cult they belong to. This means you'll have multiple listings for the same follower.
		self.cults.each do |cult| 
			BloodOath.all.each do |bloodoath|
				if bloodoath.cult == cult && bloodoath.follower != self
					cult_followers << bloodoath.follower
				end
			end
		end
		cult_followers
	end



end




















