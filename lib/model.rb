class Model

	attr_reader :departement, :numero_deppart, :hachier, :hachier_invers, :mairie

	def initialize
		@departement = []
		@numero_deppart = []
		@hachier = {}
		@hachier_invers = {}
	end

	def choix_departement
		i = 0
		page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/'))
		depart = page.xpath('//a[@class="lientxt"]')
		depart.each do |a|
		    @departement[i] = a['href'][0..-6]
		    @numero_deppart[i] = a.text[0..2].delete" "
		   	@hachier[@departement[i]] = @numero_deppart[i]
		   	@hachier_invers[@numero_deppart[i]] = @departement[i]
		    i = i + 1
		end
		return @hachier
	end

	def choix_num(num)
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + @hachier_invers["#{num}"] + ".html"))
		mairie = page.xpath('//a[@class="lientxt"]')
		mairie.each do |a|
			@mairie

		end
	end
end