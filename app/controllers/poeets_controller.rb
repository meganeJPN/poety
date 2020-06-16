class PoeetsController < ApplicationController
  before_action :set_poeet, only: [:edit, :update,:destroy]
  def index
    @poeets = Poeet.all
  end

  def new
    @poeet = Poeet.new
  end

  def create
    # Poeet.create(content: params[:poeet][:content])
    @poeet = Poeet.new(poeet_params)
    if params[:back]
      render :new
    else
      if @poeet.save
        redirect_to poeets_path,notice: "ポイートしました"
      else
        render :new
      end
    end
  end

  def edit
  end

  def destroy
    @poeet.destroy
    redirect_to poeets_path,notice:"ポイートを削除しました"
  end

  def update
    if @poeet.update(poeet_params)
      redirect_to poeets_path,notice: "ポイートを編集しました"
    else
      render :edit
    end
  end

  def confirm
    @poeet = Poeet.new(poeet_params)
    render :new if @poeet.invalid?
  end

  private
  def poeet_params
    params.require(:poeet).permit(:content)
  end

  def set_poeet
    @poeet = Poeet.find(params[:id])
  end
end
