class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    search = params[:search].present? ? params[:search] : ""
    @term = search
    @search = 
      if search
        User.search(search, fields: [:first_name, :last_name, :city, :state, :country], misspellings: false)
      end
    @total = @search.total_count
    @time = @search.took
    @search = Kaminari.paginate_array(@search).page(params[:page]).per(10)
  end
end