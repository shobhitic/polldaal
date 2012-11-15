module ChoicesHelper
  def get_choices_based_on_user_votes(choice)
    if @vote
      if @vote.choice == choice
        return button_to choice.description, vote_path(@vote, :choice_id => choice), :class => "btn btn-inverse", :method => :put
      else
        return button_to choice.description, vote_path(@vote, :choice_id => choice), :class => "btn", :method => :put
      end
    else
      return button_to choice.description, votes_path(:choice_id => choice), :class => "btn"
    end
  end

end
