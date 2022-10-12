class UsersReflex < ApplicationReflex
  include UsersTable

  def search
    params[:query] = element[:value].strip
    update_records
  end

  def filter
    params[:filter_by] = element[:value].strip
    update_records
  end
  
  private
  
  def update_records
    prepare_records

    assigns = {
      query: params[:query],
      filter_by: params[:filter_by],
      users: @users
    }

    uri = URI.parse([request.base_url, request.path].join)
    uri.query = assigns.except(:users).to_query

    morph :nothing

    cable_ready
      .inner_html(selector: "#search-results", html: render(partial: "users/search_result", assigns: assigns))
      .push_state(url: uri.to_s)
      .broadcast
  end

  
end
