<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	
		/* üũ�ڽ� Ŭ�� �� ��ü����, ���� */
		$j("#total").click(function() {
			if($j("#total").is(":checked")) 
				$j("input[name=filter]").prop("checked", true);
			else 
				$j("input[name=filter]").prop("checked", false);
		});
		
		/* üũ�ڽ��� ���� ���õ��� �� ��ü üũ�ڽ� üũ, �ϳ��� ������ �� üũ�ڽ� ���� */
		$j("input[name=filter]").click(function() {
			var total = $j("input[name=filter]").length;
			var checked = $j("input[name=filter]:checked").length;
			
			if(total != checked) $j("#total").prop("checked", false);
			else $j("#total").prop("checked", true); 
		});
		
		/* ���͸��޼ҵ� */
		function ajaxBoardList(){
				
				var $frm =  $j('input:checkbox[name=filter]:checked');
				var param = $frm.serialize();
				console.log($frm);
				console.log(param);
				
				$j.ajax({
					url : "/comCode/comCodeFilter.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
						console.log(data);
						$j("#boardTable").html("");
						$j("#boardTable").append(`<tr>
							<td width="80" align="center">
								Type
							</td>
							<td width="40" align="center">
								No
							</td>
							<td width="300" align="center">
								Title
							</td>
						</tr>`);
						$j(data).each(function(index, item){
							console.log(item);
							$j("#boardTable").append(
								`<tr>
									<td align="center">
										\${item.codeName}
									</td>
									<td>
										\${item.boardNum}
									</td>
									<td>
										<a href = "/board/\${item.boardType}/\${item.boardNum}/boardView.do">\${item.boardTitle}</a>
									</td>
								</tr>`	
							)
						})
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("����");
				    }
				});
		};
		
		/* ������ ���� �� ��ü ��ȸ */
		ajaxBoardList();
		
		/* ��ȸ��ư Ŭ���� ���͸��� �Խù��� ��ȸ */
		$j("#search").on("click", ajaxBoardList);
		
	});
</script>
<body>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<!-- <tr>
					<div>
						�񵿱� ��û ����
					</div>
				</tr> -->
				<!--
					�񵿱� ó��
					<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach> -->
				
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
</table>	

<input type="checkbox" name="Tfilter" id="total" value="��ü"><label for="total">��ü</label>
<c:forEach var="filter" items="${comCode}">
  		<input type="checkbox" name="filter" id=${filter.codeId } value=${filter.codeId }><label for=${filter.codeId }>${filter.codeName }</label>
</c:forEach>
<!-- <input type="checkbox" name="filter" id="common" value="a01"><label for="common">�Ϲ�</label>
<input type="checkbox" name="filter" id="qna" value="a02"><label for="qna">Q&A</label>
<input type="checkbox" name="filter" id="annony" value="a03"><label for="annony">�͸�</label>
<input type="checkbox" name="filter" id="free" value="a04"><label for="free">����</label> -->

<input type="submit" id="search" value="��ȸ">


</body>
</html>