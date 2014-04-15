<%@ page import="alamagrid.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap">
		<title>Edit/Update Teacher Information</title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listTeachers">List Teachers</g:link></li>
				<li><g:link class="create" action="createTeacher">Add New Teacher</g:link></li>
			</ul>
		</div>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1>Edit/Update Teacher Information</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
                          <g:eachError bean="${userInstance}" var="error">
                          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                          </g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="teacherActions/form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updateTeacher" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>