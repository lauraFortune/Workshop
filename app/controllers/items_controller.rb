class ItemsController < ApplicationController
  before_action :set_item, only: [ :show,:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    #@categories = Category.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
   @items = Item.all
   # @categories = Category.all
  end

  # GET /items/new
  def new
  #  @categories = Category.all
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  #  @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create
  #  @categories = Category.all
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    searchterm = "%#{params[:searchbox]}%" # var searchterm = searchbox input
    @items = Item.where("title like ?", searchterm) #instance var items = items where the title is like searchterm(users input)
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :brand, :category, :image_url)
    end
end
