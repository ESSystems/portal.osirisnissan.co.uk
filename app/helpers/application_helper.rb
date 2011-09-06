module ApplicationHelper
  
  def title(page_title)  
    content_for(:title) { page_title }  
  end
  
  # Only need this helper once, it will provide an interface to convert a block into a partial.
  # 1. Capture is a Rails helper which will 'capture' the output of a block into a variable
  # 2. Merge the 'body' variable into our options hash
  # 3. Render the partial with the given options hash. Just like calling the partial directly.
  def block_to_partial(partial_name, options = {}, &block)
    options.merge!(:body => capture(&block))
    render(:partial => partial_name, :locals => options)
  end
 
  # Create as many of these as you like, each should call a different partial 
  def box_widget(title, options = {}, extra = [], &block)
    block_to_partial('shared/box_widget', options.merge(:title => title, :extra => extra), &block)
  end
  
  def add_document_button(title, target, form, options = {})
    add_document = render(:partial => 'shared/add_document', :locals => { :f => form, :document => Document.new })
    options.merge!(:type => "button", :onclick => "$('##{target}').append('" << escape_javascript(add_document) << "')")
    button = content_tag :button, options do
      title
    end
  end
  
   def button_to_add_fields(name, f, association, options = {}, target = "")  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("shared/" << association.to_s.singularize << "_fields", :f => builder)  
    end
    target = association if target == ""
    options.merge!(:type => "button", :onclick => "add_fields(this, \"#{association}\", \"#{target}\", \"#{escape_javascript(fields)}\")")
    button = content_tag :button, options do
      name
    end
  end

end