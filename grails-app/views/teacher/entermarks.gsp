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
    <title>Enter Marks for ${curUnit}</title>
  </head>
  <body>
    <div class="container">
      
      <div class="span12">
        <fieldset>
          <legend>Enter Student Marks for ${curUnit}</legend>
          <div id="list-studentGrades" class="content scaffold-list" role="main">
          <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
          </g:if>
          <table class="table">
            <thead>
              <tr>
              <g:sortableColumn property="registrationnumber" title="Reg. Number"/>
              <g:sortableColumn property="realname" title="Name"/>
              <g:sortableColumn property="catmarks" title="CAT"/>
              <g:sortableColumn property="exammarks" title="Exam"/>
              <g:sortableColumn property="totalmarks" title="Total"/>
              <g:sortableColumn property="grade" title="Grade"/>
              <th>Commit</th>
              </tr>
            </thead>
            <tbody>
            <g:each in="${studentsGradesList}" status="i" var="studentGradeInstance">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <g:form action="savegrade" method="post">
                <g:hiddenField name="id" value="${studentGradeInstance?.id}" />
                <g:hiddenField name="version" value="${studentGradeInstance?.version}" />
                
                <td><g:link action="studentinfo">${fieldValue(bean:studentGradeInstance, field:"student.registrationnumber")}</g:link></td>
                <td>${fieldValue(bean:studentGradeInstance, field:"student.realname")}</td>
                <td><input maxlength="2" width="5px" size="2" type="number" name="catmarks" value="${fieldValue(bean:studentGradeInstance, field:"catmarks")}" min="0" max="50"/></td>
                <td><g:field maxlength="2" width="5px" size="2" type="number" name="exammarks" value="${fieldValue(bean:studentGradeInstance, field:"exammarks")}"/></td>
                <td>${fieldValue(bean:studentGradeInstance, field:'totalmarks')}</td>
                <td>${fieldValue(bean:studentGradeInstance, field:"grade")}</td>
                <td><input type="submit" value="Save"/></td>
              </g:form>
              </tr>
            </g:each>
            </tbody>
          </table>
          </div>
        </fieldset>
      </div>
    </div>
  </body>
</html>
