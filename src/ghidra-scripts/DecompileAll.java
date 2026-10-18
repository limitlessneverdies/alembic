import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import java.io.*;

public class DecompileAll extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        String outDir = args.length > 0 ? args[0] : System.getProperty("user.dir");
        DecompInterface di = new DecompInterface();
        di.openProgram(currentProgram);
        File dir = new File(outDir);
        dir.mkdirs();
        File out = new File(dir, "alembic_all_decompiled.c");
        PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(out), "UTF-8")));
        FunctionIterator f = currentProgram.getFunctionManager().getFunctions(true);
        int n = 0;
        while (f.hasNext() && !monitor.isCancelled()) {
            Function fn = f.next();
            pw.println();
            pw.println("// ==== FUNC " + fn.getName(true) + " @ " + fn.getEntryPoint() + " ====");
            DecompileResults r;
            try {
                r = di.decompileFunction(fn, 120, monitor);
            } catch (Exception e) {
                pw.println("// exception: " + e);
                n++;
                continue;
            }
            if (r != null && r.decompileCompleted()) {
                DecompiledFunction df = r.getDecompiledFunction();
                if (df != null) {
                    pw.println(df.getC());
                } else {
                    pw.println("// no compiled output");
                }
            } else {
                pw.println("// decompile failed: " + (r == null ? "null" : r.getErrorMessage()));
            }
            n++;
            if (n % 500 == 0) { println("PROGRESS " + n); }
        }
        pw.close();
        println("DECOMPILED " + n + " functions to " + out.getAbsolutePath());
    }
}
