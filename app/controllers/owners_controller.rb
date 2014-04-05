class OwnersController < ApplicationController
  def index
    @owners = Owner.order(updated_at: :desc)
  end

  def show
    @owner = Owner.find(params[:id])
    # @building = Building.new
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to new_owner_path,
        notice: 'Owner added!'
      else
        render :new
      end
  end

  private

  def owner_params
    params.require(:owner)
      .permit(:first_name, :last_name, :email, :company_name)
  end
end