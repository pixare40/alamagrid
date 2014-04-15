<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="alamagrid.*" contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <title>Units Registered</title>
  </head>
  <body>
    <div class="container">
    <g:render template="templates/menu"/>
    <div class="span3">
      <h1>My Profile</h1>
      Name: ${curstudent.realname}
    </div>
    <div class="span8">
     <fieldset>
          <legend>Units Registered</legend>
        <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>
        <table class="table">
          <thead>
            <tr>
            <g:sortableColumn property="courseunit" title="Unit Taught"/>
            <g:sortableColumn property="academicyear" title="Academic Year"/>
            </tr>
          </thead>
          <tbody>
          <g:each in="${curstudent.teachableunits}" status="i" var="unitInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="showunit" id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "courseunit")}</g:link></td>
          <td>${fieldValue(bean:unitInstance, field:'academicyear')}</td>
            </tr>
            </g:each>
          </tbody>
        </table>
        <div class="pagination">
        </div>
        </fieldset>
    </div>
    </div>
    
  </body>
</html>
