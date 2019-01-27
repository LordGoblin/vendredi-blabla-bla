require 'controller'

class Router

	def initialize
		@controller = Controller.new
	end

	def perform
		while true
			puts "tu veux faire quoi?"
			puts "1.scraping"
			puts "2.la save"
			puts "3.envoi mail"
			puts "4.quitter l'app"
			puts "5.DevMode pour voir les variables (pense a faire un scraping avant sinon variable vide)"
			params = gets.chomp.to_i
			case params
			when 1
				puts "tu as choisi scraping"
				@controller.scraping
			when 2
				puts "tu as choisi la save"
			when 3
				puts "tu as choisi envoi mail"
			when 4
				puts "a++"
				break
			when 5
				@controller.devmode
			else
				puts "ce choix n'existe pas..."
			end
		end
	end
end