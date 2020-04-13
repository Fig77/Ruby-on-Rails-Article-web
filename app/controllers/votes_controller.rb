class VotesController < ApplicationController
  include ApplicationHelper
  def update
    @vote ||= getVote
    @vote = Vote.new(article_id: params[:article], user_id: current_user.id) if @vote.nil?
    @vote.save
    redirect_to article_path
  end

  def delete; end
end
