class DepartmentsController < ApplicationController
  before_action :dep_find, only: [:show, :edit, :update, :destroy]

  def index
    @deps = Department.all
  end
  
  def show
  end

  def new
    @dep = Department.new
    render partial: "form"
  end

  def create
    @dep = Department.new(dep_params)
    if @dep.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @dep.update(dep_params)
      redirect_to departments_path(@dep)
    else
      render :edit
    end
  end

  def destroy
    @dep.destroy
    redirect_to departments_path
  end

  private
    def dep_params
      params.require(:department).permit(:dep_name)
    end

    def dep_find
      @dep = Department.find(params[:id])
    end

end
