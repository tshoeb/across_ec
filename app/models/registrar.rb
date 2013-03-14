class Registrar < ActiveRecord::Base

	has_secure_password
  validates_presence_of :password, :on => :create

  attr_accessible :email, :first_name, :last_name, :phone, :password, :password_confirmation, :admin, :university_id
  has_many :schedules
  belongs_to :university
  validates :first_name, :last_name, :email, :phone, :presence => true
   validates_format_of :first_name, :with => /^[a-z A-Z -']+$/, :message => "Invalid Name"
  validates_format_of :last_name, :with => /^[a-z A-Z -']+$/, :message => "Invalid Name"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@([\w-]+\.)+(com|edu|org|gov|net|mil|biz|info|qa)$/i, :message => "not vaild email" 
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]\d{4}?[-.]\d{4})$/, :message => "should be 11 digits (country code needed)"
end
