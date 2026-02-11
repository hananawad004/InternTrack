//// File: grails-app/domain/intern/track/UserRole.groovy
//package interntrack
//
//class UserRole implements Serializable {
//
//    private static final long serialVersionUID = 1
//
//    User user
//    Role role
//
//    static constraints = {
//        role validator: { Role r, UserRole ur ->
//            if (ur.user?.id) {
//                if (UserRole.exists(ur.user.id, r.id)) {
//                    return ['userRole.exists']
//                }
//            }
//        }
//    }
//
//    static mapping = {
//        id composite: ['user', 'role']
//        version false
//    }
//
//    static boolean exists(Long userId, Long roleId) {
//        UserRole.where {
//            user.id == userId && role.id == roleId
//        }.count() > 0
//    }
//}
// File: grails-app/domain/interntrack/UserRole.groovy
package interntrack

class UserRole implements Serializable {

    private static final long serialVersionUID = 1

    User user
    Role role

    static constraints = {
        role validator: { Role r, UserRole ur ->
            if (ur.user?.id) {
                if (UserRole.exists(ur.user.id, r.id)) {
                    return ['userRole.exists']
                }
            }
        }
    }

    static mapping = {
        id composite: ['user', 'role']
        version false
    }

    static boolean exists(Long userId, Long roleId) {
        UserRole.where {
            user.id == userId && role.id == roleId
        }.count() > 0
    }

    static UserRole get(long userId, long roleId) {
        UserRole.where {
            user == User.load(userId) &&
                    role == Role.load(roleId)
        }.get()
    }

    static void removeAll(User u) {
        UserRole.executeUpdate("DELETE FROM UserRole WHERE user = :user", [user: u])
    }

    static void removeAll(Role r) {
        UserRole.executeUpdate("DELETE FROM UserRole WHERE role = :role", [role: r])
    }
}