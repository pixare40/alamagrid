package alamagrid

class RegisteredStudent {
    Student registeredStudent
    Courses course
    AcademicTerm period
    

    static hasMany =[academicterms:AcademicTerm]
    static constraints = {
        registeredStudent nullable:true
        course nullable:true
        period nullable:true
    }
    String toString(){
        return "${registeredStudent} Course: ${course} Academic Term: ${period}"
    }
}
