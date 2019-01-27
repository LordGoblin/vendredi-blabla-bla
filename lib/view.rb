class View

	def depart(departement)
		departement.each {|key, value| print "#{value}.#{key}\n"}
		puts "choix numero depart"
		num = gets.chomp.to_i
		return num
	end
end