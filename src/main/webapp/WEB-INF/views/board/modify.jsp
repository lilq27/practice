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
			<form role="form" action="/board/modify" method="post">
			<input type="hidden" name="pageNum" value="${cri.pageNum }"> <!-- pageNum, amount url매핑 -->
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>"> <!--keyword, type url매핑  -->
			<input type="hidden" name="type" value="<c:out value='${cri.type }'/>"> 
			
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name="bno" readonly="readonly"
					value="<c:out value='${board.bno}'/>">
				</div>
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name="title" 
					value="<c:out value='${board.title }'/>">
				</div>
				<div class="form-group">
					<label>Text area</label>
					<textarea rows="3" class="form-control" name="content">
					<c:out value='${board.content }'/></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label>
					<input class="form-control" name="writer"
					value="<c:out value='${board.writer }'/>">
				</div>
				<div class="form-group">
					<label>RegDate</label>
					<input class="form-control" name="regDate"
					value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.regdate}'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>Update Date</label>
					<input class="form-control" name="updateDate"
					value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.updateDate }'/>" readonly="readonly">
				</div>
				<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
				<button type="submit" data-oper='remove' class="btn btn-default">Remove</button> 
				<button type="submit" data-oper='list' class="btn btn-default">List</button> 
		</form>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp" %>
<script>
	$(document).ready(function(){
		var formObj = $("form");
		$('button').on("click",function(e){
			e.preventDefault();
			
			var operation=$(this).data("oper");//data-oper=''
			console.log(operation);
			
			if(operation==='remove'){
				formObj.attr("action", "/board/remove"); 
			//.attr( attributeName, value )선택한 요소에 속성을 추가 , .attr( attributeName )선택한 요소의 속성의 값을 가져옴
			}else if(operation==='list'){
				//self.location="/board/list";
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag=$("input[name='pageNum']").clone(); //.clone(); 데이터 및 기능들도 함께 복사 (안써도 작동함)
				var amountTag=$("input[name='amount']").clone();
				var keywordTag=$("input[name='keyword']").clone();
				var typeTag=$("input[name='type']").clone();
				formObj.empty();
				//return;
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
			
		});
	});

</script>