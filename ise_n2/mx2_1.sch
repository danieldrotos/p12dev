<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="O" />
        <signal name="M0" />
        <signal name="M1" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="S0" />
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <port polarity="Output" name="O" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="S0" />
        <blockdef name="and2">
            <timestamp>2001-5-4T10:23:47</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2001-5-4T10:23:47</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="and2" name="I_36_9">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="M1" name="O" />
        </block>
        <block symbolname="and2b1" name="I_36_7">
            <blockpin signalname="S0" name="I0" />
            <blockpin signalname="D0" name="I1" />
            <blockpin signalname="M0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="I0" />
            <blockpin signalname="M1" name="I1" />
            <blockpin signalname="M0" name="I2" />
            <blockpin signalname="O" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3840" height="3040">
        <instance x="1696" y="1632" name="I_36_9" orien="R0" />
        <instance x="1696" y="1312" name="I_36_7" orien="R0" />
        <branch name="O">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="1376" type="branch" />
            <wire x2="2816" y1="1376" y2="1376" x1="2464" />
            <wire x2="2880" y1="1376" y2="1376" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2880" y="1376" name="O" orien="R0" />
        <branch name="M0">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2016" y="1216" type="branch" />
            <wire x2="2016" y1="1216" y2="1216" x1="1952" />
            <wire x2="2080" y1="1216" y2="1216" x1="2016" />
            <wire x2="2080" y1="1216" y2="1312" x1="2080" />
            <wire x2="2208" y1="1312" y2="1312" x1="2080" />
        </branch>
        <branch name="M1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2016" y="1536" type="branch" />
            <wire x2="2016" y1="1536" y2="1536" x1="1952" />
            <wire x2="2080" y1="1536" y2="1536" x1="2016" />
            <wire x2="2208" y1="1376" y2="1376" x1="2080" />
            <wire x2="2080" y1="1376" y2="1536" x1="2080" />
        </branch>
        <branch name="D0">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="1184" type="branch" />
            <wire x2="1120" y1="1184" y2="1184" x1="1088" />
            <wire x2="1376" y1="1184" y2="1184" x1="1120" />
            <wire x2="1696" y1="1184" y2="1184" x1="1376" />
            <wire x2="1376" y1="1184" y2="1744" x1="1376" />
            <wire x2="1696" y1="1744" y2="1744" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1088" y="1184" name="D0" orien="R180" />
        <branch name="D1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="1568" type="branch" />
            <wire x2="1120" y1="1568" y2="1568" x1="1088" />
            <wire x2="1472" y1="1568" y2="1568" x1="1120" />
            <wire x2="1696" y1="1568" y2="1568" x1="1472" />
            <wire x2="1472" y1="1568" y2="1680" x1="1472" />
            <wire x2="1696" y1="1680" y2="1680" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1088" y="1568" name="D1" orien="R180" />
        <branch name="S0">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="1376" type="branch" />
            <wire x2="1120" y1="1376" y2="1376" x1="1088" />
            <wire x2="1600" y1="1376" y2="1376" x1="1120" />
            <wire x2="1600" y1="1376" y2="1504" x1="1600" />
            <wire x2="1696" y1="1504" y2="1504" x1="1600" />
            <wire x2="1600" y1="1248" y2="1376" x1="1600" />
            <wire x2="1696" y1="1248" y2="1248" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1088" y="1376" name="S0" orien="R180" />
        <instance x="1696" y="1808" name="XLXI_1" orien="R0" />
        <instance x="2208" y="1504" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="2208" y1="1712" y2="1712" x1="1952" />
            <wire x2="2208" y1="1440" y2="1712" x1="2208" />
        </branch>
    </sheet>
</drawing>