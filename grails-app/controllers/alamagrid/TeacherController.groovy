package alamagrid

import grails.plugins.springsecurity.Secured
import alamagrid.*
import org.springframework.dao.DataIntegrityViolationException

class TeacherController {
    def springSecurityService

    @Secured(['ROLE_TEACHER'])
    def index() {
        def teacherInfo=lookupUser()
        
        [teacherinfo:teacherInfo]
    }
    private lookupUser(){
        Teacher.get(springSecurityService.principal.id)
    }
    def editprofile(){
        def teacherInstance = lookupUser()
        render (view:'editprofile', model:[userInstance:teacherInstance])
    }
    def viewexams(){
        
    }
    private getUnitsTaught(){
        def curTeacher = lookupUser()
        def unitList = UnitTaught.findAllByTeacher(curTeacher)
        return unitList
    }
    def showstudents(){
        def curTeacher = lookupUser()
        def curUnit = Units.get(params.id)
        def unitandteacher = UnitTaught.findByTeacherAndCourseunit(curTeacher,curUnit)
        //def studentList = Student.findAllByTeachableunits(unitandteacher)
        def studentGradesList = StudentGrades.findAllByUnittaught(unitandteacher)
        for (student in unitandteacher.students){
            println student.realname
            
        }
      
        render (view:'showstudents',model:[teacherinfo:curTeacher,
                curUnit:curUnit,
                unitandteacher:unitandteacher,
                studentsGradesList:studentGradesList])
    }
    def viewunits(){
        def curTeacher = lookupUser()
        def unitList = UnitTaught.findAllByTeacher(curTeacher)
        render (view:'viewunits',model:[unitlist:unitList,teacherinfo:curTeacher])
    }
    def examactions(){
        def curTeacher = lookupUser()
        def unitList = UnitTaught.findAllByTeacher(curTeacher)
        render 'Todo'
    }
    def entermarks(){
         def curTeacher = lookupUser()
        def curUnit = Units.get(params.id)
        def unitandteacher = UnitTaught.findByTeacherAndCourseunit(curTeacher,curUnit)
        //def studentList = Student.findAllByTeachableunits(unitandteacher)
        def studentGradesList = StudentGrades.findAllByUnittaught(unitandteacher)
        for (student in unitandteacher.students){
            println student.realname
            
        }
      
        render (view:'entermarks',model:[teacherinfo:curTeacher,
                curUnit:curUnit,
                unitandteacher:unitandteacher,
                studentsGradesList:studentGradesList])
    }
    def mailbox(){
        render 'mailbox coming soon'
    }
    def assignments(){
        render 'Assignments module coming soon'
    }
    def news(){
        render 'RSS News website services'
    }
    def calender(){
        render "calender via full calender plugin"
    }
    def savegrade(){
        def studentGradesInstance = StudentGrades.get(params.id)
        def sinstance = studentGradesInstance.unittaught
        if (!studentGradesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "entermarks")
            return
        }
        if (params.version) {
            def version = params.version.toLong()
            if (studentGradesInstance.version > version) {
                studentGradesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studentGrades.label', default: 'StudentGrades')] as Object[],
                          "Another user has updated this StudentGrades while you were editing")
                render(view: "entermarks", model: [studentGradesInstance: studentGradesInstance])
                return
            }
        }
         studentGradesInstance.properties = params
         int catmark = Integer.parseInt(params.catmarks)
         int exammark = Integer.parseInt(params.exammarks)
         studentGradesInstance.totalmarks = catmark+exammark
         studentGradesInstance.grade = calculateGrade(catmark,exammark)

        if (!studentGradesInstance.save(flush: true)) {
            render(view: "entermarks", model: [studentGradesInstance: studentGradesInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'studentGrades.label', default: 'Student Marks' ), studentGradesInstance.id])
        redirect(action: "entermarks", id: sinstance.id)
       
    }
    private String calculateGrade(int x, int y){
        String grade
        int refgrade = x + y
        if (refgrade>=70 && refgrade <=100){
            grade = "A"
        }
        else if (refgrade>=60 && refgrade<=69){
            grade = "B"
        }
        else if(refgrade>=50 && refgrade<=59){
            grade = "C"
        }
        else if (refgrade>=40 && refgrade<=49){
            grade = "D"
        }
        else if (refgrade>0 && refgrade<=39){
            grade = "E"
        }
        else if (refgrade == 0){
            grade = "Unknown"
        }
        return grade
    }
}
