function IdCheck(ref,fname,ename,myname,w,h,scroll){
	var userid=eval("document."+fname+"."+ename);
	
	if(!userid.value){
		alert("아이디를 입력한 후 버튼을 눌러주세요.");
		userid.focus();
		return;
		
	} else{
		ref=ref+"?"+ename+"="+userid.value;
		var winl=(screen.width-w)/2;
		var wint=(screen.width-h)/2;
		winprops='height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll;
		window.open(ref,myname,winprops)
	}
}