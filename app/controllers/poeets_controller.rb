class PoeetsController < ApplicationController
  before_action :set_poeet, only: [:edit, :update,:destroy]
  def index
    @poeets = Poeet.all
  end

  def new
    @poeet = Poeet.new
    respond_to do |format| 
      # format.html{ redirect_to @poeet, notice: 'ポイートしました' }
      format.js {} 
    end
  end

  def create
    # Poeet.create(content: params[:poeet][:content])
    @poeet = Poeet.new(poeet_params)
    respond_to do |format|
      if params[:back]
        # format.html { render :new}
        format.js {render :new} 
      else
      if @poeet.save
        format.html {redirect_to poeets_path, notice: 'ポイートしました'}
        format.json {redirect_to poeets_path, status: :created}
        format.js { redirect_to poeets_path}
      else
        format.html { render :new }
        format.json { render json: @poeet.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
    # if params[:back]
    #   render :new
    # else
    #   if @poeet.save
    #     redirect_to poeets_path,notice: "ポイートしました"
    #   else
    #     render :new
    #   end
    # end
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

  # def confirm
  #   @poeet = Poeet.new(poeet_params)
  #   render :new if @poeet.invalid?
  # end

  def confirm
    @poeet = Poeet.new(poeet_params)
    respond_to do |format| 
      if @poeet.invalid?
        format.html { render :new }
        format.json { render json: @poeet.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      else
        format.html {redirect_to poeets_path, notice: 'ポイートしました'}
        format.json { render :index, status: :created, location: @poeet }
        format.js { @status = "success"}
      end
      format.html{ redirect_to @poeet, notice: 'ポイートしました' }
      format.js {} 
    end
  end

  private
  def poeet_params
    params.require(:poeet).permit(:content)
  end

  def set_poeet
    @poeet = Poeet.find(params[:id])
  end
end
