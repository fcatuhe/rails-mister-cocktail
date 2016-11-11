class DosesController < ApplicationController
before_action :set_dose, only: [:edit, :update, :destroy]

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def edit
    @cocktail = @dose.cocktail
  end

  def update
    if @dose.update(dose_params)
      redirect_to @dose.cocktail
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
