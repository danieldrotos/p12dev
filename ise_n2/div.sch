<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK50MHz" />
        <signal name="Q10MHz" />
        <signal name="Q1MHz" />
        <signal name="Q10kHz" />
        <signal name="XLXN_3" />
        <signal name="Q25MHz" />
        <signal name="XLXN_4" />
        <signal name="Q100Hz" />
        <signal name="XLXN_6" />
        <signal name="Q10Hz" />
        <signal name="XLXN_8" />
        <signal name="Q1Hz" />
        <signal name="Q0Hz1" />
        <signal name="Q1KHz" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="Q10MHz" />
        <port polarity="Output" name="Q1MHz" />
        <port polarity="Output" name="Q10kHz" />
        <port polarity="Output" name="Q25MHz" />
        <port polarity="Output" name="Q100Hz" />
        <port polarity="Output" name="Q10Hz" />
        <port polarity="Output" name="Q1Hz" />
        <port polarity="Output" name="Q0Hz1" />
        <port polarity="Output" name="Q1KHz" />
        <blockdef name="div5">
            <timestamp>2012-2-9T8:58:41</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="div10">
            <timestamp>2012-2-9T9:8:26</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="div100">
            <timestamp>2012-2-9T9:10:57</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="div5" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK" />
            <blockpin signalname="Q10MHz" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_2">
            <blockpin signalname="Q10MHz" name="CLK" />
            <blockpin signalname="Q1MHz" name="Q" />
        </block>
        <block symbolname="div100" name="XLXI_3">
            <blockpin signalname="Q1MHz" name="CLK" />
            <blockpin signalname="Q10kHz" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_10">
            <blockpin signalname="CLK50MHz" name="C" />
            <blockpin signalname="XLXN_3" name="D" />
            <blockpin signalname="Q25MHz" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="Q25MHz" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="div10" name="XLXI_12">
            <blockpin signalname="Q10kHz" name="CLK" />
            <blockpin signalname="Q1KHz" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_13">
            <blockpin signalname="Q1KHz" name="CLK" />
            <blockpin signalname="Q100Hz" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_7">
            <blockpin signalname="Q100Hz" name="CLK" />
            <blockpin signalname="Q10Hz" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_8">
            <blockpin signalname="Q10Hz" name="CLK" />
            <blockpin signalname="Q1Hz" name="Q" />
        </block>
        <block symbolname="div10" name="XLXI_9">
            <blockpin signalname="Q1Hz" name="CLK" />
            <blockpin signalname="Q0Hz1" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="784" y="560" name="XLXI_1" orien="R0">
        </instance>
        <instance x="784" y="816" name="XLXI_2" orien="R0">
        </instance>
        <instance x="784" y="1056" name="XLXI_3" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="624" y1="528" y2="528" x1="448" />
            <wire x2="784" y1="528" y2="528" x1="624" />
            <wire x2="784" y1="272" y2="272" x1="624" />
            <wire x2="624" y1="272" y2="528" x1="624" />
        </branch>
        <iomarker fontsize="28" x="448" y="528" name="CLK50MHz" orien="R180" />
        <branch name="Q10MHz">
            <wire x2="1248" y1="624" y2="624" x1="704" />
            <wire x2="704" y1="624" y2="784" x1="704" />
            <wire x2="784" y1="784" y2="784" x1="704" />
            <wire x2="1248" y1="528" y2="528" x1="1168" />
            <wire x2="1248" y1="528" y2="624" x1="1248" />
            <wire x2="1504" y1="528" y2="528" x1="1248" />
        </branch>
        <branch name="Q1MHz">
            <wire x2="704" y1="880" y2="1024" x1="704" />
            <wire x2="784" y1="1024" y2="1024" x1="704" />
            <wire x2="1248" y1="880" y2="880" x1="704" />
            <wire x2="1248" y1="784" y2="784" x1="1168" />
            <wire x2="1248" y1="784" y2="880" x1="1248" />
            <wire x2="1504" y1="784" y2="784" x1="1248" />
        </branch>
        <branch name="Q10kHz">
            <wire x2="1248" y1="1104" y2="1104" x1="704" />
            <wire x2="704" y1="1104" y2="1248" x1="704" />
            <wire x2="784" y1="1248" y2="1248" x1="704" />
            <wire x2="1248" y1="1024" y2="1024" x1="1168" />
            <wire x2="1248" y1="1024" y2="1104" x1="1248" />
            <wire x2="1504" y1="1024" y2="1024" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1504" y="528" name="Q10MHz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="784" name="Q1MHz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1024" name="Q10kHz" orien="R0" />
        <instance x="784" y="400" name="XLXI_10" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="784" y1="144" y2="144" x1="768" />
            <wire x2="768" y1="144" y2="416" x1="768" />
            <wire x2="1536" y1="416" y2="416" x1="768" />
            <wire x2="1536" y1="144" y2="144" x1="1456" />
            <wire x2="1536" y1="144" y2="416" x1="1536" />
        </branch>
        <instance x="1232" y="176" name="XLXI_11" orien="R0" />
        <branch name="Q25MHz">
            <wire x2="1200" y1="144" y2="144" x1="1168" />
            <wire x2="1232" y1="144" y2="144" x1="1200" />
            <wire x2="1200" y1="144" y2="368" x1="1200" />
            <wire x2="1616" y1="368" y2="368" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1616" y="368" name="Q25MHz" orien="R0" />
        <branch name="Q100Hz">
            <wire x2="704" y1="1632" y2="1760" x1="704" />
            <wire x2="784" y1="1760" y2="1760" x1="704" />
            <wire x2="1248" y1="1632" y2="1632" x1="704" />
            <wire x2="1184" y1="1552" y2="1552" x1="1168" />
            <wire x2="1248" y1="1552" y2="1552" x1="1184" />
            <wire x2="1504" y1="1552" y2="1552" x1="1248" />
            <wire x2="1248" y1="1552" y2="1632" x1="1248" />
        </branch>
        <instance x="784" y="1792" name="XLXI_7" orien="R0">
        </instance>
        <instance x="784" y="1968" name="XLXI_8" orien="R0">
        </instance>
        <branch name="Q10Hz">
            <wire x2="704" y1="1824" y2="1936" x1="704" />
            <wire x2="784" y1="1936" y2="1936" x1="704" />
            <wire x2="1248" y1="1824" y2="1824" x1="704" />
            <wire x2="1248" y1="1760" y2="1760" x1="1168" />
            <wire x2="1504" y1="1760" y2="1760" x1="1248" />
            <wire x2="1248" y1="1760" y2="1824" x1="1248" />
        </branch>
        <instance x="784" y="2144" name="XLXI_9" orien="R0">
        </instance>
        <branch name="Q1Hz">
            <wire x2="704" y1="2000" y2="2112" x1="704" />
            <wire x2="784" y1="2112" y2="2112" x1="704" />
            <wire x2="1248" y1="2000" y2="2000" x1="704" />
            <wire x2="1248" y1="1936" y2="1936" x1="1168" />
            <wire x2="1504" y1="1936" y2="1936" x1="1248" />
            <wire x2="1248" y1="1936" y2="2000" x1="1248" />
        </branch>
        <branch name="Q0Hz1">
            <wire x2="1504" y1="2112" y2="2112" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1552" name="Q100Hz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1760" name="Q10Hz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1936" name="Q1Hz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="2112" name="Q0Hz1" orien="R0" />
        <instance x="784" y="1280" name="XLXI_12" orien="R0">
        </instance>
        <instance x="800" y="1584" name="XLXI_13" orien="R0">
        </instance>
        <branch name="Q1KHz">
            <wire x2="1248" y1="1344" y2="1344" x1="704" />
            <wire x2="704" y1="1344" y2="1552" x1="704" />
            <wire x2="800" y1="1552" y2="1552" x1="704" />
            <wire x2="1248" y1="1248" y2="1248" x1="1168" />
            <wire x2="1248" y1="1248" y2="1344" x1="1248" />
            <wire x2="1504" y1="1248" y2="1248" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1248" name="Q1KHz" orien="R0" />
    </sheet>
</drawing>