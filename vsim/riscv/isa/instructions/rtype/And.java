package vsim.riscv.isa.instructions.rtype;


public final class And extends RType {

    @Override
    protected int compute(int rs1, int rs2) {
        return rs1 & rs2;
    }

}