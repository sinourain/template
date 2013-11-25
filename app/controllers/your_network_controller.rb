class YourNetworkController < ApplicationController
  def index
    @payments = Payment.all
  end

end
