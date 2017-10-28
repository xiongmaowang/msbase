package com.ms.base

class RoleGroup implements Serializable{

    Role role
	Group group
	
    static RoleGroup create(Role role, Group group, boolean flush = false) {
		new RoleGroup(role: role, group: group).save(flush: flush, insert: true)
	}

	static boolean remove(Role role, Group group, boolean flush = false) {
		RoleGroup instance = RoleGroup.findByRoleAndGroup(role, group)
		if (!instance) {
			return false
		}
		instance.delete(flush: flush)
		true
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM RoleGroup WHERE role=:role', [role: role]
	}

	static void removeAll(Group group) {
		executeUpdate 'DELETE FROM RoleGroup WHERE group=:group', [group: group]
	}

	static mapping = {
		id composite: ['role', 'group']
//		version false
//		table "ROSTEN_ROLE_GROUP"
	}
}
