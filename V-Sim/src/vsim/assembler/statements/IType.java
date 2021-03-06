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

package vsim.assembler.statements;

import vsim.Errors;
import vsim.Globals;
import vsim.assembler.DebugInfo;
import vsim.linker.Relocation;
import vsim.riscv.instructions.Instruction;
import vsim.riscv.instructions.InstructionField;
import vsim.utils.Data;


/**
 * The class IType represents an i-type RISC-V statement.
 */
public class IType extends Statement {

  /** i-type min immediate value {@value} */
  private static final int MIN_VAL = -2048;
  /** i-type max immediate value {@value} */
  private static final int MAX_VAL = 2047;

  /** register destiny */
  private String rd;
  /** register source 1 */
  private String rs1;
  /** immediate or relocation */
  private Object imm;

  /**
   * Unique constructor that initializes a newly IType statement.
   *
   * @param mnemonic statement mnemonic
   * @param debug statement debug information
   * @param rd register destiny
   * @param rs1 register source 1
   * @param imm immediate value or relocation
   */
  public IType(String mnemonic, DebugInfo debug, String rd, String rs1, Object imm) {
    super(mnemonic, debug);
    this.rd = rd;
    this.rs1 = rs1;
    this.imm = imm;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public void resolve() {
    if (this.imm instanceof Relocation)
      ((Relocation) this.imm).resolve(0);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public void build(int pc) {
    int imm;
    // get imm
    if (this.imm instanceof Relocation)
      imm = ((Relocation) this.imm).resolve(pc);
    else
      imm = (int) this.imm;
    // check range
    if (Data.inRange(imm, IType.MIN_VAL, IType.MAX_VAL)) {
      Instruction inst = Globals.iset.get(this.mnemonic);
      int rd = Globals.regfile.getRegisterNumber(this.rd);
      int rs1 = Globals.regfile.getRegisterNumber(this.rs1);
      int opcode = inst.getOpCode();
      int funct3 = inst.getFunct3();
      this.code.set(InstructionField.RD, rd);
      this.code.set(InstructionField.RS1, rs1);
      this.code.set(InstructionField.IMM_11_0, imm);
      this.code.set(InstructionField.OPCODE, opcode);
      this.code.set(InstructionField.FUNCT3, funct3);
    } else
      Errors.add(this.debug, "assembler", "immediate '" + imm + "' out of range should be between -2048 and 2047");
  }

}
