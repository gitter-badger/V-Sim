package vsim.assembler;

%%

%{

  private StringBuffer text;

  /**
   * This method creates a new cup Symbol with a predefined value
   * obtained with the yytext() method.
   *
   * @param type the symbol type
   * @return the cup symbol
   */
  private java_cup.runtime.Symbol symbol(int type) {
    return new java_cup.runtime.Symbol(type, yyline + 1, yycolumn + 1, yytext());
  }

  /**
   * This method creates a new cup Symbol with a given value.
   *
   * @param type the symbol type
   * @param value the symbol value
   * @return the cup symbol
   */
  private java_cup.runtime.Symbol symbol(int type, Object value) {
    return new java_cup.runtime.Symbol(type, yyline + 1, yycolumn + 1, value);
  }

%}

%init{
  this.text = new StringBuffer(0);
%init}

%eofval{
  switch (yystate()) {
    case STRING:
      return symbol(Token.ERROR, "EOF in string constant");
    case CHARACTER:
      return symbol(Token.ERROR, "EOF in char constant");
    case SBACKSLASH:
      return symbol(Token.ERROR, "EOF in string constant");
    case CBACKSLASH:
      return symbol(Token.ERROR, "EOF in char constant");
    default:
      return symbol(Token.EOF);
  }
%eofval}


%public
%class Lexer
%final
%cup
%line
%column
%unicode

%state COMMENT
%state STRING
%state SBACKSLASH
%state CHARACTER
%state CBACKSLASH

// syntax
DOT = "."
COMMA = ","
LPAREN = "("
RPAREN = ")"

// strings and chars
STRSTART = \"
BACKSLASH = "\\"
CHAR = .
CHARSTART = \'
// comments
COMMENTSTART = "#"|";"

// directives
D_ZERO = ".zero"
D_SPACE = ".space"
D_ASCIIZ = ".asciiz"
D_ASCIZ = ".asciz"
D_STRING = ".string"
D_ASCII = ".ascii"
D_BYTE = ".byte"
D_HALF = ".half"
D_SHORT = ".short"
D_2BYTE = ".2byte"
D_WORD = ".word"
D_LONG = ".long"
D_4BYTE = ".4byte"
D_FLOAT = ".float"
D_ALIGN = ".align"
D_P2ALIGN = ".p2align"
D_BALIGN = ".balign"
D_GLOBL = ".globl"
D_GLOBAL = ".global"
D_SECTION = ".section"
D_DATA = ".data"
D_TEXT = ".text"
D_RODATA = ".rodata"
D_BSS = ".bss"

// B Format
I_BEQ = [bB][eE][qQ]
I_BGE = [bB][gG][eE]
I_BGEU = [bB][gG][eE][uU]
I_BLT = [bB][lL][tT]
I_BLTU = [bB][lL][tT][uU]
I_BNE = [bB][nN][eE]
// B Pseudos
I_BEQZ = [bB][eE][qQ][zZ]
I_BNEZ = [bB][nN][eE][zZ]
I_BLEZ = [bB][lL][eE][zZ]
I_BGEZ = [bB][gG][eE][zZ]
I_BLTZ = [bB][lL][tT][zZ]
I_BGTZ = [bB][gG][tT][zZ]
I_BGT = [bB][gG][tT]
I_BLE = [bB][lL][eE]
I_BGTU = [bB][gG][tT][uU]
I_BLEU = [bB][lL][eE][uU]

// U Format
I_AUIPC = [aA][uU][iI][pP][cC]
I_LUI = [lL][uU][iI]

// J Format
I_JAL = [jJ][aA][lL]
// J Pseudos
I_J = [jJ]

// R Format
I_ADD = [aA][dD][dD]
I_AND = [aA][nN][dD]
I_DIVU = [dD][iI][vV][uU]
I_DIV = [dD][iI][vV]
I_MULHSU = [mM][uU][lL][hH][sS][uU]
I_MULHU = [mM][uU][lL][hH][uU]
I_MULH = [mM][uU][lL][hH]
I_MUL = [mM][uU][lL]
I_OR = [oO][rR]
I_REMU = [rR][eE][mM][uU]
I_REM = [rR][eE][mM]
I_SLTU = [sS][lL][tT][uU]
I_SLL = [sS][lL][lL]
I_SLT = [sS][lL][tT]
I_SRA = [sS][rR][aA]
I_SRL = [sS][rR][lL]
I_SUB = [sS][uU][bB]
I_XOR = [xX][oO][rR]
// R Pseudos
I_NEG = [nN][eE][gG]
I_SNEZ = [sS][nN][eE][zZ]
I_SLTZ = [sS][lL][tT][zZ]
I_SGTZ = [sS][gG][tT][zZ]
// single-precision floating point
F_FMVWX = [fF][mM][vV]"."[wW]"."[xX]
F_FMVXW = [fF][mM][vV]"."[xX]"."[wW]
F_FMVSX = [fF][mM][vV]"."[sS]"."[xX]
F_FMVXS = [fF][mM][vV]"."[xX]"."[sS]
F_FCVTSW = [fF][cC][vV][tT]"."[sS]"."[wW]
F_FCVTSWU = [fF][cC][vV][tT]"."[sS]"."[wW][uU]
F_FCVTWS = [fF][cC][vV][tT]"."[wW]"."[sS]
F_FCVTWUS = [fF][cC][vV][tT]"."[wW][uU]"."[sS]
F_FADDS = [fF][aA][dD][dD]"."[sS]
F_FSUBS = [fF][sS][uU][bB]"."[sS]
F_FMULS = [fF][mM][uU][lL]"."[sS]
F_FDIVS = [fF][dD][iI][vV]"."[sS]
F_FSQRTS = [fF][sS][qQ][rR][tT]"."[sS]
F_FMADDS = [fF][mM][aA][dD][dD]"."[sS]
F_FMSUBS = [fF][mM][sS][uU][bB]"."[sS]
F_FNMSUBS = [fF][nN][mM][sS][uU][bB]"."[sS]
F_FNMADDS = [fF][nN][mM][aA][dD][dD]"."[sS]
F_FSGNJS = [fF][sS][gG][nN][jJ]"."[sS]
F_FSGNJNS = [fF][sS][gG][nN][jJ][nN]"."[sS]
F_FSGNJXS = [fF][sS][gG][nN][jJ][xX]"."[sS]
F_FMINS = [fF][mM][iI][nN]"."[sS]
F_FMAXS = [fF][mM][aA][xX]"."[sS]
F_FEQS = [fF][eE][qQ]"."[sS]
F_FLTS = [fF][lL][tT]"."[sS]
F_FLES = [fF][lL][eE]"."[sS]
F_FCLASSS = [fF][cC][lL][aA][sS][sS]"."[sS]
// floating point Pseudos
F_FMVS = [fF][mM][vV]"."[sS]
F_FABSS = [fF][aA][bB][sS]"."[sS]
F_FNEGS = [fF][nN][eE][gG]"."[sS]

// I Format
I_ADDI = [aA][dD][dD][iI]
I_ANDI = [aA][nN][dD][iI]
I_ECALL = [eE][cC][aA][lL][lL]
I_BREAK = [eE][bB][rR][eE][aA][kK]
I_JALR = [jJ][aA][lL][rR]
I_LB = [lL][bB]
I_LBU = [lL][bB][uU]
I_LH = [lL][hH]
I_LHU = [lL][hH][uU]
I_LW = [lL][wW]
I_ORI = [oO][rR][iI]
I_SLLI = [sS][lL][lL][iI]
I_SLTI = [sS][lL][tT][iI]
I_SLTIU = [sS][lL][tT][iI][uU]
I_SRAI = [sS][rR][aA][iI]
I_SRLI = [sS][rR][lL][iI]
I_XORI = [xX][oO][rR][iI]
// I Pseudos
I_NOP = [nN][oO][pP]
I_MV = [mM][vV]
I_NOT = [nN][oO][tT]
I_SEQZ = [sS][eE][qQ][zZ]
I_JR = [jJ][rR]
I_RET = [rR][eE][tT]
// single-precision floating point
F_FLW = [fF][lL][wW]

// S Format
I_SB = [sS][bB]
I_SH = [sS][hH]
I_SW = [sS][wW]
// single-precision floating point
F_FSW = [fF][sS][wW]

// Pseudos
I_LA = [lL][aA]
I_LI = [lL][iI]
I_CALL = [cC][aA][lL][lL]
I_TAIL = [tT][aA][iI][lL]

// registers
R_NUMBER = [xX]([0-9]|[12][0-9]|[3][01])
R_NAME = ("zero"|"ra"|"sp"|"gp"|"tp"|"fp"|"t"[0-6]|"a"[0-7]|"s"([0-9]|1[01]))
REGISTER = ({R_NUMBER}|{R_NAME})

// floating point registers
F_NUMBER = [fF]([0-9]|[12][0-9]|[3][01])
F_NAME = ("ft"([0-9]|1[01])|"fa"[0-8]|"fs"([0-9]|1[01]))
FREGISTER = ({F_NUMBER}|{F_NAME})

// ids
IDENTIFIER = [a-zA-Z_]([a-zA-Z0-9_]*("."[a-zA-Z0-9_]+)?)

// labels
LABEL = {IDENTIFIER}:

// numbers
NUMBER = [+-]?[0-9]+
HEXADECIMAL = 0[xX][0-9a-fA-F]+
BINARY = 0[bB][01]+

// floats
FLOAT = [+-]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

// valid whitespace
WHITESPACE = (" "|\t)

// platoform independent newline
NEWLINE = \R

// everything else error
ERROR = .
%%

<YYINITIAL>{

  // syntax symbols
  {DOT} {
    return symbol(Token.DOT);
  }

  {COMMA}  {
    return symbol(Token.COMMA);
  }

  {LPAREN} {
    return symbol(Token.LPAREN);
  }

  {RPAREN} {
    return symbol(Token.RPAREN);
  }

  // strings
  {STRSTART} {
    this.text.setLength(0);
    yybegin(STRING);
  }

  // chars
  {CHARSTART} {
    this.text.setLength(0);
    yybegin(CHARACTER);
  }

  // commnets
  {COMMENTSTART} {
    yybegin(COMMENT);
  }

  // labels
  {LABEL} {
    return symbol(Token.LABEL);
  }

  // directives
  {D_ZERO} {
    return symbol(Token.D_ZERO);
  }

  {D_SPACE} {
    return symbol(Token.D_ZERO);
  }

  {D_ASCIIZ} {
    return symbol(Token.D_ASCIIZ);
  }

  {D_ASCIZ} {
    return symbol(Token.D_ASCIIZ);
  }

  {D_ASCII} {
    return symbol(Token.D_ASCII);
  }

  {D_STRING} {
    return symbol(Token.D_ASCIIZ);
  }

  {D_BYTE} {
    return symbol(Token.D_BYTE);
  }

  {D_HALF} {
    return symbol(Token.D_HALF);
  }

  {D_SHORT} {
    return symbol(Token.D_HALF);
  }

  {D_2BYTE} {
    return symbol(Token.D_HALF);
  }

  {D_WORD} {
    return symbol(Token.D_WORD);
  }

  {D_LONG} {
    return symbol(Token.D_WORD);
  }

  {D_4BYTE} {
    return symbol(Token.D_WORD);
  }

  {D_ALIGN} {
    return symbol(Token.D_ALIGN);
  }

  {D_P2ALIGN} {
    return symbol(Token.D_ALIGN);
  }

  {D_BALIGN} {
    return symbol(Token.D_BALIGN);
  }

  {D_GLOBL} {
    return symbol(Token.D_GLOBL);
  }

  {D_GLOBAL} {
    return symbol(Token.D_GLOBL);
  }

  {D_SECTION} {
    return symbol(Token.D_SECTION);
  }

  {D_DATA} {
    return symbol(Token.D_DATA);
  }

  {D_TEXT} {
    return symbol(Token.D_TEXT);
  }

  {D_RODATA} {
    return symbol(Token.D_RODATA);
  }

  {D_BSS} {
    return symbol(Token.D_BSS);
  }

  {D_FLOAT} {
    return symbol(Token.D_FLOAT);
  }

  // B Format
  {I_BEQ} {
    return symbol(Token.I_BEQ);
  }

  {I_BGE} {
    return symbol(Token.I_BGE);
  }

  {I_BGEU} {
    return symbol(Token.I_BGEU);
  }

  {I_BLT} {
    return symbol(Token.I_BLT);
  }

  {I_BLTU} {
    return symbol(Token.I_BLTU);
  }

  {I_BNE} {
    return symbol(Token.I_BNE);
  }

  // U Format
  {I_AUIPC} {
    return symbol(Token.I_AUIPC);
  }

  {I_LUI} {
    return symbol(Token.I_LUI);
  }

  // J Format
  {I_JAL} {
    return symbol(Token.I_JAL);
  }

  // S Format
  {I_SB} {
    return symbol(Token.I_SB);
  }

  {I_SH} {
    return symbol(Token.I_SH);
  }

  {I_SW} {
    return symbol(Token.I_SW);
  }

  {F_FSW} {
    return symbol(Token.F_FSW);
  }

  // R Format
  {I_ADD} {
    return symbol(Token.I_ADD);
  }

  {I_AND} {
    return symbol(Token.I_AND);
  }

  {I_DIV} {
    return symbol(Token.I_DIV);
  }

  {I_DIVU} {
    return symbol(Token.I_DIVU);
  }

  {I_MULHSU} {
    return symbol(Token.I_MULHSU);
  }

  {I_MULHU} {
    return symbol(Token.I_MULHU);
  }

  {I_MUL} {
    return symbol(Token.I_MUL);
  }

  {I_MULH} {
    return symbol(Token.I_MULH);
  }

  {I_OR} {
    return symbol(Token.I_OR);
  }

  {I_REM} {
    return symbol(Token.I_REM);
  }

  {I_REMU} {
    return symbol(Token.I_REMU);
  }

  {I_SLTU} {
    return symbol(Token.I_SLTU);
  }

  {I_SLL} {
    return symbol(Token.I_SLL);
  }

  {I_SLT} {
    return symbol(Token.I_SLT);
  }

  {I_SRA} {
    return symbol(Token.I_SRA);
  }

  {I_SRL} {
    return symbol(Token.I_SRL);
  }

  {I_SUB} {
    return symbol(Token.I_SUB);
  }

  {I_XOR} {
    return symbol(Token.I_XOR);
  }

  {F_FMVWX} {
    return symbol(Token.F_FMVWX);
  }

  {F_FMVSX} {
    return symbol(Token.F_FMVWX);
  }

  {F_FMVXW} {
    return symbol(Token.F_FMVXW);
  }

  {F_FMVXS} {
    return symbol(Token.F_FMVXW);
  }

  {F_FCVTSW} {
    return symbol(Token.F_FCVTSW);
  }

  {F_FCVTSWU} {
    return symbol(Token.F_FCVTSWU);
  }

  {F_FCVTWS} {
    return symbol(Token.F_FCVTWS);
  }

  {F_FCVTWUS} {
    return symbol(Token.F_FCVTWUS);
  }

  {F_FADDS} {
    return symbol(Token.F_FADDS);
  }

  {F_FSUBS} {
    return symbol(Token.F_FSUBS);
  }

  {F_FMULS} {
    return symbol(Token.F_FMULS);
  }

  {F_FDIVS} {
    return symbol(Token.F_FDIVS);
  }

  {F_FSQRTS} {
    return symbol(Token.F_FSQRTS);
  }

  {F_FMADDS} {
    return symbol(Token.F_FMADDS);
  }

  {F_FMSUBS} {
    return symbol(Token.F_FMSUBS);
  }

  {F_FNMSUBS} {
    return symbol(Token.F_FNMSUBS);
  }

  {F_FNMADDS} {
    return symbol(Token.F_FNMADDS);
  }

  {F_FSGNJS} {
    return symbol(Token.F_FSGNJS);
  }

  {F_FSGNJNS} {
    return symbol(Token.F_FSGNJNS);
  }

  {F_FSGNJXS} {
    return symbol(Token.F_FSGNJXS);
  }

  {F_FMINS} {
    return symbol(Token.F_FMINS);
  }

  {F_FMAXS} {
    return symbol(Token.F_FMAXS);
  }

  {F_FEQS} {
    return symbol(Token.F_FEQS);
  }

  {F_FLTS} {
    return symbol(Token.F_FLTS);
  }

  {F_FLES} {
    return symbol(Token.F_FLES);
  }

  {F_FCLASSS} {
    return symbol(Token.F_FCLASSS);
  }

  // I Format
  {I_ADDI} {
    return symbol(Token.I_ADDI);
  }

  {I_ANDI} {
    return symbol(Token.I_ANDI);
  }

  {I_ECALL} {
    return symbol(Token.I_ECALL);
  }

  {I_BREAK} {
    return symbol(Token.I_BREAK);
  }

  {I_JALR} {
    return symbol(Token.I_JALR);
  }

  {I_LB} {
    return symbol(Token.I_LB);
  }

  {I_LBU} {
    return symbol(Token.I_LBU);
  }

  {I_LH} {
    return symbol(Token.I_LH);
  }

  {I_LHU} {
    return symbol(Token.I_LHU);
  }

  {I_LW} {
    return symbol(Token.I_LW);
  }

  {I_ORI} {
    return symbol(Token.I_ORI);
  }

  {I_SLLI} {
    return symbol(Token.I_SLLI);
  }

  {I_SLTI} {
    return symbol(Token.I_SLTI);
  }

  {I_SLTIU} {
    return symbol(Token.I_SLTIU);
  }

  {I_SRAI} {
    return symbol(Token.I_SRAI);
  }

  {I_SRLI} {
    return symbol(Token.I_SRLI);
  }

  {I_XORI} {
    return symbol(Token.I_XORI);
  }

  {F_FLW} {
    return symbol(Token.F_FLW);
  }

  // Pseudos
  {I_LA} {
    return symbol(Token.I_LA);
  }

  {I_NOP} {
    return symbol(Token.I_NOP);
  }

  {I_LI} {
    return symbol(Token.I_LI);
  }

  {I_MV} {
    return symbol(Token.I_MV);
  }

  {I_NOT} {
    return symbol(Token.I_NOT);
  }

  {I_NEG} {
    return symbol(Token.I_NEG);
  }

  {I_SEQZ} {
    return symbol(Token.I_SEQZ);
  }

  {I_SNEZ} {
    return symbol(Token.I_SNEZ);
  }

  {I_SLTZ} {
    return symbol(Token.I_SLTZ);
  }

  {I_SGTZ} {
    return symbol(Token.I_SGTZ);
  }

  {I_BEQZ} {
    return symbol(Token.I_BEQZ);
  }

  {I_BNEZ} {
    return symbol(Token.I_BNEZ);
  }

  {I_BLEZ} {
    return symbol(Token.I_BLEZ);
  }

  {I_BGEZ} {
    return symbol(Token.I_BGEZ);
  }

  {I_BLTZ} {
    return symbol(Token.I_BLTZ);
  }

  {I_BGTZ} {
    return symbol(Token.I_BGTZ);
  }

  {I_BGT} {
    return symbol(Token.I_BGT);
  }

  {I_BLE} {
    return symbol(Token.I_BLE);
  }

  {I_BGTU} {
    return symbol(Token.I_BGTU);
  }

  {I_BLTU} {
    return symbol(Token.I_BLTU);
  }

  {I_BLEU} {
    return symbol(Token.I_BLEU);
  }

  {I_J} {
    return symbol(Token.I_J);
  }

  {I_JR} {
    return symbol(Token.I_JR);
  }

  {I_RET} {
    return symbol(Token.I_RET);
  }

  {I_CALL} {
    return symbol(Token.I_CALL);
  }

  {I_TAIL} {
    return symbol(Token.I_TAIL);
  }

  {F_FMVS} {
    return symbol(Token.F_FMVS);
  }

  {F_FABSS} {
    return symbol(Token.F_FABSS);
  }

  {F_FNEGS} {
    return symbol(Token.F_FNEGS);
  }

  // registers
  {REGISTER} {
    return symbol(Token.REGISTER);
  }

  {FREGISTER} {
    return symbol(Token.FREGISTER);
  }

  // identifiers
  {IDENTIFIER} {
    return symbol(Token.IDENTIFIER);
  }

  // number
  {NUMBER} {
    try {
      return symbol(Token.NUMBER, Integer.parseInt(yytext()));
    } catch (Exception e) {
      return symbol(Token.ERROR, "(32 bits only) invalid number constant: '" + yytext() + "'");
    }
  }

  // floats
  {FLOAT} {
    try {
      return symbol(Token.FLOAT, Float.parseFloat(yytext()));
    } catch (Exception e) {
      return symbol(Token.ERROR, "invalid floating-point constat: '" + yytext() + "'");
    }
  }

  // hex number
  {HEXADECIMAL} {
    try {
      return symbol(Token.HEXNUM,   Integer.parseUnsignedInt(yytext().substring(2), 16));
    } catch (Exception e) {
      return symbol(Token.ERROR, "(32 bits only) invalid hexadecimal constant: '" + yytext() + "'");
    }
  }

  // binary number
  {BINARY} {
    try {
      return symbol(Token.BINARY, Integer.parseUnsignedInt(yytext().substring(2), 2));
    } catch (Exception e) {
      return symbol(Token.ERROR, "(32 bits only) invalid binary constant: '" + yytext() + "'");
    }
  }

  // newlines
  {NEWLINE}+ {
    return symbol(Token.NEWLINE);
  }

  // ignore whitespace
  {WHITESPACE} { /* do nothing */ }

  // report error
  {ERROR}  {
    return symbol(Token.ERROR, "(syntax) unexpected character: '" + yytext() + "'");
  }

}

<STRING> {

  {BACKSLASH} {
    yybegin(SBACKSLASH);
  }

  {STRSTART} {
    yybegin(YYINITIAL);
    return symbol(Token.STRING, this.text.toString());
  }

  {CHAR} {
    this.text.append(yytext());
  }

  {NEWLINE} {
    yypushback(yylength());
    yybegin(YYINITIAL);
    return symbol(Token.ERROR, "unterminated string constant");
  }

}

<CHARACTER> {

  {BACKSLASH} {
    yybegin(CBACKSLASH);
  }

  {CHARSTART} {
    yybegin(YYINITIAL);
    String ch = this.text.toString();
    if (ch.length() == 1)
      return symbol(Token.CHARACTER, this.text.toString().charAt(0));
    else
      return symbol(Token.ERROR, "invalid char: '" + ch + "'");
  }

  {CHAR} {
    this.text.append(yytext());
  }

  {NEWLINE} {
    yypushback(yylength());
    yybegin(YYINITIAL);
    return symbol(Token.ERROR, "unterminated char constant");
  }

}

<SBACKSLASH> {

  "0" {
    this.text.append('\0');
    yybegin(STRING);
  }

  "n" {
    this.text.append(System.getProperty("line.separator"));
    yybegin(STRING);
  }

  "t" {
    this.text.append('\t');
    yybegin(STRING);
  }

  "f" {
    this.text.append('\f');
    yybegin(STRING);
  }

  "b" {
    this.text.append('\b');
    yybegin(STRING);
  }

  "v" {
    this.text.append((char)11);
    yybegin(STRING);
  }

  "r" {
    this.text.append('\r');
    yybegin(STRING);
  }

  "\"" {
    this.text.append("\"");
    yybegin(STRING);
  }

  "'" {
    this.text.append("'");
    yybegin(STRING);
  }

  "\\" {
    this.text.append("\\");
    yybegin(STRING);
  }

  {CHAR} {
    this.text.append(yytext());
    yybegin(STRING);
  }

  {NEWLINE} {
    this.text.append(yytext());
    yybegin(STRING);
  }

}

<CBACKSLASH> {

  "0" {
    this.text.append('\0');
    yybegin(CHARACTER);
  }

  "n" {
    this.text.append('\n');
    yybegin(CHARACTER);
  }

  "t" {
    this.text.append('\t');
    yybegin(CHARACTER);
  }

  "f" {
    this.text.append('\f');
    yybegin(CHARACTER);
  }

  "b" {
    this.text.append('\b');
    yybegin(CHARACTER);
  }

  "v" {
    this.text.append((char)11);
    yybegin(CHARACTER);
  }

  "r" {
    this.text.append((char)'\r');
    yybegin(CHARACTER);
  }

  "\"" {
    this.text.append("\"");
    yybegin(CHARACTER);
  }

  "\'" {
    this.text.append("\'");
    yybegin(CHARACTER);
  }

  "\\" {
    this.text.append("\\");
    yybegin(CHARACTER);
  }

  {CHAR} {
    this.text.append(yytext());
    yybegin(CHARACTER);
  }

  {NEWLINE} {
    yypushback(yylength());
    yybegin(YYINITIAL);
    return symbol(Token.ERROR, "unterminated char constant");
  }

}

<COMMENT> {

  // consume everything
  {CHAR} { /* NOTHING TO DO */ }

  {NEWLINE} {
    yypushback(yylength());
    yybegin(YYINITIAL);
  }

}
