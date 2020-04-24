module ApplicationHelper
  def gt_vote
    current_user.votes.find_by(article_id: params[:vote][:article_id])
  end

  def g_vote(idd)
    current_user.votes.find_by(article_id: idd)
  end
end

