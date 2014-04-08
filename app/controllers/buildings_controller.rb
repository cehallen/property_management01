class BuildingsController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
    @buildings = Building.order(created_at: :desc)
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @building = Building.new
    @states = ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL',
      'IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE',
      'NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
      'TN','TX','UT','VT','VA','WA','WV','WI','WY']
  end

  def create
    @building = Building.new(building_params)
    @owner = Owner.find(params[:owner_id])
    @building.owner_id = @owner.id
    # @building.owner_id = params[:owner_id] ## isn't enough
    if @building.save
      redirect_to new_owner_building_path(@owner), 
        notice: 'Building added!'
    else
      render 'buildings/new'
    end
  end

  private

  def building_params
    params.require(:building)
      .permit(:street_address, :city, :state, :postal_code, :description)
  end
end