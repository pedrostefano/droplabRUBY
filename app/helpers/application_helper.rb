module ApplicationHelper
  def admin_types
    ['AdminUser']
  end

  def active?(path)
    "active" if current_page?(path)
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
  end

end
