module UsersHelper
    def get_initials(username)
        username.split.map { |name| name[0] }.join.upcase
    end
end
