import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.address.*;
import ghidra.program.model.symbol.*;
import java.io.*;

public class RangeXref extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(args[args.length-1]), "UTF-8")));
        long lo = Long.parseLong(args[0].replace("0x",""), 16);
        long hi = Long.parseLong(args[1].replace("0x",""), 16);
        // iterate all functions, find references to addresses in [lo, hi)
        FunctionIterator fit = currentProgram.getFunctionManager().getFunctions(true);
        while (fit.hasNext()) {
            Function f = fit.next();
            // scan instruction references within function body
            AddressSetView body = f.getBody();
            InstructionIterator iit = currentProgram.getListing().getInstructions(body, true);
            while (iit.hasNext()) {
                Instruction ins = iit.next();
                for (int i = 0; i < ins.getNumOperands(); i++) {
                    Object[] objs = ins.getOperandReferences(i);
                    if (objs != null) {
                        for (Object o : objs) {
                            if (o instanceof Reference) {
                                Reference r = (Reference) o;
                                long to = r.getToAddress().getOffset();
                                if (to >= lo && to < hi) {
                                    pw.println("FUNC " + f.getName(true) + " @ " + f.getEntryPoint() + "  REF " + r.getFromAddress() + " -> " + r.getToAddress() + " type=" + r.getReferenceType());
                                }
                            }
                        }
                    }
                }
            }
        }
        pw.close();
        println("RangeXref done");
    }
}
