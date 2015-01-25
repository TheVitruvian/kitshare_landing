class KitsController < ApplicationController
  #stuff for cancancan
  # load_and_authorize_resource
  # before_filter :authenticate_user!, except: [:index, :show]

  # GET /users
  # GET /users.json
  def index
    @kits = Kit.all
    
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @kits }
    end
  end

  def show
    @kit = Kit.find params[:id]

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @kit }
    end
  end

  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(params[:kit])
    @kit.user = current_user
    respond_to do |format|
      if @kit.save
        if params[:kit_photos]
          params[:kit_photos].each do |picture|
            @kit.kit_photos.create(image: picture)
            
          end

        end
        format.html { redirect_to @kit, notice: 'Kit was successfully created.' }

      else
        format.html { render action: "new" }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @kit = Kit.find params[:id]
  end

  def update
    @kit = Kit.find(params[:id])
    
    respond_to do |format|
      if @kit.update_attributes(params[:kit])
        format.html { redirect_to @kit, notice: 'Kit was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def search
  end

end

   