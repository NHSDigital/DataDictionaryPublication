<#ftl output_format="XML">
<#-- Mauro Template -->
<#-- FilePrefix:ClassDiagram_-->
<#-- FileSuffix:.dita-->
<#-- Description:No description-->
<#-- ActionType:actionClass-->
<#-- Mauro Template -->

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
<topic id="uml-${dataClass.id}" audience="diagrams">
    <title>${dataClass.label}</title>
    <body>
       <fig frame="all" expanse="page">
          <title>Diagram of ${dataClass.label} and related classes</title>
          <svg-container>
               <svgref href="ClassDiagram_${dataClass.dataModel.label?url_path('utf-8')}%20-%20${dataClass.label?url_path('utf-8')}.dot.svg" />
          </svg-container>
       </fig>
    </body>
</topic>