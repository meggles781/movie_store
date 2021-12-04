class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores =  Store.all
    render component: 'Stores', props: {stores: @stores}
  end

  def show
    # @store = Store.find(params[:id])
    render component: 'Store', props: { store: @store }
  end

  def new
    @store = Store.new
    render component: 'StoreNew' props: {store: @store}
  end

  def edit
    render component: 'StoreEdit' , props: {store: @store}
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      #do somethin
    else
      render :new 
    end
  end

  def update
    if @store.update(store_params)
      # do something
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    #redirect
  end

  
  private

  def set_store
    @store = Store.find(params[:id])
  end

  def 
end
