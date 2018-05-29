class Users::PseudonymsController < ApplicationController 
  def index
    @pseudonyms = current_user.pseudonyms
  end

  def new 
    @pseudonym = Pseudonym.new
  end

  def create
    pseudonym = Pseudonym.new(pseudonym_params)

    if pseudonym.save && current_user.pseudonyms << pseudonym
      flash[:notice] = "Pseudonym successfully created"
    else 
      flash[:notice] = "Oops something went wrong"
    end

    redirect_to root_path
  end

  private 

  def pseudonym_params
    params.require(:pseudonym).permit(:name)
  end
end
