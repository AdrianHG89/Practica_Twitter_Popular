require 'twitter'
require './configure'

screen_name = ARGV[0] || 'timoreilly'
a_user = Twitter.user(screen_name)

puts "Username   : #{a_user.screen_name}"
puts "Name       : #{a_user.name}"
puts "Location   : #{a_user.location}"
puts "URL        : #{a_user.url}" if a_user.url
puts "Verified   : #{a_user.verified}"
puts

tweet = Twitter.user_timeline(screen_name).first

amigos = Twitter.friends(screen_name)

				
amigos.each do |a|
		a_user2 = Twitter.user(a)
        print "Username   : #{a_user2.name} \n"
		print "numero seguidores   : #{Twitter.followers(a_user2.name)} \n"
end

if tweet
  puts "Tweet text : #{tweet.text }"
  puts "Tweet time : #{tweet.created_at}"
  puts "Tweet ID   : #{tweet.id}"
end