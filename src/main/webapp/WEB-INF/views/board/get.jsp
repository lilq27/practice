<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
</div>

<div class="row">
	<div class="panel panel-default">
	
		<div class="panel-heading">Board Register</div>
		<div class="panel-body">
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name="bno" readonly="readonly"
					value="<c:out value='${board.bno}'/>">
				</div>
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name="title" readonly="readonly"
					value="<c:out value='${board.title }'/>">
				</div>
				<div class="form-group">
					<label>Text area</label>
					<textarea rows="3" class="form-control" name="content"  readonly="readonly">
					<c:out value='${board.content }'/></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label>
					<input class="form-control" name="writer"  readonly="readonly"
					value="<c:out value='${board.writer }'/>">
				</div>
				<button data-oper="modify" class="btn btn-default"
				onclick='location.href="/board/modify?bno=<c:out value='${board.bno }'/>"'>
				Modify</button> <!-- button타입은 기본적으로 submit -->
				<button data-oper="list" class="btn btn-default"
				onclick='location.href="/board/list"'>List</button> <!-- data-oper 정확히 모르겠음 -->
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp" %>