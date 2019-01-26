require 'controller'

class Router

	def initialize
		@controller = Controller.new
	end

	def perform
		puts "bienvenur dans le project gossip"
		while true

			puts "tu veux faire quoi?"
			puts "1.scraping"
			puts "2.la save"
			puts "3.envoi mail"
			puts "4.quitter l'app"
			params = gets.chomp.to_i

			case params
			when 1
				puts "tu as choisi scraping"
				@controller.scraping
			when 2
				puts "tu as choisi la save"
				@controller.index_gossips
			when 3
				puts "tu as choisi envoi mail"
				@controller.email
			when 4
				puts "a++"
				break
			else
				puts "ce choix n'existe pas..."
			end
		end
	end
end