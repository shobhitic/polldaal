module ChoicesHelper
  def get_choices_based_on_user_votes(choice, default_class)
    if @vote
      if @vote.choice == choice
        return button_to choice.description, vote_path(@vote, :choice_id => choice), :class => "#{default_class} btn-inverse", :method => :put
      else
        return button_to choice.description, vote_path(@vote, :choice_id => choice), :class => "#{default_class}", :method => :put
      end
    else
      return button_to choice.description, votes_path(:choice_id => choice), :class => "#{default_class}"
    end
  end

end
