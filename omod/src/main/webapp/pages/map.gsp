<%
    ui.decorateWith("appui", "standardEmrPage")
%>
<script>
    var jq = jQuery;
</script>
<style>
#atlas {
    min-height: 500px;
    max-height: 1000px;
    width: 100%;
    overflow:hidden;
}
</style>
<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.message("atlas.title")}"}
    ];
    jq(function() {
        jq("#tabs").tabs();
    });
</script>
<body data-spy="scroll" data-target="#menu">
<h1>
    ${ ui.message("atlas.title") }
</h1>
<div id="tabs">
	<ul>
		<li><a href="#home">Home</a></li>
		<li><a href="#manage">Manage markers</a></li>
	</ul>
	<div id="home">
            <iframe src="http://107.170.156.44?module=1" name="atlas" id="atlas"></iframe>
	</div>
	<div id="manage">
       
    </div>
</div>
</body>

    