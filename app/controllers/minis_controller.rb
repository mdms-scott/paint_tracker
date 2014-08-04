class MinisController < ApplicationController
  before_action :find_mini, :only => [:show, :edit, :update]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update]
  def index
    @minis = Mini.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @mini = Mini.new
    @mini.photos.build
  end

  def create
    @mini = Mini.new(mini_params)
    if @mini.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
    
  end

  def edit

  end

  def update
    if @mini.update_attributes(mini_params)
      redirect_to action: 'show'
    else
      render :edit
    end
  end

  private

  def find_mini
    @mini = Mini.find(params[:id])
  end

  def mini_params
    params.require(:mini).permit(:name, :user_id, :points, photos_attributes: [:id, :image, :_destroy])
  end
end
