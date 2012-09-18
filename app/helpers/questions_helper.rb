module QuestionsHelper
  def add_new_choice(question)
    question.choices.build

  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{ j fields }\")")
  end
  
  def get_votes(choice)
    if @total_votes == 0
      @total_votes = 1
    end
    return "<div class=\"bar\" style=\"width: #{ 100 * choice.votes.length / @total_votes }%\"></div>".html_safe
  end
  
end
