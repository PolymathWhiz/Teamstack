class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    search = params[:search].present? ? params[:search] : ""
    where = {}
    where[:city] = params[:adv].capitalize if params[:adv].present?
    @term = search

    @search = 
      if search
        User.search(search, fields: [:first_name, :state, :country], misspellings: false, where: { city: where[:city] } )
      end

    @total = @search.total_count
    @time = @search.took
    @search = Kaminari.paginate_array(@search).page(params[:page]).per(10) # Paginates the results
  end
end