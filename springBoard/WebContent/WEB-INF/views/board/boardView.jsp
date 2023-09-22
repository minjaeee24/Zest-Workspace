<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
	
	$j(document).ready(function(){
		
		$j("#edit").on("click",function(){
			var boardType = $j("#boardType").val();
			var boardNum = $j("#boardNum").val(); 
			console.log(boardType);
			console.log(boardNum);
			
			$j.ajax({
			    url : "/board/boardDelete.do",
			    dataType: "json",
			    type: "GET",
			    data: {boardType : $j("#boardType").val(),
	                	boardNum : $j("#boardNum").val()},
			    success: function(data, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("이미 삭제된 게시글입니다.");
			    	
			    	location.href = "/board/boardList.do";
			    }
			});
		});
	});

</script>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardEdit.do?boardNum=${board.boardNum }&boardType=${board.boardType}">수정</a>
			<!-- 동기식 요청
			<a href="/board/boardDelete.do?boardNum=${board.boardNum }&boardType=${board.boardType}">삭제</a>
			 -->
			<input type="hidden"  id="boardNum" value="${board.boardNum }">
			<input type="hidden"  id="boardType" value="${board.boardType }"> 
			<a href="" id="edit">삭제</a> 
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>	
</body>
</html>