class DosesController < ApplicationController
before_action :set_cocktail, only: [:create]

  def create
    @dose = @cocktail.doses.new(dose_params)
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].empty?
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
