
<%@ page import="alamagrid.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
                <r:require modules="bootstrap"/>
		<title>List of Parents</title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
                  <ul>
                    <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
                    <li><g:link class="create" action="createParent">Add New Parent</g:link></li>
                  </ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1>Parents List</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
                        <thead>
                                <tr>

                                        <g:sortableColumn property="realname" title="Name" />

                                        <g:sortableColumn property="phonenumber" title="Phone Number" />

                                        <g:sortableColumn property="email" title="E-Mail Address" />

                                        <g:sortableColumn property="type" title="Type" />

                                </tr>
                        </thead>
                        <tbody>
                        <g:each in="${userInstanceList}" status="i" var="userInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                        <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "realname")}</g:link></td>

                                        <td>${fieldValue(bean: userInstance, field: "phonenumber")}</td>

                                        <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                        <td>${fieldValue(bean: userInstance, field: "type")}</td>

                                </tr>
                        </g:each>
                        </tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
