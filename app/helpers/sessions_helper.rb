module SessionsHelper
    # 登录指定用户
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # 返回当前用户
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    # 退出
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
