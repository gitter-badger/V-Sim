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
 * The Fmaxs class represents a {@code fmax.s} instruction.
 */
public final class Fmaxs extends FRType {

  /**
   * Unique constructor that initializes a newly Fmaxs instruction.
   *
   * @see vsim.riscv.instructions.rtype.FRType
   */
  public Fmaxs() {
    super("fmax.s", "fmax.s rd, rs1, rs2", "set f[rd] = max(f[rs1], f[rs2])");
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public int getFunct3() {
    return 0b001;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public int getFunct7() {
    return 0b0010100;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public float compute(float rs1, float rs2) {
    // if at least one input is a signaling NaN, return canonical NaN
    if (Data.signalingNaN(rs1) || Data.signalingNaN(rs2))
      return Float.NaN;
    // if both inputs are quiet nans, return canonical NaN
    else if (Data.quietNaN(rs1) && Data.quietNaN(rs2))
      return Float.NaN;
    // if one operand is a quiet NaN and the other is not a NaN, return
    // the non-NaN operand
    else if (Data.quietNaN(rs1) || Data.quietNaN(rs2)) {
      if (!Data.quietNaN(rs1))
        return rs1;
      else
        return rs2;
    }
    // return the larger floating point number
    else
      return Math.max(rs1, rs2);
  }

}
