<%@ page import="alamagrid.StudentGrades" %>



<div class="fieldcontain ${hasErrors(bean: studentGradesInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="studentGrades.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${alamagrid.Student.list()}" optionKey="id" required="" value="${studentGradesInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGradesInstance, field: 'unittaught', 'error')} required">
	<label for="unittaught">
		<g:message code="studentGrades.unittaught.label" default="Unittaught" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unittaught" name="unittaught.id" from="${alamagrid.UnitTaught.list()}" optionKey="id" required="" value="${studentGradesInstance?.unittaught?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGradesInstance, field: 'catmarks', 'error')} required">
	<label for="catmarks">
		<g:message code="studentGrades.catmarks.label" default="Catmarks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="catmarks" required="" value="${studentGradesInstance.catmarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGradesInstance, field: 'exammarks', 'error')} required">
	<label for="exammarks">
		<g:message code="studentGrades.exammarks.label" default="Exammarks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="exammarks" required="" value="${studentGradesInstance.exammarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGradesInstance, field: 'grade', 'error')} ">
	<label for="grade">
		<g:message code="studentGrades.grade.label" default="Grade" />
		
	</label>
	<g:textField name="grade" value="${studentGradesInstance?.grade}"/>
</div>

