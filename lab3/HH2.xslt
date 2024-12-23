<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" />
<xsl:template match="/">
	<xsl:element name="webpages">
		<xsl:apply-templates select="//link"/>
		<xsl:apply-templates select="hypertext/author"/>
	</xsl:element>
</xsl:template>

<xsl:template match="link">
	<xsl:element name="address">
		<xsl:value-of select="@source" />
	</xsl:element>
</xsl:template>

	<xsl:template match="author">
			<xsl:attribute name=”name”>  </xsl:attribute> <xsl:value-of select="name"/>
			<xsl:attribute name=”surname”>  </xsl:attribute> <xsl:value-of select="surname"/>
	</xsl:template>
	
</xsl:stylesheet>
