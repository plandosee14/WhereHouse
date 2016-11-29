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
starRating();
starRating2();