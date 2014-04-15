<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Student')}" />
    <title>Student Details</title>
  </head>
  <body>
    <h1>Student Details</h1>
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
    <ol class="property-list user">			
      <g:if test="${userInstance?.realname}">
      <li class="fieldcontain">
              <span id="name-label" class="property-label">Full Name</span>
                 <span class="property-value" aria-labelledby="name-label">
                   <g:fieldValue bean="${userInstance}" field="realname"/>
                 </span>
      </li>
      </g:if>
      <g:if test="${userInstance?.schoolid}">
      <li class="fieldcontain">
              <span id="schoolid-label" class="property-label">Registration Number</span>

                      <span class="property-value" aria-labelledby="schoolid-label"><g:fieldValue bean="${userInstance}" field="schoolid"/></span>

      </li>
      </g:if>

      <g:if test="${userInstance?.phonenumber}">
      <li class="fieldcontain">
              <span id="phonenumber-label" class="property-label">Phone Number</span>

                      <span class="property-value" aria-labelledby="phonenumber-label"><g:fieldValue bean="${userInstance}" field="phonenumber"/></span>

      </li>
      </g:if>

      <g:if test="${userInstance?.email}">
      <li class="fieldcontain">
              <span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>

                      <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

      </li>
      </g:if>

      <g:if test="${userInstance?.dateOfBirth}">
      <li class="fieldcontain">
              <span id="dateOfBirth-label" class="property-label"><g:message code="user.dateOfBirth.label" default="Date Of Birth" /></span>

                      <span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${userInstance?.dateOfBirth}" /></span>

      </li>
      </g:if>

      <g:if test="${userInstance?.address}">
      <li class="fieldcontain">
              <span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>

                      <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>

      </li>
      </g:if>

      <g:if test="${userInstance?.type}">
      <li class="fieldcontain">
              <span id="type-label" class="property-label"><g:message code="user.type.label" default="Type" /></span>

                      <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${userInstance}" field="type"/></span>

      </li>
      </g:if>
  </ol>
    <g:form>
            <fieldset class="buttons">
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <g:link class="edit" action="editStudent" id="${userInstance?.id}">Edit Student</g:link>
                    <g:actionSubmit class="delete" action="delete" id="${userInstance.id}" value="Delete Student" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
    </g:form>
  </body>
</html>
