package alamagrid

class AcademicTerm {
    String yearofstudy
    String semester
    
    static hasMany = [students:RegisteredStudent, unitstaight:UnitTaught]
    static belongsTo = RegisteredStudent

    static constraints = {
        yearofstudy nullable:true
        semester nullable:true 
    }
    String toString(){
        return "${yearofstudy}, ${semester} Semester"
    }
}
