<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery.treeTable.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	$("#group_hierarchy").treeTable({
		initialState:"expanded",
		clickableNodeNames:true
	}).disableSelection();

	$("#group_hierarchy .node").draggable({
		helper: "clone",
		opacity: .75,
		refreshPositions: true,
		revert: "invalid",
		revertDuration: 300,
		scroll: true
	});

	$("#group_hierarchy .node").each(function() {
		$(this).parents("#group_hierarchy tbody tr").droppable({
			accept: ".node",
			drop: function(e, ui) {
				$($(ui.draggable).parents("#group_hierarchy tbody tr")).appendBranchTo(this);
			},
			hoverClass: "accept",
			over: function(e, ui) {
				if(this.id != $(ui.draggable.parents("#group_hierarchy tbody tr")[0]).id && !$(this).is(".expanded")) {
					$(this).expand();
				}
			}
		});
	});

	$("#group_hierarchy tbody tr").mousedown(function() {
		$("#group_hierarchy tbody tr.selected").removeClass("selected");
		$(this).addClass("selected");
	});

	$("#group_hierarchy tbody tr span").mousedown(function() {
		$($(this).parents("#group_hierarchy tbody tr")[0]).trigger("mousedown");
	});
});
</script>