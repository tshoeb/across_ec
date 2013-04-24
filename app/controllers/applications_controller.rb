class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  load_and_authorize_resource #authorization code to limit access to controller actions, to avoid url hacking
  def index
    @title = "Applications"
    @applications = Application.paginate(:page => params[:page], :per_page => 14) # if more than 14 records shifts the rest of the records to other page

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @title = "Student Application"
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @title = "New Application"
    @application = current_student.applications.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @title = "Editing Application"
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        StudentMailer.application_confirmation(@application.student).deliver # sending application confirmation email
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end

  def approve # method to change the application status to approved by registrar and send the email about it to student
    application = Application.find(params[:id])
    application.update_attributes(:status => 'Approved')
    StudentMailer.application_approved(@application.student, @application).deliver
    redirect_to applications_path
  end
  def decline # method to change the application status to declined by registrar and send the email about it to student
    application = Application.find(params[:id])
    application.update_attributes(:status => 'Declined')
	StudentMailer.application_declined(@application.student, @application).deliver
    redirect_to applications_path
  end

end
