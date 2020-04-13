class VotesController < ApplicationController
  include ApplicationHelper
  def update
    @vote ||= getVote
    if @vote.nil?
      @vote = Vote.new(:article_id =>  params[:article], :user_id=>current_user.id)
    end
    @vote.save
    redirect_to article_path
  end

  def delete
  end

end
