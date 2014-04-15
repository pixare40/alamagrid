package alamagrid

import org.springframework.dao.DataIntegrityViolationException

class StudentGradesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [studentGradesInstanceList: StudentGrades.list(params), studentGradesInstanceTotal: StudentGrades.count()]
    }

    def create() {
        [studentGradesInstance: new StudentGrades(params)]
    }

    def save() {
        def studentGradesInstance = new StudentGrades(params)
        if (!studentGradesInstance.save(flush: true)) {
            render(view: "create", model: [studentGradesInstance: studentGradesInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), studentGradesInstance.id])
        redirect(action: "show", id: studentGradesInstance.id)
    }

    def show() {
        def studentGradesInstance = StudentGrades.get(params.id)
        if (!studentGradesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
            return
        }

        [studentGradesInstance: studentGradesInstance]
    }

    def edit() {
        def studentGradesInstance = StudentGrades.get(params.id)
        if (!studentGradesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
            return
        }

        [studentGradesInstance: studentGradesInstance]
    }

    def update() {
        def studentGradesInstance = StudentGrades.get(params.id)
        if (!studentGradesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (studentGradesInstance.version > version) {
                studentGradesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studentGrades.label', default: 'StudentGrades')] as Object[],
                          "Another user has updated this StudentGrades while you were editing")
                render(view: "edit", model: [studentGradesInstance: studentGradesInstance])
                return
            }
        }

        studentGradesInstance.properties = params

        if (!studentGradesInstance.save(flush: true)) {
            render(view: "edit", model: [studentGradesInstance: studentGradesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), studentGradesInstance.id])
        redirect(action: "list", id: studentGradesInstance.id)
    }

    def delete() {
        def studentGradesInstance = StudentGrades.get(params.id)
        if (!studentGradesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
            return
        }

        try {
            studentGradesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    def savegrades(){
        def studentGradesInstance = StudentGrades.get(params.id)
        if (!studentGradesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (studentGradesInstance.version > version) {
                studentGradesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studentGrades.label', default: 'StudentGrades')] as Object[],
                          "Another user has updated this StudentGrades while you were editing")
                render(view: "edit", model: [studentGradesInstance: studentGradesInstance])
                return
            }
        }

        studentGradesInstance.properties = params

        if (!studentGradesInstance.save(flush: true)) {
            render(view: "edit", model: [studentGradesInstance: studentGradesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'studentGrades.label', default: 'StudentGrades'), studentGradesInstance.id])
        redirect(action: "show", id: studentGradesInstance.id)
    }
}
