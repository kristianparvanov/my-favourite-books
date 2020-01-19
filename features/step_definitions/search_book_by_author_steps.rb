Given("the following books exist:") do |table|
	table.hashes.each do |book|
		Book.create! book
	end
end

Then("the author of {string} should be {string}") do |string, string2|
	assert_text Book.where(title: string).first!, string2
end