class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  load_and_authorize_resource

  def index
    @title = "Students"
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @title = "Student"
    #@student = Student.find(params[:id])
    if params[:id].nil?
      @student = current_student
    else 
      @student = Student.find params[:id]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @title = "Create new Student"
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @title = "Editing Student"
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        StudentMailer.registration_confirmation(@student).deliver
        session[:student_id] = @student.id
        format.html { redirect_to @student, notice: 'Successfully registered' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
		oldemail = @student.email
    respond_to do |format|
      if @student.update_attributes(params[:student])
		newemail = @student.email
		if oldemail != newemail
			@student.set_confirmation_code
			StudentMailer.registration_confirmation(@student).deliver
		end
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
  def confirm_account
	@student = Student.find(params[:id])
	@login_student = Student.find_by_confirmation_code!(params[:code])
	if @student == @login_student
		@student.active = true
		@student.save
		session[:student_id] = @student.id
		redirect_to @student, notice: 'Account successfully confirmed'
	else
		redirect_to root_path, notice: 'Sorry may be your link expired or you did not sign in.'
	end
  end
end
