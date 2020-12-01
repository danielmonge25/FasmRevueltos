format PE GUI 4.0
entry start
include 'win32a.inc'
VENTANA = 102

IDC_EDIT_1 = 1000
IDC_EDIT_2 = 1001
IDC_EDIT_3 = 1002

IDC_BTN_1 = 1005
IDC_BTN_2 = 1006
IDC_BTN_3 = 1007
IDC_BTN_4 = 1008
IDC_BTN_5 = 1009

IDC_BTN_6 = 1010


section '.code' code readable executable
mov bl,0
start:
    invoke GetModuleHandle,0
    invoke DialogBoxParam,eax,VENTANA,0,DialogProc,0
exit:
    invoke  ExitProcess,0

proc DialogProc uses esi edi ebx,hwnddlg,msg,wparam,lparam

  cmp [msg],WM_INITDIALOG
  je .wminitdialog

  cmp [msg],WM_COMMAND
  je .wmcommand

  cmp [msg],WM_CLOSE
  je .wmclose

  xor eax,eax
  jmp .quit

  .wminitdialog:     

    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,palabra
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_2,txtEnBlanco

    jmp .done

  .wmcommand:        

    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_1
    je .BTN1
    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_2
    je .BTN2
    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_3
    je .BTN3
    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_4
    je .BTN4
    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_5
    je .BTN5

    cmp [wparam], BN_CLICKED shl 16 + IDC_BTN_6
    je .BTN6
    jmp .done

 .BTN6:

    invoke GetDlgItemText,[hwnddlg],IDC_EDIT_2,z,113
    mov dl,byte[cont]
    sub byte[cont],dl
    add byte[cont],48
    mov cl,0
    add cl,byte[z+1]
    cmp byte[revueltas],cl
    je .igual

    mov cl,0
    add cl,byte[z+2]
    cmp byte[revueltas+1],cl
    je .igual2

    mov cl,0
    add cl,byte[z+3]
    cmp byte[revueltas+2],cl
    je .igual3

    mov cl,0
    add cl,byte[z+4]
    cmp byte[revueltas+3],cl
    je .igual4

    mov cl,0
    add cl,byte[z+5]
    cmp byte[revueltas+4],cl
    je .igual5

    mov cl,0
    add cl,byte[z+6]
    cmp byte[revueltas+5],cl
    je .igual6

    mov cl,0
    add cl,byte[z+7]
    cmp byte[revueltas+6],cl
    je .igual7

    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,cont
    mov byte[cont],dl
    jmp .done

    .igual:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+2]
        cmp byte[revueltas+1],cl
        je .igual2

        mov cl,0
        add cl,byte[z+3]
        cmp byte[revueltas+2],cl
        je .igual3

        mov cl,0
        add cl,byte[z+4]
        cmp byte[revueltas+3],cl
        je .igual4

        mov cl,0
        add cl,byte[z+5]
        cmp byte[revueltas+4],cl
        je .igual5

        mov cl,0
        add cl,byte[z+6]
        cmp byte[revueltas+5],cl
        je .igual6

        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl

        jmp .done

    .igual2:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+3]
        cmp byte[revueltas+2],cl
        je .igual3

        mov cl,0
        add cl,byte[z+4]
        cmp byte[revueltas+3],cl
        je .igual4

        mov cl,0
        add cl,byte[z+5]
        cmp byte[revueltas+4],cl
        je .igual5

        mov cl,0
        add cl,byte[z+6]
        cmp byte[revueltas+5],cl
        je .igual6

        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl
        jmp .done

    .igual3:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+4]
        cmp byte[revueltas+3],cl
        je .igual4

        mov cl,0
        add cl,byte[z+5]
        cmp byte[revueltas+4],cl
        je .igual5

        mov cl,0
        add cl,byte[z+6]
        cmp byte[revueltas+5],cl
        je .igual6

        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl
        jmp .done

    .igual4:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+5]
        cmp byte[revueltas+4],cl
        je .igual5

        mov cl,0
        add cl,byte[z+6]
        cmp byte[revueltas+5],cl
        je .igual6

        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl
        jmp .done

    .igual5:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+6]
        cmp byte[revueltas+5],cl
        je .igual6

        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl
        jmp .done

    .igual6:
        add byte[cont],1
        mov cl,0
        add cl,byte[z+7]
        cmp byte[revueltas+6],cl
        je .igual7
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl
        jmp .done

    .igual7:
        add byte[cont],1
        invoke SetDlgItemText,[hwnddlg],IDC_EDIT_3,cont
        mov byte[cont],dl

    
    jmp .done

 .BTN5:

    mov dl,byte[palabra5]
    sub byte[revueltas],32
    add byte[revueltas],dl
    sub byte[revuelta],32
    add byte[revuelta],dl
    sub dl,dl
    mov dl,byte[palabra5+1]
    sub byte[revueltas+1],32
    add byte[revueltas+1],dl
    sub byte[revuelta+1],32
    add byte[revuelta+1],dl
    sub dl,dl
    mov dl,byte[palabra5+2]
    sub byte[revueltas+2],32
    add byte[revueltas+2],dl
    sub byte[revuelta+2],32
    add byte[revuelta+2],dl
    sub dl,dl
    mov dl,byte[palabra5+3]
    sub byte[revueltas+3],32
    add byte[revueltas+3],dl
    sub byte[revuelta+3],32
    add byte[revuelta+3],dl
    sub dl,dl
    mov dl,byte[palabra5+4]
    sub byte[revueltas+4],32
    add byte[revueltas+4],dl
    sub byte[revuelta+4],32
    add byte[revuelta+4],dl
    sub dl,dl
    mov dl,byte[palabra5+5]
    sub byte[revueltas+5],32
    add byte[revueltas+5],dl
    sub byte[revuelta+5],32
    add byte[revuelta+5],dl
    sub dl,dl
    mov dl,byte[palabra5+6]
    sub byte[revueltas+6],32
    add byte[revueltas+6],dl
    sub byte[revuelta+6],32
    add byte[revuelta+6],dl
    sub dl,dl

    cmp byte[cont],50
    je .done
    add byte[cont],1
    mov dl,byte[revuelta]
    mov cl,byte[revuelta+1]
    mov al,byte[revuelta+2]
    mov bl,byte[revuelta+3]

    mov byte[revuelta+3],dl
    mov byte[revuelta],cl


    mov byte[revuelta+2],al
    mov byte[revuelta+1],bl

    mov cl,byte[revuelta+4]
    mov al,byte[revuelta+5]
    mov bl,byte[revuelta+6]

    mov byte[revuelta+4],al
    mov byte[revuelta+5],bl
    mov byte[revuelta+6],cl

    mov al,0
    mov bl,0
    mov cl,0
    mov dl,0
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,revuelta
    

    jmp .done

 .BTN4:

    mov dl,byte[palabra4]
    sub byte[revueltas],32
    add byte[revueltas],dl
    sub byte[revuelta],32
    add byte[revuelta],dl
    sub dl,dl
    mov dl,byte[palabra4+1]
    sub byte[revueltas+1],32
    add byte[revueltas+1],dl
    sub byte[revuelta+1],32
    add byte[revuelta+1],dl
    sub dl,dl
    mov dl,byte[palabra4+2]
    sub byte[revueltas+2],32
    add byte[revueltas+2],dl
    sub byte[revuelta+2],32
    add byte[revuelta+2],dl
    sub dl,dl
    mov dl,byte[palabra4+3]
    sub byte[revueltas+3],32
    add byte[revueltas+3],dl
    sub byte[revuelta+3],32
    add byte[revuelta+3],dl
    sub dl,dl
    mov dl,byte[palabra4+4]
    sub byte[revueltas+4],32
    add byte[revueltas+4],dl
    sub byte[revuelta+4],32
    add byte[revuelta+4],dl
    sub dl,dl
    mov dl,byte[palabra4+5]
    sub byte[revueltas+5],32
    add byte[revueltas+5],dl
    sub byte[revuelta+5],32
    add byte[revuelta+5],dl
    sub dl,dl
    mov dl,byte[palabra4+6]
    sub byte[revueltas+6],32
    add byte[revueltas+6],dl
    sub byte[revuelta+6],32
    add byte[revuelta+6],dl
    sub dl,dl

    cmp byte[cont],50
    je .done
    add byte[cont],1
    mov dl,byte[revuelta]
    mov cl,byte[revuelta+1]
    mov al,byte[revuelta+2]
    mov bl,byte[revuelta+3]

    mov byte[revuelta+3],dl
    mov byte[revuelta],cl


    mov byte[revuelta+2],al
    mov byte[revuelta+1],bl

    mov cl,byte[revuelta+4]
    mov al,byte[revuelta+5]
    mov bl,byte[revuelta+6]

    mov byte[revuelta+4],al
    mov byte[revuelta+5],bl
    mov byte[revuelta+6],cl

    mov al,0
    mov bl,0
    mov cl,0
    mov dl,0
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,revuelta
    
    jmp .done

 .BTN3:

    mov dl,byte[palabra3]
    sub byte[revueltas],32
    add byte[revueltas],dl
    sub byte[revuelta],32
    add byte[revuelta],dl
    sub dl,dl
    mov dl,byte[palabra3+1]
    sub byte[revueltas+1],32
    add byte[revueltas+1],dl
    sub byte[revuelta+1],32
    add byte[revuelta+1],dl
    sub dl,dl
    mov dl,byte[palabra3+2]
    sub byte[revueltas+2],32
    add byte[revueltas+2],dl
    sub byte[revuelta+2],32
    add byte[revuelta+2],dl
    sub dl,dl
    mov dl,byte[palabra3+3]
    sub byte[revueltas+3],32
    add byte[revueltas+3],dl
    sub byte[revuelta+3],32
    add byte[revuelta+3],dl
    sub dl,dl
    mov dl,byte[palabra3+4]
    sub byte[revueltas+4],32
    add byte[revueltas+4],dl
    sub byte[revuelta+4],32
    add byte[revuelta+4],dl
    sub dl,dl
    mov dl,byte[palabra3+5]
    sub byte[revueltas+5],32
    add byte[revueltas+5],dl
    sub byte[revuelta+5],32
    add byte[revuelta+5],dl
    sub dl,dl
    mov dl,byte[palabra3+6]
    sub byte[revueltas+6],32
    add byte[revueltas+6],dl
    sub byte[revuelta+6],32
    add byte[revuelta+6],dl
    sub dl,dl

    cmp byte[cont],50
    je .done
    add byte[cont],1
    mov dl,byte[revuelta]
    mov cl,byte[revuelta+1]
    mov al,byte[revuelta+2]
    mov bl,byte[revuelta+3]

    mov byte[revuelta+3],dl
    mov byte[revuelta],cl


    mov byte[revuelta+2],al
    mov byte[revuelta+1],bl

    mov cl,byte[revuelta+4]
    mov al,byte[revuelta+5]
    mov bl,byte[revuelta+6]

    mov byte[revuelta+4],al
    mov byte[revuelta+5],bl
    mov byte[revuelta+6],cl

    mov al,0
    mov bl,0
    mov cl,0
    mov dl,0
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,revuelta
    
    jmp .done

 .BTN2:

    mov dl,byte[palabra2]
    sub byte[revueltas],32
    add byte[revueltas],dl
    sub byte[revuelta],32
    add byte[revuelta],dl
    sub dl,dl
    mov dl,byte[palabra2+1]
    sub byte[revueltas+1],32
    add byte[revueltas+1],dl
    sub byte[revuelta+1],32
    add byte[revuelta+1],dl
    sub dl,dl
    mov dl,byte[palabra2+2]
    sub byte[revueltas+2],32
    add byte[revueltas+2],dl
    sub byte[revuelta+2],32
    add byte[revuelta+2],dl
    sub dl,dl
    mov dl,byte[palabra2+3]
    sub byte[revueltas+3],32
    add byte[revueltas+3],dl
    sub byte[revuelta+3],32
    add byte[revuelta+3],dl
    sub dl,dl
    mov dl,byte[palabra2+4]
    sub byte[revueltas+4],32
    add byte[revueltas+4],dl
    sub byte[revuelta+4],32
    add byte[revuelta+4],dl
    sub dl,dl
    mov dl,byte[palabra2+5]
    sub byte[revueltas+5],32
    add byte[revueltas+5],dl
    sub byte[revuelta+5],32
    add byte[revuelta+5],dl
    sub dl,dl
    mov dl,byte[palabra2+6]
    sub byte[revueltas+6],32
    add byte[revueltas+6],dl
    sub byte[revuelta+6],32
    add byte[revuelta+6],dl
    sub dl,dl  

    cmp byte[cont],50
    je .done
    add byte[cont],1
    mov dl,byte[revuelta]
    mov cl,byte[revuelta+1]
    mov al,byte[revuelta+2]
    mov bl,byte[revuelta+3]

    mov byte[revuelta+3],dl
    mov byte[revuelta],cl


    mov byte[revuelta+2],al
    mov byte[revuelta+1],bl

    mov cl,byte[revuelta+4]
    mov al,byte[revuelta+5]
    mov bl,byte[revuelta+6]

    mov byte[revuelta+4],al
    mov byte[revuelta+5],bl
    mov byte[revuelta+6],cl

    mov al,0
    mov bl,0
    mov cl,0
    mov dl,0
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,revuelta      
    

    jmp .done

 .BTN1:   

    mov dl,byte[palabra1]
    sub byte[revueltas],32
    add byte[revueltas],dl
    sub byte[revuelta],32
    add byte[revuelta],dl
    sub dl,dl
    mov dl,byte[palabra1+1]
    sub byte[revueltas+1],32
    add byte[revueltas+1],dl
    sub byte[revuelta+1],32
    add byte[revuelta+1],dl
    sub dl,dl
    mov dl,byte[palabra1+2]
    sub byte[revueltas+2],32
    add byte[revueltas+2],dl
    sub byte[revuelta+2],32
    add byte[revuelta+2],dl
    sub dl,dl
    mov dl,byte[palabra1+3]
    sub byte[revueltas+3],32
    add byte[revueltas+3],dl
    sub byte[revuelta+3],32
    add byte[revuelta+3],dl
    sub dl,dl
    mov dl,byte[palabra1+4]
    sub byte[revueltas+4],32
    add byte[revueltas+4],dl
    sub byte[revuelta+4],32
    add byte[revuelta+4],dl
    sub dl,dl
    mov dl,byte[palabra1+5]
    sub byte[revueltas+5],32
    add byte[revueltas+5],dl
    sub byte[revuelta+5],32
    add byte[revuelta+5],dl
    sub dl,dl
    mov dl,byte[palabra1+6]
    sub byte[revueltas+6],32
    add byte[revueltas+6],dl
    sub byte[revuelta+6],32
    add byte[revuelta+6],dl
    sub dl,dl   

    cmp byte[cont],50
    je .done
    add byte[cont],1
    mov dl,byte[revuelta]
    mov cl,byte[revuelta+1]
    mov al,byte[revuelta+2]
    mov bl,byte[revuelta+3]

    mov byte[revuelta+3],dl
    mov byte[revuelta],cl


    mov byte[revuelta+2],al
    mov byte[revuelta+1],bl

    mov cl,byte[revuelta+4]
    mov al,byte[revuelta+5]
    mov bl,byte[revuelta+6]

    mov byte[revuelta+4],al
    mov byte[revuelta+5],bl
    mov byte[revuelta+6],cl

    mov al,0
    mov bl,0
    mov cl,0
    mov dl,0
    invoke SetDlgItemText,[hwnddlg],IDC_EDIT_1,revuelta

    jmp .done

  .wmclose:

    invoke EndDialog,[hwnddlg],0

  .done:

    mov eax,1

  .quit:

  ret       

endp

section '.idata' import data readable writeable    

  library kernel,'KERNEL32.DLL',\
          user,'USER32.DLL'
  import kernel,\
         GetModuleHandle,'GetModuleHandleA',\
         ExitProcess,'ExitProcess'
  import user,\
         ShowWindow,'ShowWindow',\
         GetDlgItem,'GetDlgItem',\
         UpdateWindow,'UpdateWindow',\
         DialogBoxParam,'DialogBoxParamA',\ 
         SetDlgItemText,'SetDlgItemTextA',\
         GetDlgItemText,'GetDlgItemTextA',\
         EndDialog,'EndDialog'

        revueltas db "         ", 10
        .length= ($-revueltas)

        revuelta db "         ", 10
        .length= ($-revuelta)

        z db 8 dup 0

        palabra1 db "qualias", 10
        .length= ($-palabra1)

        palabra2 db "naranja", 10
        .length= ($-palabra2)

        palabra3 db "manzana", 10
        .length= ($-palabra3)

        palabra4 db "pintura", 10
        .length= ($-palabra4)

        palabra5 db "ventana", 10
        .length= ($-palabra5)

        cont db "0",10
        .length= ($-cont)

section '.text' readable writeable
        txtEnBlanco db " ",0
        txtClick db 10,0
        palabra db "_ _ _ _ _ _ _ _ _", 10
        .length= ($-palabra)



section '.rc' resource data readable 

  IDR_LOGO = 7

  directory RT_DIALOG,dialogs,\
            RT_BITMAP,bitmaps
       
  resource dialogs,VENTANA,LANG_ENGLISH+SUBLANG_DEFAULT,mod_exp_dialog

  resource bitmaps,\
       IDR_LOGO,LANG_ENGLISH+SUBLANG_DEFAULT,logo 

  dialog mod_exp_dialog,\
  'Examen Final - B85017 - CI-0118',0,0,500,300,\
  DS_MODALFRAME+WS_MINIMIZEBOX+DS_CENTER+WS_VISIBLE+WS_CAPTION+WS_SYSMENU,\
  0,0,"Arial",11


  dialogitem 'BUTTON','Escoga una boton/palabra',-1,7,5,490,290,BS_GROUPBOX+WS_VISIBLE,0

  dialogitem 'BUTTON','7 es la puntuacion maxima',-1,7,250,490,290,BS_GROUPBOX+WS_VISIBLE,0



  dialogitem 'EDIT',0,IDC_EDIT_1,18,180,160,20,ES_MULTILINE+ES_AUTOVSCROLL+ES_WANTRETURN+WS_VSCROLL+WS_BORDER+WS_VISIBLE,0

  dialogitem 'EDIT',0,IDC_EDIT_2,18,210,160,20,ES_MULTILINE+ES_AUTOVSCROLL+ES_WANTRETURN+WS_VSCROLL+WS_BORDER+WS_VISIBLE,0 

  dialogitem 'EDIT',0,IDC_EDIT_3,18,260,80,20,ES_MULTILINE+ES_AUTOVSCROLL+ES_WANTRETURN+WS_VSCROLL+WS_BORDER+WS_VISIBLE,0 



  dialogitem 'BUTTON',"Enter",IDC_BTN_6,200,210,75,25,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton

  

  dialogitem 'BUTTON',"Palabra 1",IDC_BTN_1,350,20,100,30,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton

  dialogitem 'BUTTON',"Palabra 2",IDC_BTN_2,350,70,100,30,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton

  dialogitem 'BUTTON',"Palabra 3",IDC_BTN_3,350,120,100,30,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton

  dialogitem 'BUTTON',"Palabra 4",IDC_BTN_4,350,170,100,30,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton

  dialogitem 'BUTTON',"Palabra 5",IDC_BTN_5,350,220,100,30,BS_PUSHBUTTON+WS_VISIBLE,0 ; Boton



  dialogitem 'STATIC',IDR_LOGO,IDR_LOGO,13,25,600,300,WS_VISIBLE+SS_BITMAP



  enddialog

  bitmap logo, 'portada.bmp'
