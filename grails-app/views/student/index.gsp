<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@page import="alamagrid.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <title>Your Profile</title>
  </head>
  <body>
    <div class="container">
    <g:render template="templates/menu"/>
    <div class="span3">
      <fieldset>
        <legend>My Profile</legend>
        <span>Name: ${curstudent.realname}<br/></span>
        <span>Course: ${mycourse.name}</span>
      </fieldset>
    </div>
      <div class="span8">
        <fieldset>
          <legend>Units Offered This Semester</legend>
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
            <td><g:link action="registerunit" id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "courseunit")}</g:link></td>
          <td>${fieldValue(bean:unitInstance, field:'academicyear')}</td>
            </tr>
            </g:each>
          </tbody>
        </table>
        </fieldset>
      </div>
    </div>
    </div>
  </body>
</html>
