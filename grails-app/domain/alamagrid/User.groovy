package alamagrid

class User {

	transient springSecurityService

	String username
	String password
        String email
        String realname
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
                email blank:false, nullable:false
                realname blank:false, nullable:false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

       
}
