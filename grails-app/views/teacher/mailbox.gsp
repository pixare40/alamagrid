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
    <r:require modules="bootstrap"/>
    <title>Your Mailbox</title>
  </head>
  <body>
    <div class="container">
    <g:render template="templates/header"/>
    <h1 class="soften">Your Mailbox</h1>
    <g:form method="post" action="sendmessage">
      
    </g:form>
    </div>
  </body>
</html>
