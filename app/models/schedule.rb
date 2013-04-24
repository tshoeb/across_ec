class Schedule < ActiveRecord::Base

  before_save :setting_date

  attr_accessible :date_uploaded, :file_name, :schedule, :semester_year, :registrar_id
  mount_uploader :schedule, ScheduleUploader
  belongs_to :registrar
  validates :file_name, :semester_year, :presence => true  
  
  def setting_date # to set the creation date by default
	self.date_uploaded = Date.today
  end
end
