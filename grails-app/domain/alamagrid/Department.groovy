package alamagrid

class Department {
    String deptcode
    String deptname
    
    static hasMany = [courses:Courses]

    static constraints = {
    }
}
