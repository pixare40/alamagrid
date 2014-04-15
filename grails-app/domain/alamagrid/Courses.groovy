package alamagrid

class Courses {
    String name
    String coursecode
    
    static hasMany = [units:Units, students:Student]
    static belongsTo = [department:Department]
    static searchable = true
    static constraints = {
        name nullable:false, blank:false
        coursecode nullable:false, blank:false
        department nullable:true
    }
}
