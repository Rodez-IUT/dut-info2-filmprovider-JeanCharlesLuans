<?xml version="1.0" encoding="UTF-8"  ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
     <html>
        <head>
            <meta charset="UTF-8" />
            <title> FILMS </title>
        </head>

         <body>
             <h1> Titre </h1>
             <table>
             <thead>
                 <tr>
                     <th>Titre</th><th>Résumé</th><th>Nom réalisateur</th><th>Prenom réalisateur</th>
                 </tr>
             </thead>

             <tbody>
             <xsl:for-each select="/films/film">
                <tr>
                    <td><xsl:value-of select="titre"/></td>
                    <td><xsl:value-of select="resume"/></td>
                    
                    <xsl:variable name="idReal" select="@id_realisateur"/>
                    <td><xsl:value-of select="/films/realisateur[@id_realisateur=$idReal]/nom"/></td>
                    <td><xsl:value-of select="/films/realisateur[@id_realisateur=$idReal]/prenom"/></td>
                </tr>
             </xsl:for-each>
             </tbody>

            </table>
         </body>
     </html>
    </xsl:template>
</xsl:stylesheet>