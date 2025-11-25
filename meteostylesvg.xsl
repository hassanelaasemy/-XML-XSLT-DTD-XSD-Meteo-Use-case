<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
      <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000">
              <line x1="100" y1="100" x2="100" y2="600" stroke-width="2" stroke="black"></line>
          <line x1="100" y1="600" x2="1000" y2="600" stroke-width="2" stroke="black"></line>
          <xsl:for-each select="meteo/mesure[@date='2006-01-01']/ville">
              <xsl:variable name="pos" select="position()*110"/>
              <xsl:variable name="temp" select="@temperature*10"/>
              <text stroke="blue"  x="{$pos}" y="620"><xsl:value-of select="@nom"/></text>
              <rect width="20" height="{$temp}" x="{$pos}" y="{600-$temp}" stroke="black" fill="orange">
                  <animate 
                      attributeName="height" 
                      dur="3s" 
                      repeatCount="indefinite"
                      values="0;{$temp};0"
                      >
                  </animate>
                  <animate 
                      attributeName="y" 
                      dur="3s" 
                      repeatCount="indefinite" 
                      values="600;{600-$temp};600">
                  </animate>
              </rect>
              <text x="{$pos}" y="{600-$temp -10}" stroke="black"><xsl:value-of select="@temperature"/></text>
              </xsl:for-each>
      </svg>
    </xsl:template>
</xsl:stylesheet>