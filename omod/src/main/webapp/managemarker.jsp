<%@page import="org.openmrs.module.atlas.*"%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script  type="text/javascript">
    if (typeof jQuery === 'undefined') {
        document.write("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js'><\/script>");
        document.write("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js'><\/script>");
    }
    var jq = jQuery.noConflict();
    var connected;
    function updateModulefromServer() {
        connected = isModuleConnect("https://atlas.local/module/auth?uuid=${atlasData.id}&callback=getAuth");
    }
    function receiveMessage(event) {
        updateModulefromServer();
        addEventListener("message", receiveMessage, false);
    }
    jq(document).ready(function() {
        addEventListener("message", receiveMessage, false);
    });
</script>
<script src="<openmrs:contextPath/>/dwr/interface/DWRAtlasService.js"></script>
<openmrs:htmlInclude file="/moduleResources/atlas/atlas.css" />
<openmrs:htmlInclude file="/moduleResources/atlas/styles/bootstrap-btn.css" />
<openmrs:htmlInclude file="/moduleResources/atlas/atlas.js" />


<h2>
    <spring:message code="atlas.manageMarkerLink" />
</h2>
<br />

<openmrs:require privilege="Manage Atlas Data" otherwise="/login.htm"
                 redirect="/index.htm" />
<div id="home">
    <div id="atlas-map">
        <iframe src="https://atlas.local/module?uuid=${atlasData.id}&patients=${atlasData.numberOfPatients}&encounters=
                ${atlasData.numberOfEncounters}&observations=${atlasData.numberOfObservations}" 
                name="atlas" style="height: 100%;width: 100%" id="atlas"></iframe>
    </div>
    <div class="note-container" id="module-control" style="display:none">
        <div class="note" id="disabled" style="background-color: rgba(255, 95, 95, 0.73);  
             <c:if test="${atlasData.moduleEnabled}"> display: none; </c:if> margin-left: -100px;">
                 <div class="text">
                     <strong><spring:message code="atlas.disabled" /></strong><br>
                 <strong><spring:message code="atlas.autoUpdates" /></strong>
                 <div id="disabled-button" class="btn-group btn-toggle"> 
                     <button class="btn btn-xs btn-danger active"><spring:message
                             code="atlas.buttonDisabled" /></button>
                 <button class="btn btn-xs btn-default active"><spring:message
                         code="atlas.buttonEnabled" /></button></div>
             </div>
             <div class ="atlas-show-dialog"><i class="icon-info-sign small" style="vertical-align: middle"></i>
                 <spring:message
                     code="atlas.dataSend"/></div>
        </div>

        <div class="note" id="enabled" style="background-color: rgba(156, 214, 16, 0.53); 
             <c:if test="${not atlasData.moduleEnabled}"> display: none; </c:if> margin-left: 0px;">

                 <div class="text">
                     <strong><spring:message code="atlas.autoUpdates" /></strong>
                 <div id="enabled-button"class="btn-group btn-toggle"> 
                     <button class="btn btn-xs btn-default active"><spring:message
                             code="atlas.buttonDisabled" /></button>
                 <button class="btn btn-xs btn-success active"><spring:message
                         code="atlas.buttonEnabled" /></button></div>
             </div>
             <div class="atlas-show-dialog"><i class="icon-info-sign small" style="vertical-align: middle"></i>
                 <spring:message code="atlas.dataSend" /></div>
        </div>
    </div>
    <div class="note-container" style="display:none" id="unlinked">
        <div class="note" style="background-color: rgba(255, 95, 95, 0.73); margin-left: -100px;">
            <div class="text">
                <p><strong><spring:message code="atlas.unlinked" /></strong></p>
            </div>
        </div>
    </div> 
    <div id="atlas-gutter-sentInfo" style="display: none">
        <span id="atlas-gutter-sentInfoTitle"><spring:message
                code="atlas.whatWillBeSentInfoTitle" /> </span> <br><br><textarea
            id="atlas-dialog-jsonData" cols="75" rows="10" readonly="readonly"
            style="resize: none;"></textarea>
    </div>
</div>  

<%@ include file="/WEB-INF/template/footer.jsp"%>
