class Registrar < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone
  has_many :schedules
  validates :first_name, :last_name, :email, :phone, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@([\w-]+\.)+(com|edu|org|gov|net|mil|biz|info|qa)$/i, :message => "not vaild email" 
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]\d{4}?[-.]\d{4})$/, :message => "should be 11 digits (country code needed)"
  

end
