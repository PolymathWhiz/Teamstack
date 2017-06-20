module UtilHelper
  def truncate_user_name(length)
    if current_user.first_name.present? || current_user.last_name.present?
      first_name = current_user.first_name.titleize
      last_name = current_user.last_name.titleize
      name = first_name + " " + last_name if first_name || last_name != nil
      truncate(name, length: length)
    else
      email = current_user.email
      truncate(email, length: length)
    end
  end

  def city
    city = current_user.city
    return "#{city}" if !city.blank?
  end

  def state
    state = current_user.state
    return ", #{state}" if !state.blank?
  end

  def country
    country = current_user.country 
    return ", #{country}." if !country.blank?
  end

  def member_time
    since = current_user.created_at.to_date.to_s(:long)
    return "Member since #{since}"
  end

  def bio
    current_user.bio 
  end
end