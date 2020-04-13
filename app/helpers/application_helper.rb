module ApplicationHelper
  def getVote
    current_user.votes.find_by(:article_id =>  params[:article])
  end

  def gVote(id)
  	current_user.votes.find_by(:article_id =>  id)
  end
end
