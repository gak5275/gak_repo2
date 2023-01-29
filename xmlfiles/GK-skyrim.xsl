<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="GK-skyrim.css" />
                <xsl:apply-templates/>
            </head>
            <body>
                <xsl:apply-templates select="descendant::body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    
    <xsl:template match="QuestItem">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="character[@ref='UrielSeptim']">
        <span class="UrielSeptim">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character[@ref='hero']">
        <span class="hero">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character[@ref='Jauffre']">
        <span class="Jauffre">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character[@ref='MartinSeptim']">
        <span class="MartinSeptim">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character[@ref='MehrunesDagon']">
        <span class="MehrunesDagon">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character[@ref='MankarCamoran']">
        <span class="MankarCamoran">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="epithet">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="faction[@ref='MythicDawn']">
        <span class="MythicDawn">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction[@ref='blades']">
        <span class="blades">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction[@ref='daedra']">
        <span class="daedra">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction[@ref='empire']">
        <span class="empire">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction[@ref='DarkBrotherhood']">
        <span class="DarkBrotherhood">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="location">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
</xsl:stylesheet>