module UtilHelper
  def truncate_user_name(length)
    if current_user.first_name.present? && current_user.last_name.present?
      first_name = current_user.first_name.titleize
      last_name = current_user.last_name.titleize
      name = first_name + " " + last_name if first_name || last_name != nil
      truncate(name, length: length)
    else
      email = current_user.email
      truncate(email, length: length)
    end
  end
end