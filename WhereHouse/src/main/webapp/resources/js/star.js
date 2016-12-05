// star rating
var starRating = function() {
	var $star = $(".star-input"), $result = $star.find("output>b");
	$(document).on("focusin", ".star-input>.input", function() {
		$(this).addClass("focus");
	}).on("focusout", ".star-input>.input", function() {
		var $this = $(this);
		setTimeout(function() {
			if ($this.find(":focus").length === 0) {
				$this.removeClass("focus");
			}
		}, 100);
	}).on("change", ".star-input :radio", function() {
		$result.text($(this).next().text());
	}).on("mouseover", ".star-input label", function() {
		$result.text($(this).text());
	}).on("mouseleave", ".star-input>.input", function() {
		var $checked = $star.find(":checked");
		if ($checked.length === 0) {
			$result.text("0");
		} else {
			$result.text($checked.next().text());
		}
	});
};
var starRating2 = function() {
	$star2 = $(".star-input2"), $result2 = $star2.find("output>b");
	$(document).on("focusin", ".star-input2>.input", function() {
		$(this).addClass("focus2");
	}).on("focusout", ".star-input2>.input", function() {
		var $this = $(this);
		setTimeout(function() {
			if ($this.find(":focus2").length === 0) {
				$this.removeClass("focus2");
			}
		}, 100);
	}).on("change", ".star-input2 :radio", function() {
		$result2.text($(this).next().text());
	}).on("mouseover", ".star-input2 label", function() {
		$result2.text($(this).text());
	}).on("mouseleave", ".star-input2>.input", function() {
		var $checked = $star2.find(":checked");
		if ($checked.length === 0) {
			$result2.text("0");
		} else {
			$result2.text($checked.next().text());
		}
	});
};
var starRating3 = function() {
	$star3 = $(".star-input3"), $result3 = $star3.find("output>b");
	$(document).on("focusin", ".star-input3>.input", function() {
		$(this).addClass("focus3");
	}).on("focusout", ".star-input3>.input", function() {
		var $this = $(this);
		setTimeout(function() {
			if ($this.find(":focus3").length === 0) {
				$this.removeClass("focus3");
			}
		}, 100);
	}).on("change", ".star-input3 :radio", function() {
		$result3.text($(this).next().text());
	}).on("mouseover", ".star-input3 label", function() {
		$result3.text($(this).text());
	}).on("mouseleave", ".star-input3>.input", function() {
		var $checked = $star3.find(":checked");
		if ($checked.length === 0) {
			$result3.text("0");
		} else {
			$result3.text($checked.next().text());
		}
	});
};

var starRating4 = function() {
	$star4 = $(".star-input4"), $result4 = $star4.find("output>b");
	$(document).on("focusin", ".star-input4>.input", function() {
		$(this).addClass("focus4");
	}).on("focusout", ".star-input4>.input", function() {
		var $this = $(this);
		setTimeout(function() {
			if ($this.find(":focus4").length === 0) {
				$this.removeClass("focus4");
			}
		}, 100);
	}).on("change", ".star-input4 :radio", function() {
		$result4.text($(this).next().text());
	}).on("mouseover", ".star-input4 label", function() {
		$result4.text($(this).text());
	}).on("mouseleave", ".star-input4>.input", function() {
		var $checked = $star4.find(":checked");
		if ($checked.length === 0) {
			$result4.text("0");
		} else {
			$result4.text($checked.next().text());
		}
	});
};
starRating();
starRating2();
starRating3();
starRating4();