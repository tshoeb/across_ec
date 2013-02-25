class Schedule < ActiveRecord::Base
  attr_accessible :date_uploaded, :file_name, :schedule, :semester_year, :registrar_id
  mount_uploader :schedule, ScheduleUploader
  belongs_to :registrar
  validates :file_name, :date_uploaded, :semester_year, :presence => true  
end
