module UsersTable
  extend ActiveSupport::Concern
  
  protected

  def prepare_records
    @users = params[:query].present? ? User.search(params[:query]) : User.limit(10)
    @order_by = permitted_column_name(params[:order_by])
    @direction = permitted_direction(params[:direction])
    @users = filtered_users if params[:filter_by].present?
  end

  private

    def permitted_column_name(column_name)
      %w[name status].find { |permitted| column_name == permitted } || "name"
    end

    def permitted_direction(direction)
      %w[asc desc].find { |permitted| direction == permitted } || "asc"
    end

    def filtered_users
      @users = @users.status_filter(params[:filter_by].to_sym) if User.statuses[params[:filter_by]].class == Integer
    end
end
