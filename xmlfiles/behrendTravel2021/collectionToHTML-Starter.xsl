<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>

    <!-- ebb: This XSLT reads a collection of XML files and outputs a single HTML document assembling all
        the files into one HTML page. 
       
        Below is an xsl:variable set to store a collection of XML documents (stored in our file directory
    named xml-letters. We need to ignore everything except the XML files in that directory (so XSLT doesn't try to
    process the Relax NG schema), so the ?select="*.xml" selects only the XML files in the collection. -->

    <xsl:variable name="travelColl" as="document-node()+"
        select="collection('xml-letters/?select=*.xml')"/>

    <xsl:template match="/"><!-- ebb: Set up the XSLT to run against any single XML file, so this 
    tmemplate has a document node to match on-->
        <html>
            <head>
                <title>Behrend Travel Letters</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <!--ebb: The line above helps your HTML scale to fit lots of different devices. -->
                <link rel="stylesheet" type="text/css" href="GK-behrendTravel.css"/>
            </head>
            <body>
                <h1>Behrend's Travel Adventures in France</h1>
                <section id="toc">
                    <h2>Contents</h2>
                    <table>
                        <tr>
                            <th>Letter Date</th><!--first column table heading-->
                            <th>People Mentioned</th><!--second column table heading-->
                            <th>Places Mentioned</th><!--third column table heading-->
                        </tr>
                        
                        <!--ebb: Here we use our $travelColl variable pointing into the collection, and we set up our modal XSLT. -->
                        <xsl:apply-templates select="$travelColl//letter" mode="toc">
                            <xsl:sort select="(descendant::date)[1]/@when ! xs:date(.)"/>
                        </xsl:apply-templates>
                        
                    </table>
                </section>

                <section id="fulltext">
                   <!--ebb: Look! no @mode in this xsl:apply-templates. -->
                    <xsl:apply-templates select="$travelColl//letter">
                        <xsl:sort select="(descendant::date)[1]/@when ! xs:date(.)"/>
                    </xsl:apply-templates>
                </section>
            </body>
        </html>
    </xsl:template>
    
    <!-- ************************************************* -->
    <!-- ebb: TOC mode templates for the table of contents -->
    <!-- ************************************************* -->
   
   <xsl:template match="letter" mode="toc">
       <tr>
           <td>
               <p>
                   <span class="date">
                       <a href="#{@xml:id}"><xsl:apply-templates select="@xml:id"/></a>
                   </span>
               </p>
           </td><!--first column data cell: to hold the date of the letter-->
           <td>
               <p>
                   <span class="people">
                       <xsl:value-of select="descendant::persName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
                   </span>
               </p>
           </td><!--second column data cell: to hold a sorted, string-joined list of persons mentioned. -->
           <td>
               <p>
                   <span class="places">
                       <xsl:value-of select="descendant::placeName ! normalize-space() => distinct-values() => sort() => string-join(', ')"/>
                   </span>
               </p>
           </td><!--third column data cell: to hold a sorted, string-joined list of places mentioned.-->
           
       </tr>
   </xsl:template>

    <!-- ************************************************* -->
    <!-- ebb: templates for outputting the text of the letters -->
    <!-- ************************************************* -->
    
    <xsl:template match="letter">
        <div id="{@xml:id}">
            <xsl:apply-templates/>
        </div>        
    </xsl:template>
    
    <xsl:template match="dateLine">
        <dateLine>
            <xsl:apply-templates/>
        </dateLine>        
    </xsl:template>
    
    <xsl:template match="hand">
        <hand>
            <xsl:apply-templates/>
        </hand>        
    </xsl:template>
    
    <xsl:template match="intro">
        <intro>
            <xsl:apply-templates/>
        </intro>        
    </xsl:template>
    
    <xsl:template match="note">
        <note>
            <xsl:apply-templates/>
        </note>        
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>        
    </xsl:template>

    <xsl:template match="date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="persName">
        <span class="people">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="placeName">
        <span class="places">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

</xsl:stylesheet>