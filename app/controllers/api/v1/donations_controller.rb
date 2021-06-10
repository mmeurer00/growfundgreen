class Api::V1::DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :update, :destroy]

 # GET /donations
  def index
    @donations = Donation.all

    render json: @donations
  end

  # GET /donations/1
  def show
    render json: @donation
  end

  # POST /donations
  def create
    campaign = Campaign.find_by(id: params[:campaign_id])
    @donation = campaign.donations.build(donation_params)

    if @donation.save
      render json: {donation: @donation, status: 201}, location: api_v1_campaign_path(@donation)
    else
      flash.now[:notice] = "Donation DID NOT save. Fill in all fields. "
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  #PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      render json: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  #DELETE /donations/1
  def destroy
    @donation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.require(:donation).permit(:comment, :price, :campaign_id)
    end
end
