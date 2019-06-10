require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

scary_cult = Cult.new("Scary Cult", "Seattle", 1987, "Keep Seattle scary!", 18)
fun_cult = Cult.new("Fun Cult", "Portland", 1907, "Portland is fun.", 65)
spiffy_cult = Cult.new("Spiffy Cult", "Seattle", 1880, "We're old!", 22)

follower1 = Follower.new("Sam", 19, "In it to win it.")
follower2 = Follower.new("Jane", 62, "I don't like mottos.")
follower3 = Follower.new("Sally", 40, "Hooray!")
follower4 = Follower.new("Sam", 19, "In it to win it.")
follower5 = Follower.new("Jane", 62, "I don't like mottos.")
follower6 = Follower.new("Sally", 12, "Hooray!")
follower7 = Follower.new("Sam", 19, "In it to win it.")
follower8 = Follower.new("Jane", 62, "I don't like mottos.")
follower9 = Follower.new("Sally", 6, "Hooray!")
follower10 = Follower.new("Sam", 19, "In it to win it.")
follower11 = Follower.new("Jane", 62, "I don't like mottos.")
follower12 = Follower.new("Jim", 16, "Hooray!")

BloodOath.new(scary_cult, follower2, "2018-03-19")
BloodOath.new(scary_cult, follower1, "1880-01-29")
BloodOath.new(fun_cult, follower2, "2003-09-10")
BloodOath.new(fun_cult, follower1, "2000-01-01")
BloodOath.new(fun_cult, follower3, "1900-01-06")
BloodOath.new(spiffy_cult, follower12, "1900-01-01")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
