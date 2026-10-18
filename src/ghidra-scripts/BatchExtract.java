import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.address.*;
import java.io.*;

public class BatchExtract extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        String outDir = args[args.length-1];
        new File(outDir).mkdirs();
        int count = 0;
        for (int i = 0; i < args.length - 1; i++) {
            String addrStr = args[i].replace("0x", "");
            long v = Long.parseLong(addrStr, 16);
            Address addr = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(v);
            Function f = getFunctionAt(addr);
            if (f == null) { f = getFunctionContaining(addr); }
            if (f == null) {
                println("NOT FOUND: " + args[i]);
                continue;
            }
            String name = f.getName(true);
            Address entry = f.getEntryPoint();
            // write to file
            File outFile = new File(outDir, name + "_" + entry + ".txt");
            PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8")));
            pw.println("// ==== FUNC " + name + " @ " + entry + " ====");
            pw.println("// size: " + f.getBody().getNumAddresses() + " bytes");
            // decompile
            try {
                ghidra.app.decompiler.DecompInterface di = new ghidra.app.decompiler.DecompInterface();
                di.openProgram(currentProgram);
                ghidra.app.decompiler.DecompileResults r = di.decompileFunction(f, 300, monitor);
                if (r != null && r.decompileCompleted()) {
                    ghidra.app.decompiler.DecompiledFunction df = r.getDecompiledFunction();
                    if (df != null) {
                        pw.println(df.getC());
                    } else {
                        pw.println("// no decompiled output");
                    }
                } else {
                    pw.println("// decompile failed: " + (r == null ? "null" : r.getErrorMessage()));
                }
            } catch (Exception e) {
                pw.println("// exception: " + e);
            }
            pw.close();
            println("EXTRACTED: " + name + " @ " + entry + " -> " + outFile.getName());
            count++;
        }
        println("BATCH DONE: " + count + " functions extracted to " + outDir);
    }
}
