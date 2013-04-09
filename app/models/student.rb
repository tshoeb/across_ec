class Student < ActiveRecord::Base

  before_create :set_confirmation_code
  has_secure_password
  validates_presence_of :password, :on => :create

  attr_accessible :email, :first_name, :last_name, :major, :mobile, :student_number, :year_of_graduation, :password, :password_confirmation, :university_id

  has_many :applications

  validates :first_name, :last_name, :email, :mobile, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :first_name, :with => /^[a-z A-Z -']+$/, :message => "Invalid First Name"
  validates_format_of :last_name, :with => /^[a-z A-Z -']+$/, :message => "Invalid Last Name"
  validates_format_of :major, :with => /^[a-z A-Z -']+$/, :message => "Invalid Major"
  #validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(qatar\.)?(cmu|vcu|tamu|georgetown)\.(edu)$/i, :message => "not vaild email" 
  validates_format_of :mobile, :with => /^(\+?\d{8}|\+?\d{3}?[-.]\d{4}?[-.]\d{4})$/, :message => "should be 11 digits (country code needed)"

  def proper_name
    first_name + " " + last_name
  end
  
  def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  StudentMailer.password_reset(self).deliver
  end
	
  def generate_token(column)
	begin
	  self[column] = SecureRandom.urlsafe_base64
	end while Student.exists?(column => self[column])
  end
  
  def set_confirmation_code
	generate_token(:confirmation_code)
	self.active = false
	return
  end
end
