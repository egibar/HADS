<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
   <html>
     <body>
        <h2> Lista de tareas de la asignatura selecionada</h2>
        <table border="2">
         <tr bgcolor="#9acd32">
            <th>Código</th>
            <th>Descripción</th>
            <th>Horas Estimadas</th>
         </tr>
          
        <xsl:for-each select="tareas/tarea">
           <xsl:sort select="codigo"/>
            <tr>
              <td>
                <xsl:value-of select="codigo"/>
              </td>
              <td>
                <xsl:value-of select="descripcion"/>
              </td>
              <td>
                <xsl:value-of select="hestimadas"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet> 

