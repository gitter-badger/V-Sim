/*
Copyright (C) 2018-2019 Andres Castellanos

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>
*/

package vsim.assembler;

/** CUP generated class containing symbol constants. */
public class Token {

  /* terminals */
  public static final int D_FLOAT = 132;
  public static final int I_NOT = 85;
  public static final int IDENTIFIER = 117;
  public static final int F_FNEGS = 108;
  public static final int I_BEQ = 72;
  public static final int F_FCVTWS = 30;
  public static final int I_NOP = 82;
  public static final int I_BNEZ = 92;
  public static final int I_MULH = 14;
  public static final int I_SH = 69;
  public static final int D_TEXT = 125;
  public static final int F_FCVTWUS = 31;
  public static final int NEWLINE = 7;
  public static final int F_FMVS = 106;
  public static final int I_SRAI = 63;
  public static final int I_SB = 68;
  public static final int I_BLEZ = 93;
  public static final int I_MUL = 15;
  public static final int I_SLTZ = 89;
  public static final int I_LW = 58;
  public static final int I_BLEU = 100;
  public static final int I_AUIPC = 79;
  public static final int REGISTER = 115;
  public static final int I_SLTU = 19;
  public static final int I_LUI = 78;
  public static final int F_FSW = 71;
  public static final int F_FEQS = 46;
  public static final int D_SECTION = 124;
  public static final int I_LBU = 55;
  public static final int F_FMADDS = 37;
  public static final int COMMA = 3;
  public static final int D_ALIGN = 129;
  public static final int F_FADDS = 32;
  public static final int F_FSGNJXS = 43;
  public static final int F_FDIVS = 35;
  public static final int RPAREN = 5;
  public static final int I_LI = 83;
  public static final int I_LHU = 57;
  public static final int I_SLTIU = 62;
  public static final int I_SLTI = 61;
  public static final int I_LH = 56;
  public static final int D_ZERO = 120;
  public static final int I_LB = 54;
  public static final int I_LA = 81;
  public static final int LPAREN = 4;
  public static final int D_ASCII = 119;
  public static final int I_BGEZ = 94;
  public static final int I_ANDI = 51;
  public static final int I_SGTZ = 90;
  public static final int I_ADD = 8;
  public static final int I_DIV = 11;
  public static final int I_BGEU = 74;
  public static final int F_FLW = 67;
  public static final int ERROR = 133;
  public static final int FLOAT = 112;
  public static final int I_SRLI = 64;
  public static final int I_SLT = 21;
  public static final int I_TAIL = 105;
  public static final int F_FMAXS = 45;
  public static final int F_FNMADDS = 40;
  public static final int I_BEQZ = 91;
  public static final int I_SLL = 20;
  public static final int CHARACTER = 114;
  public static final int I_BREAK = 66;
  public static final int I_SRL = 23;
  public static final int D_ASCIIZ = 118;
  public static final int I_CALL = 104;
  public static final int NUMBER = 109;
  public static final int F_FSQRTS = 36;
  public static final int F_FMSUBS = 38;
  public static final int I_JAL = 80;
  public static final int F_FSUBS = 33;
  public static final int F_FLTS = 47;
  public static final int D_RODATA = 127;
  public static final int I_SRA = 22;
  public static final int I_REMU = 17;
  public static final int I_JR = 102;
  public static final int I_SNEZ = 88;
  public static final int I_RET = 103;
  public static final int I_SLLI = 60;
  public static final int I_DIVU = 10;
  public static final int D_DATA = 126;
  public static final int I_REM = 18;
  public static final int I_ORI = 59;
  public static final int I_JALR = 53;
  public static final int I_XORI = 65;
  public static final int I_ADDI = 50;
  public static final int D_BALIGN = 130;
  public static final int DOT = 2;
  public static final int I_BNE = 77;
  public static final int EOF = 0;
  public static final int F_FNMSUBS = 39;
  public static final int F_FCVTSW = 28;
  public static final int I_AND = 9;
  public static final int I_OR = 16;
  public static final int I_BLTZ = 95;
  public static final int F_FMULS = 34;
  public static final int F_FMVXW = 27;
  public static final int D_BSS = 128;
  public static final int I_BGT = 97;
  public static final int D_GLOBL = 131;
  public static final int I_NEG = 86;
  public static final int I_BLTU = 76;
  public static final int LABEL = 6;
  public static final int D_BYTE = 121;
  public static final int I_XOR = 25;
  public static final int F_FMINS = 44;
  public static final int error = 1;
  public static final int I_BGE = 73;
  public static final int I_ECALL = 52;
  public static final int F_FSGNJNS = 42;
  public static final int BINARY = 111;
  public static final int F_FABSS = 107;
  public static final int I_SEQZ = 87;
  public static final int I_BGTZ = 96;
  public static final int F_FMVWX = 26;
  public static final int I_BGTU = 99;
  public static final int I_BLT = 75;
  public static final int F_FCVTSWU = 29;
  public static final int I_J = 101;
  public static final int F_FLES = 48;
  public static final int D_WORD = 123;
  public static final int STRING = 113;
  public static final int D_HALF = 122;
  public static final int F_FSGNJS = 41;
  public static final int F_FCLASSS = 49;
  public static final int I_MULHSU = 12;
  public static final int HEXNUM = 110;
  public static final int I_BLE = 98;
  public static final int FREGISTER = 116;
  public static final int I_MV = 84;
  public static final int I_SUB = 24;
  public static final int I_MULHU = 13;
  public static final int I_SW = 70;
  public static final String[] terminalNames = new String[] { "EOF", "error", "DOT", "COMMA", "LPAREN", "RPAREN",
      "LABEL", "NEWLINE", "I_ADD", "I_AND", "I_DIVU", "I_DIV", "I_MULHSU", "I_MULHU", "I_MULH", "I_MUL", "I_OR",
      "I_REMU", "I_REM", "I_SLTU", "I_SLL", "I_SLT", "I_SRA", "I_SRL", "I_SUB", "I_XOR", "F_FMVWX", "F_FMVXW",
      "F_FCVTSW", "F_FCVTSWU", "F_FCVTWS", "F_FCVTWUS", "F_FADDS", "F_FSUBS", "F_FMULS", "F_FDIVS", "F_FSQRTS",
      "F_FMADDS", "F_FMSUBS", "F_FNMSUBS", "F_FNMADDS", "F_FSGNJS", "F_FSGNJNS", "F_FSGNJXS", "F_FMINS", "F_FMAXS",
      "F_FEQS", "F_FLTS", "F_FLES", "F_FCLASSS", "I_ADDI", "I_ANDI", "I_ECALL", "I_JALR", "I_LB", "I_LBU", "I_LH",
      "I_LHU", "I_LW", "I_ORI", "I_SLLI", "I_SLTI", "I_SLTIU", "I_SRAI", "I_SRLI", "I_XORI", "I_BREAK", "F_FLW", "I_SB",
      "I_SH", "I_SW", "F_FSW", "I_BEQ", "I_BGE", "I_BGEU", "I_BLT", "I_BLTU", "I_BNE", "I_LUI", "I_AUIPC", "I_JAL",
      "I_LA", "I_NOP", "I_LI", "I_MV", "I_NOT", "I_NEG", "I_SEQZ", "I_SNEZ", "I_SLTZ", "I_SGTZ", "I_BEQZ", "I_BNEZ",
      "I_BLEZ", "I_BGEZ", "I_BLTZ", "I_BGTZ", "I_BGT", "I_BLE", "I_BGTU", "I_BLEU", "I_J", "I_JR", "I_RET", "I_CALL",
      "I_TAIL", "F_FMVS", "F_FABSS", "F_FNEGS", "NUMBER", "HEXNUM", "BINARY", "FLOAT", "STRING", "CHARACTER",
      "REGISTER", "FREGISTER", "IDENTIFIER", "D_ASCIIZ", "D_ASCII", "D_ZERO", "D_BYTE", "D_HALF", "D_WORD", "D_SECTION",
      "D_TEXT", "D_DATA", "D_RODATA", "D_BSS", "D_ALIGN", "D_BALIGN", "D_GLOBL", "D_FLOAT", "ERROR" };
}
