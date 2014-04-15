package alamagrid

class Units {
    String name
    String code
    String description
    String yearOffered
    String semesterOffered
    String unitType
    
    static belongsTo = [course:Courses]
    static hasMany = [prerequisites:Units]

    static constraints = {
        name nullable:false, blank:false
        code nullable:false, blank:false
        description nullable:true
        yearOffered nullable:true
        semesterOffered nullable:true
        unitType(inList:['Core','Elective'])
        course nullable:true
        prerequisites nullable:true
    }
    String toString(){
        return "${name} - ${code}"
    }
}
