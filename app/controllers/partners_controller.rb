class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ destroy ]
  before_action :set_states, only: %i[new edit]
  before_action :set_user

  def new
    current_user.friend_request(@user)
    # redirect_back(fallback_location: root_path)
    current_user.reload
  end

  def create
    current_user.accept_request(@user)
    # redirect_back(fallback_location: root_path)
    current_user.reload
  end

  def destroy
    current_user.reject_request(@user)
    # redirect_back(fallback_location: root_path)
    current_user.reload
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = partner.find_by(user_id: current_user.id, partner_id: params[:partner_id])
  end
  
  def set_user
    @user = User.find(params[:id])
  end
    
  def set_states
    @states = Partner.states.map { |state, id| [state, state] }
  end

   # Only allow a list of trusted parameters through.
  def partner_params
    params.require(:partner).permit(:user_id, :training_id, :state)
  end
end
