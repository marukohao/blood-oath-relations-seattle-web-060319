class BloodOath

attr_accessor :cult, :follower, :initiation_date
	@@all = []

	def initialize(cult, follower, initiation_date)
		@cult = cult
		@follower = follower
		@initiation_date = initiation_date
		@@all << self
	end

	def self.all
		@@all
	end

	def self.first_oath
		first_oath_date = BloodOath.all[0].initiation_date.split("-")[0]
		first_follower = nil

		BloodOath.all.each do |bloodoath| bloodoath.initiation_date.split("-")
			if bloodoath.initiation_date.split("-")[0] <= first_oath_date[0]
				first_oath_date = bloodoath.initiation_date.split("-")
				first_follower = bloodoath.follower
			elsif bloodoath.initiation_date.split("-")[0] == first_oath_date[0]
				if bloodoath.initiation_date.split("-")[1] <= first_oath_date[1]
					first_oath_date = bloodoath.initiation_date.split("-")
					first_follower = bloodoath.follower
				elsif bloodoath.initiation_date.split("-")[1] == first_oath_date[1]
					if bloodoath.initiation_date.split("-")[2] <= first_oath_date[2]
						first_oath_date = bloodoath.initiation_date.split("-")
						first_follower = bloodoath.follower
					end
				end	
			end
		end
		first_follower
	end
end