<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="I(15:0)" />
        <signal name="I(31:16)" />
        <signal name="DL0(7:0)" />
        <signal name="DL1(7:0)" />
        <signal name="DL2(7:0)" />
        <signal name="DL3(7:0)" />
        <signal name="DH0(7:0)" />
        <signal name="DH1(7:0)" />
        <signal name="DH2(7:0)" />
        <signal name="DH3(7:0)" />
        <signal name="S" />
        <signal name="DL3(7:0),DL2(7:0),DL1(7:0),DL0(7:0)" />
        <signal name="DH3(7:0),DH2(7:0),DH1(7:0),DH0(7:0)" />
        <signal name="D3(7:0),D2(7:0),D1(7:0),D0(7:0)" />
        <signal name="D0(7:0)" />
        <signal name="D1(7:0)" />
        <signal name="D2(7:0)" />
        <signal name="D3(7:0)" />
        <signal name="I(31:0)" />
        <port polarity="Input" name="S" />
        <port polarity="Output" name="D0(7:0)" />
        <port polarity="Output" name="D1(7:0)" />
        <port polarity="Output" name="D2(7:0)" />
        <port polarity="Output" name="D3(7:0)" />
        <port polarity="Input" name="I(31:0)" />
        <blockdef name="word2seg">
            <timestamp>2016-4-25T15:34:13</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
        </blockdef>
        <blockdef name="mx2_1_32">
            <timestamp>2016-4-18T12:41:16</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="word2seg" name="XLXI_1">
            <blockpin signalname="DL0(7:0)" name="D0(7:0)" />
            <blockpin signalname="DL1(7:0)" name="D1(7:0)" />
            <blockpin signalname="DL2(7:0)" name="D2(7:0)" />
            <blockpin signalname="DL3(7:0)" name="D3(7:0)" />
            <blockpin signalname="I(15:0)" name="I(15:0)" />
        </block>
        <block symbolname="mx2_1_32" name="XLXI_3">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="DL3(7:0),DL2(7:0),DL1(7:0),DL0(7:0)" name="I0(31:0)" />
            <blockpin signalname="DH3(7:0),DH2(7:0),DH1(7:0),DH0(7:0)" name="I1(31:0)" />
            <blockpin signalname="D3(7:0),D2(7:0),D1(7:0),D0(7:0)" name="O(31:0)" />
        </block>
        <block symbolname="word2seg" name="XLXI_4">
            <blockpin signalname="DH0(7:0)" name="D0(7:0)" />
            <blockpin signalname="DH1(7:0)" name="D1(7:0)" />
            <blockpin signalname="DH2(7:0)" name="D2(7:0)" />
            <blockpin signalname="DH3(7:0)" name="D3(7:0)" />
            <blockpin signalname="I(31:16)" name="I(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="I(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="544" type="branch" />
            <wire x2="768" y1="544" y2="544" x1="720" />
            <wire x2="832" y1="544" y2="544" x1="768" />
        </branch>
        <branch name="I(31:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="784" y="880" type="branch" />
            <wire x2="784" y1="880" y2="880" x1="704" />
            <wire x2="832" y1="880" y2="880" x1="784" />
        </branch>
        <instance x="832" y="768" name="XLXI_1" orien="R0">
        </instance>
        <instance x="832" y="1104" name="XLXI_4" orien="R0">
        </instance>
        <branch name="DL0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="544" type="branch" />
            <wire x2="1296" y1="544" y2="544" x1="1216" />
            <wire x2="1360" y1="544" y2="544" x1="1296" />
        </branch>
        <branch name="DL1(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="608" type="branch" />
            <wire x2="1296" y1="608" y2="608" x1="1216" />
            <wire x2="1360" y1="608" y2="608" x1="1296" />
        </branch>
        <branch name="DL2(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="672" type="branch" />
            <wire x2="1296" y1="672" y2="672" x1="1216" />
            <wire x2="1360" y1="672" y2="672" x1="1296" />
        </branch>
        <branch name="DL3(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="736" type="branch" />
            <wire x2="1312" y1="736" y2="736" x1="1216" />
            <wire x2="1360" y1="736" y2="736" x1="1312" />
        </branch>
        <branch name="DH0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="880" type="branch" />
            <wire x2="1296" y1="880" y2="880" x1="1216" />
            <wire x2="1360" y1="880" y2="880" x1="1296" />
        </branch>
        <branch name="DH1(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="944" type="branch" />
            <wire x2="1296" y1="944" y2="944" x1="1216" />
            <wire x2="1360" y1="944" y2="944" x1="1296" />
        </branch>
        <branch name="DH2(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1008" type="branch" />
            <wire x2="1296" y1="1008" y2="1008" x1="1216" />
            <wire x2="1360" y1="1008" y2="1008" x1="1296" />
        </branch>
        <branch name="DH3(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1072" type="branch" />
            <wire x2="1296" y1="1072" y2="1072" x1="1216" />
            <wire x2="1360" y1="1072" y2="1072" x1="1296" />
        </branch>
        <branch name="S">
            <wire x2="1600" y1="1312" y2="1312" x1="528" />
            <wire x2="2160" y1="912" y2="912" x1="1600" />
            <wire x2="1600" y1="912" y2="1312" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="528" y="1312" name="S" orien="R180" />
        <branch name="DL3(7:0),DL2(7:0),DL1(7:0),DL0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="784" type="branch" />
            <wire x2="1856" y1="784" y2="784" x1="1600" />
            <wire x2="2160" y1="784" y2="784" x1="1856" />
        </branch>
        <branch name="DH3(7:0),DH2(7:0),DH1(7:0),DH0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="848" type="branch" />
            <wire x2="1856" y1="848" y2="848" x1="1600" />
            <wire x2="2160" y1="848" y2="848" x1="1856" />
        </branch>
        <branch name="D3(7:0),D2(7:0),D1(7:0),D0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2816" y="784" type="branch" />
            <wire x2="2816" y1="784" y2="784" x1="2544" />
            <wire x2="3040" y1="784" y2="784" x1="2816" />
        </branch>
        <branch name="D0(7:0)">
            <wire x2="2752" y1="1184" y2="1184" x1="2624" />
        </branch>
        <branch name="D1(7:0)">
            <wire x2="2752" y1="1264" y2="1264" x1="2624" />
        </branch>
        <branch name="D2(7:0)">
            <wire x2="2752" y1="1344" y2="1344" x1="2624" />
        </branch>
        <branch name="D3(7:0)">
            <wire x2="2752" y1="1424" y2="1424" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1184" name="D0(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2752" y="1264" name="D1(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2752" y="1344" name="D2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2752" y="1424" name="D3(7:0)" orien="R0" />
        <instance x="2160" y="944" name="XLXI_3" orien="R0">
        </instance>
        <branch name="I(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="544" type="branch" />
            <wire x2="544" y1="544" y2="544" x1="464" />
            <wire x2="624" y1="544" y2="544" x1="544" />
        </branch>
        <iomarker fontsize="28" x="464" y="544" name="I(31:0)" orien="R180" />
    </sheet>
</drawing>