class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    search = params[:search]
    @term = search
    city = params[:city]
    where = {}
    where[:city] = city.capitalize unless !city.present?
    if search.present? && city.present?
        @search = User.search(search, fields: [:first_name, :state, :country], misspellings: false, where: { city: where[:city] } )
    else
       @search = User.search(search, fields: [:first_name, :state, :country], misspellings: false)
    end
    @total = @search.total_count
    @time = @search.took
    @search = Kaminari.paginate_array(@search).page(params[:page]).per(12) # Paginates the results
  end
end