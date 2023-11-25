class PatronsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patrons = Patron.all
  end

  def show
    @patron = Patron.find(params[:id])
  end

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    
    respond_to do |format|
      if @patron.save
        format.html { redirect_to @patron, notice: 'Patron was successfully created.' }
        format.json { render :show, status: :created, location: @patron }
      else
        format.html { render :new }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end
  
  def update
    @patron = Patron.find(params[:id])
    if @patron.update(patron_params)
      redirect_to patrons_path, notice: 'Patron updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @patron = Patron.find(params[:id])
    @patron.destroy
    redirect_to patrons_path, notice: 'Patron removed successfully.'
  end
  

  private
  def patron_params
    params.require(:patron).permit(:name, :id_number, :email, :password, :password_confirmation)
  end
  
  def authorize_user
    unless current_user.admin? || @patron == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def authorize_patron
    redirect_to root_path, alert: 'You are not authorized to perform this action' unless current_user && current_user.patron?
  end
end
