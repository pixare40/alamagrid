<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="alamagrid.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>



<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <title>Administrator Dashboard</title>
  </head>
  <body>
    <h1>Hello ${adminname.realname} What Actions would you like to take? </h1>
  <g:link class="btn btn-large" controller="admin" action="listStudents">Student Actions</g:link>
  <g:link class="btn btn-large" controller="admin" action="listTeachers">Teacher Actions</g:link>
  <g:link class="btn btn-large" controller="admin" action="listParents">Parent Actions</g:link>
  <g:link class='btn btn-large' action="register">Register Students</g:link>
  
  </body>
</html>
