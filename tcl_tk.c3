module tcltk;

const TCL_OK = 0;
const TCL_ERROR = 1;
const TCL_RETURN = 2;
const TCL_BREAK = 3;
const TCL_CONTINUE =4;

const TCL_DONT_WAIT = (1<<1);
const TCL_WINDOW_EVENTS = (1<<2);
const TCL_FILE_EVENTS = (1<<3);
const TCL_TIMER_EVENTS = (1<<4);
const TCL_IDLE_EVENTS = (1<<5);
const TCL_ALL_EVENTS = (~TCL_DONT_WAIT);

const TCL_GLOBAL_ONLY = 1;
const TCL_NAMESPACE_ONLY = 2;
const TCL_APPEND_VALUE = 4;
const TCL_LIST_ELEMENT = 8;
const TCL_TRACE_READS = 0x10;
const TCL_TRACE_WRITES = 0x20;
const TCL_TRACE_UNSETS = 0x40;
const TCL_TRACE_DESTROYED = 0x80;
const TCL_INTERP_DESTROYED = 0x100;
const TCL_LEAVE_ERR_MSG = 0x200;
const TCL_TRACE_ARRAY = 0x800;

def Tcl_Interp = void;
def Tcl_Obj = void;
def Tcl_ExitProc = void;
def Tcl_CmdProc = void;
def Tcl_CmdDeleteProc = void;
def ClientData = CInt;

extern fn Tcl_Interp* tcl_create_interp() @extern("Tcl_CreateInterp");  
extern fn void tcl_delete_interp(Tcl_Interp* tcl_interp) @extern("Tcl_DeleteInterp");  

extern fn CInt tcl_init(Tcl_Interp* tcl_interp) @extern("Tcl_Init");  
extern fn CInt tcl_app_init(Tcl_Interp* tcl_interp) @extern("Tcl_AppInit");  

extern fn void tcl_exit(CInt status) @extern("Tcl_Exit");  
extern fn void tcl_finalize() @extern("Tcl_Finalize");  
extern fn void tcl_create_exit_handler(Tcl_ExitProc* proc, ClientData client_data) @extern("Tcl_CreateExitHandler");  
extern fn void tcl_delete_exit_handler(Tcl_ExitProc* proc, ClientData client_data) @extern("Tcl_DeleteExitHandler");  
extern fn void tcl_exit_thread(CInt status) @extern("Tcl_ExitThread");  
extern fn void tcl_finalize_thread() @extern("Tcl_FinalizeThread");  
extern fn void tcl_create_thread_exit_handler(Tcl_ExitProc* proc, ClientData client_data) @extern("Tcl_CreateThreadExitHandler");  
extern fn void tcl_delete_thread_exit_handler(Tcl_ExitProc* proc, ClientData client_data) @extern("Tcl_DeleteThreadExitHandler");  
extern fn void tcl_set_exit_proc(Tcl_ExitProc* proc) @extern("Tcl_SetExitProc");  

extern fn CInt tcl_eval_obj_ex(Tcl_Interp* tcl_interp, Tcl_Obj* obj_ptr, CInt flags) @extern("Tcl_EvalObjEx");  
extern fn CInt tcl_eval_file(Tcl_Interp* tcl_interp, ZString filename) @extern("Tcl_EvalFile");  
extern fn CInt tcl_eval_objv(Tcl_Interp* tcl_interp,  Tcl_Obj* objc, Tcl_Obj* objv, CInt flags) @extern("Tcl_EvalObjv");  
extern fn CInt tcl_eval(Tcl_Interp* tcl_interp, ZString script) @extern("Tcl_Eval");  
extern fn CInt tcl_eval_ex(Tcl_Interp* tcl_interp,  ZString script, CInt num_bytes, CInt flags) @extern("Tcl_EvalEx");  
extern fn CInt tcl_global_eval(Tcl_Interp* tcl_interp,  ZString script) @extern("Tcl_GlobalEval");  
extern fn CInt tcl_global_eval_obj(Tcl_Interp* tcl_interp, Tcl_Obj* obj_ptr) @extern("Tcl_GlobalEvalObj");  
extern fn CInt tcl_var_eval(Tcl_Interp* tcl_interp, ZString ...part) @extern("Tcl_VarEval");  
// extern fn CInt tcl_var_eval_va(Tcl_Interp* tcl_interp, ? list) @extern("Tcl_VarEvalVA");


extern fn CInt tcl_create_command(Tcl_Interp* tcl_interp, ZString cmd_name, Tcl_CmdProc* proc, ClientData client_data, Tcl_CmdDeleteProc* delete_proc) @extern("Tcl_CreateCommand");

extern fn CInt tcl_do_one_event(CInt flags) @extern("Tcl_DoOneEvent");  
extern fn ZString tcl_get_string_result(Tcl_Interp* tcl_interp) @extern("Tcl_GetStringResult");  

extern fn CInt tk_init(Tcl_Interp* tcl_interp) @extern("Tk_Init");  
extern fn CInt tk_safe_init(Tcl_Interp* tcl_interp) @extern("Tk_SafeInit");  