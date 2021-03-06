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

package vsim.riscv.instructions.rtype;

import vsim.utils.Data;


/**
 * The Fsgnjs class represents a {@code fsgnj.s} instruction.
 */
public final class Fsgnjs extends FRType {

  /**
   * Unique constructor that initializes a newly Fsgnjs instruction.
   *
   * @see vsim.riscv.instructions.rtype.FRType
   */
  public Fsgnjs() {
    super("fsgnj.s", "fsgnj.s rd, rs1, rs2", "set f[rd] = {f[rs2][31], f[rs1][30:0]}");
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public int getFunct7() {
    return 0b0010000;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public float compute(float rs1, float rs2) {
    int ax = Float.floatToIntBits(rs1) & (Data.EXPONENT_MASK | Data.FRACTION_MASK);
    int bx = Float.floatToIntBits(rs2) & Data.SIGN_MASK;
    return Float.intBitsToFloat(ax | bx);
  }

}
