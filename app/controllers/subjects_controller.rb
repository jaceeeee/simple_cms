class SubjectsController < ApplicationController
  layout 'admin'
  
  # controller filter methods
  before_action :confirm_logged_in
  before_action :set_subject_count, :only => [:new, :create, :edit, :update]

  def index
    logger.debug("*** Testing the logger. ***")
    @subjects = Subject.sorted    
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})    
  end

  def create
    # instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # save the object
    if @subject.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    # If save fails, redisplay the form so user can fix problems
    else      
      render('new')
    end
  end

  def edit
   @subject = Subject.find(params[:id])   
  end

  def update
    # instantiate a new object using form parameters
    @subject = Subject.find(params[:id])
    # update the object
    if @subject.update_attributes(subject_params)
    # If save succeeds, redirect to the show action
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))
      # blocked path 'PATCH'
    # If save fails, redisplay the form so user can fix problems
    else      
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])    
  end

  def destroy
    @subject = Subject.find(params[:id])    
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end
end