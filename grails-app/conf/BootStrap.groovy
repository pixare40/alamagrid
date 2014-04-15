import alamagrid.*

class BootStrap {
    
    def springSecurityService

    def init = { servletContext ->
       
        def teacherRole = Role.findByAuthority('ROLE_TEACHER') ?: new Role(authority: 'ROLE_TEACHER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def studentRole = Role.findByAuthority('ROLE_STUDENT') ?: new Role(authority: 'ROLE_STUDENT').save(failOnError: true)
        def gaurdianRole = Role.findByAuthority('ROLE_GAURDIAN') ?: new Role(authority: 'ROLE_GAURDIAN').save(failOnError: true)
        def deptAdminRole = Role.findByAuthority('ROLE_DEPTADMIN')?: new Role(authority:'ROLE_DEPTADMIN').save(failOnError:true)
        def financeRole = Role.findByAuthority('ROLE_FINANCE')?: new Role(authority:'ROLE_FINANCE').save(failOnError:true)
        
        def compsci = new Courses(
            name:'BSc. Computer Science',
            coursecode:'CSI'
        ).save(failOnError:true)
        
        def secStudent = User.findByUsername('student1') ?: new Student(
                realname:'Kabaji Egara',
                username: 'student1',
                password: 'student1',
                registrationnumber: 'COM/0513/10',
                enabled: true,
                dateOfBirth:new Date(),
                course:compsci,
                email:'kabzegara@gmail.com').save(failOnError: true)
 
        if (!secStudent.authorities.contains(studentRole)) {
            UserRole.create secStudent, studentRole
        }
        def secStudent2 = User.findByUsername('student2') ?: new Student(
                realname:'Kambalonza Egara',
                username: 'student2',
                password: 'student2',
                registrationnumber: 'COM/0513/08',
                enabled: true,
                dateOfBirth:new Date(),
                course:compsci,
                email:'kabzegara@yahoo.com').save(failOnError: true)
 
        if (!secStudent2.authorities.contains(studentRole)) {
            UserRole.create secStudent2, studentRole
        }
        def deptAdmin1 = User.findByUsername('deptadmin1')?:new Teacher(
            realname:'Jairus Fala',
            username:'jairo',
            password:'jairo',
            staffid:'5678',
            email:'jairusnifala@yahoo.com',
            enabled:true
        ).save(failOnError:true)
        if (!deptAdmin1.authorities.contains(deptAdminRole)){
            UserRole.create deptAdmin1, deptAdminRole
        }
        def secAdmin = User.findByUsername('admin') ?: new User(
                realname:'Kabaji Egara',
                username: 'admin',
                password: springSecurityService.encodePassword('admin'),
                enabled: true,
                email:'kabajie@yahoo.co.uk').save(failOnError: true)
 
        if (!secAdmin.authorities.contains(adminRole)) {
            UserRole.create secAdmin, adminRole
        }
        def secTeacher = User.findByUsername('teacher1')?:new Teacher(
            realname:"Kabaji Egara",
            username:'teacher1',
            password:'teacher',
            staffid: '12345',
            email:'kibabii@yahoo.com',
            enabled:true
        ).save(failOnError:true)
        if (!secTeacher.authorities.contains(teacherRole)){
            UserRole.create secTeacher, teacherRole
        }
        
        
        def compdept = new Department(
            deptcode:'23',
            deptname:'ICSIT'
        ).save(failOnError:true)
        
        def probs = new Units(
            name:'Probibility and Statistice',
            code:'SMA 2103',
            descritpion:'A fully intergrated approach to the mathematical problems of probability and statistics',
            yearOffered:'First',
            semesterOffered: 'Second',
            unitType:'Core',
            course:compsci
        ).save(failOnError:true)
        def algs = new Units(
            name:'Algorithms',
            code:'SMA 2145',
            descritpion:'A fully intergrated approach to the mathematical problems of probability and statistics',
            yearOffered:'First',
            semesterOffered: 'Second',
            unitType:'Core',
            course:compsci
        ).save(failOnError:true)
        def newyear = new AcademicTerm(
            yearofstudy:'2012/2013',
            semester:'Second'
        ).save(failOnError:true)
        def assignedTeacher = new UnitTaught(
            teacher:secTeacher,
            courseunit: probs,
            academicyear: newyear
        ).save(failOnError:true)
        
        def anaaTA = new UnitTaught(
            teacher:secTeacher,
            courseunit: algs,
            academicyear: newyear
        ).save(failOnError:true)
        

    }
    def destroy = {
    }
}
