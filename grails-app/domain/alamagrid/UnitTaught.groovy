package alamagrid

class UnitTaught {
    Teacher teacher
    Units courseunit
    AcademicTerm academicyear
    
    static hasMany = [students:Student, studentgrades:StudentGrades]
    static belongsTo = Student

    static constraints = {
    }
    
    String toString(){
        return "${courseunit} "
    }
}
