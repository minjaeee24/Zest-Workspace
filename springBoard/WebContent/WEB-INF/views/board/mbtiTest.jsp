<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>mbtiTest</title>
<style>
	#bodyTop {
		fill: #33a474;
	}
	
	.question{
		text-align: center;
	    font-size: 23.4px;
	    font-weight: 900;
	    color: #576071;
	}
	
	.checkbox{
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 30px 0 20px;
	}
	
	[type="radio"] {
		vertical-align: middle;
		appearance: none;
	}
	
	#mainText{
		max-width: 1200px;
		padding: 15px;
		margin: 0 auto;
	}
	
	.agree{
		color: #33a474;
		font-size: 19.8px;
		font-weight: 900;
	}
	
	.nonAgree{
		color: #88619a;
		font-size: 19.8px;
		font-weight: 900;
	}
	
	.radioBtn{
		margin: 0 30px;
	}
	
	.lBtn:hover, .lBtn:checked{
		background-color: #33a474;
	}
	
	.btn4:hover, .btn4:checked{
		background-color: gray;
	}
	
	.rBtn:hover, .rBtn:checked{
		background-color: #88619a;
	}

	.lBtn:checked{
		background-image: url('data:image/svg+xml;utf8, <svg aria-labelledby="i_j6h79zy9oo" viewBox="-13 -15 60 73" fill="white" role="img" xmlns="http://www.w3.org/2000/svg"><title id="i_j6h79zy9oo">Completed</title> <path d="m41.766 8.625-26.25 26.25-9.282-9.281a1.126 1.126 0 0 0-1.593 0l-1.06 1.06c-.44.44-.44 1.152 0 1.593L14.72 39.375c.44.44 1.153.44 1.594 0l28.106-28.106c.44-.44.44-1.153 0-1.594l-1.06-1.05a1.126 1.126 0 0 0-1.593 0z" fill-rule="evenodd"></path></svg>');	
	} 
	.btn4:checked{
		background-image: url('data:image/svg+xml;utf8, <svg aria-labelledby="i_j6h79zy9oo" viewBox="-13 -15 60 73" fill="white" role="img" xmlns="http://www.w3.org/2000/svg"><title id="i_j6h79zy9oo">Completed</title> <path d="m41.766 8.625-26.25 26.25-9.282-9.281a1.126 1.126 0 0 0-1.593 0l-1.06 1.06c-.44.44-.44 1.152 0 1.593L14.72 39.375c.44.44 1.153.44 1.594 0l28.106-28.106c.44-.44.44-1.153 0-1.594l-1.06-1.05a1.126 1.126 0 0 0-1.593 0z" fill-rule="evenodd"></path></svg>');
	}
	.rBtn:checked{
		background-image: url('data:image/svg+xml;utf8, <svg aria-labelledby="i_j6h79zy9oo" viewBox="-13 -15 60 73" fill="white" role="img" xmlns="http://www.w3.org/2000/svg"><title id="i_j6h79zy9oo">Completed</title> <path d="m41.766 8.625-26.25 26.25-9.282-9.281a1.126 1.126 0 0 0-1.593 0l-1.06 1.06c-.44.44-.44 1.152 0 1.593L14.72 39.375c.44.44 1.153.44 1.594 0l28.106-28.106c.44-.44.44-1.153 0-1.594l-1.06-1.05a1.126 1.126 0 0 0-1.593 0z" fill-rule="evenodd"></path></svg>');
	}
	
	.btn{
		transition-property: background-color;
	    transition-duration: 0.3s;
	}
	
	
	
	.btn1{
	    border: 3px solid #33a474;
	    border-radius: 100px;
	    width: 55px;
	    height: 55px;
	    margin-right: 20px;
	}
	
	.btn2{
	    border: 3px solid #33a474;
	    border-radius: 100px;
	    width: 45px;
	    height: 45px;
	    margin-right: 20px;	    
	}
	
	.btn3{
	    border: 3px solid #33a474;
	    border-radius: 100px;
	    width: 35px;
	    height: 35px;
	    margin-right: 20px;
	}
	
	.btn4{
	    border: 3px solid gray;
	    border-radius: 200px;
	    width: 30px;
	    height: 30px;
	    margin-right: 20px;
	}
	
	.btn5{
	    border: 3px solid #88619a;
	    border-radius: 100px;
	    width: 35px;
	    height: 35px;
	    margin-right: 20px;
	}
	
	.btn6{
	    border: 3px solid #88619a;
	    border-radius: 100px;
	    width: 45px;
	    height: 45px;
	    margin-right: 20px;
	}
	
	.btn7{
	    border: 3px solid #88619a;
	    border-radius: 100px;
	    width: 55px;
	    height: 55px;
	}
	
	.outline{
		border-bottom: 1px solid #dddfe2;
		margin-top: 35px;
		padding-bottom: 20px;
	}
	
	.btnWrap{
		display: flex;
		justify-content: center;
		align-items: center;
	    padding: 30px 0 60px;
	}
	
	.button{
		text-decoration: none;
		color: #fff;
		background-color: #88619a;
		border: none;
		border-radius: 100px;
		/* padding: 19px 50px; */
		text-align: center;
		line-height: 80px;
		font-size: 23px;
		font-weight: 600;
		height: 80px;
		width: 350px;
		transition: all .2s ease-in-out;
	}
	
	.button:hover{
		background-color: #6c4d7b;
	}
	
</style>
</head>
<body>
<script>

	function nextList(index){
					    // 4, 9, 14, 19 ...
		
		$j(".wrapper").each(function(index2, item) {
			if(index < index2 && index + 6 > index2 ){
				$j(item).css("display", "block");
			}else{
				$j(item).css("display", "none");
			}			
		});
	}
	
	var EI = 0;
	var IE = 0;
	var NS = 0;
	var SN = 0;
	var TF = 0;
	var FT = 0;
	var JP = 0;
	var PJ = 0;
	
	var M = "";
	var B = "";
	var T = "";
	var I = "";

	function resultMbti() {
		
		
		$j('.EI:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				EI += 3;
			}else if($j(item).val() == 2){
				EI += 2;
			}else if($j(item).val() == 3){
				EI += 1;
			}else if($j(item).val() == 4){
				EI += 0;
			}else if($j(item).val() == 5){
				EI += -1;
			}else if($j(item).val() == 6){
				EI += -2;
			}else if($j(item).val() == 7){
				EI += -3;
			}
		
		});
		
		$j('.NS:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				IE += 3;
			}else if($j(item).val() == 2){
				IE += 2;
			}else if($j(item).val() == 3){
				IE += 1;
			}else if($j(item).val() == 4){
				IE += 0;
			}else if($j(item).val() == 5){
				IE += -1;
			}else if($j(item).val() == 6){
				IE += -2;
			}else if($j(item).val() == 7){
				IE += -3;
			}
		
		});
		
		$j('.NS:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				NS += 3;
			}else if($j(item).val() == 2){
				NS += 2;
			}else if($j(item).val() == 3){
				NS += 1;
			}else if($j(item).val() == 4){
				NS += 0;
			}else if($j(item).val() == 5){
				NS += -1;
			}else if($j(item).val() == 6){
				NS += -2;
			}else if($j(item).val() == 7){
				NS += -3;
			}
		
		});
		
		$j('.SN:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				SN += 3;
			}else if($j(item).val() == 2){
				SN += 2;
			}else if($j(item).val() == 3){
				SN += 1;
			}else if($j(item).val() == 4){
				SN += 0;
			}else if($j(item).val() == 5){
				SN += -1;
			}else if($j(item).val() == 6){
				SN += -2;
			}else if($j(item).val() == 7){
				SN += -3;
			}
		
		});
		
		$j('.TF:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				TF += 3;
			}else if($j(item).val() == 2){
				TF += 2;
			}else if($j(item).val() == 3){
				TF += 1;
			}else if($j(item).val() == 4){
				TF += 0;
			}else if($j(item).val() == 5){
				TF += -1;
			}else if($j(item).val() == 6){
				TF += -2;
			}else if($j(item).val() == 7){
				TF += -3;
			}
		
		});
		
		$j('.FT:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				FT += 3;
			}else if($j(item).val() == 2){
				FT += 2;
			}else if($j(item).val() == 3){
				FT += 1;
			}else if($j(item).val() == 4){
				FT += 0;
			}else if($j(item).val() == 5){
				FT += -1;
			}else if($j(item).val() == 6){
				FT += -2;
			}else if($j(item).val() == 7){
				FT += -3;
			}
		
		});
		
		$j('.JP:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				JP += 3;
			}else if($j(item).val() == 2){
				JP += 2;
			}else if($j(item).val() == 3){
				JP += 1;
			}else if($j(item).val() == 4){
				JP += 0;
			}else if($j(item).val() == 5){
				JP += -1;
			}else if($j(item).val() == 6){
				JP += -2;
			}else if($j(item).val() == 7){
				JP += -3;
			}
		
		});
		
		$j('.PJ:checked').each(function(index, item){
			var value = $j(item).val();
			
			if($j(item).val() == 1){
				PJ += 3;
			}else if($j(item).val() == 2){
				PJ += 2;
			}else if($j(item).val() == 3){
				PJ += 1;
			}else if($j(item).val() == 4){
				PJ += 0;
			}else if($j(item).val() == 5){
				PJ += -1;
			}else if($j(item).val() == 6){
				PJ += -2;
			}else if($j(item).val() == 7){
				PJ += -3;
			}
		
		});
		
		console.log(EI);
		console.log(IE);
		console.log(SN);
		console.log(NS);
		console.log(TF);
		console.log(FT);
		console.log(JP);
		console.log(PJ);
		
		if(EI < IE){
			M = "I";
		}else{
			M = "E";
		}
		
		if(SN < NS){
			B = "N";
		}else{
			B = "S";
		}
		
		if(TF < FT){
			T = "F";
		}else {
			T = "T";
		}
		
		if(JP < PJ){
			I = "P";
		}else {
			I = "J";
		}
		
		console.log(M);
		console.log(B);
		console.log(T);
		console.log(I);
		
		var mbti = M+B+T+I;
		console.log(mbti);
		
		$j.ajax({
			url: "/board/mbtiResult.do",
			dataType: "json",
			type: "GET",
			data : {mbti: mbti},
			success: function(data, textStatus, jqXHR){
				console.log(data);
				console.log(${data})
				console.log(data.MBTI);
				location.href = "/board/mbtiResultPage.do?MBTI=${data.MBTI}";
				
			}
		});
		 
		
	}

	$j(document).ready(function(){
		
	});
</script>
<div>
	<div id="header">
		<div id="logo"></div>
		<div></div>
		<div></div>
	</div>
	<div id="body">
		<div id="bodyTop">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1920 60" preserveAspectRatio="none" class="angular-1920-1 hero__shape hero__shape--top">
				<path d="m0 20 420 40L800 0l750 60 370-45V0H0z"></path>
			</svg>
			<!-- 페이지당 문항 5개 -->
			<div id="mainText">
				<c:forEach var="item" items="${ list }" varStatus="status">
					<div class="wrapper" style='${ status.index < 5? "" : "display: none;"}'>
						<div class="outline">
							<div class="question">
								<span>${item.boardComment }</span>
							</div>
							<div class="checkbox">
								<div>
									<span class="agree">동의</span>
								</div>
								<div class="radioBtn">
									<input type="radio" name="${item.boardNum }" value="1" class="btn lBtn btn1 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="2" class="btn lBtn btn2 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="3" class="btn lBtn btn3 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="4" class="btn btn4 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="5" class="btn rBtn btn5 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="6" class="btn rBtn btn6 ${item.boardType }">
									<input type="radio" name="${item.boardNum }" value="7" class="btn rBtn btn7 ${item.boardType }">
								</div>
								<div>
									<span class="nonAgree">비동의</span>
								</div>
							</div>
						</div>
						<c:if test="${(status.index + 1) mod 5  eq 0 and not status.last}">
							<div class="btnWrap">
								<button class="button" onclick="nextList(${status.index})">다음</button>
							</div>
						</c:if>
						<c:if test="${status.last }">
							<div class="btnWrap">
								<button class="button" onclick="resultMbti()">검사결과</button> <!-- href="/board/mbtiResult.do" -->
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="footer"></div>
</div>

</body>
</html>