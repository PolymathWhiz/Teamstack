module UtilHelper
  def truncate_user_name(first_name, last_name, length)
    name = first_name + " " + last_name
    truncate(name, length: length)
  end

  def city
    city = @user.city
    return "#{city}" if !city.blank?
  end

  def state
    state = @user.state
    return ", #{state}" if !state.blank?
  end

  def country
    country = @user.country 
    return ", #{country}." if !country.blank?
  end

  def member_time
    since = @user.created_at.to_date.to_s(:long)
    return "Member since #{since}"
  end

  def bio
    @user.bio 
  end

  def number_formatter(number)
     number_to_human(number, :format => '%n%u', :units => { :thousand => 'K', :million => 'M', :billion => 'B', :trillion => 'T' }) unless number == nil 
  end
end