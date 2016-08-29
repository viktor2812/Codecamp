class Employee < ActiveRecord::Base
	require 'roo'
	belongs_to :company

	validates :first_name, presence: true
	validates :surname, presence: true
	validates :curp, presence: true
	validates :net_monthly_salary, presence: true
	validates :admission_date, presence: true
	validates :employee_key, presence: true
	validates :payment_cycle, presence: true
	validates :fk_id_card, presence: true
	validates :fk_id_card,   :presence => {:message => 'Fk Id Card is inavlid'},
                     :numericality => true,
                     :length => { :minimum => 3, :maximum => 10 }
  validates :net_monthly_salary, presence:true, numericality: {only_float: true}

	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    employee = find_by_id(row["id"]) || new
	    employee.attributes = row.to_hash.slice(*accessible_attributes)
	    employee.save(:validate=>false)
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when '.csv' then Roo::Csv.new(file.path)
	  when '.xls' then Roo::Excel.new(file.path)
	  when '.xlsx' then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end

	private
		def self.accessible_attributes
		 ["first_name", "surname", "curp", "net_monthly_salary", "admission_date", "employee_key", "payment_cycle", "fk_id_card", "company_id"]
		end

end
