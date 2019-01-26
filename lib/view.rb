class View

	def depart(departement)
		departement.each {|key, value| print "#{value}.#{key}\n"}
		puts "choix numero deppart"
		num = gets.chomp.to_i
		return num
	end
end