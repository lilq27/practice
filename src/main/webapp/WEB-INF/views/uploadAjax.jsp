<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>
		
		</ul>
	</div>
	
	<button id='uploadBtn'>upload</button>
	
	<script type="text/javascript">
	$(function(){
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
		
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		var cloneObj = $(".uploadDiv").clone();
		
		var uploadResult = $(".uploadResult ul");
		
		function showUploadeFile(uploadResultArr) {
			var str = "";
			$(uploadResultArr).each(function(i, obj) {
				
				if(!obj.image) {
					str += "<li>" + obj.fileName + "</li>";
				} else {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + boj.uuid + "_" + obj.fileName);
				}
				str += "<li><img src = '/display?fileName = " + fileCallPath + "'><li>";
				
				
				console.log("index: " + i)
			});
			
			uploadResult.append(str);
		}
		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//add filedate to formdata
			for(var i = 0; i < files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result) {
// 					alert("Uploaded");
					console.log(result);
					
					showUploadeFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			});
		});		
	});	
	</script>
	
</body>
</html>