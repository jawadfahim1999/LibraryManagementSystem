class ReturnsController < ApplicationController
  before_action :find_checkout, only: [:return, :complete_return]

  def return
  end

  def complete_return
    @checkout.returned_at = DateTime.current
  
    if @checkout.save
      redirect_to checkouts_path, notice: 'Book returned successfully.'
    else
      render :return
    end
  end

  private

  def find_checkout
    @checkout = Checkout.find(params[:id])
  end
end