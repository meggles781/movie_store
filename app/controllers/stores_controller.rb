class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  def index
    @stores = Store.all
    render component: 'Stores', props: {stores: @stores}
  end

  def show
    # @store = Store.find(params[:id])
    render component: 'Store', props:{store: @store}
  end

  def new
    @store = Store.new
    render component: 'StoreNew', props:{store: @store}
  end

  def create
    # Store.new(name: "", location: "")
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @store = Store.find(params[:id])
    render component: 'StoreEdit', props:{store: @store}
  end

  def update
    # @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # @store = Store.find(params[:id])
    @store.destroy
    redirect_to root_path
  end

  private
  def set_store
    @store = Store.find(params[:id])
  end
  def store_params
    params.require(:store).permit(:name, :location)
  end

end