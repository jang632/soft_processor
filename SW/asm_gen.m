clc; clear; close all;


instr = {
    "MOVI R3, 0x01"
    "MOVI R0, 0xF0"
    "ADDI R1, R0, 0x01"
    "MOV R1, R0"
    "JNZ R0, 0x02"
    "NOP"
    "MOVI R3, 0x02"
    "ANDI R5, R4, 0x01"
    "JZ R5, 0x07"
    "NOP"
    "MOVI R3, 0x04"
    "MOVI R0, 0xF0"
    "ADDI R1, R0, 0x01"
    "MOV R1, R0"
    "JNZ R0, 0x0c"
    "NOP"
    "MOVI R3, 0x08"
    "ANDI R5, R4, 0x02"
    "JZ R5, 0x11"
    "NOP"
    "JMP R6"
    "NOP"
};

fileID = fopen("prog_mem.txt","w");


for i = 1:length(instr)
    bin = assembler(instr{i});   
    fprintf("%s\n", bin);       
    fprintf(fileID, "%s,\n", bin);  
end

fclose(fileID);
disp("Finished");
