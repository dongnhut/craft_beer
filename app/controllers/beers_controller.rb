class BeersController < ApplicationController
  before_action :beer, only: [:show, :edit, :update, :destroy, :archive, :unarchive]
  before_action :categories, only: [:new, :edit, :create, :update]

  # GET /beers
  def index
    @beers = Beer.order(id: :desc).page params[:page]
  end

  # GET /beers/1
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /beers/new
  def new
    @beer = Beer.new
  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to beers_url, notice: 'Beer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /beers/1
  def update
    if @beer.update(beer_params)
      redirect_to beers_url, notice: 'Beer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /beers/1
  def destroy
    @beer.destroy
    redirect_to beers_url, notice: 'Beer was successfully destroyed.'
  end

  # PUT beers/1/archive
  def archive
    if @beer.update(archive_status: 1)
      redirect_to :back, notice: 'Beer was successfully archived.'
    else
      redirect_to beers_url, notice: 'Beer was not successfully archived.'
    end
  end

  # PUT beers/1/unarchive
  def unarchive
    if @beer.update(archive_status: 0)
      redirect_to :back, notice: 'Beer was successfully unarchived.'
    else
      redirect_to beers_url, notice: 'Beer was not successfully unarchived.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def beer
    @beer = Beer.includes(:category).find(params[:id])
  end

  def categories
    @categories = Category.pluck(:name, :id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def beer_params
    permited_params = params.require(:beer).permit(:name, :manufacturer, :country, :price, :description)
    permited_params.merge!(category: Category.find_by(id: params[:beer][:category_id]))
  end
end
