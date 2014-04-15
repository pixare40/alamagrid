package alamagrid



import org.junit.*
import grails.test.mixin.*

@TestFor(StudentGradesController)
@Mock(StudentGrades)
class StudentGradesControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/studentGrades/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studentGradesInstanceList.size() == 0
        assert model.studentGradesInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.studentGradesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.studentGradesInstance != null
        assert view == '/studentGrades/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/studentGrades/show/1'
        assert controller.flash.message != null
        assert StudentGrades.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGrades/list'


        populateValidParams(params)
        def studentGrades = new StudentGrades(params)

        assert studentGrades.save() != null

        params.id = studentGrades.id

        def model = controller.show()

        assert model.studentGradesInstance == studentGrades
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGrades/list'


        populateValidParams(params)
        def studentGrades = new StudentGrades(params)

        assert studentGrades.save() != null

        params.id = studentGrades.id

        def model = controller.edit()

        assert model.studentGradesInstance == studentGrades
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGrades/list'

        response.reset()


        populateValidParams(params)
        def studentGrades = new StudentGrades(params)

        assert studentGrades.save() != null

        // test invalid parameters in update
        params.id = studentGrades.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/studentGrades/edit"
        assert model.studentGradesInstance != null

        studentGrades.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/studentGrades/show/$studentGrades.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        studentGrades.clearErrors()

        populateValidParams(params)
        params.id = studentGrades.id
        params.version = -1
        controller.update()

        assert view == "/studentGrades/edit"
        assert model.studentGradesInstance != null
        assert model.studentGradesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/studentGrades/list'

        response.reset()

        populateValidParams(params)
        def studentGrades = new StudentGrades(params)

        assert studentGrades.save() != null
        assert StudentGrades.count() == 1

        params.id = studentGrades.id

        controller.delete()

        assert StudentGrades.count() == 0
        assert StudentGrades.get(studentGrades.id) == null
        assert response.redirectedUrl == '/studentGrades/list'
    }
}
