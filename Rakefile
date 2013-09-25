task :default => :user

desc "Lanzar la aplicacion con el usuario y el numero limite pasados"
task :user, :name, :num do |t, args|
  name = args[:name] || 'Adrihg89'
  num = args[:num] || 10
  sh "ruby popular.rb #{name} #{num}"
end