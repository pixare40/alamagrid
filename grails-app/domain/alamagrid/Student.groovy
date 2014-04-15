package alamagrid
import alamgrid.*

class Student extends User{
    
    transient springSecurityService
    
    String realname
    String registrationnumber
    Date dateOfBirth
    Courses course
    
    static hasMany = [followed:Parents, teachableunits:UnitTaught, studentgrades:StudentGrades]
    static searchable = true

    static constraints = {
        registrationnumber blank:false, nullable:false, unique:true
        dateOfBirth nullable:true
        course nullable:true
        
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
            return "${realname} ${registrationnumber}"
        }
}
