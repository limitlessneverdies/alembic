import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.address.*;
import ghidra.program.model.symbol.*;
import java.io.*;

public class XrefDigger extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(args[args.length-1]), "UTF-8")));
        for (int i = 0; i < args.length - 1; i++) {
            String a = args[i].replace("0x", "");
            long v = Long.parseLong(a, 16);
            Address addr = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(v);
            ReferenceIterator it = currentProgram.getReferenceManager().getReferencesTo(addr);
            int n = 0;
            pw.println("// ==== TARGET " + addr + " ====");
            while (it.hasNext()) {
                Reference r = it.next();
                Address from = r.getFromAddress();
                Function f = getFunctionContaining(from);
                String fn = (f == null) ? "NOFUNC" : f.getName(true) + " @ " + f.getEntryPoint();
                pw.println("  FROM " + from + " type=" + r.getReferenceType() + " in " + fn);
                n++;
            }
            if (n == 0) { pw.println("  (no references found)"); }
        }
        pw.close();
        println("XREFDIG done: " + (args.length - 1) + " targets");
    }
}
