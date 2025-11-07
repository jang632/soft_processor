function bin = assembler(instr)

    instr = upper(strtrim(instr));
    parts = split(instr, {' ', ',', '\t'});
    parts = parts(parts~="");

    op = parts{1};

    regBits = @(r) dec2bin(str2double(extractAfter(r,"R")),3);

    immBits = @(x) sprintf('%08s', dec2bin( ...
        contains(x,'0X')*hex2dec(x) + ~contains(x,'0X')*str2double(x), 8));

    switch op

        case "MOV"
            Rx = regBits(parts{2});
            Ry = regBits(parts{3});
            temp = sprintf("00000000_00010%s_01100%s_00000000", Rx, Ry);

        case "MOVI"
            Rx = regBits(parts{2});
            Imm = immBits(parts{3});
            temp = sprintf("00000000_00110000_10000%s_%s", Rx, Imm);

        case "JMP"
            Rx = regBits(parts{2});
            temp = sprintf("00000001_00010%s_01100110_00000000", Rx);

        case "JZ"
            Rx = regBits(parts{2});
            Imm = immBits(parts{3});
            temp = sprintf("00000010_00110%s_10000110_%s", Rx, Imm);

        case "JNZ"
            Rx = regBits(parts{2});
            Imm = immBits(parts{3});
            temp = sprintf("00000011_00110%s_10000110_%s", Rx, Imm);

        case "ADD"
            Rd = regBits(parts{2});
            Rx = regBits(parts{3});
            Ry = regBits(parts{4});
            temp = sprintf("00000000_00010%s_0%s0%s_00000000", Rx, Ry, Rd);

        case "ADDI"
            Rd = regBits(parts{2});
            Rx = regBits(parts{3});
            Imm = immBits(parts{4});
            temp = sprintf("00000000_00010%s_10000%s_%s", Rx, Rd, Imm);

        case "AND"
            Rd = regBits(parts{2});
            Rx = regBits(parts{3});
            Ry = regBits(parts{4});
            temp = sprintf("00000000_00000%s_0%s0%s_00000000", Rx, Ry, Rd);

        case "ANDI"
            Rd = regBits(parts{2});
            Rx = regBits(parts{3});
            Imm = immBits(parts{4});
            temp = sprintf("00000000_00000%s_10000%s_%s", Rx, Rd, Imm);

        case "NOP"
            temp = "00000000_00000000_00000000_00000000";

        case "JMPI"
            Imm = immBits(parts{2});
            temp = sprintf("00000001_00010110_11100110_%s", Imm);


        otherwise
            error("Nieznana instrukcja: %s", instr);
    end

    bin = erase(temp, "_");
end
