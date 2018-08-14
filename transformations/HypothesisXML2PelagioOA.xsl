<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:h="https://hypothes.is/"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"></xsl:output>
    <xsl:template match="/">
        <rdf:RDF
            xmlns:dcterms="http://purl.org/dc/terms/"
            xmlns:oa="http://www.w3.org/ns/oa#"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:cnt="http://www.w3.org/2011/content#"
            xmlns:pelagios="http://pelagios.github.io/vocab/terms#">
            
            <xsl:for-each-group select="//h:rows[starts-with(h:text, 'http')]" group-by="./h:target/h:source/text()">
                <pelagios:AnnotatedThing rdf:about="{./h:target/h:source/text()}"/>
                <xsl:for-each select="current-group()">
                    <oa:Annotation rdf:about="{./h:links/h:json/text()}">
                    <oa:hasBody rdf:resource="{./h:text/text()}"/>
                    <oa:hasTarget rdf:resource="{current-grouping-key()}"/>
                </oa:Annotation>
                </xsl:for-each>
            </xsl:for-each-group>
            
        </rdf:RDF>
        
    </xsl:template>
</xsl:stylesheet>