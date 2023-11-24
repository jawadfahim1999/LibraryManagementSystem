class PatronsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patrons = Patron.all
  end

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    if @patron.save
      redirect_to patrons_path, notice: 'Patron added successfully.'
    else
      render :new
    end
  end

  private

  def patron_params
    params.require(:patron).permit(:name, :id_number)
  end
end
