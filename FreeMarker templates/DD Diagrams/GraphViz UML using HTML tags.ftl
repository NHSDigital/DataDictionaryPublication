<#ftl>
<#-- Mauro Template -->
<#-- Name:GraphViz UML using HTML tags -->
<#-- FilePrefix:ClassDiagram_ -->
<#-- FileSuffix:.dot -->
<#-- Description:No description -->
<#-- ActionType:actionClass -->
<#-- Mauro Template -->
<#-- Configuration parameters -->
<#assign siteRoot="https://datadictionary.nhs.uk/">

<#-- Get DD Parameters for an object -->
<#function getDDParameter catalogueItem, parameter >
<#-- catalogueItem.metadata?filter(p -> p.namespace="datadictionary.nhs.uk")?filter(p -> p.key=parameter).first.value  -->
<#assign res=catalogueItem.label >
<#return "" >
</#function>
<#macro drawChildren class>
// Children of ${class.label!"Unknown class"}
    <#list class.childDataClasses as related>
        "${class.id}" -> "${related.id}" [
                arrowhead = "empty"
                headlabel = "<@multiplicity class />"
                taillabel = "<@multiplicity related />"
        ]
        <@drawClass related />
    </#list>
</#macro>
<#-- writeDDMultiplicity - writes the multiplicity of the association using DD properties -->
<#macro writeDDMultiplicity rel>
          // Multiplicity UIDs 
          // Client ${getDDParameter( rel "clientCardinality" )}  ${getDDParameter( rel "clientUin" )}
          // Supplier ${getDDParameter( rel "supplierCardinality" )}  ${getDDParameter( rel "supplierUin" )}
          // direction ${getDDParameter( rel "direction" )}
</#macro>
<#macro drawParent class>
// Parent(s) of ${class.label!"Unknown class"}
<#if class.parentDataClass??>
<@drawClass class.parentDataClass />
        "${class.parentDataClass.id}" -> "${class.id}" [
                arrowtail = "empty"
                headlabel = "<@multiplicity class />"
                taillabel = "<@multiplicity class.parentDataClass />"
        ]
<#else>
// No Parent
</#if>
</#macro>
<#macro drawClass class incType="no">
// class ${getDDParameter( class "TitleCaseName" )}
        "${class.id}" [ 
                tooltip = "${class.label}",
                label = < 
                <table border="0">
                <tr><td border="0" align="center" style="class"><b>${class.label!"Unknown class"}</b></td></tr>
                <#list class.childDataElements?filter(p -> p.dataType.domainType != "ReferenceType") as dataElement>
                <tr><td border="0" align="left" style="attribute" href="${siteRoot}attributes/${dataElement.label?replace(" ","_")}.html" title="Element: ${dataElement.label}">+ ${dataElement.label}<#if incType != "no"> : ${dataElement.dataType.label!"Missing datatype"} </#if>[<@multiplicity dataElement />]</td></tr></#list>
                </table>
                >
                class="class"
        ]
</#macro>
<#macro multiplicity object>
<#if object.minMultiplicity??><#if object.minMultiplicity == object.maxMultiplicity>${object.minMultiplicity}<#else>${object.minMultiplicity}..<#if object.maxMultiplicity==-1>*<#else>${object.maxMultiplicity!"?"}</#if></#if></#if></#macro>
<#macro relatedClasses dataClass>
// Classes related to ${dataClass.label} 
<#list dataClass.childDataElements?filter(p -> p.dataType.domainType == "ReferenceType") as dataElement >
       "${dataClass.id}" -> "${dataElement.dataType.id}" [label="${dataElement.label}" arrowhead="none" arrowtail="none"]
        "${dataElement.dataType.id}" [label= "${dataElement.dataType.label?replace(" Reference","")}" URL="https://datadictionary.nhs.uk/classes/${dataElement.dataType.label?replace(" Reference","")?replace(" ","_")}.html"]
        // ${dataElement.label}    ${dataElement.dataType.id} 
        //
        // Listing the multiplicity properties for class ${dataClass.id} ${dataClass.label}
<#attempt>
<@writeDDMultiplicity dataElement />
<#recover>
        // Failed to list multiplicities
</#attempt>
</#list>
</#macro>

digraph G {
        node [
            shape = "record"
        ]
        edge [
        ]
        stylesheet = "https://datadictionary.nhs.uk/oxygen-webhelp/template/NHSD.css"
        
// The root class
<@drawClass dataClass />

// The child classes
<@drawChildren dataClass />  
 
// The related classes
<@relatedClasses dataClass />       
      
}