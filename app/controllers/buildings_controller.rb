class BuildingsController < ApplicationController
  def index
    @buildings = Building.order(created_at: :desc)
  end

  def new
    @owners = Owner.all.map{ |o| [o.full_name, o.id] }
    @building = Building.new
    @states = ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL',
      'IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE',
      'NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
      'TN','TX','UT','VT','VA','WA','WV','WI','WY']
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to new_building_path, 
        notice: 'Building added!'
    else
      render :new
    end
  end

  private

  def building_params
    params.require(:building)
      .permit(:street_address, :city, :state, :postal_code, :description, :owner_id)
  end
end