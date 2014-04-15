<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@page import="alamgrid.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <title>Your Desk</title>
  </head>
  <body>
    <g:render template="templates/header"/>
    <div class="container-fluid">
    <div class="row-fluid">
    <div id="teacher-info" class="span4">
      <fieldset>
        <legend>Profile</legend>
        <g:render template="templates/profileinfo"/>
      </fieldset>
    </div>
      <div id="notice-board" class="span8">
        <fieldset>
        <legend>Notice Board</legend>
        </fieldset>
        <div class="borderful">
        <fieldset>         
          <legend>Latest News</legend>         
        </fieldset>
        </div>
        <div class="borderful">
          <fieldset>
            <legend>Upcoming Events</legend>
          </fieldset>
        </div>
      </div>
      
    </div>
    </div>
  </body>
</html>
