<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="alamgrid.*" contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <title>Students Taking ${curUnit}</title>
  </head>
  <body>
    <div class="container">
    <g:render template="templates/header"/>
    <div class="span3">
      <fieldset>
        <legend>My Profile</legend>
    <g:render template="templates/profileinfo"/>
      </fieldset>
    </div>
    <div class="span8">
      <fieldset>
        <legend>Your Students</legend>
        <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>
        <g:link action="entermarks" class="btn btn-small">Enter Grades &raquo; </g:link>
        <table class="table">
          <thead>
            <tr>
            <g:sortableColumn property="students" title="Student Name"/>
            <g:sortableColumn property="regnumber" title="Registration Number"/>
            </tr>
          </thead>
          <tbody>
          <g:each in="${unitandteacher.students}" status="i" var="studentInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="studentprofile" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "realname")}</g:link></td>
          <td>${fieldValue(bean: studentInstance, field: "registrationnumber")}</td>
          <td></td>
            </tr>
            </g:each>
          </tbody>
        </table>
        <div>

        </div>
      </fieldset>
    </div>
    </div>
  </body>
</html>
