<?xml version="1.0" encoding="UTF-8"?>
<!-- Version1.0.8 Release2015.09.02 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8" />

<xsl:strip-space elements="table tr td program"/>

<xsl:template match="html | Smacs">
	<html>
		<xsl:apply-templates />
	</html>
</xsl:template>


<xsl:template match="svccatg">
	<head>
		<meta>
			<xsl:attribute name="date"><xsl:value-of select="@Sakuseibi"/></xsl:attribute>
			<xsl:attribute name="modelname"><xsl:value-of select="@Modelnbr"/></xsl:attribute>
			<xsl:attribute name="booktype"></xsl:attribute>
			<xsl:attribute name="lang"></xsl:attribute>
			<xsl:attribute name="destination"></xsl:attribute>
		</meta>
	</head>
	<body>
		<section>
			<xsl:apply-templates />
		</section>
	</body>
</xsl:template>

<xsl:template match="def">
	<xsl:apply-templates />
</xsl:template>


<xsl:template match="ManualText">
	<head>
		<meta>
			<xsl:attribute name="date"><xsl:value-of select="@Sakuseibi"/></xsl:attribute>
			<xsl:attribute name="modelname"><xsl:value-of select="Head/Modellist/Models /Modelnbr"/></xsl:attribute>
			<xsl:attribute name="booktype"></xsl:attribute>
			<xsl:attribute name="lang"></xsl:attribute>
			<xsl:attribute name="destination"></xsl:attribute>
		</meta>
	</head>
	<body>
		<section>
			<group>
				<title><xsl:value-of select="Head/Htitle"/></title>
				<section>
					<group>
						<title><xsl:value-of select="Head/Header"/></title>
						<xsl:apply-templates select="Header1"/>
					</group>
				</section>
			</group>
		</section>
	</body>
</xsl:template>

<xsl:template match="head">
	<head>
		<xsl:apply-templates />
	</head>
</xsl:template>

<xsl:template match="meta">
	<meta>
		<xsl:attribute name="folder"><xsl:value-of select="@folder" /></xsl:attribute>
		<xsl:attribute name="section_id"><xsl:value-of select="@section_id" /></xsl:attribute>
		<xsl:attribute name="date"><xsl:value-of select="@date" /></xsl:attribute>
		<xsl:attribute name="lang"><xsl:value-of select="@lang" /></xsl:attribute>
		<xsl:attribute name="destination"><xsl:value-of select="@destination" /></xsl:attribute>
		<xsl:attribute name="revision"><xsl:value-of select="@revision" /></xsl:attribute>
		<xsl:attribute name="bookid"><xsl:value-of select="@bookid" /></xsl:attribute>
		<xsl:attribute name="booktype"><xsl:value-of select="@booktype" /></xsl:attribute>
		<xsl:attribute name="modelname"><xsl:value-of select="@modelname" /></xsl:attribute>
		<xsl:attribute name="serialnbr"><xsl:value-of select="@serialnbr" /></xsl:attribute>
		<xsl:attribute name="backcoverdate"><xsl:value-of select="@backcoverdate" /></xsl:attribute>
	</meta>
</xsl:template>

<xsl:template match="body">
	<body>
		<xsl:apply-templates />
	</body>
</xsl:template>

<xsl:template match="section">
	<section>
		<xsl:if test="@type">
			<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates />
	</section>
</xsl:template>

<xsl:template match="Header1 | Header2 | Header3 | Header4 | Header5 | Header6">
	<section>
		<!--xsl:if test="@Tnumtype = 'Number'"><xsl:attribute name="type">number</xsl:attribute></xsl:if-->
		<xsl:apply-templates />
	</section>
</xsl:template>

<xsl:template match="component">
	<group>
		<xsl:if test="not(compdesc)"><title /></xsl:if>
		<xsl:apply-templates select="*[not(self::servinfo)]" />
		<xsl:if test="servinfo">
			<section>
				<xsl:apply-templates select="servinfo" />
			</section>
		</xsl:if>
	</group>
</xsl:template>

<xsl:template match="servinfo">
	<group>
		<xsl:if test="not(title)"><title /></xsl:if>
		<xsl:apply-templates select="*[not(self::servinfosub)]" />
		<xsl:if test="servinfosub">
			<section>
				<xsl:apply-templates select="servinfosub" />
			</section>
		</xsl:if>
	</group>
</xsl:template>

<xsl:template match="servinfosub">
	<group>
		<xsl:if test="not(title)"><title /></xsl:if>
		<xsl:apply-templates select="*[not(self::topic | self::deflist)]" />
		<xsl:if test="topic or deflist">
			<section>
				<xsl:apply-templates select="topic | deflist" />
			</section>
		</xsl:if>
	</group>
</xsl:template>

<xsl:template match="deflist">
	<group>
		<!--xsl:if test="not(title)"><title /></xsl:if-->
		<xsl:if test="not(descendant::term)"><title /></xsl:if>
		<xsl:apply-templates />
	</group>
</xsl:template>

<xsl:template match="topic">
	<group>
		<xsl:if test="not(title)"><title /></xsl:if>
		<xsl:apply-templates />
	</group>
</xsl:template>

<xsl:template match="group">
	<group>
		<xsl:if test="@introduction">
			<xsl:attribute name="introduction"><xsl:value-of select="@introduction" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@section_id">
			<xsl:attribute name="section_id"><xsl:value-of select="@section_id" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@columnsetting">
			<xsl:attribute name="columnsetting"><xsl:value-of select="@columnsetting" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@issued">
			<xsl:attribute name="issued"><xsl:value-of select="@issued" /></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates />
	</group>
</xsl:template>

<xsl:template match="Hhead">
	<!--xsl:if test="@Page">
	<pagectrl type="page"/>
	</xsl:if-->
	<group>
		<!--xsl:if test="@Serial"><xsl:attribute name="ref-id"><xsl:value-of select="@Serial"/></xsl:attribute></xsl:if-->
		<title><xsl:if test="@refid"><xsl:attribute name="id"><xsl:value-of select="@refid"/></xsl:attribute></xsl:if><xsl:value-of select="Htxt1 | Htxt2 | Htxt3 | Htxt"/></title>
		<xsl:apply-templates />
	</group>
</xsl:template>

<xsl:template match="compdesc | title | term">
	<xsl:if test="not(parent::table)">
		<title>
			<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
			<xsl:if test="@key"><xsl:attribute name="key"><xsl:value-of select="@key" /></xsl:attribute></xsl:if>
			<xsl:apply-templates/>
		</title>
	</xsl:if>
	<xsl:if test="parent::table or parent::tgroup">
		<tabletitle><xsl:apply-templates /></tabletitle>
	</xsl:if>
</xsl:template>

<xsl:template match="Hhead/Htxt1 | Hhead/Htxt2 | Hhead/Htxt">
	<!--xsl:if test="@Page">
		<pagectrl type="page"/>
	</xsl:if-->
</xsl:template>

<xsl:template match="dl">
	<xsl:if test="ancestor::dl[not(ancestor::group)]">
		<xsl:message terminate="yes">
			<xsl:text>dlのかけ方がおかしい箇所があります、構造をよく確認下さい。</xsl:text>
		</xsl:message>
	</xsl:if>
	<dl>
		<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
		<xsl:apply-templates />
	</dl>
</xsl:template>

<xsl:template match="dd">
	<dd>
		<xsl:apply-templates />
	</dd>
</xsl:template>

<xsl:template match="dt">
	<dt>
		<xsl:apply-templates />
	</dt>
</xsl:template>

<xsl:template match="Tyuki">
	<dl type="note">
		<xsl:apply-templates select="*[not(child::*[self::Tyuki1])]" />
		<xsl:if test="child::*[self::Tyuki1]">
			<dd>
				<ol>
					<li><xsl:apply-templates select="Tyuki1" /></li>
				</ol>
			</dd>
		</xsl:if>
	</dl>
</xsl:template>

<xsl:template match="TyukiB">
	<dt><xsl:apply-templates /></dt>
</xsl:template>

<xsl:template match="Tyuki1 | Tyuki1/Ptxt">
	<p><xsl:apply-templates select="*[not(child::*[self::Tyuki2])]" /></p>
	<xsl:if test="child::*[self::Tyuki2]">
		<ol>
			<li><xsl:apply-templates select="Tyuki2" /></li>
		</ol>
	</xsl:if>
</xsl:template>

<xsl:template match="Tyuki2 | Tyuki2/Ptxt">
	<p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="ref">
	<a>
		<xsl:if test="@refid"><xsl:attribute name="id"><xsl:value-of select="@refid"/></xsl:attribute></xsl:if>
		<xsl:if test="@srcfile"><xsl:attribute name="srcfile"><xsl:value-of select="@srcfile"/></xsl:attribute></xsl:if>
		<xsl:if test="@format"><xsl:attribute name="format"><xsl:value-of select="@format"/></xsl:attribute></xsl:if>
	</a>
</xsl:template>

<xsl:template match="div">
	<xsl:if test="child::*">
		<div>
			<!--xsl:for-each select="@*">
				<xsl:if test="@span">
					<xsl:attribute name="span"><xsl:value-of select="@span" /></xsl:attribute>
				</xsl:if>
				<xsl:if test="not(@span)">
					<xsl:attribute name="{@*}"><xsl:value-of select="{@*}" /></xsl:attribute>
				</xsl:if>
			</xsl:for-each-->
			<xsl:if test="@span">
				<xsl:attribute name="span"><xsl:value-of select="@span" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@JPN">
				<xsl:attribute name="JPN"><xsl:value-of select="@JPN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@EXP">
				<xsl:attribute name="EXP"><xsl:value-of select="@EXP" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@CE">
				<xsl:attribute name="CE"><xsl:value-of select="@CE" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@EU">
				<xsl:attribute name="EU"><xsl:value-of select="@EU" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@LX">
				<xsl:attribute name="LX"><xsl:value-of select="@LX" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@NA">
				<xsl:attribute name="NA"><xsl:value-of select="@NA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@CHN">
				<xsl:attribute name="CHN"><xsl:value-of select="@CHN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@DEU">
				<xsl:attribute name="DEU"><xsl:value-of select="@DEU" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@ESP">
				<xsl:attribute name="ESP"><xsl:value-of select="@ESP" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@FRA">
				<xsl:attribute name="FRA"><xsl:value-of select="@FRA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@GBR">
				<xsl:attribute name="GBR"><xsl:value-of select="@GBR" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@HAN">
				<xsl:attribute name="HAN"><xsl:value-of select="@HAN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@ITA">
				<xsl:attribute name="ITA"><xsl:value-of select="@ITA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@USA">
				<xsl:attribute name="USA"><xsl:value-of select="@USA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@UK">
				<xsl:attribute name="UK"><xsl:value-of select="@UK" /></xsl:attribute>
			</xsl:if>
			<!--xsl:if test="@HANTA">
				<xsl:attribute name="HANTA"><xsl:value-of select="@HANTA" /></xsl:attribute>
			</xsl:if-->
			<xsl:if test="@AU">
				<xsl:attribute name="AU"><xsl:value-of select="@AU" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@CN">
				<xsl:attribute name="CN"><xsl:value-of select="@CN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@TUR">
				<xsl:attribute name="TUR"><xsl:value-of select="@TUR" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@CC">
				<xsl:attribute name="CC"><xsl:value-of select="@CC" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@AUS">
				<xsl:attribute name="AUS"><xsl:value-of select="@AUS" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@RUS">
				<xsl:attribute name="RUS"><xsl:value-of select="@RUS" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@POL">
				<xsl:attribute name="POL"><xsl:value-of select="@POL" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@THA">
				<xsl:attribute name="THA"><xsl:value-of select="@THA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@NZL">
				<xsl:attribute name="NZL"><xsl:value-of select="@NZL" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@TWN">
				<xsl:attribute name="TWN"><xsl:value-of select="@TWN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@IDN">
				<xsl:attribute name="IDN"><xsl:value-of select="@IDN" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@ASIA">
				<xsl:attribute name="ASIA"><xsl:value-of select="@ASIA" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@MYS">
				<xsl:attribute name="MYS"><xsl:value-of select="@MYS" /></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates />
		</div>
	</xsl:if>
</xsl:template>

<xsl:template match="figure | Figure">
	<figure>
		<!--xsl:apply-templates /-->
		<xsl:apply-templates select="*[not(self::callout)]" />
	</figure>
	<xsl:if test="callout or Nbr1">
		<p>名称</p>
		<xsl:if test="callout">
			<ol>
				<xsl:apply-templates select="callout/call" />
			</ol>
		</xsl:if>
		<xsl:if test="callout">
			<ol>
				<xsl:apply-templates select="callout/call" />
			</ol>
		</xsl:if>
	</xsl:if>
</xsl:template>

<xsl:template match="figuretitle | figure/title">
	<figuretitle>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</figuretitle>
</xsl:template>

<xsl:template match="graphic">
	<graphic>
		<!--xsl:copy-of select="." /-->
		<xsl:attribute name="file">
			<!--xsl:value-of select="@file"/-->
			<xsl:if test="contains(substring(@file,1,7), 'TextArt')"><xsl:value-of select="@file"/></xsl:if>
			<xsl:if test="not(contains(substring(@file,1,7), 'TextArt'))">
				<xsl:if test="contains(@file, 'TextArt')">
					<xsl:text>TextArt</xsl:text><xsl:value-of select="substring-after(@file, '/TextArt')"/>
				</xsl:if>
				<xsl:if test="not(contains(@file, 'TextArt'))">
					<xsl:value-of select="@file"/>
				</xsl:if>
			</xsl:if>
		</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<!--xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
		<xsl:attribute name="impsize"><xsl:value-of select="@impsize"/></xsl:attribute>
		<xsl:attribute name="impby"><xsl:value-of select="@impby"/></xsl:attribute>
		<xsl:attribute name="sideways"><xsl:value-of select="@sideways"/></xsl:attribute>
		<xsl:attribute name="impang"><xsl:value-of select="@impang"/></xsl:attribute>
		<xsl:attribute name="position"><xsl:value-of select="@position"/></xsl:attribute>
		<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		<xsl:attribute name="cropped"><xsl:value-of select="@cropped"/></xsl:attribute>
		<xsl:attribute name="float"><xsl:value-of select="@float"/></xsl:attribute-->
		<xsl:attribute name="width">
			<!--xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/-->
			<xsl:value-of select="@width"/>
		</xsl:attribute>
		<xsl:attribute name="height">
			<!--xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/-->
			<xsl:value-of select="@height"/>
		</xsl:attribute>
		<!--xsl:attribute name="angle"><xsl:value-of select="@angle"/></xsl:attribute>
		<xsl:attribute name="bloffset"><xsl:value-of select="@bloffset"/></xsl:attribute>
		<xsl:attribute name="nsoffset"><xsl:value-of select="@nsoffset"/></xsl:attribute-->
	</graphic>
</xsl:template>

<xsl:template match="Title">
	<title><xsl:apply-templates /></title>
</xsl:template>

<xsl:template match="Graphic">
	<graphic>
		<xsl:attribute name="file"><xsl:value-of select="@file"/></xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="position">below</xsl:attribute>
		<xsl:attribute name="align">acenter</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<xsl:apply-templates />
	</graphic>
</xsl:template>

<xsl:template match="Graphic2">
	<graphic>
		<xsl:attribute name="file"><xsl:value-of select="@file"/></xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="position">below</xsl:attribute>
		<xsl:attribute name="align">acenter</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<xsl:apply-templates />
	</graphic>
</xsl:template>

<xsl:template match="img">
	<img>
		<!--xsl:copy-of select="." /-->
		<xsl:attribute name="file">
			<!--xsl:value-of select="@file"/-->
			<xsl:if test="contains(substring(@file,1,7), 'TextArt')"><xsl:value-of select="@file"/></xsl:if>
			<xsl:if test="not(contains(substring(@file,1,7), 'TextArt'))">
				<xsl:if test="contains(@file, 'TextArt')">
					<xsl:text>TextArt</xsl:text><xsl:value-of select="substring-after(@file, '/TextArt')"/>
				</xsl:if>
				<xsl:if test="not(contains(@file, 'TextArt'))">
					<xsl:value-of select="@file"/>
				</xsl:if>
			</xsl:if>
		</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<!--xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
		<xsl:attribute name="impsize"><xsl:value-of select="@impsize"/></xsl:attribute>
		<xsl:attribute name="impby"><xsl:value-of select="@impby"/></xsl:attribute>
		<xsl:attribute name="sideways"><xsl:value-of select="@sideways"/></xsl:attribute>
		<xsl:attribute name="impang"><xsl:value-of select="@impang"/></xsl:attribute>
		<xsl:attribute name="position"><xsl:value-of select="@position"/></xsl:attribute>
		<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		<xsl:attribute name="cropped"><xsl:value-of select="@cropped"/></xsl:attribute>
		<xsl:attribute name="float"><xsl:value-of select="@float"/></xsl:attribute-->
		<xsl:attribute name="width">
			<!--xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/-->
			<xsl:value-of select="@width"/>
		</xsl:attribute>
		<xsl:attribute name="height">
			<!--xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/-->
			<xsl:value-of select="@height"/>
		</xsl:attribute>
		<xsl:attribute name="angle"><xsl:value-of select="@angle"/></xsl:attribute>
		<xsl:attribute name="bloffset"><xsl:value-of select="@bloffset"/></xsl:attribute>
		<xsl:attribute name="nsoffset"><xsl:value-of select="@nsoffset"/></xsl:attribute>
	</img>
</xsl:template>

<xsl:template match="Ptxt/Graphic">
	<img>
		<xsl:attribute name="file"><xsl:value-of select="@file"/></xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="position">inline</xsl:attribute>
		<xsl:attribute name="bloffset">0mm</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<xsl:apply-templates />
	</img>
</xsl:template>

<xsl:template match="Symbol | connectorillust/graphic">
	<img>
		<xsl:attribute name="file"><xsl:value-of select="@file"/></xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="format-number((substring-before(@width,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="format-number((substring-before(@height,'in') * 25.4),'#.000mm')"/></xsl:attribute>
		<xsl:attribute name="position">inline</xsl:attribute>
		<xsl:attribute name="bloffset">0mm</xsl:attribute>
		<xsl:attribute name="dpi"><xsl:value-of select="@dpi"/></xsl:attribute>
		<xsl:attribute name="rasterdpi"><xsl:value-of select="@rasterdpi"/></xsl:attribute>
		<xsl:attribute name="xoffset"><xsl:value-of select="@xoffset"/></xsl:attribute>
		<xsl:attribute name="yoffset"><xsl:value-of select="@yoffset"/></xsl:attribute>
		<xsl:apply-templates />
	</img>
</xsl:template>

<xsl:template match="ol">
	<ol>
		<xsl:if test="@type"><xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</ol>
</xsl:template>

<xsl:template match="ul">
	<ul>
		<xsl:if test="@type"><xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</ul>
</xsl:template>

<xsl:template match="List1 | List2 | List3 | List4 | List5 | BoxG1 | BoxG2 | BoxG3">
	<xsl:if test="@Enumtype = 'Number'">
		<ol>
			<xsl:apply-templates />
		</ol>
	</xsl:if>
	<xsl:if test="@Enumtype = 'Bullet'">
		<ul type="bullet">
			<xsl:apply-templates />
		</ul>
	</xsl:if>
	<xsl:if test="not(@Enumtype)">
		<ul type="none">
			<xsl:apply-templates />
		</ul>
	</xsl:if>
</xsl:template>

<xsl:template match="list1 | list2 | Nbr1 | s1">
	<xsl:if test="@enumtype='bullet'">
		<ul type="bullet">
			<xsl:apply-templates />
		</ul>
	</xsl:if>
	<xsl:if test="@enumtype='arabicnum'">
		<ol>
			<xsl:apply-templates />
		</ol>
	</xsl:if>
	<xsl:if test="not(@enumtype)">
		<ul type="none">
			<xsl:apply-templates />
		</ul>
	</xsl:if>
</xsl:template>

<xsl:template match="callout">
</xsl:template>

<xsl:template match="spec">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="call | item">
	<xsl:if test="self::call">
		<li>
			<p><xsl:apply-templates /></p>
		</li>
	</xsl:if>
	<xsl:if test="self::item">
		<li>
			<xsl:apply-templates />
		</li>
	</xsl:if>
</xsl:template>

<xsl:template match="li">
	<li>
		<xsl:apply-templates />
	</li>
</xsl:template>

<xsl:template match="Item">
	<li>
		<xsl:if test="@refid"><xsl:attribute name="id"><xsl:value-of select="@refid"/></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</li>
</xsl:template>

<xsl:template match="Info">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="p">
	<xsl:if test="not(parent::figuretitle)">
		<p><xsl:copy-of select="@*" /><xsl:apply-templates /></p>
	</xsl:if>
	<xsl:if test="parent::figuretitle">
		<p><xsl:choose><xsl:when test="text()='タイトル取得_***'"><xsl:value-of select="preceding::title[1]" />_0＜＜★★＞＞</xsl:when><xsl:otherwise><xsl:copy-of select="@*" /><xsl:apply-templates /></xsl:otherwise></xsl:choose></p>
	</xsl:if>
</xsl:template>

<xsl:template match="connectorcolor | connectorillust | connectorname | connectorno | para | paragroup | ptxt | question | spec | testspec">
	<xsl:if test="not(parent::s1)"><p><xsl:apply-templates /></p></xsl:if>
	<xsl:if test="parent::s1"><li><p><xsl:apply-templates select="text() | *[not(p)]" /></p></li></xsl:if>
</xsl:template>

<xsl:template match="Ptxt">
	<p><xsl:if test="@refid"><xsl:attribute name="id"><xsl:value-of select="@refid"/></xsl:attribute></xsl:if><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="diag/diagtable | table/tgroup | connectorlist | table[not(descendant::tgroup)]">
	<table>
		<xsl:choose>
			<xsl:when test="self::diagtable or self::tgroup or self::connectorlist">
				<xsl:attribute name="tabletype">
					<xsl:if test="@Hyotype='Translate'">parttable</xsl:if>
					<xsl:if test="(@Hyotype='all') or (@Hyotype='FrameAll') or (@Hyotype='All')">all</xsl:if>
					<xsl:if test="not(@Hyotype)">all</xsl:if>
				</xsl:attribute>
				<xsl:attribute name="format">
					<xsl:if test="@Hyotype='Translate'">parttable</xsl:if>
					<xsl:if test="(@Hyotype='all') or (@Hyotype='FrameAll') or (@Hyotype='All')">all</xsl:if>
					<xsl:if test="not(@Hyotype)">all</xsl:if>
				</xsl:attribute>
				<xsl:attribute name="width"><xsl:value-of select="@width | @widths | tgroup/@widths | tgroup/@width" /></xsl:attribute>
				<xsl:attribute name="cols">
					<xsl:if test="@cols"><xsl:value-of select="@cols | tgroup/@cols" /></xsl:if>
					<xsl:if test="not(@cols)">
						<xsl:if test="not(self::diagtable)"><xsl:value-of select="count(child::*[self::*])" /></xsl:if>
						<xsl:if test="self::diagtable"><xsl:value-of select="count(diaghead/*/*)" /></xsl:if>
					</xsl:if>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@cols"><xsl:attribute name="cols"><xsl:value-of select="@cols" /></xsl:attribute></xsl:if>
				<xsl:if test="@width"><xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute></xsl:if>
				<xsl:if test="@format"><xsl:attribute name="format"><xsl:value-of select="@format" /></xsl:attribute></xsl:if>
				<xsl:if test="@tabletype"><xsl:attribute name="tabletype"><xsl:value-of select="@tabletype" /></xsl:attribute></xsl:if>
				<xsl:if test="@fontsize"><xsl:attribute name="fontsize"><xsl:value-of select="@fontsize" /></xsl:attribute></xsl:if>
				<xsl:if test="@align"><xsl:attribute name="align"><xsl:value-of select="@align" /></xsl:attribute></xsl:if>
				<xsl:if test="@position"><xsl:attribute name="position"><xsl:value-of select="@position" /></xsl:attribute></xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates />
	</table>
</xsl:template>

<xsl:template match="Table">
	<table>
		<xsl:if test="@Hyotype = 'All'"><xsl:attribute name="tabletype">all</xsl:attribute></xsl:if>
		<xsl:if test="Tgroup/@format = 'FrameAll'"><xsl:attribute name="format">all</xsl:attribute></xsl:if>
		<xsl:if test="@Hyotype = 'None'"><xsl:attribute name="tabletype">none</xsl:attribute></xsl:if>
		<xsl:if test="Tgroup/@format = 'FrameNone'"><xsl:attribute name="format">none</xsl:attribute></xsl:if>
		<xsl:if test="@Hyotype = 'Translate'"><xsl:attribute name="tabletype">parttable</xsl:attribute></xsl:if>
		<xsl:if test="Tgroup/@format = 'Hyo'"><xsl:attribute name="format">parttable</xsl:attribute></xsl:if>
		<!--xsl:attribute name="format"><xsl:value-of select="Tgroup/@frame"/></xsl:attribute-->
		<xsl:if test="Tgroup/@cols"><xsl:attribute name="cols"><xsl:value-of select="Tgroup/@cols"/></xsl:attribute></xsl:if>
		<xsl:if test="Tgroup/@widths"><xsl:attribute name="width"><xsl:value-of select="Tgroup/@widths"/></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</table>
</xsl:template>

<xsl:template match="tgroup | table/title">
</xsl:template>

<xsl:template match="tabletitle">
	<table>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</table>
</xsl:template>

<xsl:template match="thead | Tgroup/Thead | tgroup/thead | condhead | diaghead">
	<thead>
		<xsl:apply-templates />
	</thead>
</xsl:template>

<xsl:template match="tbody | Tgroup/Tbody | tgroup/tbody | contbody | diagbody">
	<tbody>
		<xsl:apply-templates />
	</tbody>
</xsl:template>

<xsl:template match="tr | Row | row | connector | diagcondgrp | diagheadrow | condheadrow | diagtestgrp">
	<tr>
		<xsl:apply-templates />
	</tr>
</xsl:template>

<xsl:template match="td | Entry | entry | testaction | connectornumber/connectorno | connectordace">
	<td>
		<xsl:if test="@hspan"><xsl:attribute name="hspan"><xsl:value-of select="@hspan" /></xsl:attribute></xsl:if>
		<xsl:if test="@vspan"><xsl:attribute name="vspan"><xsl:value-of select="@vspan" /></xsl:attribute></xsl:if>
		<xsl:if test="@rbdr"><!--xsl:attribute name="rbdr"><xsl:value-of select="@rbdr" /></xsl:attribute--></xsl:if>
		<xsl:if test="@cbdr"><!--xsl:attribute name="cbdr"><xsl:value-of select="@cbdr" /></xsl:attribute--></xsl:if>
		<xsl:if test="@rotate"><xsl:attribute name="rotate"><xsl:value-of select="@rotate" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</td>
</xsl:template>

<xsl:template match="td/text()">
	<p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="tabletitle">
	<tabletitle>
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:apply-templates />
	</tabletitle>
</xsl:template>

<xsl:template match="newline">
	<xsl:copy-of select="." />
</xsl:template>

<xsl:template match="revision">
	<revision>
		<xsl:if test="@date"><xsl:attribute name="date"><xsl:value-of select="@date" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</revision>
</xsl:template>

<xsl:template match="a | ref">
	<refer>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
		<xsl:if test="@srcfile">
			<xsl:attribute name="id"><xsl:value-of select="substring-after(@srcfile,'#')" /></xsl:attribute>
			<xsl:variable name="pass">
				<xsl:choose>
					<xsl:when test="contains(@srcfile,'../')"><xsl:value-of select="substring-after(substring-before(@srcfile,'#'),'../')" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="substring-before(@srcfile,'#')" /></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="contains($pass,'/')">
					<xsl:attribute name="object"><xsl:value-of select="substring-after($pass,'/')" /></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="object"><xsl:value-of select="$pass" /></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<!--xsl:attribute name="object"><xsl:value-of select="substring-before(@srcfile,'#')" /></xsl:attribute-->
		</xsl:if>
		<xsl:attribute name="format"><xsl:value-of select="@format" /></xsl:attribute>
		<xsl:apply-templates />
	</refer>
</xsl:template>

<xsl:template match="refer">
	<refer>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
		<xsl:if test="@object">
			<xsl:variable name="pass">
				<xsl:choose>
					<xsl:when test="contains(@object,'../')"><xsl:value-of select="substring-after(@object,'../')" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="@object" /></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="contains($pass,'/')">
					<xsl:attribute name="object"><xsl:value-of select="substring-after($pass,'/')" /></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="object"><xsl:value-of select="$pass" /></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!--xsl:if test="@object"><xsl:attribute name="object"><xsl:value-of select="@object" /></xsl:attribute></xsl:if-->
		<xsl:if test="@format"><xsl:attribute name="format"><xsl:value-of select="@format" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</refer>
</xsl:template>

<xsl:template match="b | Bold">
	<b>
		<xsl:apply-templates />
	</b>
</xsl:template>

<xsl:template match="Btxt">
	<p><b><xsl:apply-templates /></b></p>
</xsl:template>

<xsl:template match="cite">
	<cite>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</cite>
</xsl:template>

<xsl:template match="Itaric">
	<xsl:value-of select="." />
</xsl:template>

<xsl:template match="Important">
	<xsl:value-of select="." />
</xsl:template>

<xsl:template match="pmlink">
	<pmlink>
		<xsl:apply-templates />
	</pmlink>
</xsl:template>

<xsl:template match="emph | Bold | Reference1 | Reference2 | Reference3">
	<xsl:if test="self::emph or self::Bold">
		<b><xsl:apply-templates /></b>
	</xsl:if>
	<xsl:if test="self::Reference1 or self::Reference2 or self::Reference3"></xsl:if>
</xsl:template>

<xsl:template match="small | Sub | Small | sub">
	<small>
		<xsl:apply-templates />
	</small>
</xsl:template>

<xsl:template match="sup | Sup">
	<sup>
		<xsl:apply-templates />
	</sup>
</xsl:template>

<xsl:template match="ins">
	<ins>
		<xsl:if test="@datetime"><xsl:attribute name="datetime"><xsl:value-of select="@datetime" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</ins>
</xsl:template>

<xsl:template match="del">
	<del>
		<xsl:if test="@datetime"><xsl:attribute name="datetime"><xsl:value-of select="@datetime" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</del>
</xsl:template>

<xsl:template match="footnote">
	<footnote>
		<xsl:apply-templates />
	</footnote>
</xsl:template>

<xsl:template match="index">
	<index>
		<xsl:if test="@key"><xsl:attribute name="key"><xsl:value-of select="@key" /></xsl:attribute></xsl:if>
		<xsl:if test="@keyword"><xsl:attribute name="keyword"><xsl:value-of select="@keyword" /></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</index>
</xsl:template>

<xsl:template match="float">
	<float>
		<xsl:apply-templates />
	</float>
</xsl:template>

<xsl:template match="left">
	<left>
		<xsl:apply-templates />
	</left>
</xsl:template>

<xsl:template match="right">
	<right>
		<xsl:apply-templates />
	</right>
</xsl:template>

<xsl:template match="frlink">
	<frlink>
		<xsl:apply-templates />
	</frlink>
</xsl:template>

<!--xsl:template match="resultyes | resultno">
</xsl:template-->

<xsl:template match="diagstep | dlabel1 | dlabel2 | dlabel3 | dlabel4 | dlabel5 | clabel1 | clabel2 | testvalue | testyes | testno">
	<td>
		<xsl:if test="@vspan"><xsl:attribute name="vspan"><xsl:value-of select="@vspan"/></xsl:attribute></xsl:if>
		<xsl:if test="@hspan"><xsl:attribute name="hspan"><xsl:value-of select="@hspan"/></xsl:attribute></xsl:if>
		<xsl:if test="@cbdr"><xsl:attribute name="cbdr"><xsl:value-of select="@cbdr"/></xsl:attribute></xsl:if>
		<xsl:if test="@rbdr"><xsl:attribute name="rbdr"><xsl:value-of select="@rbdr"/></xsl:attribute></xsl:if>
		<p>
			<xsl:if test="self::diagstep"><xsl:value-of select="position()" /></xsl:if>
			<xsl:if test="self::dlabel1">ステップ</xsl:if>
			<xsl:if test="self::dlabel2">アクション</xsl:if>
			<xsl:if test="self::dlabel3">基準値</xsl:if>
			<xsl:if test="self::dlabel4">はい</xsl:if>
			<xsl:if test="self::dlabel5">いいえ</xsl:if>
			<xsl:if test="self::testvalue">
				<xsl:if test="text() or child::*"><xsl:apply-templates /></xsl:if>
				<xsl:if test="not(text() or child::*)">-</xsl:if>
			</xsl:if>
			<xsl:if test="self::testyes">
				<xsl:if test="child::resultyes"><xsl:apply-templates /></xsl:if>
				<xsl:if test="not(child::resultyes)">-</xsl:if>
			</xsl:if>
			<xsl:if test="self::testno">
				<xsl:if test="child::resultno"><xsl:apply-templates /></xsl:if>
				<xsl:if test="not(child::resultno)">-</xsl:if>
			</xsl:if>
			<xsl:if test="self::clabel1">No.</xsl:if>
			<xsl:if test="self::clabel2">コネクタフェース</xsl:if>
		</p>
	</td>
</xsl:template>

<xsl:template match="attention2 | attention3 | attention4 | attention5">
	<dl>
		<xsl:attribute name="type">
			<xsl:if test="self::attention2">warning</xsl:if>
			<xsl:if test="self::attention3">caution</xsl:if>
			<xsl:if test="self::attention4">important</xsl:if>
			<xsl:if test="self::attention5">note</xsl:if>
		</xsl:attribute>
		<dd>
			<xsl:apply-templates />
		</dd>
	</dl>
</xsl:template>

</xsl:stylesheet>