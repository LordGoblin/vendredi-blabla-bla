class Model
	attr_reader :array_departement, :array_numero_depart, :hachier_keydeppart_valuenumero, :hachier_invers_keynumero_valuedeppart, :array_profil_mairie_https

	def initialize
		@array_departement = []
		@array_numero_depart = []
		@array_profil_mairie_https = []
		@hachier_keydepart_valuenumero = {}
		@hachier_invers_keynumero_valuedeppart = {}
	end

	def choix_departement
		i = 0
		page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/'))
		page.xpath('//a[@class="lientxt"]').each do |a|
		   	@hachier_keydeppart_valuenumero[(@array_departement[i] = a['href'][0..-6])] = (@array_numero_depart[i] = a.text[0..2].delete" ")
		   	@hachier_invers_keynumero_valuedeppart[(@array_numero_depart[i] = a.text[0..2].delete" ")] = (array_departement[i] = a['href'][0..-6])
		    i = i + 1
		end
		return @hachier_keydeppart_valuenumero
	end

	def choix_num(num)
		i = 0
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + @hachier_invers_keynumero_valuedeppart["#{num}"] + ".html"))
		page.xpath('//a[@class="lientxt"]').each do |a|
			@array_profil_mairie_https[i] = "http://annuaire-des-mairies.com#{(a['href'][1..-1])}"
			i = i + 1
		end
		return @array_profil_mairie_https
	end

	def modedev(a)
		case a
		when 2
			print @array_numero_depart
			print "\n"
		when 3
			print @array_departement
			print "\n"
		when 4
			print @hachier_keydeppart_valuenumero
			print "\n"
		when 5
			print @hachier_invers_keynumero_valuedeppart
			print "\n"
		else
			puts "nop"
		end
	end
end