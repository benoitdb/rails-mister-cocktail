# a
class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose     = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose,][:ingredient])

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
  end
  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id)
  end
end

