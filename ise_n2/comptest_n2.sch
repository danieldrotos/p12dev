<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="MDO(31:0)" />
        <signal name="MDI(31:0)" />
        <signal name="MWE" />
        <signal name="H" />
        <signal name="L" />
        <signal name="SW3" />
        <signal name="BTN0" />
        <signal name="ADDR(31:0)" />
        <signal name="BTN1" />
        <signal name="TR(31:0)" />
        <signal name="SW2" />
        <signal name="SW1" />
        <signal name="SW0" />
        <signal name="seg0" />
        <signal name="seg1" />
        <signal name="seg2" />
        <signal name="seg3" />
        <signal name="seg4" />
        <signal name="seg5" />
        <signal name="seg6" />
        <signal name="dp" />
        <signal name="an0" />
        <signal name="an1" />
        <signal name="an2" />
        <signal name="an3" />
        <signal name="f10kHz" />
        <signal name="BTN3" />
        <signal name="DD(31:0)" />
        <signal name="SW7,SW6,SW5,SW4" />
        <signal name="XLXN_65" />
        <signal name="D0(31:0)" />
        <signal name="SW4" />
        <signal name="SW5" />
        <signal name="SW6" />
        <signal name="SW7" />
        <signal name="B0" />
        <signal name="BTN2" />
        <signal name="TREG(31:0)" />
        <signal name="CLK" />
        <signal name="f100Hz" />
        <signal name="f10Hz" />
        <signal name="f1MHz" />
        <signal name="f10MHz" />
        <signal name="B1" />
        <signal name="B2" />
        <signal name="B3" />
        <signal name="RCLK" />
        <signal name="SYS_CLK" />
        <signal name="CTRL(1)" />
        <signal name="CTRL(0)" />
        <signal name="CTRL(2)" />
        <signal name="DHEX(7:0)" />
        <signal name="DHEX(15:8)" />
        <signal name="DHEX(23:16)" />
        <signal name="DHEX(31:24)" />
        <signal name="DHEX(31:0)" />
        <signal name="DSP(31:0)" />
        <signal name="CTRL(3)" />
        <signal name="f25MHz" />
        <signal name="DSP(7:0)" />
        <signal name="DSP(15:8)" />
        <signal name="DSP(23:16)" />
        <signal name="DSP(31:24)" />
        <signal name="f1KHz" />
        <signal name="PORTA(31:0)" />
        <signal name="PORTB(31:0)" />
        <signal name="PORTC(31:0)" />
        <signal name="PORTD(31:0)" />
        <signal name="CLKstat(2:0)" />
        <signal name="SW3,SW2,SW1,SW0" />
        <signal name="D0(31:4),B3,B2,B1,B0" />
        <signal name="D0(31:8),S(7:0)" />
        <signal name="SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0" />
        <signal name="CTRL(7:0)" />
        <signal name="led3" />
        <signal name="led2" />
        <signal name="led1" />
        <signal name="led0" />
        <signal name="led4" />
        <signal name="led5" />
        <signal name="led6" />
        <signal name="led7" />
        <signal name="CLKstat(0)" />
        <signal name="PORTB(0)" />
        <signal name="PORTB(1)" />
        <signal name="PORTB(2)" />
        <signal name="CLKstat(1)" />
        <signal name="CLKstat(2)" />
        <signal name="N4" />
        <signal name="PORTB(4)" />
        <signal name="PORTB(5)" />
        <signal name="PORTB(6)" />
        <signal name="PORTB(7)" />
        <signal name="PORTB(3)" />
        <signal name="S(7:0)" />
        <signal name="mem_test" />
        <signal name="CTRL(5)" />
        <signal name="CTRL(6)" />
        <signal name="CTRL(7)" />
        <signal name="CTRL(4)" />
        <signal name="XLXN_67" />
        <signal name="tmr(31:0)" />
        <signal name="ctr(31:0)" />
        <port polarity="Input" name="SW3" />
        <port polarity="Input" name="BTN0" />
        <port polarity="Input" name="BTN1" />
        <port polarity="Input" name="SW2" />
        <port polarity="Input" name="SW1" />
        <port polarity="Input" name="SW0" />
        <port polarity="Output" name="seg0" />
        <port polarity="Output" name="seg1" />
        <port polarity="Output" name="seg2" />
        <port polarity="Output" name="seg3" />
        <port polarity="Output" name="seg4" />
        <port polarity="Output" name="seg5" />
        <port polarity="Output" name="seg6" />
        <port polarity="Output" name="dp" />
        <port polarity="Output" name="an0" />
        <port polarity="Output" name="an1" />
        <port polarity="Output" name="an2" />
        <port polarity="Output" name="an3" />
        <port polarity="Input" name="BTN3" />
        <port polarity="Input" name="SW4" />
        <port polarity="Input" name="SW5" />
        <port polarity="Input" name="SW6" />
        <port polarity="Input" name="SW7" />
        <port polarity="Input" name="BTN2" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="led3" />
        <port polarity="Output" name="led2" />
        <port polarity="Output" name="led1" />
        <port polarity="Output" name="led0" />
        <port polarity="Output" name="led4" />
        <port polarity="Output" name="led5" />
        <port polarity="Output" name="led6" />
        <port polarity="Output" name="led7" />
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
        <blockdef name="div">
            <timestamp>2016-4-25T15:51:21</timestamp>
            <rect width="256" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
        </blockdef>
        <blockdef name="display">
            <timestamp>2016-4-25T15:20:19</timestamp>
            <rect width="256" x="64" y="-768" height="768" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="dword2seg">
            <timestamp>2016-4-25T15:32:30</timestamp>
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
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="mux32">
            <timestamp>2016-3-14T14:57:14</timestamp>
            <rect width="256" x="64" y="-1152" height="1152" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="384" y1="-1120" y2="-1120" x1="320" />
            <rect width="64" x="320" y="-1132" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
        </blockdef>
        <blockdef name="DATA0_32">
            <timestamp>2016-4-6T6:57:51</timestamp>
            <rect width="256" x="0" y="-64" height="64" />
            <line x2="320" y1="-32" y2="-32" x1="256" />
            <rect width="64" x="256" y="-44" height="24" />
        </blockdef>
        <blockdef name="fd4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="fd8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="m8_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-544" y2="-544" x1="0" />
            <line x2="96" y1="-608" y2="-608" x1="0" />
            <line x2="96" y1="-672" y2="-672" x1="0" />
            <line x2="96" y1="-736" y2="-736" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="160" />
            <line x2="160" y1="-268" y2="-160" x1="160" />
            <line x2="96" y1="-224" y2="-224" x1="128" />
            <line x2="128" y1="-264" y2="-224" x1="128" />
            <line x2="96" y1="-96" y2="-96" x1="192" />
            <line x2="192" y1="-276" y2="-96" x1="192" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-280" y2="-32" x1="224" />
            <line x2="256" y1="-512" y2="-512" x1="320" />
            <line x2="96" y1="-768" y2="-256" x1="96" />
            <line x2="96" y1="-704" y2="-768" x1="256" />
            <line x2="256" y1="-288" y2="-704" x1="256" />
            <line x2="256" y1="-256" y2="-288" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="96" y1="-480" y2="-480" x1="0" />
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
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
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
        <blockdef name="comp">
            <timestamp>2017-5-31T11:50:36</timestamp>
            <rect width="64" x="320" y="148" height="24" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <rect width="64" x="320" y="212" height="24" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <rect width="64" x="320" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <rect width="64" x="320" y="-556" height="24" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <rect width="64" x="320" y="-620" height="24" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <rect width="256" x="64" y="-704" height="960" />
        </blockdef>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="H" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="L" name="G" />
        </block>
        <block symbolname="display" name="disp_drv">
            <blockpin signalname="an0" name="AN0" />
            <blockpin signalname="an1" name="AN1" />
            <blockpin signalname="an2" name="AN2" />
            <blockpin signalname="an3" name="AN3" />
            <blockpin signalname="seg0" name="CA" />
            <blockpin signalname="seg1" name="CB" />
            <blockpin signalname="seg2" name="CC" />
            <blockpin signalname="seg3" name="CD" />
            <blockpin signalname="seg4" name="CE" />
            <blockpin signalname="seg5" name="CF" />
            <blockpin signalname="seg6" name="CG" />
            <blockpin signalname="f10kHz" name="CLK" />
            <blockpin signalname="DSP(7:0)" name="D0(7:0)" />
            <blockpin signalname="DSP(15:8)" name="D1(7:0)" />
            <blockpin signalname="DSP(23:16)" name="D2(7:0)" />
            <blockpin signalname="DSP(31:24)" name="D3(7:0)" />
            <blockpin signalname="dp" name="DP" />
        </block>
        <block symbolname="dword2seg" name="disph_sel">
            <blockpin signalname="DHEX(7:0)" name="D0(7:0)" />
            <blockpin signalname="DHEX(15:8)" name="D1(7:0)" />
            <blockpin signalname="DHEX(23:16)" name="D2(7:0)" />
            <blockpin signalname="DHEX(31:24)" name="D3(7:0)" />
            <blockpin signalname="DD(31:0)" name="I(31:0)" />
            <blockpin signalname="BTN3" name="S" />
        </block>
        <block symbolname="mux32" name="disp_mx">
            <blockpin signalname="XLXN_65" name="E" />
            <blockpin signalname="PORTA(31:0)" name="I0(31:0)" />
            <blockpin signalname="PORTB(31:0)" name="I1(31:0)" />
            <blockpin signalname="D0(31:0)" name="I10(31:0)" />
            <blockpin signalname="D0(31:0)" name="I11(31:0)" />
            <blockpin signalname="D0(31:0)" name="I12(31:0)" />
            <blockpin signalname="MDI(31:0)" name="I13(31:0)" />
            <blockpin signalname="MDO(31:0)" name="I14(31:0)" />
            <blockpin signalname="ADDR(31:0)" name="I15(31:0)" />
            <blockpin signalname="PORTC(31:0)" name="I2(31:0)" />
            <blockpin signalname="PORTD(31:0)" name="I3(31:0)" />
            <blockpin signalname="D0(31:0)" name="I4(31:0)" />
            <blockpin signalname="D0(31:0)" name="I5(31:0)" />
            <blockpin signalname="tmr(31:0)" name="I6(31:0)" />
            <blockpin signalname="ctr(31:0)" name="I7(31:0)" />
            <blockpin signalname="TR(31:0)" name="I8(31:0)" />
            <blockpin signalname="TREG(31:0)" name="I9(31:0)" />
            <blockpin signalname="DD(31:0)" name="O(31:0)" />
            <blockpin signalname="SW7,SW6,SW5,SW4" name="S(3:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_26">
            <blockpin signalname="XLXN_65" name="P" />
        </block>
        <block symbolname="DATA0_32" name="CONST0">
            <blockpin signalname="D0(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="fd4ce" name="prell">
            <blockpin signalname="f100Hz" name="C" />
            <blockpin signalname="H" name="CE" />
            <blockpin signalname="L" name="CLR" />
            <blockpin signalname="BTN0" name="D0" />
            <blockpin signalname="BTN1" name="D1" />
            <blockpin signalname="BTN2" name="D2" />
            <blockpin signalname="BTN3" name="D3" />
            <blockpin signalname="B0" name="Q0" />
            <blockpin signalname="B1" name="Q1" />
            <blockpin signalname="B2" name="Q2" />
            <blockpin signalname="B3" name="Q3" />
        </block>
        <block symbolname="m8_1e" name="clk_sel">
            <blockpin signalname="f10MHz" name="D0" />
            <blockpin signalname="f1MHz" name="D1" />
            <blockpin signalname="f10kHz" name="D2" />
            <blockpin signalname="f1KHz" name="D3" />
            <blockpin signalname="f100Hz" name="D4" />
            <blockpin signalname="f10Hz" name="D5" />
            <blockpin signalname="f25MHz" name="D6" />
            <blockpin signalname="B0" name="D7" />
            <blockpin signalname="H" name="E" />
            <blockpin signalname="CTRL(0)" name="S0" />
            <blockpin signalname="CTRL(1)" name="S1" />
            <blockpin signalname="CTRL(2)" name="S2" />
            <blockpin signalname="RCLK" name="O" />
        </block>
        <block symbolname="mx2_1_32" name="dispb_mx">
            <blockpin signalname="CTRL(3)" name="S" />
            <blockpin signalname="DHEX(31:0)" name="I0(31:0)" />
            <blockpin signalname="DD(31:0)" name="I1(31:0)" />
            <blockpin signalname="DSP(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="div" name="clkdiv">
            <blockpin signalname="CLK" name="CLK50MHz" />
            <blockpin name="Q0Hz1" />
            <blockpin signalname="f100Hz" name="Q100Hz" />
            <blockpin signalname="f10Hz" name="Q10Hz" />
            <blockpin signalname="f10kHz" name="Q10kHz" />
            <blockpin signalname="f10MHz" name="Q10MHz" />
            <blockpin name="Q1Hz" />
            <blockpin signalname="f1KHz" name="Q1KHz" />
            <blockpin signalname="f1MHz" name="Q1MHz" />
            <blockpin signalname="f25MHz" name="Q25MHz" />
        </block>
        <block symbolname="fd8ce" name="ctrl_reg">
            <blockpin signalname="B1" name="C" />
            <blockpin signalname="B2" name="CE" />
            <blockpin signalname="L" name="CLR" />
            <blockpin signalname="SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0" name="D(7:0)" />
            <blockpin signalname="CTRL(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_66">
            <blockpin signalname="CLKstat(0)" name="D0" />
            <blockpin signalname="PORTB(0)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led0" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_67">
            <blockpin signalname="CLKstat(1)" name="D0" />
            <blockpin signalname="PORTB(1)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led1" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_68">
            <blockpin signalname="CLKstat(2)" name="D0" />
            <blockpin signalname="PORTB(2)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led2" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_69">
            <blockpin signalname="BTN1" name="D0" />
            <blockpin signalname="PORTB(3)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led3" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_71">
            <blockpin name="D0" />
            <blockpin signalname="PORTB(5)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led5" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_72">
            <blockpin signalname="MWE" name="D0" />
            <blockpin signalname="PORTB(6)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led6" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_70">
            <blockpin signalname="SYS_CLK" name="D0" />
            <blockpin signalname="PORTB(4)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led4" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_73">
            <blockpin name="D0" />
            <blockpin signalname="PORTB(7)" name="D1" />
            <blockpin signalname="N4" name="S0" />
            <blockpin signalname="led7" name="O" />
        </block>
        <block symbolname="fd8ce" name="prell_sw">
            <blockpin signalname="f100Hz" name="C" />
            <blockpin signalname="H" name="CE" />
            <blockpin signalname="L" name="CLR" />
            <blockpin signalname="SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0" name="D(7:0)" />
            <blockpin signalname="S(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_75">
            <blockpin signalname="RCLK" name="I" />
            <blockpin signalname="SYS_CLK" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_77">
            <blockpin signalname="CTRL(7)" name="I0" />
            <blockpin signalname="CTRL(6)" name="I1" />
            <blockpin signalname="CTRL(5)" name="I2" />
            <blockpin signalname="mem_test" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_78">
            <blockpin signalname="CTRL(4)" name="I" />
            <blockpin signalname="N4" name="O" />
        </block>
        <block symbolname="comp" name="computer">
            <attr value="../counter.asc" name="PROGRAM">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="SYS_CLK" name="CLK" />
            <blockpin signalname="BTN1" name="RESET" />
            <blockpin signalname="mem_test" name="mem_test" />
            <blockpin signalname="XLXN_67" name="clk10m" />
            <blockpin signalname="D0(31:4),B3,B2,B1,B0" name="PORTI(31:0)" />
            <blockpin signalname="D0(31:8),S(7:0)" name="PORTJ(31:0)" />
            <blockpin signalname="SW3,SW2,SW1,SW0" name="TRS(3:0)" />
            <blockpin signalname="MWE" name="MWE" />
            <blockpin signalname="PORTA(31:0)" name="PORTA(31:0)" />
            <blockpin signalname="PORTB(31:0)" name="PORTB(31:0)" />
            <blockpin signalname="PORTC(31:0)" name="PORTC(31:0)" />
            <blockpin signalname="PORTD(31:0)" name="PORTD(31:0)" />
            <blockpin signalname="TR(31:0)" name="TR(31:0)" />
            <blockpin signalname="CLKstat(2:0)" name="CLKstat(2:0)" />
            <blockpin signalname="ADDR(31:0)" name="ADDR(31:0)" />
            <blockpin signalname="MDO(31:0)" name="MDO(31:0)" />
            <blockpin signalname="MDI(31:0)" name="MDI(31:0)" />
            <blockpin signalname="TREG(31:0)" name="TREG(31:0)" />
            <blockpin signalname="tmr(31:0)" name="tmr(31:0)" />
            <blockpin signalname="ctr(31:0)" name="ctr(31:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_80">
            <blockpin signalname="f1MHz" name="I" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="H">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="144" type="branch" />
            <wire x2="1712" y1="144" y2="144" x1="1584" />
            <wire x2="1760" y1="144" y2="144" x1="1712" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="192" type="branch" />
            <wire x2="1712" y1="192" y2="192" x1="1584" />
            <wire x2="1760" y1="192" y2="192" x1="1712" />
            <wire x2="1584" y1="192" y2="208" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="176" y="800" name="SW3" orien="R180" />
        <branch name="BTN1">
            <wire x2="272" y1="1440" y2="1440" x1="176" />
        </branch>
        <branch name="SW2">
            <wire x2="288" y1="736" y2="736" x1="176" />
        </branch>
        <branch name="SW1">
            <wire x2="288" y1="672" y2="672" x1="176" />
        </branch>
        <branch name="SW0">
            <wire x2="288" y1="608" y2="608" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="736" name="SW2" orien="R180" />
        <iomarker fontsize="28" x="176" y="672" name="SW1" orien="R180" />
        <iomarker fontsize="28" x="176" y="608" name="SW0" orien="R180" />
        <instance x="4608" y="3296" name="disp_drv" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="144" y="16" type="instance" />
        </instance>
        <branch name="seg0">
            <wire x2="5072" y1="2560" y2="2560" x1="4992" />
        </branch>
        <branch name="seg1">
            <wire x2="5072" y1="2624" y2="2624" x1="4992" />
        </branch>
        <branch name="seg2">
            <wire x2="5072" y1="2688" y2="2688" x1="4992" />
        </branch>
        <branch name="seg3">
            <wire x2="5072" y1="2752" y2="2752" x1="4992" />
        </branch>
        <branch name="seg4">
            <wire x2="5072" y1="2816" y2="2816" x1="4992" />
        </branch>
        <branch name="seg5">
            <wire x2="5072" y1="2880" y2="2880" x1="4992" />
        </branch>
        <branch name="seg6">
            <wire x2="5072" y1="2944" y2="2944" x1="4992" />
        </branch>
        <branch name="dp">
            <wire x2="5072" y1="3008" y2="3008" x1="4992" />
        </branch>
        <branch name="an0">
            <wire x2="5072" y1="3072" y2="3072" x1="4992" />
        </branch>
        <branch name="an1">
            <wire x2="5072" y1="3136" y2="3136" x1="4992" />
        </branch>
        <branch name="an2">
            <wire x2="5072" y1="3200" y2="3200" x1="4992" />
        </branch>
        <branch name="an3">
            <wire x2="5072" y1="3264" y2="3264" x1="4992" />
        </branch>
        <iomarker fontsize="28" x="5072" y="2560" name="seg0" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2624" name="seg1" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2688" name="seg2" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2752" name="seg3" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2816" name="seg4" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2880" name="seg5" orien="R0" />
        <iomarker fontsize="28" x="5072" y="2944" name="seg6" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3008" name="dp" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3072" name="an0" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3136" name="an1" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3200" name="an2" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3264" name="an3" orien="R0" />
        <branch name="f10kHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4560" y="2560" type="branch" />
            <wire x2="4560" y1="2560" y2="2560" x1="4528" />
            <wire x2="4608" y1="2560" y2="2560" x1="4560" />
        </branch>
        <instance x="3376" y="3440" name="disp_mx" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="144" y="16" type="instance" />
        </instance>
        <branch name="DD(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3792" y="2320" type="branch" />
            <wire x2="3792" y1="2320" y2="2320" x1="3760" />
            <wire x2="3824" y1="2320" y2="2320" x1="3792" />
        </branch>
        <branch name="PORTA(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2320" type="branch" />
            <wire x2="3264" y1="2320" y2="2320" x1="3200" />
            <wire x2="3376" y1="2320" y2="2320" x1="3264" />
        </branch>
        <branch name="PORTB(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2384" type="branch" />
            <wire x2="3264" y1="2384" y2="2384" x1="3200" />
            <wire x2="3376" y1="2384" y2="2384" x1="3264" />
        </branch>
        <branch name="PORTC(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2448" type="branch" />
            <wire x2="3264" y1="2448" y2="2448" x1="3200" />
            <wire x2="3376" y1="2448" y2="2448" x1="3264" />
        </branch>
        <branch name="PORTD(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2512" type="branch" />
            <wire x2="3264" y1="2512" y2="2512" x1="3200" />
            <wire x2="3376" y1="2512" y2="2512" x1="3264" />
        </branch>
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2576" type="branch" />
            <wire x2="3264" y1="2576" y2="2576" x1="3200" />
            <wire x2="3376" y1="2576" y2="2576" x1="3264" />
        </branch>
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2640" type="branch" />
            <wire x2="3264" y1="2640" y2="2640" x1="3200" />
            <wire x2="3376" y1="2640" y2="2640" x1="3264" />
        </branch>
        <branch name="tmr(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2704" type="branch" />
            <wire x2="3264" y1="2704" y2="2704" x1="3200" />
            <wire x2="3376" y1="2704" y2="2704" x1="3264" />
        </branch>
        <branch name="ctr(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2768" type="branch" />
            <wire x2="3264" y1="2768" y2="2768" x1="3200" />
            <wire x2="3376" y1="2768" y2="2768" x1="3264" />
        </branch>
        <branch name="TR(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2832" type="branch" />
            <wire x2="3264" y1="2832" y2="2832" x1="3200" />
            <wire x2="3376" y1="2832" y2="2832" x1="3264" />
        </branch>
        <branch name="TREG(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2896" type="branch" />
            <wire x2="3264" y1="2896" y2="2896" x1="3200" />
            <wire x2="3376" y1="2896" y2="2896" x1="3264" />
        </branch>
        <branch name="SW7,SW6,SW5,SW4">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3216" y="3344" type="branch" />
            <wire x2="3216" y1="3344" y2="3344" x1="3088" />
            <wire x2="3376" y1="3344" y2="3344" x1="3216" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2928" y1="3376" y2="3408" x1="2928" />
            <wire x2="3376" y1="3408" y2="3408" x1="2928" />
        </branch>
        <instance x="2864" y="3376" name="XLXI_26" orien="R0" />
        <instance x="2032" y="160" name="CONST0" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="16" type="instance" />
        </instance>
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2416" y="128" type="branch" />
            <wire x2="2416" y1="128" y2="128" x1="2352" />
            <wire x2="2480" y1="128" y2="128" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="176" y="1376" name="BTN0" orien="R180" />
        <iomarker fontsize="28" x="176" y="1440" name="BTN1" orien="R180" />
        <branch name="SW4">
            <wire x2="288" y1="864" y2="864" x1="176" />
        </branch>
        <branch name="SW5">
            <wire x2="288" y1="928" y2="928" x1="176" />
        </branch>
        <branch name="SW6">
            <wire x2="288" y1="992" y2="992" x1="176" />
        </branch>
        <branch name="SW7">
            <wire x2="288" y1="1056" y2="1056" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="864" name="SW4" orien="R180" />
        <iomarker fontsize="28" x="176" y="928" name="SW5" orien="R180" />
        <iomarker fontsize="28" x="176" y="992" name="SW6" orien="R180" />
        <iomarker fontsize="28" x="176" y="1056" name="SW7" orien="R180" />
        <branch name="SW3">
            <wire x2="288" y1="800" y2="800" x1="176" />
        </branch>
        <branch name="ADDR(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="3280" type="branch" />
            <wire x2="3280" y1="3280" y2="3280" x1="3200" />
            <wire x2="3376" y1="3280" y2="3280" x1="3280" />
        </branch>
        <instance x="1520" y="144" name="XLXI_5" orien="R0" />
        <instance x="1520" y="336" name="XLXI_6" orien="R0" />
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="2960" type="branch" />
            <wire x2="3264" y1="2960" y2="2960" x1="3200" />
            <wire x2="3376" y1="2960" y2="2960" x1="3264" />
        </branch>
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="3024" type="branch" />
            <wire x2="3264" y1="3024" y2="3024" x1="3200" />
            <wire x2="3376" y1="3024" y2="3024" x1="3264" />
        </branch>
        <branch name="D0(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="3088" type="branch" />
            <wire x2="3280" y1="3088" y2="3088" x1="3200" />
            <wire x2="3376" y1="3088" y2="3088" x1="3280" />
        </branch>
        <branch name="MDI(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="3152" type="branch" />
            <wire x2="3280" y1="3152" y2="3152" x1="3200" />
            <wire x2="3376" y1="3152" y2="3152" x1="3280" />
        </branch>
        <branch name="MDO(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="3216" type="branch" />
            <wire x2="3280" y1="3216" y2="3216" x1="3200" />
            <wire x2="3376" y1="3216" y2="3216" x1="3280" />
        </branch>
        <branch name="BTN0">
            <wire x2="272" y1="1376" y2="1376" x1="176" />
        </branch>
        <branch name="CLK">
            <wire x2="304" y1="2592" y2="2592" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="2592" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="176" y="1504" name="BTN2" orien="R180" />
        <branch name="BTN2">
            <wire x2="272" y1="1504" y2="1504" x1="176" />
        </branch>
        <instance x="272" y="1824" name="prell" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-48" type="instance" />
        </instance>
        <branch name="BTN3">
            <wire x2="272" y1="1568" y2="1568" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="1568" name="BTN3" orien="R180" />
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="224" y="1792" type="branch" />
            <wire x2="224" y1="1792" y2="1792" x1="176" />
            <wire x2="272" y1="1792" y2="1792" x1="224" />
        </branch>
        <branch name="H">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="224" y="1632" type="branch" />
            <wire x2="224" y1="1632" y2="1632" x1="176" />
            <wire x2="272" y1="1632" y2="1632" x1="224" />
        </branch>
        <branch name="f100Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="224" y="1696" type="branch" />
            <wire x2="224" y1="1696" y2="1696" x1="176" />
            <wire x2="272" y1="1696" y2="1696" x1="224" />
        </branch>
        <branch name="B0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1376" type="branch" />
            <wire x2="704" y1="1376" y2="1376" x1="656" />
            <wire x2="720" y1="1376" y2="1376" x1="704" />
        </branch>
        <branch name="B1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1440" type="branch" />
            <wire x2="704" y1="1440" y2="1440" x1="656" />
            <wire x2="720" y1="1440" y2="1440" x1="704" />
        </branch>
        <branch name="B2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1504" type="branch" />
            <wire x2="704" y1="1504" y2="1504" x1="656" />
            <wire x2="720" y1="1504" y2="1504" x1="704" />
        </branch>
        <branch name="B3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1568" type="branch" />
            <wire x2="704" y1="1568" y2="1568" x1="656" />
            <wire x2="720" y1="1568" y2="1568" x1="704" />
        </branch>
        <branch name="f10MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2560" type="branch" />
            <wire x2="1040" y1="2560" y2="2560" x1="1008" />
            <wire x2="1088" y1="2560" y2="2560" x1="1040" />
        </branch>
        <branch name="f1MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2624" type="branch" />
            <wire x2="1040" y1="2624" y2="2624" x1="1008" />
            <wire x2="1088" y1="2624" y2="2624" x1="1040" />
        </branch>
        <branch name="f10kHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2688" type="branch" />
            <wire x2="1040" y1="2688" y2="2688" x1="1008" />
            <wire x2="1088" y1="2688" y2="2688" x1="1040" />
        </branch>
        <branch name="SYS_CLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="704" type="branch" />
            <wire x2="2240" y1="704" y2="704" x1="1616" />
            <wire x2="2320" y1="704" y2="704" x1="2240" />
        </branch>
        <instance x="1088" y="3296" name="clk_sel" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-20" type="instance" />
        </instance>
        <branch name="H">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="3264" type="branch" />
            <wire x2="1040" y1="3264" y2="3264" x1="1008" />
            <wire x2="1088" y1="3264" y2="3264" x1="1040" />
        </branch>
        <branch name="CTRL(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="3136" type="branch" />
            <wire x2="1040" y1="3136" y2="3136" x1="1008" />
            <wire x2="1088" y1="3136" y2="3136" x1="1040" />
        </branch>
        <branch name="CTRL(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="3072" type="branch" />
            <wire x2="1040" y1="3072" y2="3072" x1="1008" />
            <wire x2="1088" y1="3072" y2="3072" x1="1040" />
        </branch>
        <branch name="CTRL(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="3200" type="branch" />
            <wire x2="1040" y1="3200" y2="3200" x1="1008" />
            <wire x2="1088" y1="3200" y2="3200" x1="1040" />
        </branch>
        <branch name="RCLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="2784" type="branch" />
            <wire x2="1472" y1="2784" y2="2784" x1="1408" />
            <wire x2="1504" y1="2784" y2="2784" x1="1472" />
        </branch>
        <instance x="4112" y="3120" name="dispb_mx" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="128" y="16" type="instance" />
        </instance>
        <instance x="3824" y="2544" name="disph_sel" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="128" y="16" type="instance" />
        </instance>
        <branch name="BTN3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3808" y="2384" type="branch" />
            <wire x2="3808" y1="2384" y2="2384" x1="3776" />
            <wire x2="3824" y1="2384" y2="2384" x1="3808" />
        </branch>
        <branch name="DHEX(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4336" y="2320" type="branch" />
            <wire x2="4336" y1="2320" y2="2320" x1="4208" />
            <wire x2="4400" y1="2320" y2="2320" x1="4336" />
        </branch>
        <branch name="DHEX(15:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4320" y="2384" type="branch" />
            <wire x2="4320" y1="2384" y2="2384" x1="4208" />
            <wire x2="4400" y1="2384" y2="2384" x1="4320" />
        </branch>
        <branch name="DHEX(23:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4320" y="2448" type="branch" />
            <wire x2="4320" y1="2448" y2="2448" x1="4208" />
            <wire x2="4400" y1="2448" y2="2448" x1="4320" />
        </branch>
        <branch name="DHEX(31:24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4320" y="2512" type="branch" />
            <wire x2="4320" y1="2512" y2="2512" x1="4208" />
            <wire x2="4400" y1="2512" y2="2512" x1="4320" />
        </branch>
        <branch name="DHEX(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4016" y="2960" type="branch" />
            <wire x2="4016" y1="2960" y2="2960" x1="3920" />
            <wire x2="4112" y1="2960" y2="2960" x1="4016" />
        </branch>
        <branch name="DSP(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4560" y="2960" type="branch" />
            <wire x2="4560" y1="2960" y2="2960" x1="4496" />
            <wire x2="4608" y1="2960" y2="2960" x1="4560" />
        </branch>
        <branch name="DD(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4016" y="3024" type="branch" />
            <wire x2="4016" y1="3024" y2="3024" x1="3920" />
            <wire x2="4112" y1="3024" y2="3024" x1="4016" />
        </branch>
        <branch name="DSP(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4528" y="2624" type="branch" />
            <wire x2="4528" y1="2624" y2="2624" x1="4432" />
            <wire x2="4608" y1="2624" y2="2624" x1="4528" />
        </branch>
        <branch name="DSP(15:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4528" y="2688" type="branch" />
            <wire x2="4528" y1="2688" y2="2688" x1="4432" />
            <wire x2="4608" y1="2688" y2="2688" x1="4528" />
        </branch>
        <branch name="DSP(23:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4528" y="2752" type="branch" />
            <wire x2="4528" y1="2752" y2="2752" x1="4432" />
            <wire x2="4608" y1="2752" y2="2752" x1="4528" />
        </branch>
        <branch name="DSP(31:24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4528" y="2816" type="branch" />
            <wire x2="4528" y1="2816" y2="2816" x1="4432" />
            <wire x2="4608" y1="2816" y2="2816" x1="4528" />
        </branch>
        <branch name="CTRL(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4016" y="3088" type="branch" />
            <wire x2="4016" y1="3088" y2="3088" x1="3920" />
            <wire x2="4112" y1="3088" y2="3088" x1="4016" />
        </branch>
        <branch name="f1KHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2752" type="branch" />
            <wire x2="1040" y1="2752" y2="2752" x1="1008" />
            <wire x2="1088" y1="2752" y2="2752" x1="1040" />
        </branch>
        <branch name="B0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="3008" type="branch" />
            <wire x2="1040" y1="3008" y2="3008" x1="1008" />
            <wire x2="1088" y1="3008" y2="3008" x1="1040" />
        </branch>
        <branch name="f25MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2944" type="branch" />
            <wire x2="1040" y1="2944" y2="2944" x1="1008" />
            <wire x2="1088" y1="2944" y2="2944" x1="1040" />
        </branch>
        <branch name="f100Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="2816" type="branch" />
            <wire x2="1056" y1="2816" y2="2816" x1="1008" />
            <wire x2="1088" y1="2816" y2="2816" x1="1056" />
        </branch>
        <branch name="f10Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2880" type="branch" />
            <wire x2="1040" y1="2880" y2="2880" x1="1008" />
            <wire x2="1088" y1="2880" y2="2880" x1="1040" />
        </branch>
        <branch name="f10Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2976" type="branch" />
            <wire x2="768" y1="2976" y2="2976" x1="688" />
            <wire x2="816" y1="2976" y2="2976" x1="768" />
        </branch>
        <branch name="f100Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2912" type="branch" />
            <wire x2="768" y1="2912" y2="2912" x1="688" />
            <wire x2="816" y1="2912" y2="2912" x1="768" />
        </branch>
        <branch name="f25MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2592" type="branch" />
            <wire x2="768" y1="2592" y2="2592" x1="688" />
            <wire x2="816" y1="2592" y2="2592" x1="768" />
        </branch>
        <branch name="f10MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2656" type="branch" />
            <wire x2="768" y1="2656" y2="2656" x1="688" />
            <wire x2="816" y1="2656" y2="2656" x1="768" />
        </branch>
        <branch name="f1MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2720" type="branch" />
            <wire x2="768" y1="2720" y2="2720" x1="688" />
            <wire x2="816" y1="2720" y2="2720" x1="768" />
        </branch>
        <branch name="f10kHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2784" type="branch" />
            <wire x2="768" y1="2784" y2="2784" x1="688" />
            <wire x2="816" y1="2784" y2="2784" x1="768" />
        </branch>
        <instance x="304" y="3136" name="clkdiv" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="128" y="16" type="instance" />
        </instance>
        <branch name="f1KHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="2848" type="branch" />
            <wire x2="768" y1="2848" y2="2848" x1="688" />
            <wire x2="816" y1="2848" y2="2848" x1="768" />
        </branch>
        <branch name="ADDR(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="704" type="branch" />
            <wire x2="2800" y1="704" y2="704" x1="2704" />
            <wire x2="2880" y1="704" y2="704" x1="2800" />
        </branch>
        <branch name="MDO(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="768" type="branch" />
            <wire x2="2800" y1="768" y2="768" x1="2704" />
            <wire x2="2880" y1="768" y2="768" x1="2800" />
        </branch>
        <branch name="MWE">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="896" type="branch" />
            <wire x2="2784" y1="896" y2="896" x1="2704" />
            <wire x2="2880" y1="896" y2="896" x1="2784" />
        </branch>
        <branch name="CLKstat(2:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1088" type="branch" />
            <wire x2="2800" y1="1088" y2="1088" x1="2704" />
            <wire x2="2880" y1="1088" y2="1088" x1="2800" />
        </branch>
        <branch name="TREG(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1024" type="branch" />
            <wire x2="2800" y1="1024" y2="1024" x1="2704" />
            <wire x2="2880" y1="1024" y2="1024" x1="2800" />
        </branch>
        <branch name="TR(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2768" y="960" type="branch" />
            <wire x2="2768" y1="960" y2="960" x1="2704" />
            <wire x2="2880" y1="960" y2="960" x1="2768" />
        </branch>
        <branch name="MDI(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="832" type="branch" />
            <wire x2="2784" y1="832" y2="832" x1="2704" />
            <wire x2="2880" y1="832" y2="832" x1="2784" />
        </branch>
        <branch name="PORTA(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1152" type="branch" />
            <wire x2="2800" y1="1152" y2="1152" x1="2704" />
            <wire x2="2880" y1="1152" y2="1152" x1="2800" />
        </branch>
        <branch name="PORTB(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1216" type="branch" />
            <wire x2="2800" y1="1216" y2="1216" x1="2704" />
            <wire x2="2880" y1="1216" y2="1216" x1="2800" />
        </branch>
        <branch name="PORTC(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1280" type="branch" />
            <wire x2="2800" y1="1280" y2="1280" x1="2704" />
            <wire x2="2880" y1="1280" y2="1280" x1="2800" />
        </branch>
        <branch name="PORTD(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1344" type="branch" />
            <wire x2="2800" y1="1344" y2="1344" x1="2704" />
            <wire x2="2880" y1="1344" y2="1344" x1="2800" />
        </branch>
        <branch name="BTN1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="768" type="branch" />
            <wire x2="2272" y1="768" y2="768" x1="2192" />
            <wire x2="2320" y1="768" y2="768" x1="2272" />
        </branch>
        <branch name="SW3,SW2,SW1,SW0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="832" type="branch" />
            <wire x2="2160" y1="832" y2="832" x1="2016" />
            <wire x2="2320" y1="832" y2="832" x1="2160" />
        </branch>
        <branch name="D0(31:4),B3,B2,B1,B0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="896" type="branch" />
            <wire x2="2160" y1="896" y2="896" x1="2016" />
            <wire x2="2320" y1="896" y2="896" x1="2160" />
        </branch>
        <branch name="D0(31:8),S(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2128" y="960" type="branch" />
            <wire x2="2128" y1="960" y2="960" x1="2016" />
            <wire x2="2320" y1="960" y2="960" x1="2128" />
        </branch>
        <branch name="RCLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="704" type="branch" />
            <wire x2="1280" y1="704" y2="704" x1="1232" />
            <wire x2="1392" y1="704" y2="704" x1="1280" />
        </branch>
        <branch name="SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="2112" type="branch" />
            <wire x2="320" y1="2112" y2="2112" x1="256" />
            <wire x2="560" y1="2112" y2="2112" x1="320" />
        </branch>
        <instance x="560" y="2368" name="ctrl_reg" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="208" y="-48" type="instance" />
        </instance>
        <branch name="B2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="2176" type="branch" />
            <wire x2="464" y1="2176" y2="2176" x1="416" />
            <wire x2="560" y1="2176" y2="2176" x1="464" />
        </branch>
        <branch name="B1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="2240" type="branch" />
            <wire x2="464" y1="2240" y2="2240" x1="416" />
            <wire x2="560" y1="2240" y2="2240" x1="464" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="2336" type="branch" />
            <wire x2="464" y1="2336" y2="2336" x1="416" />
            <wire x2="560" y1="2336" y2="2336" x1="464" />
        </branch>
        <branch name="CTRL(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="2112" type="branch" />
            <wire x2="1024" y1="2112" y2="2112" x1="944" />
            <wire x2="1072" y1="2112" y2="2112" x1="1024" />
        </branch>
        <instance x="4240" y="1360" name="XLXI_66" orien="R0" />
        <instance x="4240" y="1536" name="XLXI_67" orien="R0" />
        <instance x="4240" y="1712" name="XLXI_68" orien="R0" />
        <instance x="4240" y="1888" name="XLXI_69" orien="R0" />
        <instance x="4848" y="1536" name="XLXI_71" orien="R0" />
        <instance x="4848" y="1712" name="XLXI_72" orien="R0" />
        <instance x="4848" y="1360" name="XLXI_70" orien="R0" />
        <branch name="led3">
            <wire x2="4576" y1="1760" y2="1760" x1="4560" />
            <wire x2="4592" y1="1760" y2="1760" x1="4576" />
        </branch>
        <branch name="led2">
            <wire x2="4576" y1="1584" y2="1584" x1="4560" />
            <wire x2="4592" y1="1584" y2="1584" x1="4576" />
        </branch>
        <branch name="led1">
            <wire x2="4576" y1="1408" y2="1408" x1="4560" />
            <wire x2="4592" y1="1408" y2="1408" x1="4576" />
        </branch>
        <branch name="led0">
            <wire x2="4576" y1="1232" y2="1232" x1="4560" />
            <wire x2="4592" y1="1232" y2="1232" x1="4576" />
        </branch>
        <branch name="led4">
            <wire x2="5184" y1="1232" y2="1232" x1="5168" />
            <wire x2="5200" y1="1232" y2="1232" x1="5184" />
        </branch>
        <branch name="led5">
            <wire x2="5184" y1="1408" y2="1408" x1="5168" />
            <wire x2="5200" y1="1408" y2="1408" x1="5184" />
        </branch>
        <branch name="led6">
            <wire x2="5184" y1="1584" y2="1584" x1="5168" />
            <wire x2="5200" y1="1584" y2="1584" x1="5184" />
        </branch>
        <branch name="led7">
            <wire x2="5184" y1="1760" y2="1760" x1="5168" />
            <wire x2="5200" y1="1760" y2="1760" x1="5184" />
        </branch>
        <branch name="CLKstat(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4160" y="1200" type="branch" />
            <wire x2="4160" y1="1200" y2="1200" x1="4112" />
            <wire x2="4240" y1="1200" y2="1200" x1="4160" />
        </branch>
        <branch name="BTN1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4160" y="1728" type="branch" />
            <wire x2="4160" y1="1728" y2="1728" x1="4112" />
            <wire x2="4240" y1="1728" y2="1728" x1="4160" />
        </branch>
        <branch name="SYS_CLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4768" y="1200" type="branch" />
            <wire x2="4768" y1="1200" y2="1200" x1="4720" />
            <wire x2="4848" y1="1200" y2="1200" x1="4768" />
        </branch>
        <branch name="MWE">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4768" y="1552" type="branch" />
            <wire x2="4768" y1="1552" y2="1552" x1="4720" />
            <wire x2="4848" y1="1552" y2="1552" x1="4768" />
        </branch>
        <branch name="PORTB(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1264" type="branch" />
            <wire x2="4144" y1="1264" y2="1264" x1="4112" />
            <wire x2="4240" y1="1264" y2="1264" x1="4144" />
        </branch>
        <branch name="PORTB(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1440" type="branch" />
            <wire x2="4144" y1="1440" y2="1440" x1="4112" />
            <wire x2="4240" y1="1440" y2="1440" x1="4144" />
        </branch>
        <branch name="PORTB(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1616" type="branch" />
            <wire x2="4144" y1="1616" y2="1616" x1="4112" />
            <wire x2="4240" y1="1616" y2="1616" x1="4144" />
        </branch>
        <branch name="CLKstat(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4128" y="1376" type="branch" />
            <wire x2="4128" y1="1376" y2="1376" x1="4112" />
            <wire x2="4240" y1="1376" y2="1376" x1="4128" />
        </branch>
        <branch name="CLKstat(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4128" y="1552" type="branch" />
            <wire x2="4128" y1="1552" y2="1552" x1="4112" />
            <wire x2="4240" y1="1552" y2="1552" x1="4128" />
        </branch>
        <branch name="N4">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4112" y="1920" type="branch" />
            <wire x2="4112" y1="1920" y2="1920" x1="4064" />
            <wire x2="4208" y1="1920" y2="1920" x1="4112" />
            <wire x2="4816" y1="1920" y2="1920" x1="4208" />
            <wire x2="4240" y1="1328" y2="1328" x1="4208" />
            <wire x2="4208" y1="1328" y2="1504" x1="4208" />
            <wire x2="4240" y1="1504" y2="1504" x1="4208" />
            <wire x2="4208" y1="1504" y2="1680" x1="4208" />
            <wire x2="4240" y1="1680" y2="1680" x1="4208" />
            <wire x2="4208" y1="1680" y2="1856" x1="4208" />
            <wire x2="4240" y1="1856" y2="1856" x1="4208" />
            <wire x2="4208" y1="1856" y2="1920" x1="4208" />
            <wire x2="4848" y1="1328" y2="1328" x1="4816" />
            <wire x2="4816" y1="1328" y2="1504" x1="4816" />
            <wire x2="4848" y1="1504" y2="1504" x1="4816" />
            <wire x2="4816" y1="1504" y2="1680" x1="4816" />
            <wire x2="4848" y1="1680" y2="1680" x1="4816" />
            <wire x2="4816" y1="1680" y2="1856" x1="4816" />
            <wire x2="4816" y1="1856" y2="1920" x1="4816" />
            <wire x2="4848" y1="1856" y2="1856" x1="4816" />
        </branch>
        <instance x="4848" y="1888" name="XLXI_73" orien="R0" />
        <branch name="PORTB(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4752" y="1264" type="branch" />
            <wire x2="4752" y1="1264" y2="1264" x1="4720" />
            <wire x2="4848" y1="1264" y2="1264" x1="4752" />
        </branch>
        <branch name="PORTB(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4752" y="1440" type="branch" />
            <wire x2="4752" y1="1440" y2="1440" x1="4720" />
            <wire x2="4848" y1="1440" y2="1440" x1="4752" />
        </branch>
        <branch name="PORTB(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4752" y="1616" type="branch" />
            <wire x2="4752" y1="1616" y2="1616" x1="4720" />
            <wire x2="4848" y1="1616" y2="1616" x1="4752" />
        </branch>
        <branch name="PORTB(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4752" y="1792" type="branch" />
            <wire x2="4752" y1="1792" y2="1792" x1="4720" />
            <wire x2="4848" y1="1792" y2="1792" x1="4752" />
        </branch>
        <iomarker fontsize="28" x="4592" y="1760" name="led3" orien="R0" />
        <iomarker fontsize="28" x="4592" y="1584" name="led2" orien="R0" />
        <iomarker fontsize="28" x="4592" y="1408" name="led1" orien="R0" />
        <iomarker fontsize="28" x="4592" y="1232" name="led0" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1232" name="led4" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1408" name="led5" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1584" name="led6" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1760" name="led7" orien="R0" />
        <branch name="PORTB(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4160" y="1792" type="branch" />
            <wire x2="4160" y1="1792" y2="1792" x1="4112" />
            <wire x2="4240" y1="1792" y2="1792" x1="4160" />
        </branch>
        <branch name="SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="352" y="480" type="branch" />
            <wire x2="352" y1="480" y2="480" x1="80" />
            <wire x2="640" y1="480" y2="480" x1="352" />
        </branch>
        <instance x="640" y="736" name="prell_sw" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-48" type="instance" />
        </instance>
        <branch name="S(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1136" y="480" type="branch" />
            <wire x2="1120" y1="480" y2="480" x1="1024" />
            <wire x2="1136" y1="480" y2="480" x1="1120" />
            <wire x2="1232" y1="480" y2="480" x1="1136" />
        </branch>
        <branch name="H">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="576" y="544" type="branch" />
            <wire x2="576" y1="544" y2="544" x1="544" />
            <wire x2="640" y1="544" y2="544" x1="576" />
        </branch>
        <branch name="f100Hz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="576" y="608" type="branch" />
            <wire x2="576" y1="608" y2="608" x1="544" />
            <wire x2="640" y1="608" y2="608" x1="576" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="576" y="704" type="branch" />
            <wire x2="576" y1="704" y2="704" x1="544" />
            <wire x2="640" y1="704" y2="704" x1="576" />
        </branch>
        <instance x="1392" y="736" name="XLXI_75" orien="R0" />
        <branch name="mem_test">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1408" type="branch" />
            <wire x2="2224" y1="1408" y2="1408" x1="2112" />
            <wire x2="2320" y1="1408" y2="1408" x1="2224" />
        </branch>
        <instance x="1856" y="1536" name="XLXI_77" orien="R0" />
        <branch name="CTRL(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1344" type="branch" />
            <wire x2="1776" y1="1344" y2="1344" x1="1728" />
            <wire x2="1856" y1="1344" y2="1344" x1="1776" />
        </branch>
        <branch name="CTRL(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1408" type="branch" />
            <wire x2="1776" y1="1408" y2="1408" x1="1728" />
            <wire x2="1856" y1="1408" y2="1408" x1="1776" />
        </branch>
        <branch name="CTRL(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1472" type="branch" />
            <wire x2="1776" y1="1472" y2="1472" x1="1728" />
            <wire x2="1856" y1="1472" y2="1472" x1="1776" />
        </branch>
        <instance x="3840" y="1952" name="XLXI_78" orien="R0" />
        <branch name="CTRL(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3744" y="1920" type="branch" />
            <wire x2="3744" y1="1920" y2="1920" x1="3680" />
            <wire x2="3840" y1="1920" y2="1920" x1="3744" />
        </branch>
        <instance x="2320" y="1376" name="computer" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="128" y="272" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="PROGRAM" x="32" y="298" type="instance" />
        </instance>
        <instance x="1856" y="1616" name="XLXI_80" orien="R0" />
        <branch name="f1MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1792" y="1584" type="branch" />
            <wire x2="1792" y1="1584" y2="1584" x1="1728" />
            <wire x2="1856" y1="1584" y2="1584" x1="1792" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="2096" y1="1584" y2="1584" x1="2080" />
            <wire x2="2192" y1="1584" y2="1584" x1="2096" />
            <wire x2="2192" y1="1472" y2="1584" x1="2192" />
            <wire x2="2320" y1="1472" y2="1472" x1="2192" />
        </branch>
        <branch name="tmr(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1536" type="branch" />
            <wire x2="2800" y1="1536" y2="1536" x1="2704" />
            <wire x2="2880" y1="1536" y2="1536" x1="2800" />
        </branch>
        <branch name="ctr(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1600" type="branch" />
            <wire x2="2800" y1="1600" y2="1600" x1="2704" />
            <wire x2="2880" y1="1600" y2="1600" x1="2800" />
        </branch>
    </sheet>
</drawing>