<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> 
<head>
    <meta charset="utf-8">
	<title>ColorPicker</title>
	<link irel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
	<link href="http://localhost:9090/tumblbugs/css/evol-colorpicker.min.css" rel="stylesheet" />

	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/evol-colorpicker.min.js"></script>
	<style>
	div.evo-pop {
    background-color: white;
    border: 1px solid black;
    }
	</style>
	<script>

$(document).ready(function(){

	// Change theme
    /*$('.css').on('click', function(evt){
        var theme=this.innerHTML.toLowerCase().replace(' ', '-'),
            url='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/'+theme+'/jquery-ui.css';
        $('#jquiCSS').attr('href', url);
        $('.css').removeClass('sel');
        $(this).addClass('sel');
    });*/
	
	// Events demo
	/*function setColor(evt, color){
        if(color){
            $('#cpEvent').css('background-color', color);
        }
	}

	$('#cpBinding').colorpicker({
		color:'#ebf1dd',
		initialHistory: ['#ff0000','#000000','red', 'purple']
	})
		.on('change.color', setColor)
		.on('mouseover.color', setColor);
	*/
	// Methods demo
	/*$('#getVal').on('click', function(){
		alert('Selected color = "' + $('#cp1').colorpicker("val") + '"');
	});
	$('#setVal').on('click', function(){
		$('#cp1').colorpicker("val",'#31859b');
	});
	$('#enable').on('click', function(){
		$('#cp1').colorpicker("enable");
	});
	$('#disable').on('click', function(){
		$('#cp1').colorpicker("disable");
	});
	$('#clear').on('click', function(){
		$('#cp1').colorpicker("clear");
	});
	$('#destroy1').on('click', function(){
		$('#cp1').colorpicker("destroy");
	});
	// Methods demo 2 (inline colorpicker)
	$('#getVal2').on('click', function(){
		alert('Selected color = "' + $('#cpInline').colorpicker("val") + '"');
	});
	$('#setVal2').on('click', function(){
		$('#cpInline').colorpicker("val", '#31859b');
	});
	$('#enable2').on('click', function(){
		$('#cpInline').colorpicker("enable");
	});
	$('#disable2').on('click', function(){
		$('#cpInline').colorpicker("disable");
	});
	$('#destroy2').on('click', function(){
		$('#cpInline').colorpicker("destroy");
	});
	
	// Instanciate colorpickers
	$('#cp1').colorpicker({
		color:'#ff9800',
		initialHistory: ['#ff0000','#000000','red', 'purple']
	})
	$('#cpBinding').colorpicker({
		color:'#ebf1dd'
	})
    $('#cpInline').colorpicker({color:'#92cddc'});
    $('#cpInline2').colorpicker({color:'#92cddc', defaultPalette:'web'});
*/
	// Custom theme palette
	/*$('#customTheme').colorpicker({
		color: '#f44336',
		customTheme: ['#f44336','#ff9800','#ffc107','#4caf50','#00bcd4','#3f51b5','#9c27b0', 'white', 'black']
	});
    $('#cpButton').colorpicker({showOn:'button'});*/
    $('#cpFocus').colorpicker({showOn:'focus'});
    $('#cpBoth').colorpicker();
    $('#cpOther').colorpicker({showOn:'none'});

	/*$('#show').on('click', function(evt){
		evt.stopImmediatePropagation();
		$('#cpOther').colorpicker("showPalette");
	});
	*/
	// With transparent color
	/*$('#transColor').colorpicker({
		transparentColor: true
	});

	// With hidden button
	$('#hideButton').colorpicker({
		hideButton: true
	});

	// No color indicator
	$('#noIndColor').colorpicker({
		displayIndicator: false
	});

	// French colorpicker
	$('#frenchColor').colorpicker({
		strings: "Couleurs de themes,Couleurs de base,Plus de couleurs,Moins de couleurs,Palette,Historique,Pas encore d'historique."
	});

	// Fix links
	$('a[href="#"]').attr('href', 'javascript:void(0)');*/

});

</script>
</head>

<body>
<!-- >
<h2 id="github">
    <a href="https://github.com/evoluteur/colorpicker">GitHub</a><br/>
    <iframe src="https://ghbtns.com/github-btn.html?user=evoluteur&repo=colorpicker&type=star&count=true&size=small" frameborder="0" scrolling="0" width="100px" height="30px"></iframe>
    <div class=""/>
</h2>

<h1 id="title">Evol-ColorPicker</h1>

<p style="clear:both;"><strong>Evol-ColorPicker</strong> (currently v3.4.0) is a web color picker which looks like the one in Microsoft Office 2010.
</p>

<p>
    It can be used inline or as a popup bound to a text box.
    It comes with several color palettes, can track selection history and supports "transparent" color. 
    It is a full jQuery UI widget, supporting various configurations and themes.
</p>

<div>

<p>Themes:
    <a href="#" class="css sel">Base</a> -
    <a href="#" class="css">UI lightness</a> -
    <a href="#" class="css">UI darkness</a> -
    <a href="#" class="css">Redmond</a> -
    <a href="#" class="css">Sunny</a> -
    <a href="#" class="css">Le Frog</a> -
    <a href="#" class="css">Swanky Purse</a>
</p>

<div class="demoPanel">
	Inline (using a DIV tag):<br/><br/>
	<div id="cpInline"></div>
	<br/>
	<div class="demo-links">
		<a href="#" id="getVal2">Get Value</a>
		<a href="#" id="setVal2">Set Value</a><br/>
		<a href="#" id="enable2">Enable</a>
		<a href="#" id="disable2">Disable</a>
		<a href="#" id="destroy2">Destroy</a>
	</div> 
</div>

<div class="demoPanel">
	Inline with "web" default palette:<br/><br/>
	<div id="cpInline2"></div> 
</div>
-->
<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px">
	Palette triggers:<br/><br/>
	<label>button only</label>
	<input id="cpButton" value="#ccc1d9" />
	<label>focus only</label>
	<input id="cpFocus" value="#8db3e2" />
	<label>button + focus</label>
	<input id="cpBoth" value="#b7dde8" />
	<label><a href="#" id="show">link</a></label>
	<input id="cpOther" value="#d7e3bc" />
	<br/> 
	<i>Using "showOn" option.</i>
</div>
<!-- 
<div id="cpb" class="demoPanel" style="width:170px;">
	Methods:<br/><br/>
	<input id="cp1"/><br/> 
	<div id="tests" class="demo-links">
		<a href="#" id="getVal">Get Value</a>
		<a href="#" id="setVal">Set Value</a><br/>
		<a href="#" id="enable">Enable</a>
		<a href="#" id="disable">Disable</a>
		<a href="#" id="clear">Clear</a>
		<a href="#" id="destroy1">Destroy</a>
	</div>
</div>

<div id="cpEvent" class="demoPanel" style="width:170px;background-color:#ebf1dd;">
	Event binding:
	<br/><br/>
	<input id="cpBinding"/><br/> 
	<i>Using "change.color" and "mouseover.color" events.</i>
</div>

<div class="demoPanel">
	Custom Palette:<br/>
	<br/> 
	<div id="customTheme" value="#92cddc" ></div><br/>
	<i>Using the "customTheme" option you can provide your own list of colors.</i>
</div>

<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px">
	With transparent color:
	<br/><br/>
	<input id="transColor" value="#0000ffff" />
</div>

<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px">
	Using "hideButton" option:<br/>
	<br/>
	<input id="hideButton" value="#92cddc" />
</div>

<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px;">
	No color indicator on the palette:<br/>
	<br/> 
	<input id="noIndColor" value="#92cddc" />
</div>

<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px;">
	In French:<br/>
	<br/> 
	<input id="frenchColor" value="#92cddc" /><br/>
	<i>Using the "strings" option you can translate the colorpicker.</i>
</div>

<div style="clear:both;"></div>

</div>
-->

</body>

</html>