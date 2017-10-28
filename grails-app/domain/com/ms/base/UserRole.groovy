/**
 * 创建自 xmw on 2017-01-08.
 */
package com.ms.base
import java.io.Serializable;
import grails.gorm.DetachedCriteria;
import org.apache.commons.lang.builder.HashCodeBuilder
import com.ms.base.User
import com.ms.base.Role



class UserRole implements Serializable{
    private static final long serialVersionUID = 1
    
    User user
    Role role

    UserRole(User user,Role role) {
        this.user = user
        this.role = role
    }
    boolean equals(other) {
        if (!(other instanceof UserRole)) {
            return false
        }
        other.user?.id == user?.id &&
                other.role?.id == role?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (user) builder.append(user.id)
        if (role) builder.append(role.id)
        builder.toHashCode()
    }

    static UserRole get(String userId, String roleId) {
        criteriaFor(userId, roleId).get()
    }

    static boolean exists(String userId, String roleId) {
        criteriaFor(userId, roleId).count()
    }
    private static DetachedCriteria criteriaFor(String userId, String roleId) {
        UserRole.where {
            user == User.load(userId) &&
                    role == Role.load(roleId)
        }
    }

    static List<UserRole> listAllByUser(String userId) {
        UserRole.list{
            eq("user.id",userId)
        }
    }

    static List<UserRole> listAllByRole(String roleId) {
        UserRole.list{
            eq("role.id",roleId)
        }
    }
    static List<UserRole> listAll(User user) {
        UserRole.list{
            eq("user",user)
        }
    }
    static List<UserRole> listAll(Role role) {
        UserRole.list{
            eq("role",role)
        }
    }



    static UserRole create(User user, Role role,boolean flush = false) {
        def instance = new UserRole(user,role)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(User user, Role role, boolean flush = false) {
        if (user == null || role == null) return false

        int rowCount = UserRole.where { user == user && role == role }.deleteAll()

        if (flush) {
            UserRole.withSession { it.flush()
            }
        }

        rowCount
    }

    static void removeAll(User user, boolean flush = false) {
        if (user == null) return
            UserRole.where { user == user }.deleteAll()
        if (flush) {
            UserRole.withSession { it.flush()
            }
        }
    }

    static void removeAll(Role role, boolean flush = false) {
        if (role == null) return
        UserRole.where { role == role }.deleteAll()
        if (flush) {
            UserRole.withSession { it.flush()
            }
        }
    }
    static mapping = {
        id composite: ['user', 'role']
        version false
    }
}
