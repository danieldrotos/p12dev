<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="CLK" />
        <signal name="Q" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q" />
        <blockdef name="div10">
            <timestamp>2012-2-9T9:8:26</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="div10" name="XLXI_1">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_1" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="CLK" />
            <blockpin signalname="Q" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="992" y="1088" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1600" y="1088" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1600" y1="1056" y2="1056" x1="1376" />
        </branch>
        <branch name="CLK">
            <wire x2="992" y1="1056" y2="1056" x1="848" />
        </branch>
        <branch name="Q">
            <wire x2="2144" y1="1056" y2="1056" x1="1984" />
        </branch>
        <iomarker fontsize="28" x="2144" y="1056" name="Q" orien="R0" />
        <iomarker fontsize="28" x="848" y="1056" name="CLK" orien="R180" />
    </sheet>
</drawing>