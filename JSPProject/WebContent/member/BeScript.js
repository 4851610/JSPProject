/**
 * 
 */

function popup(x){
		var data = './IdCheck.jsp?id='+x;
		window.open(data,'client','resizable=yes scrollbar=yes width=400 height=250');
	}

function close()
{
	window.close();
}