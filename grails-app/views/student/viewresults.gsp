<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="alamagrid.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require module="bootstrap"/>
    <title>View Results</title>
  </head>
  <div class="container">
  <body>
    <div class="span3">
      <fieldset>
       #some info goes here
      </fieldset>
   </div>
    <div class="span8">
      <legend>Aggregated Results for ${curstudent.realname}</legend>
      <div id="list-studentGrades" class="content scaffold-list" role="main">
          <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
          </g:if>
          <table class="table">
            <thead>
              <tr>
              <g:sortableColumn property="unittaught" title="Unit/Course Taught"/>
              <g:sortableColumn property="catmarks" title="CAT"/>
              <g:sortableColumn property="exammarks" title="Exam"/>
              <g:sortableColumn property="grade" title="Grade"/>
              </tr>
              </thead>
              <tbody>
               <g:each in="${mygrades}" status="i" var="studentGradeInstance">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="unitinfo">${fieldValue(bean:studentGradeInstance, field:"unittaught")}</g:link></td>
               <td>${fieldValue(bean:studentGradeInstance, field:'catmarks')}</td>
               <td>${fieldValue(bean:studentGradeInstance, field:'exammarks')}</td>
               <td>${fieldValue(bean:studentGradeInstance,field:'grade')}</td>
              </tr>
               </g:each>
              </tbody>
          </table>
      </div>
    </div>
  </body>
  </div>
</html>
