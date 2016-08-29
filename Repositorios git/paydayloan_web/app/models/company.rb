class Company < ActiveRecord::Base
	validates :company_name, presence: true
	validates :sub_company, presence: true
	validates :calendar_schema, presence: true
	validates :payment_schema, presence: true
	validates :contact_name, presence: true
	validates :contact_email, presence: true
	validates :contact_telephone, presence: true
	validates_format_of :contact_email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates :contact_telephone,   :presence => {:message => 'Contact Telephone is inavlid'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }
  belongs_to :user
  has_many :employees
end
