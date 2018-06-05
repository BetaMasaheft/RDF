<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:sr="http://www.w3.org/2005/sparql-results#"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="sr:sparql">
        
        <html>
            <head></head>
            <body>
                <table class="table table-responsive">
            <xsl:apply-templates/>
        </table>
            </body></html>
    </xsl:template>
    <xsl:template match="sr:head">
        <thead><tr><xsl:apply-templates/></tr></thead>
    </xsl:template>
    
    <xsl:template match="sr:variable">
        <th><xsl:value-of select="@name"/></th>
    </xsl:template>
    <xsl:template match="sr:results">
        <tbody><xsl:apply-templates/></tbody>
    </xsl:template>
    
    <xsl:template match="sr:result">
        <xsl:variable name="result" select="."/>
        <tr><xsl:for-each select="//sr:variable">
            <xsl:variable name="n" select="@name"/>
            <td><xsl:apply-templates select="$result/sr:binding[@name=$n]"/></td>
        </xsl:for-each></tr>
    </xsl:template>
    
    <xsl:template match="sr:binding">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="sr:uri">
        <a href="{.}"><xsl:value-of select="."/></a>
    </xsl:template>
</xsl:stylesheet>