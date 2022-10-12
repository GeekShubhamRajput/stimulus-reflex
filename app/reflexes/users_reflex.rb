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

  def order
    params[:order_by] = element.dataset["column-name"]
    params[:direction] = element.dataset["direction"]
    update_records
  end

  
  private
  
  def update_records
    prepare_records

    assigns = {
      query: @query,
      filter_by: @filter,
      order_by: @order_by,
      direction: @direction,
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
