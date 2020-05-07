<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>


          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example
         	<button id="regBtn" type="button" class="btn btn-xs pull-right">Register</button>
         	</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  <c:forEach items="${list }" var="board">

                    <tr>
                      <td><c:out value="${board.bno }"/></td>
                      <td><a class='move' href='/board/get?bno=<c:out value="${board.bno }"/>'>
                     	${board.title }</a></td>
                      <td>${board.writer }</td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                    </tr>

                </c:forEach>  
                </table>
                
                <div class='pull-right'>
                	<ul class="pagination">
                		<c:if test="${pageMaker.prev }">
                		<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
                		</c:if>
                		
                		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                		<li class='paginate_button ${pageMaker.cri.pageNum==num ? "active":"" }'>
                		<a href="${num }">${num }</a></li>
                		</c:forEach>
                		
                		<c:if test="${pageMaker.next }">
                		<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
                		</c:if>
                	</ul>
             	</div>
             	<form id="actionForm" action="/board/list" method="get">
             		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <!-- pageNum은 현재 페이지 -->
             		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        		</form>
              <!-- end Pagination -->

          </div>

        </div>
        <!-- /.container-fluid -->
    

      </div>
<!-- End of Main Content -->
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">처리가 완료 되었습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		var result='<c:out value="${result}"/>';
		checkModal(result);
		
		history.replaceState({},null,null); 
		//history.replaceState(stateObj,title,URL)
		//현재 history를 수정해 메소드의 매개 변수에 전달 된 stateObj, title, URL로 대체
		
		function checkModal(result){
			if(result===''|| history.state){ //==는 타입과 상관없이 비교하고 ===는 타입까지 비교
				return;						//result가 없거나 등록 후 뒤로가기를 눌렀을 때 모달이 나오는 것을 막음
			}
			if(parseInt(result)>0){ //parseInt() String을 int로 변환 , parseFloat() String을 Float(실수)으로 변환
				$(".modal-body").html("게시글 " +parseInt(result)+"번이 등록되었습니다.");
				
			}
		$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click",function(){ //등록 페이지로 이동
			self.location="/board/register"
		})
		//----------------------------------------------------------------------Modal
		
		var actionForm=$("#actionForm");
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
			//.attr()은 요소(element)의 속성(attribute)의 값을 가져오거나 속성을 추가 
			//input의 pageNum에 클릭한 button의 a href 값을 넣으라는 뜻 
			actionForm.submit();
			//input value값에 클릭된 href값이 들어가고 그걸 submit하면 mapper에서 쿼리문이 작동 
			//페이징 숫자와 리스트를 분리해서 생각할 것 
		});
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
	});
</script>
