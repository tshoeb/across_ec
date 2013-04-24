class Student < ActiveRecord::Base

  before_create :set_confirmation_code
  has_secure_password
  validates_presence_of :password, :on => :create

  attr_accessible :email, :first_name, :last_name, :major, :mobile, :student_number, :year_of_graduation, :password, :password_confirmation, :university_id

  has_many :applications
  
  MAJORS = [['Art History'], ['Biological Sciences'], ['Business Administration'], ['Chemical Engineering'], ['Communication'], ['Computational Biology'], ['Computer Science'], ['Culture and Politics'], ['Electrical and Computer Engineering'], ['Fashion Design'], ['Graphic Design'], ['Information Systems'], ['Interior Design'], ['International Economics'], ['International Politics'], ['Journalism'], ['Liberal Arts'], ['Mechanical Engineering'], ['Medical'], ['Painting & Printmaking'], ['Petroleum Engineering'], ['Pre-medical']]

  validates :first_name, :last_name, :email, :mobile, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :first_name, :with => /^[a-z A-Z -']+$/, :message => "Invalid First Name"
   validates_format_of :last_name, :with => /^[a-z A-Z \- -']+$/, :message => "Invalid Name"
  validates_format_of :major, :with => /^[a-z A-Z -']+$/, :message => "Invalid Major"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(qatar\.|qatar-med\.)?(cmu|vcu|tamu|georgetown|cornell)\.(edu)$/i, :message => "not vaild email" # method to limit users to only enter university email id
  validates_format_of :mobile, :with => /^(\+?\d{8}|\+?\d{3}?[-.]\d{4}?[-.]\d{4})$/, :message => "should be 8 digits" # method to only enter 8 digit phone number

  def proper_name # method to get the full name of user
    first_name + " " + last_name
  end
  
  def send_password_reset # method to send password reset link via email
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  StudentMailer.password_reset(self).deliver
  end
	
  def generate_token(column) # token generation method
	begin
	  self[column] = SecureRandom.urlsafe_base64
	end while Student.exists?(column => self[column])
  end
  
  def set_confirmation_code # to set the confirmation code in the database
	generate_token(:confirmation_code)
	self.active = false
	return
  end
end
