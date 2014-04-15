package alamagrid

class StudentGrades {
    Student student
    UnitTaught unittaught
    Integer catmarks = 0
    Integer exammarks = 0
    Integer totalmarks = 0
    String grade

    static constraints = {
        student blank:false, nullable:false
        unittaught blank:false, nullable:false
        catmarks nullable:true, range:0..50
        exammarks nullable:true, range:0..100
        grade nullable:true, inList:(['A','B','C','D','E','Unknown'])
        totalmarks max:100
        
    }
    
    String toString(){
        return "${student}, ${unittaught} results"
    }
    
}
