$(document).ready(function(){
	$("li:eq(0)").css('background-color','blueviolet');
	$("li").click(function(){
		$("li").css('background-color','lightseagreen');
		$(this).css('background-color','blueviolet');
		
		switch($(this).attr('id'))
		{
			case "1":
			$(".content").hide();
			$("#01").show();
			break;
			case "2":
			$(".content").hide();
			$("#02").show();
			break;
			case "3":
			$(".content").hide();
			$("#03").show();
			break;
			case "4":
			$(".content").hide();
			$("#04").show();
			break;
			case "5":
			$(".content").hide();
			$("#05").show();
			break;
			case "6":
			$(".content").hide();
			$("#06").show();
			break;
			case "7":
			$(".content").hide();
			$("#07").show();
			break;
			case "8":
			location.href="index.html";
			break;
		}
	});
});