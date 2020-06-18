class PoeetsController < ApplicationController
  before_action :set_poeet, only: [:edit, :update,:destroy]
  def index
    @poeets = Poeet.all
  end

  def new
    @poeet = Poeet.new
    respond_to do |format| 
      format.html{ redirect_to @poeet, notice: 'ポイートしました' }
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
          # format.js { @status = "success" }
          format.js {redirect_to poeets_path}
        else
          format.html { render :new }
          format.json { render json: @poeet.errors, status: :unprocessable_entity }
          # format.js { @status = "fail" }
          format.js{ render :new}
        end
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
    if params[:back]
      # format.html { render :edit }
      # format.js {render :edit}
      render :edit
    else
      if @poeet.update(poeet_params)
        redirect_to poeets_path,notice: "ポイートを編集しました"
      else
        render :edit
      end
    end
    
  end

  # def confirm
  #   @poeet = Poeet.new(poeet_params)
  #   render :new if @poeet.invalid?
  # end

  def confirm
    @poeet = Poeet.new(poeet_params)
    logger.debug("id代入前")
    logger.debug(@poeet.id)

    @poeet.id = params[:id]

    logger.debug("id代入後")
    logger.debug(@poeet.id)
    # @poeet = Poeet.find_or_initialize_by(id: params[:id])
    logger.debug("action_name")
    logger.debug(action_name)
    respond_to do |format| 
      if @poeet.invalid?
        if @poeet.id?
          format.html { render :edit }
          # format.json { render json: @poeet.errors, status: :unprocessable_entity }
          # format.js { @status = "fail" }
          format.js{ render :edit}
        else
          format.html { render :new }
          # format.json { render json: @poeet.errors, status: :unprocessable_entity }
          # format.js { @status = "fail" }
          format.js{ render :new}
        end
      else
        format.html {redirect_to poeets_path, notice: 'ポイートしました'}
        format.json { render :index, status: :created, location: @poeet }
        format.js { @status = "success"}
      end
    end
  end

  private
  def poeet_params
    params.require(:poeet).permit(:id, :content)
  end

  def set_poeet
    @poeet = Poeet.find(params[:id])
  end
end
