class VotesController < ApplicationController
  include ApplicationHelper
  def update
    @vote ||= gt_vote
    @vote = Vote.new(votes_params) if @vote.nil?
    @vote.user_id = current_user.id
    @vote.save
    redirect_to article_path
  end

  private

  def votes_params
    params.require(:vote).permit(:article_id)
  end
end
