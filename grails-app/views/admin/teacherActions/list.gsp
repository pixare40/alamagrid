
<%@ page import="alamagrid.User" %>
<!doctype html>
<html>
  <head>
          <meta name="layout" content="main">
          
              <r:require modules="bootstrap"/>

          <title>Teacher List</title>
  </head>
  <body>
          <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
          <div class="nav" role="navigation">
                  <ul>
                          <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                          <li><g:link class="create" action="createTeacher">Add New Teacher</g:link></li>
                  </ul>
          </div>
          <div id="list-user" class="content scaffold-list" role="main">
                  <h1>Teacher List</h1>
                  <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
                  </g:if>
                  <table>
                          <thead>
                                  <tr>

                                          <g:sortableColumn property="realname" title="${message(code: 'user.realname.label', default: 'Name')}" />

                                          <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />

                                          <g:sortableColumn property="schoolid" title="Staff ID" />

                                          <g:sortableColumn property="type" title="${message(code: 'user.type.label', default: 'Position')}" />

                                          <g:sortableColumn property="campus" title="${message(code: 'user.campus.label', default: 'Campus')}" />

                                          <g:sortableColumn property="phonenumber" title="${message(code: 'user.phonenumber.label', default: 'Phone Number')}" />

                                  </tr>
                          </thead>
                          <tbody>
                          <g:each in="${userInstanceList}" status="i" var="userInstance">
                                  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                          <td><g:link action="showTeacher" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "realname")}</g:link></td>

                                          <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                          <td>${fieldValue(bean: userInstance, field: "schoolid")}</td>

                                          <td>${fieldValue(bean: userInstance, field: "type")}</td>

                                          <td>${fieldValue(bean: userInstance, field: "campus")}</td>

                                          <td>${fieldValue(bean: userInstance, field: "phonenumber")}</td>

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
