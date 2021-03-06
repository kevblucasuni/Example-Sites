<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="/_cascade/formats/xslt/_common"/>
    <xsl:include href="site://_Common Resources/formats/xslt/format-date"/>
    <xsl:template match="/system-index-block/calling-page/system-page">
        <xsl:variable name="noIndex" select="system-data-structure/block/content/system-index-block//system-folder[not(system-page[name='index'])]"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="title"/>
                </h1>
                <p>
                    <xsl:text>Folders without a page named 'index': </xsl:text>
                    <xsl:value-of select="count($noIndex)"/>
                </p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="count($noIndex) &gt; 0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-condensed" id="reportTable">
                                <thead>
                                    <tr>
                                        <th>Folder</th>
                                        <th class="col-xs-1 actions">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:apply-templates select="$noIndex"/>
                                </tbody>
                            </table>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Nothing to show here. No directories without a page named 'index' were found.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-folder">
        <tr>
            <td>
                <a href="{link}">
                    <xsl:value-of select="path"/>
                </a>
            </td>
            <td>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">open</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">edit</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">publish</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>