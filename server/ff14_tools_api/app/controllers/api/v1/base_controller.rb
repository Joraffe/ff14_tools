module Api
  module V1
    class AdminApiController < ApplicationController
      private
        def require_admin
          user_permission_id = current_user.permission_id
          permission = Permission.find(user_permission_id)

          if permission.name != 'admin':
            not_authorized
        end
    end

    class BasicApiController < ApplicationController
    end
  end
end
