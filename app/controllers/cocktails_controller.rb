class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show edit update]

  def index
    @cocktails = Cocktail.all
  end

  def edit; end

  def show; end

  def update
    @cocktail.update(param_cocktail)

    redirect_to cocktail_path
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(param_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def param_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
