<#assign display=JspTaglibs["/WEB-INF/displaytag.tld"]>

<html>

<head>
  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
  <title>OpenReports</title>
  <link rel="stylesheet" type="text/css" href="css/yui/reset-fonts-grids.css" />

  <link href="css/openreports.css" rel="stylesheet" type="text/css">
  <!-- YUI Dependencies -->
  <script type="text/javascript" src="js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="js/yui/dom-min.js"></script>
  <script type="text/javascript" src="js/yui/event-min.js"></script>
  <script type="text/javascript" src="js/yui/animation-min.js"></script>
  <script type="text/javascript" src="js/yui/dragdrop-min.js"></script>

  <script type="text/javascript" src="js/yui/connection-min.js"></script>
  <script type="text/javascript" src="js/yui/container-min.js"></script>
  <script type="text/javascript" src="js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="css/displaytag.css">


  <link rel="stylesheet" type="text/css" href="css/yui/button.css">    
  <!-- End YUI Dependencies -->
  <script type="text/javascript" src="js/highlight.js"></script>
</head>

<body class="yui-skin-sam">

<div class="menu"> 

	<div>
		<ul class="vert">			
			<li class="logo">			  
				Relatorio de Temperaturas			
			</li>                     
		</ul>

	</div>   
	  
	<div id="usermenu">	    
  		<ul class="vert">   	
  		  	 
          <li>
          	<span id="logoffButton" class="yui-button yui-link-button"> 
	    		<span class="first-child"> 
          			<a href="logout.action">Logoff</a>
          		</span>
          	</span>                   
          </li>         
          <li>
            <span id="userAdminButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="userAdmin.action">

          				Preferences
          			</a>
          		</span>
          	</span>             
          </li> 
          
          
          	<li>
          		<span id="adminButton" class="yui-button yui-link-button "> 
	    			<span class="first-child"> 
            			<a  href="reportAdmin.action">
            				Administration
            			</a>
            		</span>

            	</span>
            </li>
            
          
          <li>
          	<span id="schedulerButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="listScheduledReports.action">
          				Scheduled Reports
          			</a>
          		</span>
          	</span> 
          </li> 
          
          
          <li>

          	<span id="reportsButton" class="yui-button yui-link-button yui-button-hover yui-link-button-hover"> 
	    		<span class="first-child"> 
          			<a href="reportGroup.action">
          				Reports
          			</a>
          		</span>
          	</span> 
          </li>
          
          
          <li>
          	<span id="dashboardButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="dashboard.action">

          				Dashboard
          			</a>
          		</span>
          	</span>          
          </li>
                
        </ul>
    </div>
        
    
</div> 

<script type="text/javascript">
	var menuButton1 = new YAHOO.widget.Button("logoffButton");
	var menuButton2 = new YAHOO.widget.Button("reportsButton");
	var menuButton3 = new YAHOO.widget.Button("adminButton");
	var menuButton4 = new YAHOO.widget.Button("dashboardButton");
	var menuButton4 = new YAHOO.widget.Button("schedulerButton");
	var menuButton4 = new YAHOO.widget.Button("userAdminButton");
</script>     

<div align="center">  

  <a class="back-link img-report-small" href="reportList.action">Back to Reports </a>
  <a class="back-link img-group-small" href="reportGroup.action">Back to Groups </a>  
	
  <br/><br/>    

<br>
	
<@display.table name="results" class="displaytag" sort="list" export=true pagesize=30 requestURI="queryReportResult.action" cellspacing="1"> 
 
  <@display.column property="minima" title="Minima" format="{0, number, #,##0.00} &deg;C" /> 

  <@display.column property="media" title="Media" format="{0, number, #,##0.00} &deg;C" /> 

  <@display.column property="maxima" title="Maxima" format="{0, number, #,##0.00} &deg;C" /> 

  <@display.column property="desvio_padrao" title="Desvio Padrao" format="{0, number, #,##0.00} &deg;C" /> 

  <@display.column property="descricao" title="Descricao" sortable=true  headerClass="sortable" /> 
         
  <@display.setProperty name="export.pdf" value="true"/> 
  <@display.setProperty name="export.xml" value="false"/> 
  <@display.setProperty name="export.pdf.filename" value="${report.name}.pdf"/> 
  <@display.setProperty name="export.csv.filename" value="${report.name}.csv"/> 
  <@display.setProperty name="export.excel.filename" value="${report.name}.xls"/> 
 
</@display.table> 
     
</body>
</html>




