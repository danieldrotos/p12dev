<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S" />
        <signal name="I0(0)" />
        <signal name="I1(0)" />
        <signal name="I0(1)" />
        <signal name="I1(1)" />
        <signal name="I0(8)" />
        <signal name="I1(8)" />
        <signal name="I0(9)" />
        <signal name="I1(9)" />
        <signal name="I0(16)" />
        <signal name="I1(16)" />
        <signal name="I0(17)" />
        <signal name="I1(17)" />
        <signal name="I0(24)" />
        <signal name="I1(24)" />
        <signal name="I0(25)" />
        <signal name="I1(25)" />
        <signal name="I0(2)" />
        <signal name="I1(2)" />
        <signal name="I0(3)" />
        <signal name="I1(3)" />
        <signal name="I0(10)" />
        <signal name="I1(10)" />
        <signal name="I0(11)" />
        <signal name="I1(11)" />
        <signal name="I0(18)" />
        <signal name="I1(18)" />
        <signal name="I0(19)" />
        <signal name="I1(19)" />
        <signal name="I0(26)" />
        <signal name="I1(26)" />
        <signal name="I0(27)" />
        <signal name="I1(27)" />
        <signal name="I0(4)" />
        <signal name="I1(4)" />
        <signal name="I0(5)" />
        <signal name="I1(5)" />
        <signal name="I0(12)" />
        <signal name="I1(12)" />
        <signal name="I0(13)" />
        <signal name="I1(13)" />
        <signal name="I0(20)" />
        <signal name="I1(20)" />
        <signal name="I1(21)" />
        <signal name="I0(28)" />
        <signal name="I1(28)" />
        <signal name="I0(29)" />
        <signal name="I1(29)" />
        <signal name="I0(6)" />
        <signal name="I1(6)" />
        <signal name="I0(7)" />
        <signal name="I1(7)" />
        <signal name="I0(14)" />
        <signal name="I1(14)" />
        <signal name="I0(15)" />
        <signal name="I1(15)" />
        <signal name="I0(21)" />
        <signal name="I1(22)" />
        <signal name="I0(23)" />
        <signal name="I1(23)" />
        <signal name="I0(30)" />
        <signal name="I1(30)" />
        <signal name="I0(31)" />
        <signal name="I1(31)" />
        <signal name="O(0)" />
        <signal name="O(1)" />
        <signal name="O(2)" />
        <signal name="O(3)" />
        <signal name="O(4)" />
        <signal name="O(5)" />
        <signal name="O(6)" />
        <signal name="O(7)" />
        <signal name="O(8)" />
        <signal name="O(9)" />
        <signal name="O(10)" />
        <signal name="O(11)" />
        <signal name="O(12)" />
        <signal name="O(13)" />
        <signal name="O(14)" />
        <signal name="O(15)" />
        <signal name="O(16)" />
        <signal name="O(17)" />
        <signal name="O(18)" />
        <signal name="O(19)" />
        <signal name="O(20)" />
        <signal name="O(21)" />
        <signal name="O(22)" />
        <signal name="O(23)" />
        <signal name="O(24)" />
        <signal name="O(25)" />
        <signal name="O(26)" />
        <signal name="O(27)" />
        <signal name="O(28)" />
        <signal name="O(29)" />
        <signal name="O(30)" />
        <signal name="O(31)" />
        <signal name="O(31:0)" />
        <signal name="I0(31:0)" />
        <signal name="I1(31:0)" />
        <signal name="I0(22)" />
        <port polarity="Input" name="S" />
        <port polarity="Output" name="O(31:0)" />
        <port polarity="Input" name="I0(31:0)" />
        <port polarity="Input" name="I1(31:0)" />
        <blockdef name="mx2_1">
            <timestamp>2016-4-18T12:41:42</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="256" y1="-64" y2="-64" x1="96" />
            <line x2="256" y1="-192" y2="-64" x1="256" />
            <line x2="256" y1="-192" y2="-192" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-32" y2="-64" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <block symbolname="mx2_1" name="XLXI_33">
            <blockpin signalname="I0(0)" name="D0" />
            <blockpin signalname="I1(0)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_34">
            <blockpin signalname="I0(1)" name="D0" />
            <blockpin signalname="I1(1)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_35">
            <blockpin signalname="I0(2)" name="D0" />
            <blockpin signalname="I1(2)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_36">
            <blockpin signalname="I0(3)" name="D0" />
            <blockpin signalname="I1(3)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_37">
            <blockpin signalname="I0(4)" name="D0" />
            <blockpin signalname="I1(4)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(4)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_38">
            <blockpin signalname="I0(5)" name="D0" />
            <blockpin signalname="I1(5)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(5)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_39">
            <blockpin signalname="I0(6)" name="D0" />
            <blockpin signalname="I1(6)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(6)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_40">
            <blockpin signalname="I0(7)" name="D0" />
            <blockpin signalname="I1(7)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(7)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_41">
            <blockpin signalname="I0(15)" name="D0" />
            <blockpin signalname="I1(15)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(15)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_42">
            <blockpin signalname="I0(14)" name="D0" />
            <blockpin signalname="I1(14)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(14)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_43">
            <blockpin signalname="I0(13)" name="D0" />
            <blockpin signalname="I1(13)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(13)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_44">
            <blockpin signalname="I0(12)" name="D0" />
            <blockpin signalname="I1(12)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(12)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_45">
            <blockpin signalname="I0(11)" name="D0" />
            <blockpin signalname="I1(11)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(11)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_46">
            <blockpin signalname="I0(10)" name="D0" />
            <blockpin signalname="I1(10)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(10)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_47">
            <blockpin signalname="I0(9)" name="D0" />
            <blockpin signalname="I1(9)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(9)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_48">
            <blockpin signalname="I0(8)" name="D0" />
            <blockpin signalname="I1(8)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(8)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_49">
            <blockpin signalname="I0(16)" name="D0" />
            <blockpin signalname="I1(16)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(16)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_50">
            <blockpin signalname="I0(24)" name="D0" />
            <blockpin signalname="I1(24)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(24)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_51">
            <blockpin signalname="I0(25)" name="D0" />
            <blockpin signalname="I1(25)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(25)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_52">
            <blockpin signalname="I0(26)" name="D0" />
            <blockpin signalname="I1(26)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(26)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_53">
            <blockpin signalname="I0(17)" name="D0" />
            <blockpin signalname="I1(17)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(17)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_54">
            <blockpin signalname="I0(18)" name="D0" />
            <blockpin signalname="I1(18)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(18)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_55">
            <blockpin signalname="I0(19)" name="D0" />
            <blockpin signalname="I1(19)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(19)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_56">
            <blockpin signalname="I0(27)" name="D0" />
            <blockpin signalname="I1(27)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(27)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_57">
            <blockpin signalname="I0(20)" name="D0" />
            <blockpin signalname="I1(20)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(20)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_58">
            <blockpin signalname="I0(21)" name="D0" />
            <blockpin signalname="I1(21)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(21)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_59">
            <blockpin signalname="I0(28)" name="D0" />
            <blockpin signalname="I1(28)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(28)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_60">
            <blockpin signalname="I0(29)" name="D0" />
            <blockpin signalname="I1(29)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(29)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_61">
            <blockpin signalname="I0(22)" name="D0" />
            <blockpin signalname="I1(22)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(22)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_62">
            <blockpin signalname="I0(23)" name="D0" />
            <blockpin signalname="I1(23)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(23)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_63">
            <blockpin signalname="I0(30)" name="D0" />
            <blockpin signalname="I1(30)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(30)" name="O" />
        </block>
        <block symbolname="mx2_1" name="XLXI_64">
            <blockpin signalname="I0(31)" name="D0" />
            <blockpin signalname="I1(31)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(31)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="S">
            <wire x2="592" y1="528" y2="528" x1="208" />
            <wire x2="640" y1="528" y2="528" x1="592" />
            <wire x2="592" y1="528" y2="752" x1="592" />
            <wire x2="640" y1="752" y2="752" x1="592" />
            <wire x2="592" y1="752" y2="1056" x1="592" />
            <wire x2="640" y1="1056" y2="1056" x1="592" />
            <wire x2="592" y1="1056" y2="1280" x1="592" />
            <wire x2="640" y1="1280" y2="1280" x1="592" />
            <wire x2="592" y1="1280" y2="1616" x1="592" />
            <wire x2="656" y1="1616" y2="1616" x1="592" />
            <wire x2="592" y1="1616" y2="1840" x1="592" />
            <wire x2="656" y1="1840" y2="1840" x1="592" />
            <wire x2="592" y1="1840" y2="2144" x1="592" />
            <wire x2="656" y1="2144" y2="2144" x1="592" />
            <wire x2="592" y1="2144" y2="2368" x1="592" />
            <wire x2="656" y1="2368" y2="2368" x1="592" />
            <wire x2="592" y1="2368" y2="2544" x1="592" />
            <wire x2="1504" y1="2544" y2="2544" x1="592" />
            <wire x2="2432" y1="2544" y2="2544" x1="1504" />
            <wire x2="3312" y1="2544" y2="2544" x1="2432" />
            <wire x2="1536" y1="576" y2="576" x1="1504" />
            <wire x2="1504" y1="576" y2="800" x1="1504" />
            <wire x2="1536" y1="800" y2="800" x1="1504" />
            <wire x2="1504" y1="800" y2="1104" x1="1504" />
            <wire x2="1536" y1="1104" y2="1104" x1="1504" />
            <wire x2="1504" y1="1104" y2="1328" x1="1504" />
            <wire x2="1536" y1="1328" y2="1328" x1="1504" />
            <wire x2="1504" y1="1328" y2="1664" x1="1504" />
            <wire x2="1552" y1="1664" y2="1664" x1="1504" />
            <wire x2="1504" y1="1664" y2="1888" x1="1504" />
            <wire x2="1552" y1="1888" y2="1888" x1="1504" />
            <wire x2="1504" y1="1888" y2="2192" x1="1504" />
            <wire x2="1552" y1="2192" y2="2192" x1="1504" />
            <wire x2="1504" y1="2192" y2="2416" x1="1504" />
            <wire x2="1504" y1="2416" y2="2544" x1="1504" />
            <wire x2="1552" y1="2416" y2="2416" x1="1504" />
            <wire x2="2448" y1="576" y2="576" x1="2432" />
            <wire x2="2432" y1="576" y2="800" x1="2432" />
            <wire x2="2448" y1="800" y2="800" x1="2432" />
            <wire x2="2432" y1="800" y2="1104" x1="2432" />
            <wire x2="2448" y1="1104" y2="1104" x1="2432" />
            <wire x2="2432" y1="1104" y2="1328" x1="2432" />
            <wire x2="2448" y1="1328" y2="1328" x1="2432" />
            <wire x2="2432" y1="1328" y2="1664" x1="2432" />
            <wire x2="2464" y1="1664" y2="1664" x1="2432" />
            <wire x2="2432" y1="1664" y2="1888" x1="2432" />
            <wire x2="2464" y1="1888" y2="1888" x1="2432" />
            <wire x2="2432" y1="1888" y2="2192" x1="2432" />
            <wire x2="2464" y1="2192" y2="2192" x1="2432" />
            <wire x2="2432" y1="2192" y2="2416" x1="2432" />
            <wire x2="2464" y1="2416" y2="2416" x1="2432" />
            <wire x2="2432" y1="2416" y2="2544" x1="2432" />
            <wire x2="3344" y1="624" y2="624" x1="3312" />
            <wire x2="3312" y1="624" y2="848" x1="3312" />
            <wire x2="3344" y1="848" y2="848" x1="3312" />
            <wire x2="3312" y1="848" y2="1152" x1="3312" />
            <wire x2="3344" y1="1152" y2="1152" x1="3312" />
            <wire x2="3312" y1="1152" y2="1376" x1="3312" />
            <wire x2="3344" y1="1376" y2="1376" x1="3312" />
            <wire x2="3312" y1="1376" y2="1712" x1="3312" />
            <wire x2="3360" y1="1712" y2="1712" x1="3312" />
            <wire x2="3312" y1="1712" y2="1936" x1="3312" />
            <wire x2="3360" y1="1936" y2="1936" x1="3312" />
            <wire x2="3312" y1="1936" y2="2240" x1="3312" />
            <wire x2="3360" y1="2240" y2="2240" x1="3312" />
            <wire x2="3312" y1="2240" y2="2464" x1="3312" />
            <wire x2="3360" y1="2464" y2="2464" x1="3312" />
            <wire x2="3312" y1="2464" y2="2544" x1="3312" />
        </branch>
        <branch name="I0(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="496" y="400" type="branch" />
            <wire x2="496" y1="400" y2="400" x1="432" />
            <wire x2="640" y1="400" y2="400" x1="496" />
        </branch>
        <branch name="I1(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="464" type="branch" />
            <wire x2="480" y1="464" y2="464" x1="432" />
            <wire x2="640" y1="464" y2="464" x1="480" />
        </branch>
        <branch name="I0(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="624" type="branch" />
            <wire x2="480" y1="624" y2="624" x1="432" />
            <wire x2="640" y1="624" y2="624" x1="480" />
        </branch>
        <branch name="I1(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="688" type="branch" />
            <wire x2="464" y1="688" y2="688" x1="432" />
            <wire x2="640" y1="688" y2="688" x1="464" />
        </branch>
        <branch name="I0(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="448" type="branch" />
            <wire x2="1376" y1="448" y2="448" x1="1328" />
            <wire x2="1536" y1="448" y2="448" x1="1376" />
        </branch>
        <branch name="I1(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="512" type="branch" />
            <wire x2="1376" y1="512" y2="512" x1="1328" />
            <wire x2="1536" y1="512" y2="512" x1="1376" />
        </branch>
        <branch name="I0(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="672" type="branch" />
            <wire x2="1376" y1="672" y2="672" x1="1328" />
            <wire x2="1536" y1="672" y2="672" x1="1376" />
        </branch>
        <branch name="I1(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="736" type="branch" />
            <wire x2="1376" y1="736" y2="736" x1="1328" />
            <wire x2="1536" y1="736" y2="736" x1="1376" />
        </branch>
        <branch name="I0(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="448" type="branch" />
            <wire x2="2272" y1="448" y2="448" x1="2240" />
            <wire x2="2448" y1="448" y2="448" x1="2272" />
        </branch>
        <branch name="I1(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="512" type="branch" />
            <wire x2="2288" y1="512" y2="512" x1="2240" />
            <wire x2="2448" y1="512" y2="512" x1="2288" />
        </branch>
        <branch name="I0(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="672" type="branch" />
            <wire x2="2288" y1="672" y2="672" x1="2240" />
            <wire x2="2448" y1="672" y2="672" x1="2288" />
        </branch>
        <branch name="I1(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="736" type="branch" />
            <wire x2="2272" y1="736" y2="736" x1="2240" />
            <wire x2="2448" y1="736" y2="736" x1="2272" />
        </branch>
        <branch name="I0(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="496" type="branch" />
            <wire x2="3184" y1="496" y2="496" x1="3136" />
            <wire x2="3344" y1="496" y2="496" x1="3184" />
        </branch>
        <branch name="I1(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3168" y="560" type="branch" />
            <wire x2="3168" y1="560" y2="560" x1="3136" />
            <wire x2="3344" y1="560" y2="560" x1="3168" />
        </branch>
        <branch name="I0(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="720" type="branch" />
            <wire x2="3184" y1="720" y2="720" x1="3136" />
            <wire x2="3344" y1="720" y2="720" x1="3184" />
        </branch>
        <branch name="I1(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="784" type="branch" />
            <wire x2="3184" y1="784" y2="784" x1="3136" />
            <wire x2="3344" y1="784" y2="784" x1="3184" />
        </branch>
        <branch name="I0(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="928" type="branch" />
            <wire x2="464" y1="928" y2="928" x1="432" />
            <wire x2="640" y1="928" y2="928" x1="464" />
        </branch>
        <branch name="I1(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="992" type="branch" />
            <wire x2="464" y1="992" y2="992" x1="432" />
            <wire x2="640" y1="992" y2="992" x1="464" />
        </branch>
        <branch name="I0(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1152" type="branch" />
            <wire x2="464" y1="1152" y2="1152" x1="432" />
            <wire x2="640" y1="1152" y2="1152" x1="464" />
        </branch>
        <branch name="I1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1216" type="branch" />
            <wire x2="464" y1="1216" y2="1216" x1="432" />
            <wire x2="640" y1="1216" y2="1216" x1="464" />
        </branch>
        <branch name="I0(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="976" type="branch" />
            <wire x2="1376" y1="976" y2="976" x1="1328" />
            <wire x2="1536" y1="976" y2="976" x1="1376" />
        </branch>
        <branch name="I1(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1040" type="branch" />
            <wire x2="1376" y1="1040" y2="1040" x1="1328" />
            <wire x2="1536" y1="1040" y2="1040" x1="1376" />
        </branch>
        <branch name="I0(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="1200" type="branch" />
            <wire x2="1360" y1="1200" y2="1200" x1="1328" />
            <wire x2="1536" y1="1200" y2="1200" x1="1360" />
        </branch>
        <branch name="I1(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1264" type="branch" />
            <wire x2="1376" y1="1264" y2="1264" x1="1328" />
            <wire x2="1536" y1="1264" y2="1264" x1="1376" />
        </branch>
        <branch name="I0(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="976" type="branch" />
            <wire x2="2272" y1="976" y2="976" x1="2240" />
            <wire x2="2448" y1="976" y2="976" x1="2272" />
        </branch>
        <branch name="I1(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1040" type="branch" />
            <wire x2="2272" y1="1040" y2="1040" x1="2240" />
            <wire x2="2448" y1="1040" y2="1040" x1="2272" />
        </branch>
        <branch name="I0(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1200" type="branch" />
            <wire x2="2272" y1="1200" y2="1200" x1="2240" />
            <wire x2="2448" y1="1200" y2="1200" x1="2272" />
        </branch>
        <branch name="I1(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1264" type="branch" />
            <wire x2="2272" y1="1264" y2="1264" x1="2240" />
            <wire x2="2448" y1="1264" y2="1264" x1="2272" />
        </branch>
        <branch name="I0(26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1024" type="branch" />
            <wire x2="3184" y1="1024" y2="1024" x1="3136" />
            <wire x2="3344" y1="1024" y2="1024" x1="3184" />
        </branch>
        <branch name="I1(26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1088" type="branch" />
            <wire x2="3184" y1="1088" y2="1088" x1="3136" />
            <wire x2="3344" y1="1088" y2="1088" x1="3184" />
        </branch>
        <branch name="I0(27)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1248" type="branch" />
            <wire x2="3184" y1="1248" y2="1248" x1="3136" />
            <wire x2="3344" y1="1248" y2="1248" x1="3184" />
        </branch>
        <branch name="I1(27)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3168" y="1312" type="branch" />
            <wire x2="3168" y1="1312" y2="1312" x1="3136" />
            <wire x2="3344" y1="1312" y2="1312" x1="3168" />
        </branch>
        <branch name="I0(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="496" y="1488" type="branch" />
            <wire x2="496" y1="1488" y2="1488" x1="448" />
            <wire x2="656" y1="1488" y2="1488" x1="496" />
        </branch>
        <branch name="I1(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1552" type="branch" />
            <wire x2="480" y1="1552" y2="1552" x1="448" />
            <wire x2="656" y1="1552" y2="1552" x1="480" />
        </branch>
        <branch name="I0(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1712" type="branch" />
            <wire x2="480" y1="1712" y2="1712" x1="448" />
            <wire x2="656" y1="1712" y2="1712" x1="480" />
        </branch>
        <branch name="I1(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="496" y="1776" type="branch" />
            <wire x2="496" y1="1776" y2="1776" x1="448" />
            <wire x2="656" y1="1776" y2="1776" x1="496" />
        </branch>
        <branch name="I0(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1536" type="branch" />
            <wire x2="1376" y1="1536" y2="1536" x1="1344" />
            <wire x2="1552" y1="1536" y2="1536" x1="1376" />
        </branch>
        <branch name="I1(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1600" type="branch" />
            <wire x2="1376" y1="1600" y2="1600" x1="1344" />
            <wire x2="1552" y1="1600" y2="1600" x1="1376" />
        </branch>
        <branch name="I0(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1392" y="1760" type="branch" />
            <wire x2="1392" y1="1760" y2="1760" x1="1344" />
            <wire x2="1552" y1="1760" y2="1760" x1="1392" />
        </branch>
        <branch name="I1(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1824" type="branch" />
            <wire x2="1376" y1="1824" y2="1824" x1="1344" />
            <wire x2="1552" y1="1824" y2="1824" x1="1376" />
        </branch>
        <branch name="I0(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="1536" type="branch" />
            <wire x2="2288" y1="1536" y2="1536" x1="2256" />
            <wire x2="2464" y1="1536" y2="1536" x1="2288" />
        </branch>
        <branch name="I1(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="1600" type="branch" />
            <wire x2="2288" y1="1600" y2="1600" x1="2256" />
            <wire x2="2464" y1="1600" y2="1600" x1="2288" />
        </branch>
        <branch name="I0(21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="1760" type="branch" />
            <wire x2="2288" y1="1760" y2="1760" x1="2256" />
            <wire x2="2464" y1="1760" y2="1760" x1="2288" />
        </branch>
        <branch name="I1(21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="1824" type="branch" />
            <wire x2="2288" y1="1824" y2="1824" x1="2256" />
            <wire x2="2464" y1="1824" y2="1824" x1="2288" />
        </branch>
        <branch name="I0(28)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1584" type="branch" />
            <wire x2="3184" y1="1584" y2="1584" x1="3152" />
            <wire x2="3360" y1="1584" y2="1584" x1="3184" />
        </branch>
        <branch name="I1(28)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1648" type="branch" />
            <wire x2="3184" y1="1648" y2="1648" x1="3152" />
            <wire x2="3360" y1="1648" y2="1648" x1="3184" />
        </branch>
        <branch name="I0(29)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1808" type="branch" />
            <wire x2="3184" y1="1808" y2="1808" x1="3152" />
            <wire x2="3360" y1="1808" y2="1808" x1="3184" />
        </branch>
        <branch name="I1(29)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="1872" type="branch" />
            <wire x2="3184" y1="1872" y2="1872" x1="3152" />
            <wire x2="3360" y1="1872" y2="1872" x1="3184" />
        </branch>
        <branch name="I0(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2016" type="branch" />
            <wire x2="480" y1="2016" y2="2016" x1="448" />
            <wire x2="656" y1="2016" y2="2016" x1="480" />
        </branch>
        <branch name="I1(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2080" type="branch" />
            <wire x2="480" y1="2080" y2="2080" x1="448" />
            <wire x2="656" y1="2080" y2="2080" x1="480" />
        </branch>
        <branch name="I0(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2240" type="branch" />
            <wire x2="480" y1="2240" y2="2240" x1="448" />
            <wire x2="656" y1="2240" y2="2240" x1="480" />
        </branch>
        <branch name="I1(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="496" y="2304" type="branch" />
            <wire x2="496" y1="2304" y2="2304" x1="448" />
            <wire x2="656" y1="2304" y2="2304" x1="496" />
        </branch>
        <branch name="I0(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="2064" type="branch" />
            <wire x2="1376" y1="2064" y2="2064" x1="1344" />
            <wire x2="1552" y1="2064" y2="2064" x1="1376" />
        </branch>
        <branch name="I1(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="2128" type="branch" />
            <wire x2="1376" y1="2128" y2="2128" x1="1344" />
            <wire x2="1552" y1="2128" y2="2128" x1="1376" />
        </branch>
        <branch name="I0(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1392" y="2288" type="branch" />
            <wire x2="1392" y1="2288" y2="2288" x1="1344" />
            <wire x2="1552" y1="2288" y2="2288" x1="1392" />
        </branch>
        <branch name="I1(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1392" y="2352" type="branch" />
            <wire x2="1392" y1="2352" y2="2352" x1="1344" />
            <wire x2="1552" y1="2352" y2="2352" x1="1392" />
        </branch>
        <branch name="I0(22)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="2064" type="branch" />
            <wire x2="2288" y1="2064" y2="2064" x1="2256" />
            <wire x2="2464" y1="2064" y2="2064" x1="2288" />
        </branch>
        <branch name="I1(22)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="2128" type="branch" />
            <wire x2="2288" y1="2128" y2="2128" x1="2256" />
            <wire x2="2464" y1="2128" y2="2128" x1="2288" />
        </branch>
        <branch name="I0(23)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="2288" type="branch" />
            <wire x2="2288" y1="2288" y2="2288" x1="2256" />
            <wire x2="2464" y1="2288" y2="2288" x1="2288" />
        </branch>
        <branch name="I1(23)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="2352" type="branch" />
            <wire x2="2288" y1="2352" y2="2352" x1="2256" />
            <wire x2="2464" y1="2352" y2="2352" x1="2288" />
        </branch>
        <branch name="I0(30)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2112" type="branch" />
            <wire x2="3184" y1="2112" y2="2112" x1="3152" />
            <wire x2="3360" y1="2112" y2="2112" x1="3184" />
        </branch>
        <branch name="I1(30)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2176" type="branch" />
            <wire x2="3184" y1="2176" y2="2176" x1="3152" />
            <wire x2="3360" y1="2176" y2="2176" x1="3184" />
        </branch>
        <branch name="I0(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="2336" type="branch" />
            <wire x2="3200" y1="2336" y2="2336" x1="3152" />
            <wire x2="3360" y1="2336" y2="2336" x1="3200" />
        </branch>
        <branch name="I1(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2400" type="branch" />
            <wire x2="3184" y1="2400" y2="2400" x1="3152" />
            <wire x2="3360" y1="2400" y2="2400" x1="3184" />
        </branch>
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="432" type="branch" />
            <wire x2="1040" y1="432" y2="432" x1="960" />
            <wire x2="1088" y1="432" y2="432" x1="1040" />
        </branch>
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="656" type="branch" />
            <wire x2="1040" y1="656" y2="656" x1="960" />
            <wire x2="1088" y1="656" y2="656" x1="1040" />
        </branch>
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="960" type="branch" />
            <wire x2="1040" y1="960" y2="960" x1="960" />
            <wire x2="1088" y1="960" y2="960" x1="1040" />
        </branch>
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="1184" type="branch" />
            <wire x2="1040" y1="1184" y2="1184" x1="960" />
            <wire x2="1088" y1="1184" y2="1184" x1="1040" />
        </branch>
        <branch name="O(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="1520" type="branch" />
            <wire x2="1056" y1="1520" y2="1520" x1="976" />
            <wire x2="1104" y1="1520" y2="1520" x1="1056" />
        </branch>
        <branch name="O(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="1744" type="branch" />
            <wire x2="1056" y1="1744" y2="1744" x1="976" />
            <wire x2="1104" y1="1744" y2="1744" x1="1056" />
        </branch>
        <branch name="O(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="2048" type="branch" />
            <wire x2="1056" y1="2048" y2="2048" x1="976" />
            <wire x2="1104" y1="2048" y2="2048" x1="1056" />
        </branch>
        <branch name="O(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1072" y="2272" type="branch" />
            <wire x2="1072" y1="2272" y2="2272" x1="976" />
            <wire x2="1104" y1="2272" y2="2272" x1="1072" />
        </branch>
        <branch name="O(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="480" type="branch" />
            <wire x2="1952" y1="480" y2="480" x1="1856" />
            <wire x2="1984" y1="480" y2="480" x1="1952" />
        </branch>
        <branch name="O(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="704" type="branch" />
            <wire x2="1936" y1="704" y2="704" x1="1856" />
            <wire x2="1984" y1="704" y2="704" x1="1936" />
        </branch>
        <branch name="O(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="1008" type="branch" />
            <wire x2="1936" y1="1008" y2="1008" x1="1856" />
            <wire x2="1984" y1="1008" y2="1008" x1="1936" />
        </branch>
        <branch name="O(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1232" type="branch" />
            <wire x2="1952" y1="1232" y2="1232" x1="1856" />
            <wire x2="1984" y1="1232" y2="1232" x1="1952" />
        </branch>
        <branch name="O(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1568" type="branch" />
            <wire x2="1952" y1="1568" y2="1568" x1="1872" />
            <wire x2="2000" y1="1568" y2="1568" x1="1952" />
        </branch>
        <branch name="O(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1968" y="1792" type="branch" />
            <wire x2="1968" y1="1792" y2="1792" x1="1872" />
            <wire x2="2000" y1="1792" y2="1792" x1="1968" />
        </branch>
        <branch name="O(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1968" y="2096" type="branch" />
            <wire x2="1968" y1="2096" y2="2096" x1="1872" />
            <wire x2="2000" y1="2096" y2="2096" x1="1968" />
        </branch>
        <branch name="O(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="2320" type="branch" />
            <wire x2="1952" y1="2320" y2="2320" x1="1872" />
            <wire x2="2000" y1="2320" y2="2320" x1="1952" />
        </branch>
        <branch name="O(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2848" y="480" type="branch" />
            <wire x2="2848" y1="480" y2="480" x1="2768" />
            <wire x2="2896" y1="480" y2="480" x1="2848" />
        </branch>
        <branch name="O(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2864" y="704" type="branch" />
            <wire x2="2864" y1="704" y2="704" x1="2768" />
            <wire x2="2896" y1="704" y2="704" x1="2864" />
        </branch>
        <branch name="O(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2864" y="1008" type="branch" />
            <wire x2="2864" y1="1008" y2="1008" x1="2768" />
            <wire x2="2896" y1="1008" y2="1008" x1="2864" />
        </branch>
        <branch name="O(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2848" y="1232" type="branch" />
            <wire x2="2848" y1="1232" y2="1232" x1="2768" />
            <wire x2="2896" y1="1232" y2="1232" x1="2848" />
        </branch>
        <branch name="O(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2864" y="1568" type="branch" />
            <wire x2="2864" y1="1568" y2="1568" x1="2784" />
            <wire x2="2912" y1="1568" y2="1568" x1="2864" />
        </branch>
        <branch name="O(21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="1792" type="branch" />
            <wire x2="2880" y1="1792" y2="1792" x1="2784" />
            <wire x2="2912" y1="1792" y2="1792" x1="2880" />
        </branch>
        <branch name="O(22)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="2096" type="branch" />
            <wire x2="2880" y1="2096" y2="2096" x1="2784" />
            <wire x2="2912" y1="2096" y2="2096" x1="2880" />
        </branch>
        <branch name="O(23)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="2320" type="branch" />
            <wire x2="2880" y1="2320" y2="2320" x1="2784" />
            <wire x2="2912" y1="2320" y2="2320" x1="2880" />
        </branch>
        <branch name="O(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3760" y="528" type="branch" />
            <wire x2="3760" y1="528" y2="528" x1="3664" />
            <wire x2="3792" y1="528" y2="528" x1="3760" />
        </branch>
        <branch name="O(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3760" y="752" type="branch" />
            <wire x2="3760" y1="752" y2="752" x1="3664" />
            <wire x2="3792" y1="752" y2="752" x1="3760" />
        </branch>
        <branch name="O(26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3760" y="1056" type="branch" />
            <wire x2="3760" y1="1056" y2="1056" x1="3664" />
            <wire x2="3792" y1="1056" y2="1056" x1="3760" />
        </branch>
        <branch name="O(27)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3744" y="1280" type="branch" />
            <wire x2="3744" y1="1280" y2="1280" x1="3664" />
            <wire x2="3792" y1="1280" y2="1280" x1="3744" />
        </branch>
        <branch name="O(28)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3776" y="1616" type="branch" />
            <wire x2="3776" y1="1616" y2="1616" x1="3680" />
            <wire x2="3808" y1="1616" y2="1616" x1="3776" />
        </branch>
        <branch name="O(29)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3776" y="1840" type="branch" />
            <wire x2="3776" y1="1840" y2="1840" x1="3680" />
            <wire x2="3808" y1="1840" y2="1840" x1="3776" />
        </branch>
        <branch name="O(30)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3776" y="2144" type="branch" />
            <wire x2="3776" y1="2144" y2="2144" x1="3680" />
            <wire x2="3808" y1="2144" y2="2144" x1="3776" />
        </branch>
        <branch name="O(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3776" y="2368" type="branch" />
            <wire x2="3776" y1="2368" y2="2368" x1="3680" />
            <wire x2="3808" y1="2368" y2="2368" x1="3776" />
        </branch>
        <branch name="O(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4384" y="672" type="branch" />
            <wire x2="4384" y1="672" y2="672" x1="4240" />
            <wire x2="4592" y1="672" y2="672" x1="4384" />
        </branch>
        <branch name="I0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="208" y="176" type="branch" />
            <wire x2="208" y1="176" y2="176" x1="128" />
            <wire x2="416" y1="176" y2="176" x1="208" />
        </branch>
        <branch name="I1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="192" y="256" type="branch" />
            <wire x2="192" y1="256" y2="256" x1="128" />
            <wire x2="416" y1="256" y2="256" x1="192" />
        </branch>
        <iomarker fontsize="28" x="4592" y="672" name="O(31:0)" orien="R0" />
        <iomarker fontsize="28" x="128" y="176" name="I0(31:0)" orien="R180" />
        <iomarker fontsize="28" x="128" y="256" name="I1(31:0)" orien="R180" />
        <instance x="640" y="560" name="XLXI_33" orien="R0">
        </instance>
        <instance x="640" y="784" name="XLXI_34" orien="R0">
        </instance>
        <instance x="640" y="1088" name="XLXI_35" orien="R0">
        </instance>
        <instance x="640" y="1312" name="XLXI_36" orien="R0">
        </instance>
        <instance x="656" y="1648" name="XLXI_37" orien="R0">
        </instance>
        <instance x="656" y="1872" name="XLXI_38" orien="R0">
        </instance>
        <instance x="656" y="2176" name="XLXI_39" orien="R0">
        </instance>
        <instance x="656" y="2400" name="XLXI_40" orien="R0">
        </instance>
        <instance x="1552" y="2448" name="XLXI_41" orien="R0">
        </instance>
        <instance x="1552" y="2224" name="XLXI_42" orien="R0">
        </instance>
        <instance x="1552" y="1920" name="XLXI_43" orien="R0">
        </instance>
        <instance x="1552" y="1696" name="XLXI_44" orien="R0">
        </instance>
        <instance x="1536" y="1360" name="XLXI_45" orien="R0">
        </instance>
        <instance x="1536" y="832" name="XLXI_47" orien="R0">
        </instance>
        <instance x="1536" y="608" name="XLXI_48" orien="R0">
        </instance>
        <instance x="2448" y="608" name="XLXI_49" orien="R0">
        </instance>
        <instance x="3344" y="656" name="XLXI_50" orien="R0">
        </instance>
        <instance x="3344" y="880" name="XLXI_51" orien="R0">
        </instance>
        <instance x="3344" y="1184" name="XLXI_52" orien="R0">
        </instance>
        <instance x="2448" y="832" name="XLXI_53" orien="R0">
        </instance>
        <instance x="2448" y="1136" name="XLXI_54" orien="R0">
        </instance>
        <instance x="2448" y="1360" name="XLXI_55" orien="R0">
        </instance>
        <instance x="3344" y="1408" name="XLXI_56" orien="R0">
        </instance>
        <instance x="2464" y="1696" name="XLXI_57" orien="R0">
        </instance>
        <instance x="2464" y="1920" name="XLXI_58" orien="R0">
        </instance>
        <instance x="3360" y="1744" name="XLXI_59" orien="R0">
        </instance>
        <instance x="3360" y="1968" name="XLXI_60" orien="R0">
        </instance>
        <instance x="2464" y="2224" name="XLXI_61" orien="R0">
        </instance>
        <instance x="2464" y="2448" name="XLXI_62" orien="R0">
        </instance>
        <instance x="3360" y="2272" name="XLXI_63" orien="R0">
        </instance>
        <instance x="3360" y="2496" name="XLXI_64" orien="R0">
        </instance>
        <instance x="1536" y="1136" name="XLXI_46" orien="R0">
        </instance>
        <iomarker fontsize="28" x="208" y="528" name="S" orien="R180" />
    </sheet>
</drawing>