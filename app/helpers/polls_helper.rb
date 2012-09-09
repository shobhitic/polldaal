module PollsHelper
  def get_votes(choice)
    if @total_votes == 0
      @total_votes = 1
    end
    return "<div class=\"bar\" style=\"width: #{ 100 * choice.votes.length / @total_votes }%\"></div>".html_safe
  end
end