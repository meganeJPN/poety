class PoeetsController < ApplicationController
  def index
    @poeets = Poeet.all
  end

  def new
    @poeet = Poeet.new
  end

  def create
    # Poeet.create(content: params[:poeet][:content])
    Poeet.create(poeet_params)
    redirect_to poeets_path
  end

  private
  def poeet_params
    params.require(:poeet).permit(:content)
  end
end
