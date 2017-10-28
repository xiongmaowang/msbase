/**
 * 创建自 zmd on 2017-01-03.
 */
package com.ms.base
import java.io.Serializable;
import grails.gorm.DetachedCriteria;
import org.apache.commons.lang.builder.HashCodeBuilder
import com.ms.base.User
import com.ms.base.Resource



class UserResource implements Serializable{
    private static final long serialVersionUID = 1
    
    User user
    Resource resource

    UserResource(User user,Resource resource) {
        this.user = user
        this.resource = resource
    }
    boolean equals(other) {
        if (!(other instanceof UserResource)) {
            return false
        }
        other.user?.id == user?.id &&
                other.resource?.id == resource?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (user) builder.append(user.id)
        if (resource) builder.append(resource.id)
        builder.toHashCode()
    }

    static UserResource get(String userId, String resourceId) {
        criteriaFor(userId, resourceId).get()
    }

    static boolean exists(String userId, String resourceId) {
        criteriaFor(userId, resourceId).count()
    }
    private static DetachedCriteria criteriaFor(String userId, String resourceId) {
        UserResource.where {
            user == User.load(userId) &&
                    resource == Resource.load(resourceId)
        }
    }

    static List<User> listAllUser(String userId) {
        UserResource.list{
            eq("user.id",userId)
        }
    }

    static List<Resource> listAllResource(String resourceId) {
        UserResource.list{
            eq("resource.id",resourceId)
        }
    }



    static UserResource create(User user, Resource resource,boolean flush = false) {
        def instance = new UserResource(user,resource)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(User user, Resource resource, boolean flush = false) {
        if (user == null || resource == null) return false

        int rowCount = UserResource.where { user == user && resource == resource }.deleteAll()

        if (flush) {
            UserResource.withSession { it.flush()
            }
        }

        rowCount
    }

    static void removeAll(User user, boolean flush = false) {
        if (user == null) return
            UserResource.where { user == user }.deleteAll()
        if (flush) {
            UserResource.withSession { it.flush()
            }
        }
    }

    static void removeAll(Resource resource, boolean flush = false) {
        if (resource == null) return
        UserResource.where { resource == resource }.deleteAll()
        if (flush) {
            UserResource.withSession { it.flush()
            }
        }
    }
    static mapping = {
        id composite: ['user', 'resource']
        version false
    }
}
