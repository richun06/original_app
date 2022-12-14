class ReservesController < ApplicationController

  def index
    @reserves = Reserve.all
    @reserve = Reserve.new
  end

  def new
    @reserve = Reserve.new
  end

  def create
    Reserve.create(reserve_parameter)
    redirect_to reserves_path
  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    redirect_to reserves_path, notice:"削除しました"
  end

  def edit
    @reserve = Reserve.find(params[:id])
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update(reserve_parameter)
      redirect_to reserves_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def reserve_parameter
    params.require(:reserve).permit(:title, :content, :start_time)
  end

end
