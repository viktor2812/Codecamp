class Loan < ActiveRecord::Base
	
	def self.get_period
		(Time.now.end_of_month.day - Time.now.day)
	end

end
