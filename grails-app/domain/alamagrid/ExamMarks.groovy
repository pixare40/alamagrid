package alamagrid

class ExamMarks {
    
    Student student
    Units unit
    Teacher teacher
    Integer grade
    
    static belongsTo = Student

    static constraints = {
        
    }
    String toString(){
        return "${student}, Unit: ${unit} Grade:${grade}"
    }
}
