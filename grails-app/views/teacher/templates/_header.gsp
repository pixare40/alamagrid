<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="alamagrid.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="navbar">
  <div class="navbar-inner">
    <ul class="nav">
      <li>
      <g:link controller="teacher" action="index">My Desk</g:link>
      </li>
      <li>
      <g:link action="viewunits">Exams</g:link>
      </li>
      <li>
      <g:link action="viewunits">View Units</g:link>
      </li>
      <li>
      <g:link action="mailbox">Mailbox</g:link>
      </li>
      <li>
      <g:link action="assignments">Assignments</g:link>
      </li>
      <li>
      <g:link action="news">News</g:link>
      </li>
      <li>
      <g:link action="calender">Calender</g:link>
      </li>
    </ul>
  </div>
</div>