package alamagrid

import alamagrid.*
import grails.plugins.springsecurity.Secured
import grails.converters.*
import org.springframework.dao.DataIntegrityViolationException

class StudentController {
    
    def springSecurityService

    def index() {
        def curstudent = lookupUser()
        def mycourse = curstudent.course
        def unitList = UnitTaught.list()
        [curstudent:curstudent,unitlist:unitList,mycourse:mycourse]
    
    }
    
    def registerunit(){
        def curstudent = lookupUser()
        def curunit = UnitTaught.get(params.id)
        // inotialize the students individual grades
        def studentsgrades = StudentGrades.findByStudentAndUnittaught(curstudent,curunit)?:new StudentGrades(
            student:curstudent,
            unittaught:curunit
        ).save(failOnError:true)
        curunit.addToStudents(curstudent)
        render 'Succesfully registered for ${curunit}'
    }
    
    private lookupUser(){
        Student.get(springSecurityService.principal.id)
    }
    def viewunits(){
        def curstudent = lookupUser()
        
        //def myunits = UnitTaught.students.contains(curstudent)
        [curstudent:curstudent]
    }
    def viewresults(){
        def curStudent = lookupUser()
        def mygrades = StudentGrades.findAllByStudent(curStudent)
        for (grades in mygrades){
            println grades.unittaught
        }
        
        [curstudent:curStudent,mygrades:mygrades]
        
    }
}
