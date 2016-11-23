$(function(){
			$(".bt_on").parent("li").find("ul").slideUp(0);
			$(".bt_on").click(function(){
				$(this).parent("li").find("ul").slideToggle(500);
				return false;
			});	
		});