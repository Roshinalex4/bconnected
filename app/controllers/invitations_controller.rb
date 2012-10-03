class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.save
    redirect_to "/home/index"
  end
end
