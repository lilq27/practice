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
		   <%-- <button data-oper="modify" class="btn btn-default"
				onclick='location.href="/board/modify?bno=<c:out value='${board.bno }'/>"'>
				Modify</button> <!-- button타입은 기본적으로 submit -->
				<button data-oper="list" class="btn btn-default"
				onclick='location.href="/board/list"'>List</button> <!-- data-oper 정확히 모르겠음 --> --%>
				<button data-oper='modify' class="btn btn-default"> Modify</button>
				<button data-oper='list' class="btn btn-default">List</button>
				
				<form id='operForm' action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno }'/>">
					<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>"> <!-- 조회에서 list로 갈때  -->
					<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>"> <!--pageNum, amount url매핑  -->
					
				</form>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp" %>

<script>
	$(document).ready(function(){
		var operForm =$("#operForm");
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list")
			operForm.submit();
		});
	});

</script>