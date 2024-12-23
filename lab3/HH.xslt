﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Hypertext hypermedia</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<link rel="stylesheet" href="index.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Hypertext hypermedia</h1>
					</header>

					<xsl:call-template name="navi"/>


					<div id="content">
						<h2 id="scientists">Scientists</h2>
						<!-- a place for information about hypertext scientists -->
						<xsl:apply-templates select="hypertext/people/person"/>
						<h2 id="systems">Systems</h2>
						<!-- a place for information about hypertext systems -->
						<xsl:apply-templates select="hypertext/systemList/system"/>

					</div>
					<!-- end content -->
				</div>
				<!-- end wrapper -->
				<footer>
					<xsl:apply-templates select="hypertext/author"/>	<!-- wywołanie szablonu pozwalającego na wyświetlenie informacji o imieniu oraz nazwisku studenta -->
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
		Copyright 2022, <xsl:value-of select="name"/> <xsl:text> </xsl:text>  <xsl:value-of select="surname"/>
	</xsl:template>
	
	<xsl:template name="navi">
	<nav>
		<ul>
			<li> <a href="#scientists">Scientists</a> </li>
			<li> <a href="#systems">Systems</a> 	</li>
		</ul>
	</nav>	
	</xsl:template>

	<xsl:template match="system">
		<h3>
			<xsl:value-of select="name"/> 
		</h3>
		<xsl:value-of select="description"/> <br/>
		<xsl:apply-templates select="link"/>
	</xsl:template>
	
	
	<xsl:template match="link">
	<xsl:if test="not(position()=last())">
		<li>
			<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@source"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
			</a>
		</li>
	</xsl:if>
	</xsl:template>
	
	<xsl:template match="person">
		<xsl:apply-templates select="image"/>
		<h3>
			<xsl:value-of select="name"/> <xsl:text> </xsl:text>  <xsl:value-of select="surname"/> <br/>
		</h3>
			<xsl:text>Date of birth: </xsl:text> <xsl:value-of select="birth"/> <br/>
			
			<xsl:if test="@alive='no'">
				<xsl:text>Date of death: </xsl:text> <xsl:value-of select="death"/>
			</xsl:if>
			
			<br/>
			<xsl:value-of select="about"/> 
			<br/>
			
			<h3>
			<xsl:text>Achievements: </xsl:text>
			</h3>
			
			<xsl:for-each select="achievementList/achievement">
				<xsl:sort select="title" order="ascending"/>
				<xsl:number value="position()" format="1."/>
				<xsl:value-of select="."/> <br/>
			</xsl:for-each>
			
			<br/>
			<li>
				<a>
				<xsl:attribute name="href">
					<xsl:value-of select="@source"/>
				</xsl:attribute>
				<xsl:value-of select="link"/>
				</a>
			</li>
			<br/>
	</xsl:template>
	
	
	<xsl:template match="image">
		<img class="right" alt=".">
			<xsl:attribute name="src">
				<xsl:value-of select="@source"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</img>
	</xsl:template>
	
</xsl:stylesheet>
