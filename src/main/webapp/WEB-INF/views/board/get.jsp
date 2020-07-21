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
					<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>"> <!--keyword, type url매핑  -->
					<input type="hidden" name="type" value="<c:out value='${cri.type }'/>"> 
					
				</form>
		</div>
	</div>
</div>

<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-comments fa-fw"></i> Reply -->
<!-- 			</div> -->
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<ul class="chat">
				<!-- start reply -->
				<li class="left clearfix" data-rno='12'>
				<div>
					<div class="header">
						<strong class="primary-font">User00</strong>
						<small class="pull-right text-muted">2020-05-17 21:42</small>
					</div>
					<p>Good job!</p>
				</div>
				</li>
				<!-- end reply -->
			</ul>
			<!-- ./end ul -->
		</div>
		<!-- /.panel .chat-panel -->	
		<div class="panel-footer">
		</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name="reply" value="New Reply!!!">
				</div>
				<div class="from-group">
					<label>Replyer</label>
					<input class="form-control" name="replyer" value="replyer"> 
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name="replyDate" value="">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>



<%@include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
// 		var operForm =$("#operForm");
// 		$("button[data-oper='modify']").on("click",function(e){
// 			operForm.attr("action","/board/modify").submit();
// 		});
		
// 		$("button[data-oper='list']").on("click",function(e){
// 			operForm.find("#bno").remove();
// 			operForm.attr("action","/board/list")
// 			operForm.submit();
// 		});
		//--------------------------
		console.log("===================");
		console.log("JS TEST");
		//console.log(replyService);
		
		var bnoValue = '<c:out value = "${board.bno}"/>';
		var replyUL = $(".chat");
		
// 		replyService.add({
// 			reply : "JS Test", replyer : "tester", bno : bnoValue},		
// 			function(result) {
// 			}
// 		);
		
		replyService.getList({bno : bnoValue, page : 1}, function(list) {
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		});
	
// 		replyService.remove(26, function(count) {
// 			console.log(count);
// 			if (count === "success") {
// 				alert("remove");
// 			}
// 		}, function(err) {
// 			alert('error..');
// 		});
		
// 		replyService.update({
// 			rno : 5,
// 			bno : bnoValue,
// 			reply : "Modified Reply....."
// 		}, function(result) {
// 			alert("수정완료");
// 		});
		
		replyService.get(10, function(data) {
			console.log(data);
		});
		
		showList(1);
		
		function showList(page) {
			replyService.getList({bno : bnoValue, page : page || 1}, function(replyCnt, list) {
				console.log("replyCnt: " + replyCnt);
				console.log("list: " + list);
				console.log(list);
				if(page == -1) {
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}				
				
				var str = "";
				if(list == null || list.length == 0) {
					replyUL("");
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str +="<li class = 'left clearfix' data-rno = '"+ list[i].rno +"'>";
					str +="<div><div class = 'header'><strong class = 'primary-font'>" + list[i].replyer + "</strong>";
					str +="<small class = 'pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
					str +="<p>" + list[i].reply + "</p></div></li>";
				}
				
				replyUL.html(str);
				
				showReplyPage(replyCnt)
			});
		}
		
		var modal = $("#myModal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalCloseBtn = $("#modalCloseBtn");

		$("#addReplyBtn").on("click", function(e) {
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$("#myModal").modal("show");
		});
		
		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bnoValue
			};
			replyService.add(reply, function(result) {
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				
				//showList(1);
				showList(-1);
			});
		})
		
		$(".chat").on("click", "li", function(e) {
			var rno = $(this).data("rno");

			replyService.get(rno, function(reply) {
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer).attr("readonly","replyer"); //.attr( attributeName, value )
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","replyDate");
				modal.data("rno", reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				$("#myModal").modal("show");
			});
		});
		
		modalModBtn.on("click", function(e) {
			var reply = {rno : modal.data("rno"), reply : modalInputReply.val()};
			replyService.update(reply, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			})
		});
		
		modalRemoveBtn.on("click", function(e) {
			var rno = modal.data("rno");
			replyService.remove(rno, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt) {
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum -9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href =' "+(startNum -1)+" '>Previous</a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++) {
				var active = pageNum == i? "active":"";
				
				str += "<li class='page-item "+active+" '><a class='page-link' href=' "+i+" '> "+i+"</a></li>";
			}
				if(next) {
					str += "<li class='page-item'><a class='page-link' href=' "+(endNum+1)+" '>Next</a></li>";
				}
				str += "</ul></div>";
				
				console.log(str);
				
				replyPageFooter.html(str)
			
		}
		
		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			console.log("page click");
			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum: " + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});
		

	});
</script>