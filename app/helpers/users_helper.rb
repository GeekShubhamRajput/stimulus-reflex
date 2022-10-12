module UsersHelper

  def user_status_collection
    User.statuses.map { |key, value| [key.humanize, key] }
  end
end
