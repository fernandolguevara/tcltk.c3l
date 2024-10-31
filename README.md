# Tcl/Tk bindings for c3

## Example

```c++ 
module app;

import std::io, tcltk;

fn CInt on_btn_clicked(CInt clientData, Tcl_Interp* tcl_interp, CInt argc, void* argv) {
    io::printn("called from tcl/tk");
    
    CInt rc = tcltk::tcl_eval(tcl_interp, `
tk_messageBox -message "Really quit?" \
    -icon question -type yesno \
    -detail "Select \"Yes\" to make the application exit"
`);
    if(rc == 0) {
        ZString answer = tcltk::tcl_get_string_result(tcl_interp);
        if(answer.str_view() == "yes"){
            io::printn("quiting...");
            defer tcltk::tcl_exit(0);
        }
    }
    return 0;
}

fn void! main(String[] args) {
    Tcl_Interp* tcl_interp = tcltk::tcl_create_interp();
    
    if(!tcl_interp) {
        io::printn("can not create tcl interpreter.");
    }

    tcltk::tcl_init(tcl_interp);
    tcltk::tk_init(tcl_interp);

    ZString script = `
        puts "Hello, from Tcl/Tk!"
        package require Tk
        button .btnExit -text "Click me!" -command exitProc
        pack .btnExit
    `;  

    tcltk::tcl_create_command(tcl_interp, "exitProc", &on_btn_clicked, 0, null);

    CInt rc = tcltk::tcl_eval(tcl_interp, script);
    if(rc == 0){
        for(;;) {
            tcltk::tcl_do_one_event(0);
        }
    }
}
```