//操作状态设置
function operateStatusFormatter(value, row, index){
	if (value == 1){
		return "失败";
	} else if (value == 0){
		return "成功";
	} else {
		return ;
	}
}


