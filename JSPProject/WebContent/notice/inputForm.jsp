<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<script type="text/javascript">
/* 하나라도 걸리면 경고창과 포커스를 처리한후 false를  반환한다.  */
    function checkIt(){    
        var userinput=document.userinput;
        if(!userinput.id.value){
            alert("ID를 입력하세요");
            userinput.id.focus();
            return false;
        }
        if(!userinput.passwd.value){
            alert("비밀번호를 입력하세요");
            userinput.passwd.focus();
            return false;
        }
        /*     if(userinput.passwd.value != userinput.passwd2.value){
            alert("비밀번호를 동일하게 입력하세요");
            userinput.passwd2.focus();
            return false;
        } 우리는 비번한개*/
        if(!userinput.name.value){
            alert("사용자 이름을 입력하세요");
            userinput.name.focus();
            return false;
        }
        if(!userinput.jumin1.value){
            alert("주민등록번호를 입력하세요");
            userinput.jumin1.focus();
            return false;
        }
        if(!userinput.jumin2.value){
            alert("주민등록번호를 입력하세요");
            userinput.jumin2.focus();
            return false;
        }
        return true;
    }
    //아이디 중복 여부를 판단
    function openConfirmid(userinput){
        //아이디를 입력했는지 검사
        if(userinput.id.value==""){
            alert("아이디를입력하세요");
            userinput.id.focus();
            return;
        }
        //url과 사용자 입력 id를 조합합니다.
        url="confirmId.jsp?id="+userinput.id.value;
        
        //새로운 윈도우를 엽니다.
        open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrllbar=no,resizable=no,width=300,height=200");
    }
</script>
</head>
<body>
<table align="center">
<tr><td>
<!-- 
onSubmit="return checkIt()"  : checkIt() 리턴값이 true면  Submit을 실행
                                                 false면 실행안함(자바스크립트에서경고창 포커스처리)
-->
<form method="post" action="inputPro.jsp" name="userinput" onSubmit="return checkIt()">
사용자 ID : <input type="text" name ="id" size="10" maxlength="12">
    <input type="button" name="confirm_id" value="ID중복확인" onClick="openConfirmid(this.form)"><br/>
비밀번호 : <input type="password" name ="passwd" size="15" maxlength="12"><br/>
사용자이름 : <input type="text" name ="name" size="15" maxlength="10"><br/>
주민등록번호 : <input type="text" name ="jumin1" size="7" maxlength="6">
            - <input type="text" name ="jumin2" size="7" maxlength="7"><br/>
E-Mail : <input type="text" name ="email" size="40" maxlength="30"><br/>
Blog : <input type="text" name ="blog" size="60" maxlength="50"><br/>
<input type="submit" value="등   록">
<input type="reset" value="다시 입력">
</form>
</td></tr>
</table>
</body>
</html>
