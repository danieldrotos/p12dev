<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="Q" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q" />
        <blockdef name="cd4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="cd4ce" name="XLXI_14">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_19" name="CE" />
            <blockpin signalname="XLXN_20" name="CLR" />
            <blockpin name="CEO" />
            <blockpin name="Q0" />
            <blockpin signalname="Q" name="Q1" />
            <blockpin name="Q2" />
            <blockpin name="Q3" />
            <blockpin name="TC" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="XLXN_20" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_16">
            <blockpin signalname="XLXN_19" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1152" y="1888" name="XLXI_14" orien="R0" />
        <instance x="944" y="2016" name="XLXI_15" orien="R0" />
        <instance x="944" y="1632" name="XLXI_16" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="1008" y1="1632" y2="1696" x1="1008" />
            <wire x2="1152" y1="1696" y2="1696" x1="1008" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="1152" y1="1856" y2="1856" x1="1008" />
            <wire x2="1008" y1="1856" y2="1888" x1="1008" />
        </branch>
        <branch name="Q">
            <wire x2="1760" y1="1504" y2="1504" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1504" name="Q" orien="R0" />
        <branch name="CLK">
            <wire x2="1136" y1="1760" y2="1760" x1="704" />
            <wire x2="1152" y1="1760" y2="1760" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="704" y="1760" name="CLK" orien="R180" />
    </sheet>
</drawing>