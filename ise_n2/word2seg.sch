<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D0(7:0)" />
        <signal name="D1(7:0)" />
        <signal name="D2(7:0)" />
        <signal name="D3(7:0)" />
        <signal name="I(0)" />
        <signal name="I(1)" />
        <signal name="I(2)" />
        <signal name="I(3)" />
        <signal name="I(4)" />
        <signal name="I(5)" />
        <signal name="I(6)" />
        <signal name="I(7)" />
        <signal name="I(8)" />
        <signal name="I(9)" />
        <signal name="I(10)" />
        <signal name="I(11)" />
        <signal name="I(12)" />
        <signal name="I(13)" />
        <signal name="I(14)" />
        <signal name="I(15)" />
        <signal name="XLXN_22" />
        <signal name="XLXN_26" />
        <signal name="I(15:0)" />
        <port polarity="Output" name="D0(7:0)" />
        <port polarity="Output" name="D1(7:0)" />
        <port polarity="Output" name="D2(7:0)" />
        <port polarity="Output" name="D3(7:0)" />
        <port polarity="Input" name="I(15:0)" />
        <blockdef name="bin2seg">
            <timestamp>2016-4-25T15:35:41</timestamp>
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="bin2seg" name="XLXI_1">
            <blockpin signalname="XLXN_26" name="DP" />
            <blockpin signalname="XLXN_22" name="E" />
            <blockpin signalname="I(0)" name="I1" />
            <blockpin signalname="I(1)" name="I2" />
            <blockpin signalname="I(2)" name="I4" />
            <blockpin signalname="I(3)" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="D0(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="bin2seg" name="XLXI_2">
            <blockpin signalname="XLXN_26" name="DP" />
            <blockpin signalname="XLXN_22" name="E" />
            <blockpin signalname="I(4)" name="I1" />
            <blockpin signalname="I(5)" name="I2" />
            <blockpin signalname="I(6)" name="I4" />
            <blockpin signalname="I(7)" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="D1(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="bin2seg" name="XLXI_3">
            <blockpin signalname="XLXN_26" name="DP" />
            <blockpin signalname="XLXN_22" name="E" />
            <blockpin signalname="I(8)" name="I1" />
            <blockpin signalname="I(9)" name="I2" />
            <blockpin signalname="I(10)" name="I4" />
            <blockpin signalname="I(11)" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="D2(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="bin2seg" name="XLXI_4">
            <blockpin signalname="XLXN_26" name="DP" />
            <blockpin signalname="XLXN_22" name="E" />
            <blockpin signalname="I(12)" name="I1" />
            <blockpin signalname="I(13)" name="I2" />
            <blockpin signalname="I(14)" name="I4" />
            <blockpin signalname="I(15)" name="I8" />
            <blockpin name="NZ" />
            <blockpin signalname="D3(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_22" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="XLXN_26" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1456" y="800" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1456" y="1264" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1456" y="1728" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1456" y="2192" name="XLXI_4" orien="R0">
        </instance>
        <branch name="D0(7:0)">
            <wire x2="1968" y1="448" y2="448" x1="1840" />
        </branch>
        <branch name="D1(7:0)">
            <wire x2="1968" y1="912" y2="912" x1="1840" />
        </branch>
        <branch name="D2(7:0)">
            <wire x2="1984" y1="1376" y2="1376" x1="1840" />
        </branch>
        <branch name="D3(7:0)">
            <wire x2="1968" y1="1840" y2="1840" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1968" y="448" name="D0(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1968" y="912" name="D1(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1984" y="1376" name="D2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1840" name="D3(7:0)" orien="R0" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="448" type="branch" />
            <wire x2="1376" y1="448" y2="448" x1="1328" />
            <wire x2="1456" y1="448" y2="448" x1="1376" />
        </branch>
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="512" type="branch" />
            <wire x2="1376" y1="512" y2="512" x1="1328" />
            <wire x2="1456" y1="512" y2="512" x1="1376" />
        </branch>
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="576" type="branch" />
            <wire x2="1376" y1="576" y2="576" x1="1328" />
            <wire x2="1456" y1="576" y2="576" x1="1376" />
        </branch>
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="640" type="branch" />
            <wire x2="1376" y1="640" y2="640" x1="1328" />
            <wire x2="1456" y1="640" y2="640" x1="1376" />
        </branch>
        <branch name="I(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="912" type="branch" />
            <wire x2="1376" y1="912" y2="912" x1="1328" />
            <wire x2="1456" y1="912" y2="912" x1="1376" />
        </branch>
        <branch name="I(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="976" type="branch" />
            <wire x2="1376" y1="976" y2="976" x1="1328" />
            <wire x2="1456" y1="976" y2="976" x1="1376" />
        </branch>
        <branch name="I(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1040" type="branch" />
            <wire x2="1376" y1="1040" y2="1040" x1="1328" />
            <wire x2="1456" y1="1040" y2="1040" x1="1376" />
        </branch>
        <branch name="I(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1104" type="branch" />
            <wire x2="1376" y1="1104" y2="1104" x1="1328" />
            <wire x2="1456" y1="1104" y2="1104" x1="1376" />
        </branch>
        <branch name="I(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1376" type="branch" />
            <wire x2="1376" y1="1376" y2="1376" x1="1328" />
            <wire x2="1456" y1="1376" y2="1376" x1="1376" />
        </branch>
        <branch name="I(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1440" type="branch" />
            <wire x2="1376" y1="1440" y2="1440" x1="1328" />
            <wire x2="1456" y1="1440" y2="1440" x1="1376" />
        </branch>
        <branch name="I(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1504" type="branch" />
            <wire x2="1376" y1="1504" y2="1504" x1="1328" />
            <wire x2="1456" y1="1504" y2="1504" x1="1376" />
        </branch>
        <branch name="I(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1568" type="branch" />
            <wire x2="1376" y1="1568" y2="1568" x1="1328" />
            <wire x2="1456" y1="1568" y2="1568" x1="1376" />
        </branch>
        <branch name="I(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1840" type="branch" />
            <wire x2="1376" y1="1840" y2="1840" x1="1328" />
            <wire x2="1456" y1="1840" y2="1840" x1="1376" />
        </branch>
        <branch name="I(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1904" type="branch" />
            <wire x2="1376" y1="1904" y2="1904" x1="1328" />
            <wire x2="1456" y1="1904" y2="1904" x1="1376" />
        </branch>
        <branch name="I(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1968" type="branch" />
            <wire x2="1376" y1="1968" y2="1968" x1="1328" />
            <wire x2="1456" y1="1968" y2="1968" x1="1376" />
        </branch>
        <branch name="I(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="2032" type="branch" />
            <wire x2="1376" y1="2032" y2="2032" x1="1328" />
            <wire x2="1456" y1="2032" y2="2032" x1="1376" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="1456" y1="768" y2="768" x1="1200" />
            <wire x2="1200" y1="768" y2="1232" x1="1200" />
            <wire x2="1456" y1="1232" y2="1232" x1="1200" />
            <wire x2="1200" y1="1232" y2="1696" x1="1200" />
            <wire x2="1456" y1="1696" y2="1696" x1="1200" />
            <wire x2="1200" y1="1696" y2="2160" x1="1200" />
            <wire x2="1456" y1="2160" y2="2160" x1="1200" />
        </branch>
        <instance x="1136" y="768" name="XLXI_5" orien="R0" />
        <branch name="XLXN_26">
            <wire x2="1456" y1="704" y2="704" x1="1280" />
            <wire x2="1280" y1="704" y2="1168" x1="1280" />
            <wire x2="1456" y1="1168" y2="1168" x1="1280" />
            <wire x2="1280" y1="1168" y2="1632" x1="1280" />
            <wire x2="1456" y1="1632" y2="1632" x1="1280" />
            <wire x2="1280" y1="1632" y2="2096" x1="1280" />
            <wire x2="1456" y1="2096" y2="2096" x1="1280" />
            <wire x2="1280" y1="2096" y2="2224" x1="1280" />
        </branch>
        <instance x="1216" y="2352" name="XLXI_6" orien="R0" />
        <branch name="I(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="448" type="branch" />
            <wire x2="704" y1="448" y2="448" x1="592" />
            <wire x2="816" y1="448" y2="448" x1="704" />
        </branch>
        <iomarker fontsize="28" x="592" y="448" name="I(15:0)" orien="R180" />
    </sheet>
</drawing>