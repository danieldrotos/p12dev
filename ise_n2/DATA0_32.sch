<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="L" />
        <signal name="O(31:0)" />
        <signal name="XLXN_6" />
        <signal name="O(7)" />
        <signal name="O(6)" />
        <signal name="O(5)" />
        <signal name="O(4)" />
        <signal name="O(3)" />
        <signal name="O(2)" />
        <signal name="O(1)" />
        <signal name="O(0)" />
        <signal name="O(15)" />
        <signal name="O(14)" />
        <signal name="O(13)" />
        <signal name="O(12)" />
        <signal name="O(10)" />
        <signal name="O(9)" />
        <signal name="O(8)" />
        <signal name="O(11)" />
        <signal name="XLXN_23" />
        <signal name="O(23)" />
        <signal name="O(22)" />
        <signal name="O(21)" />
        <signal name="O(20)" />
        <signal name="O(18)" />
        <signal name="O(17)" />
        <signal name="O(16)" />
        <signal name="O(19)" />
        <signal name="XLXN_32" />
        <signal name="O(31)" />
        <signal name="O(30)" />
        <signal name="O(29)" />
        <signal name="O(28)" />
        <signal name="O(26)" />
        <signal name="O(25)" />
        <signal name="O(24)" />
        <signal name="O(27)" />
        <signal name="XLXN_41" />
        <port polarity="Output" name="O(31:0)" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_2">
            <blockpin signalname="L" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_11">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_36">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_37">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_38">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_39">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_40">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_41">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_42">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_43">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(15)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_44">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(16)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_45">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(17)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_46">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(18)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_47">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(19)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_48">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(20)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_49">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(21)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_50">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(22)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_51">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(23)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_52">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(24)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_53">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(25)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_54">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(26)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_55">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(27)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_56">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(28)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_57">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(29)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_58">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(30)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_59">
            <blockpin signalname="L" name="I" />
            <blockpin signalname="O(31)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="576" y="784" type="branch" />
            <wire x2="576" y1="784" y2="784" x1="464" />
            <wire x2="1280" y1="784" y2="784" x1="576" />
            <wire x2="1280" y1="784" y2="912" x1="1280" />
            <wire x2="1360" y1="912" y2="912" x1="1280" />
            <wire x2="1280" y1="912" y2="992" x1="1280" />
            <wire x2="1360" y1="992" y2="992" x1="1280" />
            <wire x2="1280" y1="992" y2="1072" x1="1280" />
            <wire x2="1360" y1="1072" y2="1072" x1="1280" />
            <wire x2="1280" y1="1072" y2="1152" x1="1280" />
            <wire x2="1360" y1="1152" y2="1152" x1="1280" />
            <wire x2="1280" y1="1152" y2="1232" x1="1280" />
            <wire x2="1360" y1="1232" y2="1232" x1="1280" />
            <wire x2="1280" y1="1232" y2="1312" x1="1280" />
            <wire x2="1360" y1="1312" y2="1312" x1="1280" />
            <wire x2="1280" y1="1312" y2="1392" x1="1280" />
            <wire x2="1360" y1="1392" y2="1392" x1="1280" />
            <wire x2="1280" y1="1392" y2="1472" x1="1280" />
            <wire x2="1360" y1="1472" y2="1472" x1="1280" />
            <wire x2="1280" y1="1472" y2="1664" x1="1280" />
            <wire x2="1920" y1="1664" y2="1664" x1="1280" />
            <wire x2="1360" y1="176" y2="176" x1="1280" />
            <wire x2="1280" y1="176" y2="256" x1="1280" />
            <wire x2="1360" y1="256" y2="256" x1="1280" />
            <wire x2="1280" y1="256" y2="336" x1="1280" />
            <wire x2="1360" y1="336" y2="336" x1="1280" />
            <wire x2="1280" y1="336" y2="416" x1="1280" />
            <wire x2="1360" y1="416" y2="416" x1="1280" />
            <wire x2="1280" y1="416" y2="496" x1="1280" />
            <wire x2="1360" y1="496" y2="496" x1="1280" />
            <wire x2="1280" y1="496" y2="576" x1="1280" />
            <wire x2="1360" y1="576" y2="576" x1="1280" />
            <wire x2="1280" y1="576" y2="656" x1="1280" />
            <wire x2="1360" y1="656" y2="656" x1="1280" />
            <wire x2="1280" y1="656" y2="736" x1="1280" />
            <wire x2="1360" y1="736" y2="736" x1="1280" />
            <wire x2="1280" y1="736" y2="784" x1="1280" />
            <wire x2="2000" y1="176" y2="176" x1="1920" />
            <wire x2="1920" y1="176" y2="256" x1="1920" />
            <wire x2="2000" y1="256" y2="256" x1="1920" />
            <wire x2="1920" y1="256" y2="336" x1="1920" />
            <wire x2="2000" y1="336" y2="336" x1="1920" />
            <wire x2="1920" y1="336" y2="416" x1="1920" />
            <wire x2="2000" y1="416" y2="416" x1="1920" />
            <wire x2="1920" y1="416" y2="496" x1="1920" />
            <wire x2="2000" y1="496" y2="496" x1="1920" />
            <wire x2="1920" y1="496" y2="576" x1="1920" />
            <wire x2="2000" y1="576" y2="576" x1="1920" />
            <wire x2="1920" y1="576" y2="656" x1="1920" />
            <wire x2="2000" y1="656" y2="656" x1="1920" />
            <wire x2="1920" y1="656" y2="736" x1="1920" />
            <wire x2="2000" y1="736" y2="736" x1="1920" />
            <wire x2="1920" y1="736" y2="912" x1="1920" />
            <wire x2="2000" y1="912" y2="912" x1="1920" />
            <wire x2="1920" y1="912" y2="992" x1="1920" />
            <wire x2="2000" y1="992" y2="992" x1="1920" />
            <wire x2="1920" y1="992" y2="1072" x1="1920" />
            <wire x2="2000" y1="1072" y2="1072" x1="1920" />
            <wire x2="1920" y1="1072" y2="1152" x1="1920" />
            <wire x2="2000" y1="1152" y2="1152" x1="1920" />
            <wire x2="1920" y1="1152" y2="1232" x1="1920" />
            <wire x2="2000" y1="1232" y2="1232" x1="1920" />
            <wire x2="1920" y1="1232" y2="1312" x1="1920" />
            <wire x2="2000" y1="1312" y2="1312" x1="1920" />
            <wire x2="1920" y1="1312" y2="1392" x1="1920" />
            <wire x2="2000" y1="1392" y2="1392" x1="1920" />
            <wire x2="1920" y1="1392" y2="1472" x1="1920" />
            <wire x2="2000" y1="1472" y2="1472" x1="1920" />
            <wire x2="1920" y1="1472" y2="1664" x1="1920" />
        </branch>
        <instance x="400" y="912" name="XLXI_2" orien="R0" />
        <instance x="1360" y="208" name="XLXI_4" orien="R0" />
        <instance x="1360" y="288" name="XLXI_5" orien="R0" />
        <instance x="1360" y="368" name="XLXI_6" orien="R0" />
        <instance x="1360" y="448" name="XLXI_7" orien="R0" />
        <instance x="1360" y="528" name="XLXI_8" orien="R0" />
        <instance x="1360" y="608" name="XLXI_9" orien="R0" />
        <instance x="1360" y="688" name="XLXI_10" orien="R0" />
        <instance x="1360" y="768" name="XLXI_11" orien="R0" />
        <branch name="O(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3024" y="480" type="branch" />
            <wire x2="3024" y1="480" y2="480" x1="2960" />
            <wire x2="3088" y1="480" y2="480" x1="3024" />
        </branch>
        <iomarker fontsize="28" x="3088" y="480" name="O(31:0)" orien="R0" />
        <branch name="O(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="736" type="branch" />
            <wire x2="1632" y1="736" y2="736" x1="1584" />
            <wire x2="1680" y1="736" y2="736" x1="1632" />
        </branch>
        <branch name="O(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="656" type="branch" />
            <wire x2="1632" y1="656" y2="656" x1="1584" />
            <wire x2="1680" y1="656" y2="656" x1="1632" />
        </branch>
        <branch name="O(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="576" type="branch" />
            <wire x2="1632" y1="576" y2="576" x1="1584" />
            <wire x2="1680" y1="576" y2="576" x1="1632" />
        </branch>
        <branch name="O(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="496" type="branch" />
            <wire x2="1632" y1="496" y2="496" x1="1584" />
            <wire x2="1680" y1="496" y2="496" x1="1632" />
        </branch>
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="336" type="branch" />
            <wire x2="1632" y1="336" y2="336" x1="1584" />
            <wire x2="1680" y1="336" y2="336" x1="1632" />
        </branch>
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="256" type="branch" />
            <wire x2="1632" y1="256" y2="256" x1="1584" />
            <wire x2="1680" y1="256" y2="256" x1="1632" />
        </branch>
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="176" type="branch" />
            <wire x2="1632" y1="176" y2="176" x1="1584" />
            <wire x2="1680" y1="176" y2="176" x1="1632" />
        </branch>
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="416" type="branch" />
            <wire x2="1632" y1="416" y2="416" x1="1584" />
            <wire x2="1680" y1="416" y2="416" x1="1632" />
        </branch>
        <branch name="O(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1472" type="branch" />
            <wire x2="1632" y1="1472" y2="1472" x1="1584" />
            <wire x2="1680" y1="1472" y2="1472" x1="1632" />
        </branch>
        <branch name="O(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1392" type="branch" />
            <wire x2="1632" y1="1392" y2="1392" x1="1584" />
            <wire x2="1680" y1="1392" y2="1392" x1="1632" />
        </branch>
        <branch name="O(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1312" type="branch" />
            <wire x2="1632" y1="1312" y2="1312" x1="1584" />
            <wire x2="1680" y1="1312" y2="1312" x1="1632" />
        </branch>
        <branch name="O(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1232" type="branch" />
            <wire x2="1632" y1="1232" y2="1232" x1="1584" />
            <wire x2="1680" y1="1232" y2="1232" x1="1632" />
        </branch>
        <branch name="O(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1072" type="branch" />
            <wire x2="1632" y1="1072" y2="1072" x1="1584" />
            <wire x2="1680" y1="1072" y2="1072" x1="1632" />
        </branch>
        <branch name="O(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="992" type="branch" />
            <wire x2="1632" y1="992" y2="992" x1="1584" />
            <wire x2="1680" y1="992" y2="992" x1="1632" />
        </branch>
        <branch name="O(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="912" type="branch" />
            <wire x2="1632" y1="912" y2="912" x1="1584" />
            <wire x2="1680" y1="912" y2="912" x1="1632" />
        </branch>
        <branch name="O(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1152" type="branch" />
            <wire x2="1632" y1="1152" y2="1152" x1="1584" />
            <wire x2="1680" y1="1152" y2="1152" x1="1632" />
        </branch>
        <instance x="1360" y="944" name="XLXI_36" orien="R0" />
        <instance x="1360" y="1024" name="XLXI_37" orien="R0" />
        <instance x="1360" y="1104" name="XLXI_38" orien="R0" />
        <instance x="1360" y="1184" name="XLXI_39" orien="R0" />
        <instance x="1360" y="1264" name="XLXI_40" orien="R0" />
        <instance x="1360" y="1344" name="XLXI_41" orien="R0" />
        <instance x="1360" y="1424" name="XLXI_42" orien="R0" />
        <instance x="1360" y="1504" name="XLXI_43" orien="R0" />
        <branch name="O(23)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="736" type="branch" />
            <wire x2="2272" y1="736" y2="736" x1="2224" />
            <wire x2="2320" y1="736" y2="736" x1="2272" />
        </branch>
        <branch name="O(22)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2256" y="656" type="branch" />
            <wire x2="2256" y1="656" y2="656" x1="2224" />
            <wire x2="2320" y1="656" y2="656" x1="2256" />
        </branch>
        <branch name="O(21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="576" type="branch" />
            <wire x2="2272" y1="576" y2="576" x1="2224" />
            <wire x2="2320" y1="576" y2="576" x1="2272" />
        </branch>
        <branch name="O(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="496" type="branch" />
            <wire x2="2272" y1="496" y2="496" x1="2224" />
            <wire x2="2320" y1="496" y2="496" x1="2272" />
        </branch>
        <branch name="O(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="336" type="branch" />
            <wire x2="2272" y1="336" y2="336" x1="2224" />
            <wire x2="2320" y1="336" y2="336" x1="2272" />
        </branch>
        <branch name="O(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="256" type="branch" />
            <wire x2="2272" y1="256" y2="256" x1="2224" />
            <wire x2="2320" y1="256" y2="256" x1="2272" />
        </branch>
        <branch name="O(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="176" type="branch" />
            <wire x2="2272" y1="176" y2="176" x1="2224" />
            <wire x2="2320" y1="176" y2="176" x1="2272" />
        </branch>
        <branch name="O(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="416" type="branch" />
            <wire x2="2272" y1="416" y2="416" x1="2224" />
            <wire x2="2320" y1="416" y2="416" x1="2272" />
        </branch>
        <instance x="2000" y="208" name="XLXI_44" orien="R0" />
        <instance x="2000" y="288" name="XLXI_45" orien="R0" />
        <instance x="2000" y="368" name="XLXI_46" orien="R0" />
        <instance x="2000" y="448" name="XLXI_47" orien="R0" />
        <instance x="2000" y="528" name="XLXI_48" orien="R0" />
        <instance x="2000" y="608" name="XLXI_49" orien="R0" />
        <instance x="2000" y="688" name="XLXI_50" orien="R0" />
        <instance x="2000" y="768" name="XLXI_51" orien="R0" />
        <branch name="O(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1472" type="branch" />
            <wire x2="2272" y1="1472" y2="1472" x1="2224" />
            <wire x2="2320" y1="1472" y2="1472" x1="2272" />
        </branch>
        <branch name="O(30)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1392" type="branch" />
            <wire x2="2272" y1="1392" y2="1392" x1="2224" />
            <wire x2="2320" y1="1392" y2="1392" x1="2272" />
        </branch>
        <branch name="O(29)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1312" type="branch" />
            <wire x2="2272" y1="1312" y2="1312" x1="2224" />
            <wire x2="2320" y1="1312" y2="1312" x1="2272" />
        </branch>
        <branch name="O(28)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1232" type="branch" />
            <wire x2="2272" y1="1232" y2="1232" x1="2224" />
            <wire x2="2320" y1="1232" y2="1232" x1="2272" />
        </branch>
        <branch name="O(26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1072" type="branch" />
            <wire x2="2272" y1="1072" y2="1072" x1="2224" />
            <wire x2="2320" y1="1072" y2="1072" x1="2272" />
        </branch>
        <branch name="O(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="992" type="branch" />
            <wire x2="2272" y1="992" y2="992" x1="2224" />
            <wire x2="2320" y1="992" y2="992" x1="2272" />
        </branch>
        <branch name="O(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="912" type="branch" />
            <wire x2="2272" y1="912" y2="912" x1="2224" />
            <wire x2="2320" y1="912" y2="912" x1="2272" />
        </branch>
        <branch name="O(27)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="1152" type="branch" />
            <wire x2="2272" y1="1152" y2="1152" x1="2224" />
            <wire x2="2320" y1="1152" y2="1152" x1="2272" />
        </branch>
        <instance x="2000" y="944" name="XLXI_52" orien="R0" />
        <instance x="2000" y="1024" name="XLXI_53" orien="R0" />
        <instance x="2000" y="1104" name="XLXI_54" orien="R0" />
        <instance x="2000" y="1184" name="XLXI_55" orien="R0" />
        <instance x="2000" y="1264" name="XLXI_56" orien="R0" />
        <instance x="2000" y="1344" name="XLXI_57" orien="R0" />
        <instance x="2000" y="1424" name="XLXI_58" orien="R0" />
        <instance x="2000" y="1504" name="XLXI_59" orien="R0" />
    </sheet>
</drawing>