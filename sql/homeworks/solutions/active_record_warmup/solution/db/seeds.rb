Actor.destroy_all
Movie.destroy_all
Casting.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('actors')
ActiveRecord::Base.connection.reset_pk_sequence!('movies')
ActiveRecord::Base.connection.reset_pk_sequence!('castings')

ActiveRecord::Base.transaction do
	puts 'Loading actors...'
	require_relative 'data/actors.rb'
	puts 'Loading movies...'
	require_relative 'data/movies.rb'
	puts 'Loading castings...'
	require_relative 'data/castings.rb'
	puts 'Done!'
end
