class Api::V1::CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :update, :destroy]

    # GET /campaigns
    def index
        
        @campaigns = Campaign.all
       
        render json: @campaigns, include: {
          donations: {
            except: [:created_at, :updated_at]
          }
        }
    end

    #GET /campaigns/1
        def show
          render json: @campaign, include: {
            donations: {
              except: [:created_at, :updated_at]
            }
          }
    end

    # POST /campaigns
    def create
      @campaign = Campaign.new(campaign_params)

      if @campaign.save
        render json: @campaign, status: :created, location: api_v1_campaign_path(@campaign)
      else
        render json: @campaign.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /campaigns/1
    def update
      if @campaign.update(campaign_params)
        render json: @campaign
      else
        render json: @campaign.errors, status: :unprocessable_entity
      end
    end

    # DELETE /campaigns/1
    def destroy
      if @campaign.destroy
        render json: {message: "Successfully deleted"}
      else
        render json: {message: "Did not delete"}
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
        @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
        params.require(:campaign).permit(:name, :description, :goal)
    end
end
