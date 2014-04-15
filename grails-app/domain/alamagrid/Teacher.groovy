package alamagrid

class Teacher extends User{
    
    String realname
    String staffid
    Date dateOfBirth

    static constraints = {
        staffid nullable:false, unique:true
        dateOfBirth nullable:true
    }
    
     def beforeInsert() {
            encodePassword()
    }

    def beforeUpdate() {
            if (isDirty('password')) {
                    encodePassword()
            }
    }
    protected void encodePassword() {
            password = springSecurityService.encodePassword(password)
    }
    String toString(){
        return "${realname}, ${staffid}"
    }
}
