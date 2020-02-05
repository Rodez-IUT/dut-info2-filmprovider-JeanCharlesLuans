<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/films">
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Film Provider</title>
            </head>
            <body>
                <h1>Liste des films</h1>

                <xsl:apply-templates select="film">
                    <xsl:sort select="@annee"/>
                </xsl:apply-templates>


            </body>
        </html>

    </xsl:template>

    <xsl:template match="film">
        <table width="60%">
            <tr>
                <xsl:variable name="idReal" select="@id_realisateur"/>
                <xsl:variable name="nomReal" select="/films/realisateur[@id_realisateur = $idReal]/nom"/>
                <xsl:variable name="prenomReal" select="/films/realisateur[@id_realisateur = $idReal]/prenom"/>
                <td colspan="2">
                    <b> <xsl:value-of select="titre"/> </b>
                    <i> ( <xsl:value-of select="$nomReal"/> , <xsl:value-of select="$prenomReal"/> )</i>
                </td>
            </tr>

            <tr>
                <xsl:variable name="srcImage" select="resume/image/@source" />

                    <xsl:if test="resume/image=true()">
                        <td><img src="{$srcImage}"/></td>
                        <td><xsl:value-of select="resume"/></td>
                    </xsl:if>

                    <xsl:if test="resume/image=false()">
                        <td colspan="2"><xsl:value-of select="resume"/></td>
                    </xsl:if>


            </tr>

        </table>
        <hr/>
    </xsl:template>

</xsl:stylesheet>