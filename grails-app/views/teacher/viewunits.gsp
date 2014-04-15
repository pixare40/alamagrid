<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="alamagrid.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Units</title>
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
  </head>
  <body>
    <g:render template="templates/header"/>
    <div class="container">
      <div class="span3">
        <fieldset>
          <legend>Profile Info</legend>
          <g:render template="templates/profileinfo"/>
        </fieldset>
      </div>
      <div class="span8">
        <fieldset>
          <legend>Units Taught (Click to view students)</legend>
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
          <g:each in="${unitlist}" status="i" var="unitInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="entermarks" id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "courseunit")}</g:link></td>
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
