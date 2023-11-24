class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @checkouts = Checkout.all
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

  private

  def checkout_params
    params.require(:checkout).permit(:book_id, :patron_id, :checked_out_at, :due_date, :returned_at)
  end
end
