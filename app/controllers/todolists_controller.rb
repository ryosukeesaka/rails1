class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
  	 redirect_to todolist_path(@list.id)
    else
      @lists = List.all
     render :index
    end
  end

  def index
  	@lists = List.all
    @list = List.new
  end

  def show
  	@list = List.find(params[:id])
    flash[:success] = 'Book was successfully created.'
  end

  def edit
  	@list = List.find(params[:id])
  end

  def update
  	list = List.find(params[:id])
  	list.update(list_params)
  	redirect_to todolist_path(list.id)
  end

  def destroy
  	list = List.find(params[:id])
  	list.destroy
  	redirect_to todolists_path
  end


  private

  def list_params
  	params.require(:list).permit(:title, :body)
  end
end
