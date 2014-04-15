
<%@ page import="alamagrid.StudentGrades" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentGrades.label', default: 'StudentGrades')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-studentGrades" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-studentGrades" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="studentGrades.student.label" default="Student" /></th>
					
						<th><g:message code="studentGrades.unittaught.label" default="Unittaught" /></th>
					
						<g:sortableColumn property="catmarks" title="${message(code: 'studentGrades.catmarks.label', default: 'Catmarks')}" />
					
						<g:sortableColumn property="exammarks" title="${message(code: 'studentGrades.exammarks.label', default: 'Exammarks')}" />
					
						<g:sortableColumn property="grade" title="${message(code: 'studentGrades.grade.label', default: 'Grade')}" />
					
					</tr>
				</thead>
				<tbody>
                                  
				<g:each in="${studentGradesInstanceList}" status="i" var="studentGradesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
					<g:form action="update" method="post">
                                          <g:hiddenField name="id" value="${studentGradesInstance?.id}" />
				<g:hiddenField name="version" value="${studentGradesInstance?.version}" />
                                          <td><g:link action="show" id="${studentGradesInstance.id}">${fieldValue(bean: studentGradesInstance, field: "student")}</g:link></td>
					
						<td>${fieldValue(bean: studentGradesInstance, field: "unittaught")}</td>
					
                                                <td><g:field type="number" name="catmarks" value="${fieldValue(bean: studentGradesInstance, field: "catmarks")}" min="0" max="50"/>
               
                                                </td>
					
						<td><g:field type="number"name ="exammarks" value="${fieldValue(bean: studentGradesInstance, field: "exammarks")}" min="0" max="100"/>
                                            
                                                </td>
					
						<td><g:select name="grade" from="${['A','B','C','D','E']}" value="${fieldValue(bean: studentGradesInstance, field: "grade")}" maxlength='1'/>
                                               
                                                </td>
                                                <td>
                                                  <input type="submit" value="Commit" class="save btn"/>
                                                </td>
                                        </g:form>
					</tr>
				</g:each>
                                    
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentGradesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
