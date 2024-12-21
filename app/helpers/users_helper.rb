module UsersHelper
    def get_initials(user)
        user.name.split.map { |name| name[0] }.join.upcase
    end
end
