require 'twitter'
require './configure'

screen_name = ARGV[0] || 'Adrihg89'
a_user = Twitter.user(screen_name)

puts "Username   : #{a_user.screen_name}"
puts "Name       : #{a_user.name}"
puts "Location   : #{a_user.location}"
puts "URL        : #{a_user.url}" if a_user.url
puts "Verified   : #{a_user.verified}"
puts "Seguidores   : #{a_user.followers_count}"
puts

tweet = Twitter.user_timeline(screen_name).first

amigos = Twitter.friends(screen_name)
lista_amigos = {}
#amigos.sort! { |a,b| a_user2 = Twitter.user(a), a_user3 = Twitter.user(b), a_user2.follower_count <=> a_user3.follower_count }
amigos.each do |a|
		#print "Username   : #{a.name} \n"
		a_user2 = Twitter.user(a)
		lista_amigos[a_user2.screen_name] = a_user2.followers_count
		#print "Username: #{a_user2.name} Seguidores: #{a_user2.followers_count} \n"
		#a_user2 = Twitter.user(a)
        #print "Username   : #{a_user2.name} \n"
end

#lista_amigos.sort_by { |x,y| y }
#lista_amigos.sort{ |a,b| a_user2 = Twitter.user(a), a_user3 = Twitter.user(b), a_user2.follower_count <=> a_user3.follower_count }

#lista_amigos.each do |usu,num_seguidores|
#puts "usuario: #{usu} seguidores: #{num_seguidores}"
#end

lista_amigos.sort_by {|usu,num_seguidores| -num_seguidores}

lista_amigos.each do |usu,num_seguidores|
	puts "usuario: #{usu} seguidores: #{num_seguidores}"
end







