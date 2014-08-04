module ApplicationHelper

  def active_class controller, action
    if controller == controller_name && action == action_name
      'active'
    else
      ''
    end
  end

end
