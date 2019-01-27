require	'model.rb'
require 'view.rb'

class Controller
	attr_reader :array_profil_mairie_https

	def initialize
		@view = View.new
		@model = Model.new
		@array_profil_mairie_https = []
	end

	def scraping
		#debut :
		@array_profil_mairie_https = @model.choix_num(@view.depart(@model.choix_departement))
		#fin xD: 
		#puts @array_profil_mairie_https
	end

	def devmode
		puts "1 = (array_profil_mairie_https) == tout les liens de fiche des mairies"
		puts "2 = (array_numero_depart) == tout les numeros de departement"
		puts "3 = (array_departement) == tout les departement"
		puts "4 = (hachier_keydeppart_valuenumero) == hash |key = departement|value = numero|"
		puts "5 = (hachier_invers_keynumero_valuedeppart) == hash |key = numero|value = departement"
		puts "6 = (array_mairie_pour_https) == heuuuuu ca : (/59/lille.html) "
		params = gets.chomp.to_i
		case params
		when 1
			puts @array_profil_mairie_https
		when 2
			@model.modedev(params)
		when 3
			@model.modedev(params)
		when 4
			@model.modedev(params)
		when 5
			@model.modedev(params)
		when 6
			@model.modedev(params)
		else
			puts "nop"
		end
	end
end