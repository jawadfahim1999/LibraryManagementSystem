class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @checkouts = Checkout.all
  end

  def show
    @checkout = Checkout.find(params[:id])
  end

  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      redirect_to checkouts_path, notice: 'Checkout added successfully.'
    else
      render :new
    end
  end


  def edit
    @checkout = Checkout.find(params[:id])
  end

  def update
    @checkout = Checkout.find(params[:id])

    if @checkout.update(checkout_params)
      redirect_to checkouts_path, notice: 'Checkout updated successfully.'
    else
      render :edit
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:book_id, :patron_id, :checked_out_at, :due_date, :returned_at)
  end

  def authorize_user
    redirect_to root_path, alert: 'You are not authorized to perform this action' unless current_user && current_user.regular_user?
  end
end
