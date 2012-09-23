class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.save
  end
end
