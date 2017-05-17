<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="I1" />
        <signal name="I2" />
        <signal name="I4" />
        <signal name="I8" />
        <signal name="D(0:15)" />
        <signal name="D(0)" />
        <signal name="D(1)" />
        <signal name="D(2)" />
        <signal name="D(3)" />
        <signal name="D(4)" />
        <signal name="D(5)" />
        <signal name="D(6)" />
        <signal name="D(7)" />
        <signal name="D(8)" />
        <signal name="D(9)" />
        <signal name="D(10)" />
        <signal name="D(11)" />
        <signal name="D(12)" />
        <signal name="D(13)" />
        <signal name="D(14)" />
        <signal name="D(15)" />
        <signal name="E" />
        <signal name="SEG(7:0)" />
        <signal name="SEG(2)" />
        <signal name="SEG(1)" />
        <signal name="SEG(0)" />
        <signal name="SEG(5)" />
        <signal name="SEG(4)" />
        <signal name="SEG(6)" />
        <signal name="SEG(3)" />
        <signal name="SEG(7)" />
        <signal name="DP" />
        <signal name="NZ" />
        <signal name="XLXN_155" />
        <signal name="XLXN_156" />
        <port polarity="Input" name="I1" />
        <port polarity="Input" name="I2" />
        <port polarity="Input" name="I4" />
        <port polarity="Input" name="I8" />
        <port polarity="Input" name="E" />
        <port polarity="Output" name="SEG(7:0)" />
        <port polarity="Input" name="DP" />
        <port polarity="Output" name="NZ" />
        <blockdef name="d4_16e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-1152" height="1088" />
            <line x2="320" y1="-1088" y2="-1088" x1="384" />
            <line x2="320" y1="-1024" y2="-1024" x1="384" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-1088" y2="-1088" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="or12">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <arc ex="48" ey="-464" sx="48" sy="-368" r="56" cx="16" cy="-416" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="48" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-64" y2="-368" x1="48" />
            <arc ex="112" ey="-464" sx="192" sy="-416" r="88" cx="116" cy="-376" />
            <line x2="48" y1="-368" y2="-368" x1="112" />
            <arc ex="192" ey="-416" sx="112" sy="-368" r="88" cx="116" cy="-456" />
            <line x2="48" y1="-464" y2="-464" x1="112" />
            <line x2="48" y1="-768" y2="-464" x1="48" />
            <line x2="192" y1="-416" y2="-416" x1="256" />
            <line x2="48" y1="-640" y2="-640" x1="0" />
            <line x2="48" y1="-576" y2="-576" x1="0" />
            <line x2="48" y1="-512" y2="-512" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-768" y2="-768" x1="0" />
            <line x2="48" y1="-704" y2="-704" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="or9">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="72" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-64" y2="-272" x1="48" />
            <line x2="48" y1="-576" y2="-368" x1="48" />
            <arc ex="112" ey="-368" sx="192" sy="-320" r="88" cx="116" cy="-280" />
            <line x2="48" y1="-272" y2="-272" x1="112" />
            <arc ex="192" ey="-320" sx="112" sy="-272" r="88" cx="116" cy="-360" />
            <line x2="48" y1="-368" y2="-368" x1="112" />
            <line x2="192" y1="-320" y2="-320" x1="256" />
            <arc ex="48" ey="-368" sx="48" sy="-272" r="56" cx="16" cy="-320" />
            <line x2="48" y1="-576" y2="-576" x1="0" />
            <line x2="48" y1="-512" y2="-512" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-448" y2="-448" x1="0" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="d4_16e" name="XLXI_1">
            <blockpin signalname="I1" name="A0" />
            <blockpin signalname="I2" name="A1" />
            <blockpin signalname="I4" name="A2" />
            <blockpin signalname="I8" name="A3" />
            <blockpin signalname="E" name="E" />
            <blockpin signalname="D(0)" name="D0" />
            <blockpin signalname="D(1)" name="D1" />
            <blockpin signalname="D(10)" name="D10" />
            <blockpin signalname="D(11)" name="D11" />
            <blockpin signalname="D(12)" name="D12" />
            <blockpin signalname="D(13)" name="D13" />
            <blockpin signalname="D(14)" name="D14" />
            <blockpin signalname="D(15)" name="D15" />
            <blockpin signalname="D(2)" name="D2" />
            <blockpin signalname="D(3)" name="D3" />
            <blockpin signalname="D(4)" name="D4" />
            <blockpin signalname="D(5)" name="D5" />
            <blockpin signalname="D(6)" name="D6" />
            <blockpin signalname="D(7)" name="D7" />
            <blockpin signalname="D(8)" name="D8" />
            <blockpin signalname="D(9)" name="D9" />
        </block>
        <block symbolname="or12" name="XLXI_3">
            <blockpin signalname="D(15)" name="I0" />
            <blockpin signalname="D(14)" name="I1" />
            <blockpin signalname="D(2)" name="I10" />
            <blockpin signalname="D(0)" name="I11" />
            <blockpin signalname="D(12)" name="I2" />
            <blockpin signalname="D(10)" name="I3" />
            <blockpin signalname="D(9)" name="I4" />
            <blockpin signalname="D(8)" name="I5" />
            <blockpin signalname="D(7)" name="I6" />
            <blockpin signalname="D(6)" name="I7" />
            <blockpin signalname="D(5)" name="I8" />
            <blockpin signalname="D(3)" name="I9" />
            <blockpin signalname="SEG(0)" name="O" />
        </block>
        <block symbolname="or9" name="XLXI_4">
            <blockpin signalname="D(13)" name="I0" />
            <blockpin signalname="D(10)" name="I1" />
            <blockpin signalname="D(9)" name="I2" />
            <blockpin signalname="D(8)" name="I3" />
            <blockpin signalname="D(7)" name="I4" />
            <blockpin signalname="D(3)" name="I5" />
            <blockpin signalname="D(2)" name="I6" />
            <blockpin signalname="D(1)" name="I7" />
            <blockpin signalname="D(0)" name="I8" />
            <blockpin signalname="XLXN_156" name="O" />
        </block>
        <block symbolname="or12" name="XLXI_5">
            <blockpin signalname="D(13)" name="I0" />
            <blockpin signalname="D(11)" name="I1" />
            <blockpin signalname="D(1)" name="I10" />
            <blockpin signalname="D(0)" name="I11" />
            <blockpin signalname="D(10)" name="I2" />
            <blockpin signalname="D(9)" name="I3" />
            <blockpin signalname="D(8)" name="I4" />
            <blockpin signalname="D(7)" name="I5" />
            <blockpin signalname="D(6)" name="I6" />
            <blockpin signalname="D(5)" name="I7" />
            <blockpin signalname="D(4)" name="I8" />
            <blockpin signalname="D(3)" name="I9" />
            <blockpin signalname="SEG(2)" name="O" />
        </block>
        <block symbolname="or12" name="XLXI_6">
            <blockpin signalname="D(14)" name="I0" />
            <blockpin signalname="D(14)" name="I1" />
            <blockpin signalname="D(2)" name="I10" />
            <blockpin signalname="D(0)" name="I11" />
            <blockpin signalname="D(13)" name="I2" />
            <blockpin signalname="D(12)" name="I3" />
            <blockpin signalname="D(11)" name="I4" />
            <blockpin signalname="D(9)" name="I5" />
            <blockpin signalname="D(8)" name="I6" />
            <blockpin signalname="D(6)" name="I7" />
            <blockpin signalname="D(5)" name="I8" />
            <blockpin signalname="D(3)" name="I9" />
            <blockpin signalname="SEG(3)" name="O" />
        </block>
        <block symbolname="or12" name="XLXI_7">
            <blockpin signalname="D(15)" name="I0" />
            <blockpin signalname="D(15)" name="I1" />
            <blockpin signalname="D(2)" name="I10" />
            <blockpin signalname="D(0)" name="I11" />
            <blockpin signalname="D(15)" name="I2" />
            <blockpin signalname="D(14)" name="I3" />
            <blockpin signalname="D(13)" name="I4" />
            <blockpin signalname="D(12)" name="I5" />
            <blockpin signalname="D(11)" name="I6" />
            <blockpin signalname="D(10)" name="I7" />
            <blockpin signalname="D(8)" name="I8" />
            <blockpin signalname="D(6)" name="I9" />
            <blockpin signalname="SEG(4)" name="O" />
        </block>
        <block symbolname="or12" name="XLXI_8">
            <blockpin signalname="D(0)" name="I0" />
            <blockpin signalname="D(15)" name="I1" />
            <blockpin signalname="D(4)" name="I10" />
            <blockpin signalname="D(0)" name="I11" />
            <blockpin signalname="D(14)" name="I2" />
            <blockpin signalname="D(12)" name="I3" />
            <blockpin signalname="D(11)" name="I4" />
            <blockpin signalname="D(10)" name="I5" />
            <blockpin signalname="D(9)" name="I6" />
            <blockpin signalname="D(8)" name="I7" />
            <blockpin signalname="D(6)" name="I8" />
            <blockpin signalname="D(5)" name="I9" />
            <blockpin signalname="SEG(5)" name="O" />
        </block>
        <block symbolname="or12" name="XLXI_9">
            <blockpin signalname="D(15)" name="I0" />
            <blockpin signalname="D(4)" name="I1" />
            <blockpin signalname="D(3)" name="I10" />
            <blockpin signalname="D(2)" name="I11" />
            <blockpin signalname="D(14)" name="I2" />
            <blockpin signalname="D(13)" name="I3" />
            <blockpin signalname="D(11)" name="I4" />
            <blockpin signalname="D(10)" name="I5" />
            <blockpin signalname="D(9)" name="I6" />
            <blockpin signalname="D(8)" name="I7" />
            <blockpin signalname="D(6)" name="I8" />
            <blockpin signalname="D(5)" name="I9" />
            <blockpin signalname="SEG(6)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="DP" name="I0" />
            <blockpin signalname="E" name="I1" />
            <blockpin signalname="SEG(7)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="XLXN_155" name="I1" />
            <blockpin signalname="NZ" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="D(0)" name="I" />
            <blockpin signalname="XLXN_155" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_13">
            <blockpin signalname="D(4)" name="I0" />
            <blockpin signalname="XLXN_156" name="I1" />
            <blockpin signalname="SEG(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="288" y="1984" name="XLXI_1" orien="R0" />
        <branch name="I1">
            <wire x2="288" y1="896" y2="896" x1="240" />
        </branch>
        <branch name="I2">
            <wire x2="288" y1="960" y2="960" x1="240" />
        </branch>
        <branch name="I4">
            <wire x2="288" y1="1024" y2="1024" x1="240" />
        </branch>
        <branch name="I8">
            <wire x2="288" y1="1088" y2="1088" x1="240" />
        </branch>
        <iomarker fontsize="28" x="240" y="896" name="I1" orien="R180" />
        <iomarker fontsize="28" x="240" y="960" name="I2" orien="R180" />
        <iomarker fontsize="28" x="240" y="1024" name="I4" orien="R180" />
        <iomarker fontsize="28" x="240" y="1088" name="I8" orien="R180" />
        <bustap x2="736" y1="896" y2="896" x1="832" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="896" type="branch" />
            <wire x2="704" y1="896" y2="896" x1="672" />
            <wire x2="736" y1="896" y2="896" x1="704" />
        </branch>
        <bustap x2="736" y1="960" y2="960" x1="832" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="960" type="branch" />
            <wire x2="704" y1="960" y2="960" x1="672" />
            <wire x2="736" y1="960" y2="960" x1="704" />
        </branch>
        <bustap x2="736" y1="1024" y2="1024" x1="832" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1024" type="branch" />
            <wire x2="704" y1="1024" y2="1024" x1="672" />
            <wire x2="736" y1="1024" y2="1024" x1="704" />
        </branch>
        <bustap x2="736" y1="1088" y2="1088" x1="832" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1088" type="branch" />
            <wire x2="704" y1="1088" y2="1088" x1="672" />
            <wire x2="736" y1="1088" y2="1088" x1="704" />
        </branch>
        <bustap x2="736" y1="1152" y2="1152" x1="832" />
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1152" type="branch" />
            <wire x2="704" y1="1152" y2="1152" x1="672" />
            <wire x2="736" y1="1152" y2="1152" x1="704" />
        </branch>
        <bustap x2="736" y1="1216" y2="1216" x1="832" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1216" type="branch" />
            <wire x2="704" y1="1216" y2="1216" x1="672" />
            <wire x2="736" y1="1216" y2="1216" x1="704" />
        </branch>
        <bustap x2="736" y1="1280" y2="1280" x1="832" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1280" type="branch" />
            <wire x2="704" y1="1280" y2="1280" x1="672" />
            <wire x2="736" y1="1280" y2="1280" x1="704" />
        </branch>
        <bustap x2="736" y1="1344" y2="1344" x1="832" />
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1344" type="branch" />
            <wire x2="704" y1="1344" y2="1344" x1="672" />
            <wire x2="736" y1="1344" y2="1344" x1="704" />
        </branch>
        <bustap x2="736" y1="1408" y2="1408" x1="832" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1408" type="branch" />
            <wire x2="704" y1="1408" y2="1408" x1="672" />
            <wire x2="736" y1="1408" y2="1408" x1="704" />
        </branch>
        <bustap x2="736" y1="1472" y2="1472" x1="832" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1472" type="branch" />
            <wire x2="704" y1="1472" y2="1472" x1="672" />
            <wire x2="736" y1="1472" y2="1472" x1="704" />
        </branch>
        <bustap x2="736" y1="1536" y2="1536" x1="832" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1536" type="branch" />
            <wire x2="704" y1="1536" y2="1536" x1="672" />
            <wire x2="736" y1="1536" y2="1536" x1="704" />
        </branch>
        <bustap x2="736" y1="1600" y2="1600" x1="832" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1600" type="branch" />
            <wire x2="704" y1="1600" y2="1600" x1="672" />
            <wire x2="736" y1="1600" y2="1600" x1="704" />
        </branch>
        <bustap x2="736" y1="1664" y2="1664" x1="832" />
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1664" type="branch" />
            <wire x2="704" y1="1664" y2="1664" x1="672" />
            <wire x2="736" y1="1664" y2="1664" x1="704" />
        </branch>
        <bustap x2="736" y1="1728" y2="1728" x1="832" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1728" type="branch" />
            <wire x2="704" y1="1728" y2="1728" x1="672" />
            <wire x2="736" y1="1728" y2="1728" x1="704" />
        </branch>
        <bustap x2="736" y1="1792" y2="1792" x1="832" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1792" type="branch" />
            <wire x2="704" y1="1792" y2="1792" x1="672" />
            <wire x2="736" y1="1792" y2="1792" x1="704" />
        </branch>
        <bustap x2="736" y1="1856" y2="1856" x1="832" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="1856" type="branch" />
            <wire x2="704" y1="1856" y2="1856" x1="672" />
            <wire x2="736" y1="1856" y2="1856" x1="704" />
        </branch>
        <instance x="960" y="896" name="XLXI_3" orien="R0" />
        <bustap x2="928" y1="128" y2="128" x1="832" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="128" type="branch" />
            <wire x2="944" y1="128" y2="128" x1="928" />
            <wire x2="960" y1="128" y2="128" x1="944" />
        </branch>
        <bustap x2="928" y1="192" y2="192" x1="832" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="192" type="branch" />
            <wire x2="944" y1="192" y2="192" x1="928" />
            <wire x2="960" y1="192" y2="192" x1="944" />
        </branch>
        <bustap x2="928" y1="256" y2="256" x1="832" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="256" type="branch" />
            <wire x2="944" y1="256" y2="256" x1="928" />
            <wire x2="960" y1="256" y2="256" x1="944" />
        </branch>
        <bustap x2="928" y1="320" y2="320" x1="832" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="320" type="branch" />
            <wire x2="944" y1="320" y2="320" x1="928" />
            <wire x2="960" y1="320" y2="320" x1="944" />
        </branch>
        <bustap x2="928" y1="384" y2="384" x1="832" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="384" type="branch" />
            <wire x2="944" y1="384" y2="384" x1="928" />
            <wire x2="960" y1="384" y2="384" x1="944" />
        </branch>
        <bustap x2="928" y1="448" y2="448" x1="832" />
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="448" type="branch" />
            <wire x2="944" y1="448" y2="448" x1="928" />
            <wire x2="960" y1="448" y2="448" x1="944" />
        </branch>
        <bustap x2="928" y1="512" y2="512" x1="832" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="512" type="branch" />
            <wire x2="944" y1="512" y2="512" x1="928" />
            <wire x2="960" y1="512" y2="512" x1="944" />
        </branch>
        <bustap x2="928" y1="576" y2="576" x1="832" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="576" type="branch" />
            <wire x2="944" y1="576" y2="576" x1="928" />
            <wire x2="960" y1="576" y2="576" x1="944" />
        </branch>
        <bustap x2="928" y1="640" y2="640" x1="832" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="640" type="branch" />
            <wire x2="944" y1="640" y2="640" x1="928" />
            <wire x2="960" y1="640" y2="640" x1="944" />
        </branch>
        <bustap x2="928" y1="704" y2="704" x1="832" />
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="704" type="branch" />
            <wire x2="944" y1="704" y2="704" x1="928" />
            <wire x2="960" y1="704" y2="704" x1="944" />
        </branch>
        <bustap x2="928" y1="768" y2="768" x1="832" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="768" type="branch" />
            <wire x2="944" y1="768" y2="768" x1="928" />
            <wire x2="960" y1="768" y2="768" x1="944" />
        </branch>
        <bustap x2="928" y1="832" y2="832" x1="832" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="832" type="branch" />
            <wire x2="944" y1="832" y2="832" x1="928" />
            <wire x2="960" y1="832" y2="832" x1="944" />
        </branch>
        <bustap x2="928" y1="928" y2="928" x1="832" />
        <bustap x2="928" y1="992" y2="992" x1="832" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="992" type="branch" />
            <wire x2="944" y1="992" y2="992" x1="928" />
            <wire x2="960" y1="992" y2="992" x1="944" />
        </branch>
        <bustap x2="928" y1="1056" y2="1056" x1="832" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1056" type="branch" />
            <wire x2="944" y1="1056" y2="1056" x1="928" />
            <wire x2="960" y1="1056" y2="1056" x1="944" />
        </branch>
        <bustap x2="928" y1="1120" y2="1120" x1="832" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1120" type="branch" />
            <wire x2="944" y1="1120" y2="1120" x1="928" />
            <wire x2="960" y1="1120" y2="1120" x1="944" />
        </branch>
        <bustap x2="928" y1="1184" y2="1184" x1="832" />
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1184" type="branch" />
            <wire x2="944" y1="1184" y2="1184" x1="928" />
            <wire x2="960" y1="1184" y2="1184" x1="944" />
        </branch>
        <bustap x2="928" y1="1248" y2="1248" x1="832" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1248" type="branch" />
            <wire x2="944" y1="1248" y2="1248" x1="928" />
            <wire x2="960" y1="1248" y2="1248" x1="944" />
        </branch>
        <bustap x2="928" y1="1312" y2="1312" x1="832" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1312" type="branch" />
            <wire x2="944" y1="1312" y2="1312" x1="928" />
            <wire x2="960" y1="1312" y2="1312" x1="944" />
        </branch>
        <bustap x2="928" y1="1376" y2="1376" x1="832" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1376" type="branch" />
            <wire x2="944" y1="1376" y2="1376" x1="928" />
            <wire x2="960" y1="1376" y2="1376" x1="944" />
        </branch>
        <bustap x2="928" y1="1440" y2="1440" x1="832" />
        <bustap x2="928" y1="1568" y2="1568" x1="832" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1568" type="branch" />
            <wire x2="944" y1="1568" y2="1568" x1="928" />
            <wire x2="960" y1="1568" y2="1568" x1="944" />
        </branch>
        <bustap x2="928" y1="1632" y2="1632" x1="832" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1632" type="branch" />
            <wire x2="944" y1="1632" y2="1632" x1="928" />
            <wire x2="960" y1="1632" y2="1632" x1="944" />
        </branch>
        <bustap x2="928" y1="1696" y2="1696" x1="832" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1696" type="branch" />
            <wire x2="944" y1="1696" y2="1696" x1="928" />
            <wire x2="960" y1="1696" y2="1696" x1="944" />
        </branch>
        <bustap x2="928" y1="1760" y2="1760" x1="832" />
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1760" type="branch" />
            <wire x2="944" y1="1760" y2="1760" x1="928" />
            <wire x2="960" y1="1760" y2="1760" x1="944" />
        </branch>
        <bustap x2="928" y1="1824" y2="1824" x1="832" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1824" type="branch" />
            <wire x2="944" y1="1824" y2="1824" x1="928" />
            <wire x2="960" y1="1824" y2="1824" x1="944" />
        </branch>
        <bustap x2="928" y1="1888" y2="1888" x1="832" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1888" type="branch" />
            <wire x2="944" y1="1888" y2="1888" x1="928" />
            <wire x2="960" y1="1888" y2="1888" x1="944" />
        </branch>
        <bustap x2="928" y1="1952" y2="1952" x1="832" />
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1952" type="branch" />
            <wire x2="944" y1="1952" y2="1952" x1="928" />
            <wire x2="960" y1="1952" y2="1952" x1="944" />
        </branch>
        <bustap x2="928" y1="2016" y2="2016" x1="832" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="2016" type="branch" />
            <wire x2="944" y1="2016" y2="2016" x1="928" />
            <wire x2="960" y1="2016" y2="2016" x1="944" />
        </branch>
        <bustap x2="928" y1="2080" y2="2080" x1="832" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="2080" type="branch" />
            <wire x2="944" y1="2080" y2="2080" x1="928" />
            <wire x2="960" y1="2080" y2="2080" x1="944" />
        </branch>
        <bustap x2="928" y1="2144" y2="2144" x1="832" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="2144" type="branch" />
            <wire x2="944" y1="2144" y2="2144" x1="928" />
            <wire x2="960" y1="2144" y2="2144" x1="944" />
        </branch>
        <bustap x2="928" y1="2208" y2="2208" x1="832" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="2208" type="branch" />
            <wire x2="944" y1="2208" y2="2208" x1="928" />
            <wire x2="960" y1="2208" y2="2208" x1="944" />
        </branch>
        <bustap x2="928" y1="2272" y2="2272" x1="832" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="2272" type="branch" />
            <wire x2="944" y1="2272" y2="2272" x1="928" />
            <wire x2="960" y1="2272" y2="2272" x1="944" />
        </branch>
        <instance x="1712" y="880" name="XLXI_6" orien="R0" />
        <bustap x2="1664" y1="112" y2="112" x1="1568" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="112" type="branch" />
            <wire x2="1712" y1="112" y2="112" x1="1664" />
        </branch>
        <bustap x2="1664" y1="176" y2="176" x1="1568" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="176" type="branch" />
            <wire x2="1712" y1="176" y2="176" x1="1664" />
        </branch>
        <bustap x2="1664" y1="240" y2="240" x1="1568" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="240" type="branch" />
            <wire x2="1712" y1="240" y2="240" x1="1664" />
        </branch>
        <bustap x2="1664" y1="304" y2="304" x1="1568" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="304" type="branch" />
            <wire x2="1712" y1="304" y2="304" x1="1664" />
        </branch>
        <bustap x2="1664" y1="368" y2="368" x1="1568" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="368" type="branch" />
            <wire x2="1712" y1="368" y2="368" x1="1664" />
        </branch>
        <bustap x2="1664" y1="432" y2="432" x1="1568" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="432" type="branch" />
            <wire x2="1712" y1="432" y2="432" x1="1664" />
        </branch>
        <bustap x2="1664" y1="496" y2="496" x1="1568" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="496" type="branch" />
            <wire x2="1712" y1="496" y2="496" x1="1664" />
        </branch>
        <bustap x2="1664" y1="560" y2="560" x1="1568" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="560" type="branch" />
            <wire x2="1712" y1="560" y2="560" x1="1664" />
        </branch>
        <bustap x2="1664" y1="624" y2="624" x1="1568" />
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="624" type="branch" />
            <wire x2="1712" y1="624" y2="624" x1="1664" />
        </branch>
        <bustap x2="1664" y1="688" y2="688" x1="1568" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="688" type="branch" />
            <wire x2="1712" y1="688" y2="688" x1="1664" />
        </branch>
        <bustap x2="1664" y1="752" y2="752" x1="1568" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="752" type="branch" />
            <wire x2="1712" y1="752" y2="752" x1="1664" />
        </branch>
        <bustap x2="1664" y1="816" y2="816" x1="1568" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="816" type="branch" />
            <wire x2="1712" y1="816" y2="816" x1="1664" />
        </branch>
        <instance x="1712" y="1680" name="XLXI_7" orien="R0" />
        <bustap x2="1664" y1="912" y2="912" x1="1568" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="912" type="branch" />
            <wire x2="1712" y1="912" y2="912" x1="1664" />
        </branch>
        <bustap x2="1664" y1="976" y2="976" x1="1568" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="976" type="branch" />
            <wire x2="1712" y1="976" y2="976" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1040" y2="1040" x1="1568" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1040" type="branch" />
            <wire x2="1712" y1="1040" y2="1040" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1104" y2="1104" x1="1568" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1104" type="branch" />
            <wire x2="1712" y1="1104" y2="1104" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1168" y2="1168" x1="1568" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1168" type="branch" />
            <wire x2="1712" y1="1168" y2="1168" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1232" y2="1232" x1="1568" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1232" type="branch" />
            <wire x2="1712" y1="1232" y2="1232" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1296" y2="1296" x1="1568" />
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1296" type="branch" />
            <wire x2="1712" y1="1296" y2="1296" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1360" y2="1360" x1="1568" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1360" type="branch" />
            <wire x2="1712" y1="1360" y2="1360" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1424" y2="1424" x1="1568" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1424" type="branch" />
            <wire x2="1712" y1="1424" y2="1424" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1488" y2="1488" x1="1568" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1488" type="branch" />
            <wire x2="1712" y1="1488" y2="1488" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1552" y2="1552" x1="1568" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1552" type="branch" />
            <wire x2="1712" y1="1552" y2="1552" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1616" y2="1616" x1="1568" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1616" type="branch" />
            <wire x2="1712" y1="1616" y2="1616" x1="1664" />
        </branch>
        <bustap x2="1664" y1="1712" y2="1712" x1="1568" />
        <bustap x2="1664" y1="1776" y2="1776" x1="1568" />
        <bustap x2="1664" y1="1840" y2="1840" x1="1568" />
        <bustap x2="1664" y1="1904" y2="1904" x1="1568" />
        <bustap x2="1664" y1="1968" y2="1968" x1="1568" />
        <bustap x2="1664" y1="2032" y2="2032" x1="1568" />
        <bustap x2="1664" y1="2096" y2="2096" x1="1568" />
        <bustap x2="1664" y1="2160" y2="2160" x1="1568" />
        <bustap x2="1664" y1="2224" y2="2224" x1="1568" />
        <bustap x2="1664" y1="2288" y2="2288" x1="1568" />
        <bustap x2="1664" y1="2352" y2="2352" x1="1568" />
        <bustap x2="1664" y1="2416" y2="2416" x1="1568" />
        <instance x="2464" y="880" name="XLXI_9" orien="R0" />
        <bustap x2="2416" y1="112" y2="112" x1="2320" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="112" type="branch" />
            <wire x2="2464" y1="112" y2="112" x1="2416" />
        </branch>
        <bustap x2="2416" y1="176" y2="176" x1="2320" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="176" type="branch" />
            <wire x2="2464" y1="176" y2="176" x1="2416" />
        </branch>
        <bustap x2="2416" y1="240" y2="240" x1="2320" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="240" type="branch" />
            <wire x2="2464" y1="240" y2="240" x1="2416" />
        </branch>
        <bustap x2="2416" y1="304" y2="304" x1="2320" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="304" type="branch" />
            <wire x2="2464" y1="304" y2="304" x1="2416" />
        </branch>
        <bustap x2="2416" y1="368" y2="368" x1="2320" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="368" type="branch" />
            <wire x2="2464" y1="368" y2="368" x1="2416" />
        </branch>
        <bustap x2="2416" y1="432" y2="432" x1="2320" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="432" type="branch" />
            <wire x2="2464" y1="432" y2="432" x1="2416" />
        </branch>
        <bustap x2="2416" y1="496" y2="496" x1="2320" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="496" type="branch" />
            <wire x2="2464" y1="496" y2="496" x1="2416" />
        </branch>
        <bustap x2="2416" y1="560" y2="560" x1="2320" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="560" type="branch" />
            <wire x2="2464" y1="560" y2="560" x1="2416" />
        </branch>
        <bustap x2="2416" y1="624" y2="624" x1="2320" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="624" type="branch" />
            <wire x2="2464" y1="624" y2="624" x1="2416" />
        </branch>
        <bustap x2="2416" y1="688" y2="688" x1="2320" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="688" type="branch" />
            <wire x2="2464" y1="688" y2="688" x1="2416" />
        </branch>
        <bustap x2="2416" y1="752" y2="752" x1="2320" />
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="752" type="branch" />
            <wire x2="2464" y1="752" y2="752" x1="2416" />
        </branch>
        <bustap x2="2416" y1="816" y2="816" x1="2320" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2440" y="816" type="branch" />
            <wire x2="2464" y1="816" y2="816" x1="2416" />
        </branch>
        <branch name="E">
            <wire x2="256" y1="1856" y2="1856" x1="208" />
            <wire x2="288" y1="1856" y2="1856" x1="256" />
            <wire x2="256" y1="1856" y2="2016" x1="256" />
            <wire x2="288" y1="2016" y2="2016" x1="256" />
        </branch>
        <iomarker fontsize="28" x="208" y="1856" name="E" orien="R180" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2416" type="branch" />
            <wire x2="1712" y1="2416" y2="2416" x1="1664" />
        </branch>
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2352" type="branch" />
            <wire x2="1712" y1="2352" y2="2352" x1="1664" />
        </branch>
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2288" type="branch" />
            <wire x2="1712" y1="2288" y2="2288" x1="1664" />
        </branch>
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2224" type="branch" />
            <wire x2="1712" y1="2224" y2="2224" x1="1664" />
        </branch>
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2160" type="branch" />
            <wire x2="1712" y1="2160" y2="2160" x1="1664" />
        </branch>
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2096" type="branch" />
            <wire x2="1712" y1="2096" y2="2096" x1="1664" />
        </branch>
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="2032" type="branch" />
            <wire x2="1712" y1="2032" y2="2032" x1="1664" />
        </branch>
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1968" type="branch" />
            <wire x2="1712" y1="1968" y2="1968" x1="1664" />
        </branch>
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1904" type="branch" />
            <wire x2="1712" y1="1904" y2="1904" x1="1664" />
        </branch>
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1840" type="branch" />
            <wire x2="1712" y1="1840" y2="1840" x1="1664" />
        </branch>
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1776" type="branch" />
            <wire x2="1712" y1="1776" y2="1776" x1="1664" />
        </branch>
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1688" y="1712" type="branch" />
            <wire x2="1712" y1="1712" y2="1712" x1="1664" />
        </branch>
        <instance x="1712" y="2480" name="XLXI_8" orien="R0" />
        <branch name="D(0:15)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2320" y="80" type="branch" />
            <wire x2="2320" y1="64" y2="80" x1="2320" />
            <wire x2="2320" y1="80" y2="112" x1="2320" />
            <wire x2="2320" y1="112" y2="176" x1="2320" />
            <wire x2="2320" y1="176" y2="240" x1="2320" />
            <wire x2="2320" y1="240" y2="304" x1="2320" />
            <wire x2="2320" y1="304" y2="368" x1="2320" />
            <wire x2="2320" y1="368" y2="432" x1="2320" />
            <wire x2="2320" y1="432" y2="496" x1="2320" />
            <wire x2="2320" y1="496" y2="560" x1="2320" />
            <wire x2="2320" y1="560" y2="624" x1="2320" />
            <wire x2="2320" y1="624" y2="688" x1="2320" />
            <wire x2="2320" y1="688" y2="752" x1="2320" />
            <wire x2="2320" y1="752" y2="816" x1="2320" />
            <wire x2="2320" y1="816" y2="928" x1="2320" />
        </branch>
        <branch name="D(0:15)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="832" y="96" type="branch" />
            <wire x2="832" y1="96" y2="128" x1="832" />
            <wire x2="832" y1="128" y2="192" x1="832" />
            <wire x2="832" y1="192" y2="256" x1="832" />
            <wire x2="832" y1="256" y2="320" x1="832" />
            <wire x2="832" y1="320" y2="384" x1="832" />
            <wire x2="832" y1="384" y2="448" x1="832" />
            <wire x2="832" y1="448" y2="512" x1="832" />
            <wire x2="832" y1="512" y2="576" x1="832" />
            <wire x2="832" y1="576" y2="640" x1="832" />
            <wire x2="832" y1="640" y2="704" x1="832" />
            <wire x2="832" y1="704" y2="768" x1="832" />
            <wire x2="832" y1="768" y2="832" x1="832" />
            <wire x2="832" y1="832" y2="896" x1="832" />
            <wire x2="832" y1="896" y2="928" x1="832" />
            <wire x2="832" y1="928" y2="960" x1="832" />
            <wire x2="832" y1="960" y2="992" x1="832" />
            <wire x2="832" y1="992" y2="1024" x1="832" />
            <wire x2="832" y1="1024" y2="1056" x1="832" />
            <wire x2="832" y1="1056" y2="1088" x1="832" />
            <wire x2="832" y1="1088" y2="1120" x1="832" />
            <wire x2="832" y1="1120" y2="1152" x1="832" />
            <wire x2="832" y1="1152" y2="1184" x1="832" />
            <wire x2="832" y1="1184" y2="1216" x1="832" />
            <wire x2="832" y1="1216" y2="1248" x1="832" />
            <wire x2="832" y1="1248" y2="1280" x1="832" />
            <wire x2="832" y1="1280" y2="1312" x1="832" />
            <wire x2="832" y1="1312" y2="1344" x1="832" />
            <wire x2="832" y1="1344" y2="1376" x1="832" />
            <wire x2="832" y1="1376" y2="1408" x1="832" />
            <wire x2="832" y1="1408" y2="1440" x1="832" />
            <wire x2="832" y1="1440" y2="1472" x1="832" />
            <wire x2="832" y1="1472" y2="1536" x1="832" />
            <wire x2="832" y1="1536" y2="1568" x1="832" />
            <wire x2="832" y1="1568" y2="1600" x1="832" />
            <wire x2="832" y1="1600" y2="1632" x1="832" />
            <wire x2="832" y1="1632" y2="1664" x1="832" />
            <wire x2="832" y1="1664" y2="1696" x1="832" />
            <wire x2="832" y1="1696" y2="1728" x1="832" />
            <wire x2="832" y1="1728" y2="1760" x1="832" />
            <wire x2="832" y1="1760" y2="1792" x1="832" />
            <wire x2="832" y1="1792" y2="1824" x1="832" />
            <wire x2="832" y1="1824" y2="1856" x1="832" />
            <wire x2="832" y1="1856" y2="1888" x1="832" />
            <wire x2="832" y1="1888" y2="1952" x1="832" />
            <wire x2="832" y1="1952" y2="2016" x1="832" />
            <wire x2="832" y1="2016" y2="2080" x1="832" />
            <wire x2="832" y1="2080" y2="2144" x1="832" />
            <wire x2="832" y1="2144" y2="2208" x1="832" />
            <wire x2="832" y1="2208" y2="2272" x1="832" />
            <wire x2="832" y1="2272" y2="2368" x1="832" />
        </branch>
        <branch name="D(0:15)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1568" y="96" type="branch" />
            <wire x2="1568" y1="80" y2="96" x1="1568" />
            <wire x2="1568" y1="96" y2="112" x1="1568" />
            <wire x2="1568" y1="112" y2="176" x1="1568" />
            <wire x2="1568" y1="176" y2="240" x1="1568" />
            <wire x2="1568" y1="240" y2="304" x1="1568" />
            <wire x2="1568" y1="304" y2="368" x1="1568" />
            <wire x2="1568" y1="368" y2="432" x1="1568" />
            <wire x2="1568" y1="432" y2="496" x1="1568" />
            <wire x2="1568" y1="496" y2="560" x1="1568" />
            <wire x2="1568" y1="560" y2="624" x1="1568" />
            <wire x2="1568" y1="624" y2="688" x1="1568" />
            <wire x2="1568" y1="688" y2="752" x1="1568" />
            <wire x2="1568" y1="752" y2="816" x1="1568" />
            <wire x2="1568" y1="816" y2="912" x1="1568" />
            <wire x2="1568" y1="912" y2="976" x1="1568" />
            <wire x2="1568" y1="976" y2="1040" x1="1568" />
            <wire x2="1568" y1="1040" y2="1104" x1="1568" />
            <wire x2="1568" y1="1104" y2="1168" x1="1568" />
            <wire x2="1568" y1="1168" y2="1232" x1="1568" />
            <wire x2="1568" y1="1232" y2="1296" x1="1568" />
            <wire x2="1568" y1="1296" y2="1360" x1="1568" />
            <wire x2="1568" y1="1360" y2="1424" x1="1568" />
            <wire x2="1568" y1="1424" y2="1488" x1="1568" />
            <wire x2="1568" y1="1488" y2="1552" x1="1568" />
            <wire x2="1568" y1="1552" y2="1616" x1="1568" />
            <wire x2="1568" y1="1616" y2="1712" x1="1568" />
            <wire x2="1568" y1="1712" y2="1776" x1="1568" />
            <wire x2="1568" y1="1776" y2="1840" x1="1568" />
            <wire x2="1568" y1="1840" y2="1904" x1="1568" />
            <wire x2="1568" y1="1904" y2="1968" x1="1568" />
            <wire x2="1568" y1="1968" y2="2032" x1="1568" />
            <wire x2="1568" y1="2032" y2="2096" x1="1568" />
            <wire x2="1568" y1="2096" y2="2160" x1="1568" />
            <wire x2="1568" y1="2160" y2="2224" x1="1568" />
            <wire x2="1568" y1="2224" y2="2288" x1="1568" />
            <wire x2="1568" y1="2288" y2="2352" x1="1568" />
            <wire x2="1568" y1="2352" y2="2416" x1="1568" />
            <wire x2="1568" y1="2416" y2="2480" x1="1568" />
        </branch>
        <iomarker fontsize="28" x="3216" y="2528" name="SEG(7:0)" orien="R0" />
        <instance x="960" y="2336" name="XLXI_5" orien="R0" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="1440" type="branch" />
            <wire x2="944" y1="1440" y2="1440" x1="928" />
            <wire x2="960" y1="1440" y2="1440" x1="944" />
        </branch>
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="944" y="928" type="branch" />
            <wire x2="944" y1="928" y2="928" x1="928" />
            <wire x2="960" y1="928" y2="928" x1="944" />
        </branch>
        <branch name="SEG(2)">
            <wire x2="1248" y1="1920" y2="1920" x1="1216" />
            <wire x2="1248" y1="1920" y2="2432" x1="1248" />
        </branch>
        <bustap x2="2016" y1="2528" y2="2432" x1="2016" />
        <branch name="SEG(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2000" y="2064" type="branch" />
            <wire x2="2000" y1="2064" y2="2064" x1="1968" />
            <wire x2="2016" y1="2064" y2="2064" x1="2000" />
            <wire x2="2016" y1="2064" y2="2432" x1="2016" />
        </branch>
        <bustap x2="2064" y1="2528" y2="2432" x1="2064" />
        <branch name="SEG(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2000" y="1264" type="branch" />
            <wire x2="2000" y1="1264" y2="1264" x1="1968" />
            <wire x2="2064" y1="1264" y2="1264" x1="2000" />
            <wire x2="2064" y1="1264" y2="2432" x1="2064" />
        </branch>
        <bustap x2="2112" y1="2528" y2="2432" x1="2112" />
        <branch name="SEG(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2000" y="464" type="branch" />
            <wire x2="2000" y1="464" y2="464" x1="1968" />
            <wire x2="2112" y1="464" y2="464" x1="2000" />
            <wire x2="2112" y1="464" y2="2432" x1="2112" />
        </branch>
        <bustap x2="2768" y1="2528" y2="2432" x1="2768" />
        <branch name="SEG(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2736" y="464" type="branch" />
            <wire x2="2736" y1="464" y2="464" x1="2720" />
            <wire x2="2768" y1="464" y2="464" x1="2736" />
            <wire x2="2768" y1="464" y2="2432" x1="2768" />
        </branch>
        <branch name="SEG(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3120" y="2528" type="branch" />
            <wire x2="640" y1="2528" y2="2528" x1="320" />
            <wire x2="1248" y1="2528" y2="2528" x1="640" />
            <wire x2="1296" y1="2528" y2="2528" x1="1248" />
            <wire x2="1344" y1="2528" y2="2528" x1="1296" />
            <wire x2="2016" y1="2528" y2="2528" x1="1344" />
            <wire x2="2064" y1="2528" y2="2528" x1="2016" />
            <wire x2="2112" y1="2528" y2="2528" x1="2064" />
            <wire x2="2768" y1="2528" y2="2528" x1="2112" />
            <wire x2="3120" y1="2528" y2="2528" x1="2768" />
            <wire x2="3216" y1="2528" y2="2528" x1="3120" />
        </branch>
        <branch name="SEG(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1264" y="480" type="branch" />
            <wire x2="1264" y1="480" y2="480" x1="1216" />
            <wire x2="1520" y1="480" y2="480" x1="1264" />
            <wire x2="1520" y1="480" y2="2432" x1="1520" />
            <wire x2="1520" y1="2432" y2="2432" x1="1344" />
        </branch>
        <bustap x2="1344" y1="2528" y2="2432" x1="1344" />
        <bustap x2="1296" y1="2528" y2="2432" x1="1296" />
        <bustap x2="1248" y1="2528" y2="2432" x1="1248" />
        <instance x="288" y="2144" name="XLXI_10" orien="R0" />
        <bustap x2="640" y1="2528" y2="2432" x1="640" />
        <branch name="SEG(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="608" y="2048" type="branch" />
            <wire x2="608" y1="2048" y2="2048" x1="544" />
            <wire x2="640" y1="2048" y2="2048" x1="608" />
            <wire x2="640" y1="2048" y2="2432" x1="640" />
        </branch>
        <branch name="DP">
            <wire x2="288" y1="2080" y2="2080" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="2080" name="DP" orien="R180" />
        <branch name="NZ">
            <wire x2="3296" y1="1904" y2="1904" x1="3184" />
        </branch>
        <iomarker fontsize="28" x="3296" y="1904" name="NZ" orien="R0" />
        <branch name="E">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1936" type="branch" />
            <wire x2="2896" y1="1936" y2="1936" x1="2848" />
            <wire x2="2928" y1="1936" y2="1936" x1="2896" />
        </branch>
        <instance x="2480" y="1904" name="XLXI_12" orien="R0" />
        <branch name="XLXN_155">
            <wire x2="2928" y1="1872" y2="1872" x1="2704" />
        </branch>
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2400" y="1872" type="branch" />
            <wire x2="2400" y1="1872" y2="1872" x1="2352" />
            <wire x2="2480" y1="1872" y2="1872" x1="2400" />
        </branch>
        <instance x="2928" y="2000" name="XLXI_11" orien="R0" />
        <branch name="SEG(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1312" y="1808" type="branch" />
            <wire x2="1312" y1="2432" y2="2432" x1="1296" />
            <wire x2="1312" y1="1808" y2="2432" x1="1312" />
            <wire x2="1376" y1="1808" y2="1808" x1="1312" />
            <wire x2="1376" y1="1584" y2="1808" x1="1376" />
        </branch>
        <branch name="XLXN_156">
            <wire x2="1408" y1="1184" y2="1184" x1="1216" />
            <wire x2="1408" y1="1184" y2="1328" x1="1408" />
        </branch>
        <instance x="960" y="1504" name="XLXI_4" orien="R0" />
        <instance x="1280" y="1328" name="XLXI_13" orien="R90" />
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1344" y="1296" type="branch" />
            <wire x2="1344" y1="1280" y2="1296" x1="1344" />
            <wire x2="1344" y1="1296" y2="1328" x1="1344" />
        </branch>
    </sheet>
</drawing>