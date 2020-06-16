class PoeetsController < ApplicationController
  def index
    @poeets = Poeet.all
  end

  def new
    @poeet = Poeet.new
  end

  def create
    # Poeet.create(content: params[:poeet][:content])
    @poeet = Poeet.new(poeet_params)
    if @poeet.save
      redirect_to poeets_path,notice: "ポイートしました"
    else
      render :new
    end
  end

  private
  def poeet_params
    params.require(:poeet).permit(:content)
  end
end
