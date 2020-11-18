<#ftl>
<#-- Mauro Template -->
<#-- Name:Batch file -->
<#-- FilePrefix:Model_ -->
<#-- FileSuffix:.bat -->
<#-- Description:No description -->
<#-- ActionType:actionSingleModel -->
<#-- Mauro Template -->
<#macro createLines dataClass>
"C:\Program Files (x86)\Graphviz2.38\bin\dot" -O -Tsvg "ClassDiagram_${dataClass.dataModel.label} - ${dataClass.label}.dot"
<#list dataClass.childDataClasses as dc >
<@createLines dc />
</#list>
</#macro>
Rem Batch file to generate SVG from DOT files 
Rem Freemarker version ${.version}
<#list dataModel.childDataClasses as dataClass >
<@createLines dataClass />
</#list>