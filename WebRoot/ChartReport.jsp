<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<div align="center">

<s:if test="report == null || !report.isDisplayInline()">

<a class="back-link img-report-small" href="reportList.action"><s:text name="link.back.groups"/></a>
<a class="back-link img-group-small" href="reportGroup.action"><s:text name="link.back.reports"/></a>
<a class="back-link img-report-small"href="reportOptions.action?submitSchedule=true&exportType=4"><s:text name="link.scheduleChart"/></a>  
  
<br/><br/> 
 
<div class="important img-chart" id="instructions"><s:property value="report.name"/></div>   
 
</s:if>
 
<s:property value="imageMap" escape="false"/>

<img border="0" usemap="#chart" src="imageLoader.action?imageName=ChartImage&chartRequestId=<s:property value="chartRequestId"/>"/>	
	
<br/>	

<s:actionerror/>

<br/>

<s:if test="report.reportChart.showValues">

<s:set name="chartValues" value="chartValues" scope="request" />  

<s:if test="report.reportChart.chartType == 0 || report.reportChart.chartType == 5 || report.reportChart.chartType == 8">
	<display:table name="chartValues" class="displayTag" sort="list" pagesize="50" export="true" cellspacing="1" requestURI="reportDetail.action" >  
		<display:column property="series" title="Serie" sortable="true" headerClass="sortable"/>
	    	<display:column property="category" title="Eixo X" sortable="true" headerClass="sortable"/>  	     
		<display:column property="value" title="Eixo Y" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/>
	</display:table>  
</s:if>

<s:if test="report.reportChart.chartType == 1 || report.reportChart.chartType == 4">
	<display:table name="chartValues" class="displayTag" sort="list" pagesize="50" export="true" cellspacing="1" requestURI="reportDetail.action" >  
	   <display:column property="key" title="Serie" sortable="true" headerClass="sortable"/>  	     
	   <display:column property="value" title="Valor" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/>  	     
	</display:table> 
</s:if>

<s:if test="report.reportChart.chartType == 2 || report.reportChart.chartType == 6 || report.reportChart.chartType == 11">
    <display:table name="chartValues" class="displayTag" sort="list" pagesize="50" export="true" cellspacing="1" requestURI="reportDetail.action" >  
	    <display:column property="series" title="Serie" sortable="true" headerClass="sortable"/>
	    <display:column property="value" title="Eixo X" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/>
	    <display:column property="YValue" title="Eixo Y" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/>  	     
		<s:if test="report.reportChart.chartType == 11">
			<display:column property="ZValue" title="label.zAxis" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/>  	     
		</s:if>
	</display:table>  
</s:if>

<s:if test="report.reportChart.chartType == 3 || report.reportChart.chartType == 7">
	<display:table name="chartValues"  class="displayTag" sort="list" pagesize="50" export="true" cellspacing="1" requestURI="reportDetail.action" >  
      <display:column property="series" title="Serie" sortable="true" headerClass="sortable"/>
      <display:column property="time" title="Horario" sortable="true" headerClass="sortable" format="{0,date,dd/MM/yyyy HH:mm:ss}"/>
      <display:column property="value" title="Valor" sortable="true" headerClass="sortable-right" style="text-align:right;" decorator="org.efs.openreports.util.NumberColumnDecorator"/> 
	</display:table>
</s:if>
  
</s:if>

</div>

