<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DPL" />
        <signal name="DPH" />
        <signal name="XLXN_3" />
        <signal name="E" />
        <signal name="I8" />
        <signal name="I4" />
        <signal name="I2" />
        <signal name="I1" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="H0" />
        <signal name="H1" />
        <signal name="H2" />
        <signal name="H3" />
        <signal name="XLXN_18" />
        <signal name="DL(7:0)" />
        <signal name="DH(7:0)" />
        <port polarity="Input" name="DPL" />
        <port polarity="Input" name="DPH" />
        <port polarity="Input" name="E" />
        <port polarity="Input" name="I8" />
        <port polarity="Input" name="I4" />
        <port polarity="Input" name="I2" />
        <port polarity="Input" name="I1" />
        <port polarity="Output" name="DL(7:0)" />
        <port polarity="Output" name="DH(7:0)" />
        <blockdef name="bin2bcd">
            <timestamp>2015-3-23T17:57:43</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="bin2seg">
            <timestamp>2016-4-26T8:39:40</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="bin2bcd" name="XLXI_1">
            <blockpin signalname="I1" name="I1" />
            <blockpin signalname="I2" name="I2" />
            <blockpin signalname="I4" name="I4" />
            <blockpin signalname="I8" name="I8" />
            <blockpin signalname="H0" name="QH1" />
            <blockpin signalname="H1" name="QH2" />
            <blockpin signalname="H2" name="QH4" />
            <blockpin signalname="H3" name="QH8" />
            <blockpin signalname="XLXN_9" name="QL1" />
            <blockpin signalname="XLXN_10" name="QL2" />
            <blockpin signalname="XLXN_11" name="QL4" />
            <blockpin signalname="XLXN_12" name="QL8" />
        </block>
        <block symbolname="bin2seg" name="XLXI_2">
            <blockpin signalname="DPL" name="DP" />
            <blockpin signalname="E" name="E" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_10" name="I2" />
            <blockpin signalname="XLXN_11" name="I4" />
            <blockpin signalname="XLXN_12" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="DL(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="bin2seg" name="XLXI_3">
            <blockpin signalname="DPH" name="DP" />
            <blockpin signalname="XLXN_18" name="E" />
            <blockpin signalname="H0" name="I1" />
            <blockpin signalname="H1" name="I2" />
            <blockpin signalname="H2" name="I4" />
            <blockpin signalname="H3" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="DH(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="or4" name="XLXI_4">
            <blockpin signalname="H3" name="I0" />
            <blockpin signalname="H2" name="I1" />
            <blockpin signalname="H1" name="I2" />
            <blockpin signalname="H0" name="I3" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="E" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1120" y="1536" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2096" y="1152" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2096" y="1792" name="XLXI_3" orien="R0">
        </instance>
        <branch name="DPL">
            <wire x2="1840" y1="1728" y2="1728" x1="576" />
            <wire x2="2096" y1="1056" y2="1056" x1="1840" />
            <wire x2="1840" y1="1056" y2="1728" x1="1840" />
        </branch>
        <branch name="DPH">
            <wire x2="1936" y1="1776" y2="1776" x1="576" />
            <wire x2="2096" y1="1696" y2="1696" x1="1936" />
            <wire x2="1936" y1="1696" y2="1776" x1="1936" />
        </branch>
        <instance x="1216" y="2176" name="XLXI_4" orien="R0" />
        <instance x="1616" y="2080" name="XLXI_5" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="1616" y1="2016" y2="2016" x1="1472" />
        </branch>
        <branch name="E">
            <wire x2="1552" y1="1824" y2="1824" x1="576" />
            <wire x2="1552" y1="1824" y2="1952" x1="1552" />
            <wire x2="1616" y1="1952" y2="1952" x1="1552" />
            <wire x2="1888" y1="1824" y2="1824" x1="1552" />
            <wire x2="2096" y1="1120" y2="1120" x1="1888" />
            <wire x2="1888" y1="1120" y2="1824" x1="1888" />
        </branch>
        <branch name="I8">
            <wire x2="1120" y1="1248" y2="1248" x1="592" />
        </branch>
        <branch name="I4">
            <wire x2="1120" y1="1184" y2="1184" x1="592" />
        </branch>
        <branch name="I2">
            <wire x2="1120" y1="1120" y2="1120" x1="592" />
        </branch>
        <branch name="I1">
            <wire x2="1120" y1="1056" y2="1056" x1="592" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1552" y1="1056" y2="1056" x1="1504" />
            <wire x2="1552" y1="800" y2="1056" x1="1552" />
            <wire x2="2096" y1="800" y2="800" x1="1552" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1584" y1="1120" y2="1120" x1="1504" />
            <wire x2="2096" y1="864" y2="864" x1="1584" />
            <wire x2="1584" y1="864" y2="1120" x1="1584" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1616" y1="1184" y2="1184" x1="1504" />
            <wire x2="1616" y1="928" y2="1184" x1="1616" />
            <wire x2="2096" y1="928" y2="928" x1="1616" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1648" y1="1248" y2="1248" x1="1504" />
            <wire x2="1648" y1="992" y2="1248" x1="1648" />
            <wire x2="2096" y1="992" y2="992" x1="1648" />
        </branch>
        <branch name="H0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1584" y="1312" type="branch" />
            <wire x2="1584" y1="1312" y2="1312" x1="1504" />
            <wire x2="2048" y1="1312" y2="1312" x1="1584" />
            <wire x2="2048" y1="1312" y2="1440" x1="2048" />
            <wire x2="2096" y1="1440" y2="1440" x1="2048" />
        </branch>
        <branch name="H1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1584" y="1376" type="branch" />
            <wire x2="1584" y1="1376" y2="1376" x1="1504" />
            <wire x2="2016" y1="1376" y2="1376" x1="1584" />
            <wire x2="2016" y1="1376" y2="1504" x1="2016" />
            <wire x2="2096" y1="1504" y2="1504" x1="2016" />
        </branch>
        <branch name="H2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1584" y="1440" type="branch" />
            <wire x2="1584" y1="1440" y2="1440" x1="1504" />
            <wire x2="1984" y1="1440" y2="1440" x1="1584" />
            <wire x2="1984" y1="1440" y2="1568" x1="1984" />
            <wire x2="2096" y1="1568" y2="1568" x1="1984" />
        </branch>
        <branch name="H3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1584" y="1504" type="branch" />
            <wire x2="1584" y1="1504" y2="1504" x1="1504" />
            <wire x2="1952" y1="1504" y2="1504" x1="1584" />
            <wire x2="1952" y1="1504" y2="1632" x1="1952" />
            <wire x2="2096" y1="1632" y2="1632" x1="1952" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1984" y1="1984" y2="1984" x1="1872" />
            <wire x2="1984" y1="1760" y2="1984" x1="1984" />
            <wire x2="2096" y1="1760" y2="1760" x1="1984" />
        </branch>
        <branch name="DL(7:0)">
            <wire x2="2768" y1="800" y2="800" x1="2480" />
        </branch>
        <branch name="DH(7:0)">
            <wire x2="2768" y1="1440" y2="1440" x1="2480" />
        </branch>
        <branch name="H0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1104" y="1920" type="branch" />
            <wire x2="1104" y1="1920" y2="1920" x1="1056" />
            <wire x2="1216" y1="1920" y2="1920" x1="1104" />
        </branch>
        <branch name="H1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1104" y="1984" type="branch" />
            <wire x2="1072" y1="1984" y2="1984" x1="1056" />
            <wire x2="1104" y1="1984" y2="1984" x1="1072" />
            <wire x2="1216" y1="1984" y2="1984" x1="1104" />
        </branch>
        <branch name="H2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1104" y="2048" type="branch" />
            <wire x2="1104" y1="2048" y2="2048" x1="1056" />
            <wire x2="1200" y1="2048" y2="2048" x1="1104" />
            <wire x2="1216" y1="2048" y2="2048" x1="1200" />
        </branch>
        <branch name="H3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1104" y="2112" type="branch" />
            <wire x2="1104" y1="2112" y2="2112" x1="1056" />
            <wire x2="1216" y1="2112" y2="2112" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="592" y="1056" name="I1" orien="R180" />
        <iomarker fontsize="28" x="592" y="1120" name="I2" orien="R180" />
        <iomarker fontsize="28" x="592" y="1184" name="I4" orien="R180" />
        <iomarker fontsize="28" x="592" y="1248" name="I8" orien="R180" />
        <iomarker fontsize="28" x="576" y="1728" name="DPL" orien="R180" />
        <iomarker fontsize="28" x="576" y="1776" name="DPH" orien="R180" />
        <iomarker fontsize="28" x="576" y="1824" name="E" orien="R180" />
        <iomarker fontsize="28" x="2768" y="800" name="DL(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2768" y="1440" name="DH(7:0)" orien="R0" />
    </sheet>
</drawing>