package alamagrid

import grails.plugins.springsecurity.Secured
import alamagrid.*
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.converters.*

class AdminController {
    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index() {
        def userName = User.get(springSecurityService.principal.id)
        [adminname:userName]
    
    }
    
    def listStudents(){
        User user
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //def myStudentRole = Role.findByAuthority("ROLE_STUDENT")
        def studentRole = Role.findByAuthority('ROLE_STUDENT')
        def userInstanceList = UserRole.findAllByRole(studentRole).user
        
        render(view:'studentActions/listStudents',model:[userInstanceList:userInstanceList, userInstanceTotal:User.count()])
          
        //[userInstanceList:UserRole.findAllByRole(studentRole).user]
        
    }
    def showStudent(){
        def userInstance = User.get(params.id)
        render (view:'studentActions/showStudent', model:[userInstance:userInstance])
    }
    //Actions the administrator can perform on the student
    def createStudent (){
        //def userInstance = User.findByUsername(params.username)?:new User(params)
        render(view:"studentActions/createStudent", model:[userInstance:new User(params)])
    }
    def saveStudent(){
        def userInstance = new User(params)
        //userInstance.save()
        if (!userInstance.save(flush: true)) {
            render(view: "studentActions/createStudent", model: [userInstance: userInstance])
            return
        }
        def roleStudent = Role.findByAuthority("ROLE_STUDENT")
        if (!userInstance.authorities.contains(roleStudent)) {
            UserRole.create userInstance, roleStudent
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.realname])
        redirect(action: "showStudent", id: userInstance.id)
    }

    def editStudent(){
        def userInstance = User.get(params.id)
        render (view:'studentActions/editStudent', model:[userInstance:userInstance])
    }
    def delete(){
        def userInstance = User.get(params.id)
        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "listStudents")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "showStudent", id: params.id)
        }
    }
    def update(){
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "studentActions/listStudents")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "studentActions/editStudent", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "studentActions/editStudent", model: [userInstance: userInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "showStudent", id: userInstance.id)
    }
    //Actions the administrator can perform on the Teachers
    def createTeacher(){
        render(view:"teacherActions/create", model:[userInstance:new User(params)])
    }
    def saveTeacher(){
        def userInstance = new User(params)
        //userInstance.save()
        if (!userInstance.save(flush: true)) {
            render(view: "teacherActions/create", model: [userInstance: userInstance])
            return
        }
        def roleTeacher = Role.findByAuthority("ROLE_TEACHER")
        if (!userInstance.authorities.contains(roleTeacher)) {
            UserRole.create userInstance, roleTeacher
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.realname])
        redirect(action: "teacherActions/show", id: userInstance.id)
    }
    def editTeacher(){
        def userInstance = User.get(params.id)
        render (view:'teacherActions/edit', model:[userInstance:userInstance])
    }
    def listTeachers(){
        User user
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def teacherRole = Role.findByAuthority('ROLE_TEACHER')
        def userInstanceList = UserRole.findAllByRole(teacherRole).user
        render(view:'teacherActions/list',model:[userInstanceList:userInstanceList, userInstanceTotal:User.count()])
    }
    def showTeacher(){
        def userInstance = User.get(params.id)
        render (view:'teacherActions/show', model:[userInstance:userInstance])
    }
    def updateTeacher(){
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "teacherActions/list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "teacherActions/edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "teacherActions/edit", model: [userInstance: userInstance])
            return
        }

	flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.realname])
        redirect(action: "showTeacher", id: userInstance.id)
        
    }
    //Actions Performed on the parents
    def createParent(){
        render(view:"parentActions/create", model:[userInstance:new User(params)])
    }
    def saveParent(){
        def userInstance = new User(params)
        //userInstance.save()
        if (!userInstance.save(flush: true)) {
            render(view: "parentActions/create", model: [userInstance: userInstance])
            return
        }
        def roleParent = Role.findByAuthority("ROLE_GAURDIAN")
        if (!userInstance.authorities.contains(roleParent)) {
            UserRole.create userInstance, roleParent
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.realname])
        redirect(action: "showParent", id: userInstance.id)
    }
    def editParent(){
        render 'Edite Teachers'
    }
    def listParents(){
        User user
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def parentRole = Role.findByAuthority('ROLE_GAURDIAN')
        def userInstanceList = UserRole.findAllByRole(parentRole).user
        render(view:'parentActions/list',model:[userInstanceList:userInstanceList, userInstanceTotal:User.count()])
    }
    def showParent(){
        def userInstance = User.get(params.id)
        render (view:'parentActions/show', model:[userInstance:userInstance])
    }
    def updateParent(){
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "parentActions/list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "parentActions/edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "parentActions/edit", model: [userInstance: userInstance])
            return
        }

	flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.realname])
        redirect(action: "showParent", id: userInstance.id)
        
    }
    // student registrations actions
    def register(){
//        def studentList = Student.findAll()
//        def courseList = Courses.findAll()
        render(view:'registerstudents')
    }
    def registerStudent(){
        def regStudent = new RegisteredStudent(params)
        if(!regStudent.save(flush:true)){
            render (view: registerstudents, model:[regStudent:regStudent])
            return
        }
        else{
            
        }
    }
    def getAllStudents(){
        def studentsFound = Student.list()
        def response = []
        studentsFound.each{
            response << "${it.realname} ${it.registrationnumber}"
        }
        render (response as JSON)
        }
            
}
