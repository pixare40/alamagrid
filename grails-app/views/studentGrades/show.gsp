
<%@ page import="alamagrid.StudentGrades" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentGrades.label', default: 'StudentGrades')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-studentGrades" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-studentGrades" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list studentGrades">
			
				<g:if test="${studentGradesInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="studentGrades.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${studentGradesInstance?.student?.id}">${studentGradesInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentGradesInstance?.unittaught}">
				<li class="fieldcontain">
					<span id="unittaught-label" class="property-label"><g:message code="studentGrades.unittaught.label" default="Unittaught" /></span>
					
						<span class="property-value" aria-labelledby="unittaught-label"><g:link controller="unitTaught" action="show" id="${studentGradesInstance?.unittaught?.id}">${studentGradesInstance?.unittaught?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentGradesInstance?.catmarks}">
				<li class="fieldcontain">
					<span id="catmarks-label" class="property-label"><g:message code="studentGrades.catmarks.label" default="Catmarks" /></span>
					
						<span class="property-value" aria-labelledby="catmarks-label"><g:fieldValue bean="${studentGradesInstance}" field="catmarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentGradesInstance?.exammarks}">
				<li class="fieldcontain">
					<span id="exammarks-label" class="property-label"><g:message code="studentGrades.exammarks.label" default="Exammarks" /></span>
					
						<span class="property-value" aria-labelledby="exammarks-label"><g:fieldValue bean="${studentGradesInstance}" field="exammarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentGradesInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="studentGrades.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${studentGradesInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentGradesInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentGradesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
