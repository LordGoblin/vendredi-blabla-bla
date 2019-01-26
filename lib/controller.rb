require	'model.rb'
require 'view.rb'

class Controller
	attr_reader :departement

	def initialize
		@view = View.new
		@model = Model.new
	end

	def scraping
		@model.choix_num(@view.depart(@model.choix_departement))
	end
end