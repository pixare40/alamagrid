<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
        <r:require modules="bootstrap"/>

    <title>Students List</title>
  </head>
  <body>
    <h1>Student List</h1>
    <div class="nav" role="navigation">
            <ul>
                    <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
                    <li><g:link class="create" action="createStudent">New Student</g:link></li>
            </ul>
    </div>
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
    <table class="table">
      <thead>
              <tr>

                      <g:sortableColumn property="realname" title="Name" />

                      <g:sortableColumn property="schoolid" title="Registration Number" />

                      <g:sortableColumn property="email" title="E-Mail Address" />
                      
                      <g:sortableColumn property="campus" title="Campus" />
                      
                      <g:sortableColumn property="phonenumber" title="Phone Number" />

              </tr>
      </thead>
      <tbody>
      <g:each in="${userInstanceList}" status="i" var="userInstance">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                      <td><g:link action="showStudent" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "realname")}</g:link></td>

                      <td>${fieldValue(bean: userInstance, field: "schoolid")}</td>

                      <td>${fieldValue(bean: userInstance, field: "email")}</td>
                      
                      <td>${fieldValue(bean: userInstance, field: "campus")}</td>
                      
                      <td>${fieldValue(bean: userInstance, field: "phonenumber")}</td>

              </tr>
      </g:each>
      </tbody>
  </table>
  <div class="pagination">
          <g:paginate total="${userInstanceTotal}" />
  </div>
  </body>
</html>
