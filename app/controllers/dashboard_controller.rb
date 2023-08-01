class DashboardController < ApplicationController
  def index
    @buses = params[:search].present? ? Bus.where('bus_name LIKE ?', "%#{params[:search]}%").order(created_at: :desc) : Bus.all.order(created_at: :desc)
  end
end
