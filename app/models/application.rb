class Application < ActiveRecord::Base
  attr_accessible :application_date, :course_no, :passport_copy, :registrar_id, :semester_year, :sign_form, :university_id
validates :application_date, :course_no, :passport_copy, :registrar_id, :semester_year, :sign_form, :university_id, :presence => true
mount_uploader :passport_copy, PassportCopyUploader
mount_uploader :sign_form, PassportCopyUploader


end
