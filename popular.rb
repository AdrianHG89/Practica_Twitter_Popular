require 'twitter'
require './configure'

nombre_usuario = ARGV[0] || 'Adrihg89'
lon_lista = (ARGV[1] || 10).to_i
lista_amigos = {}

a_user = Twitter.user(nombre_usuario)
puts "Username   : #{a_user.screen_name}"
amigos = Twitter.friend_ids(nombre_usuario) # Conectamos con el Twitter del usuario indicado para obtener su info.
lon_lista = lon_lista - 1 # Le quitamos uno al limite de ususarios porque empieza desde 0.
amigos = amigos.ids[0..lon_lista] # Hacemos que nuestra variable solo tenga el numero de usuario que ha indicado el usuario a la hora de la ejecucion.

# Bucle en el que recorremos nuestra variable amigos para ir creando el hash con key=nombre del amigo y value=numero de seguidores de ese amigo
for amigo in amigos
		a_user2 = Twitter.user(amigo) # Obtenemos la info de cada amigo
		lista_amigos[a_user2.screen_name] = a_user2.followers_count # Creamos el hash
end

#Ordenamos el hash de mayor a menor por el campo numero de seguidores
lista_amigos.sort_by {|nombre_amigo,num_seguidores| -num_seguidores}.each do |nombre,num|

	puts "Usuario: #{nombre} Seguidores: #{num}"
end







