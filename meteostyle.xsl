<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meteo</title>
            </head>
            <body>
                <xsl:for-each select="meteo/mesure[@date='2006-01-01']">
                    <ul>
                        <li>Date mesure : <xsl:value-of select="@date"/></li>
                    </ul>
                    <table width="90%" border="1">
                        <tr>
                            <th>Ville</th>
                            <th>Températeur</th>
                        </tr>
                        <xsl:for-each select="ville">
                            <tr>
                                <td><xsl:value-of select="@nom"/></td>
                                <td><xsl:value-of select="@temperature"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <ul>
                        <li>Températeur Moyenne : <xsl:value-of select="avg(ville/@temperature)"/></li>
                        <li>Nombre De Villes : <xsl:value-of select="count(ville)"/></li>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>