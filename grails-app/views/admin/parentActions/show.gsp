
<%@ page import="alamagrid.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap">
		<title>Parent Account Information</title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listParents">Parents List</g:link></li>
				<li><g:link class="create" action="createParent">Create Parent Account</g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
		
				<g:if test="${userInstance?.realname}">
				<li class="fieldcontain">
					<span id="realname-label" class="property-label">Full Names</span>
					
						<span class="property-value" aria-labelledby="realname-label"><g:fieldValue bean="${userInstance}" field="realname"/></span>
					
				</li>
				</g:if>

				<g:if test="${userInstance?.schoolid}">
				<li class="fieldcontain">
					<span id="schoolid-label" class="property-label">ID Number</span>
					
						<span class="property-value" aria-labelledby="schoolid-label"><g:fieldValue bean="${userInstance}" field="schoolid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.phonenumber}">
				<li class="fieldcontain">
					<span id="phonenumber-label" class="property-label">Phone Number</span>
					
						<span class="property-value" aria-labelledby="phonenumber-label"><g:fieldValue bean="${userInstance}" field="phonenumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="user.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${userInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>
					
				</li>
				</g:if>

				<g:if test="${userInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="user.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${userInstance}" field="type"/></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="editParent" id="${userInstance?.id}">Edit Parent</g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
