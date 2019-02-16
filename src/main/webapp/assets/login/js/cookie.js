/**
 * js操作cookie
 */

// 取Cookie的值
function setCookie(key, value, expiredays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + expiredays);
	document.cookie = key + "=" + escape(value)
			+ ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}

// 读取cookies
function getCookie(key) {
	var arrStr = document.cookie.split("; "); 
    for (var i = 0; i < arrStr.length; i++) { 
        var temp = arrStr[i].split("="); 
        if (temp[0] == key) 
            return unescape(temp[1]); 
    } 
}

// 删除cookies
function delCookie(key) {
	var exp = new Date();
	exp.setDate(exp.getDate() - 1);
	var val = getCookie(key);
	if (val != null)
		document.cookie = key + "=" + val + ";expires=" + exp.toGMTString();
}
