<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="alamagrid.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <title>Register Students</title>
    <g:javascript library="jquery"/>
    <g:javascript library="jquery-ui"/>
    <r:require modules="bootstrap, jquery-ui"/>
   <g:javascript>
            $(document).ready(function() {
               $('#registeredStudent').autocomplete({
                 source: '<g:createLink controller='admin' action='getAllStudents'/>'
               }); 
                
            });        
        </g:javascript>
  </head>
  <body>
    <div class="container">
      <div class="navbar navbar-inverse">
        <div class="navbar-inner">
          <ul class="nav">
            <li><a href="${createLink(uri:"/")}">Home</a></li> 
          </ul>
        </div>
      </div>
      <div class="span3">
        <p>In this page you register students for the new academic year.
        Register them by indicating the year, select the student, indicate his course and current semester of study and click save.
        You may also make use of the 'import CSV' feature to add students to the registered students list by uploading 
        an Excel Stylesheet or any other CSV format to the software</p>
      </div>
      <div class="span9">
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

          <fieldset>
            <div>
<!--	<label for="registeredStudent">Student<span class="required-indicator">*</span></label>-->
	<input type="text" name="registeredStudent" id="registeredStudent" value="" placeholder="Enter student..."/>
            </div>
          </fieldset>
          
      </div>
    </div>
  </body>
</html>
