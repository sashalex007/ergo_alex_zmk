#### Personal config

[Write up](https://alexpokho.xyz/posts/Combo-layer-hybrid-keymap)

If you are here for the combo-layer hybrid implementation, jump to [keymap](https://github.com/sashalex007/ergo_alex_zmk/blob/main/config/boards/shields/ergoalex/ergoalex.keymap) and [combos](https://github.com/sashalex007/ergo_alex_zmk/blob/main/config/boards/shields/ergoalex/combos.dtsi)

```

               left hand symbols
╭────────────────────╮ ╭────────────────────╮ 
│ __  __  __  __  __ │ │ __  __  __  __  __ │ 
│  !   }   ]   )   % │ │ __  __  __  __  __ │  
│  +   {   [   (   = │ │ __  XX  __  __  __ │
│  *   #   \   /   @ │ │ __  __  __  __  __ │
╰───────╮ __  __  __ │ │ __  __  __ ╭───────╯
        ╰────────────╯ ╰────────────╯        

              right hand symbols
╭────────────────────╮ ╭────────────────────╮
│ __  __  __  __  __ │ │ __  __  __  __  __ │ 
│ __  __  __  __  __ │ │ |   &   _   <   >  │
│ __  __  __  XX  __ │ │ =   __  __  ?   -  │
│ __  __  __  __  __ │ │ __  $   ~   ^   `  │
╰───────╮ __  __  __ │ │ __  __  __ ╭───────╯
        ╰────────────╯ ╰────────────╯        

                   nav/edit
╭─────────────────────╮ ╭────────────────────╮
│ __  __  __  __  __  │ │ __  __  __  __  __ │
│ esc cut cpy pst cmt │ │ pup wlf up wrt fld │
│ sft __  bsp ret ctr │ │ hm  lf  dn rt  end │
│ __  __  __  tab __  │ │ pdn __  jmp __  __ │
╰───────╮ __  __  __  │ │ __  __  XX ╭───────╯
        ╰─────────────╯ ╰────────────╯        
cmt = comment code
fld = fold code (vscode)
jmp = jumpy (vscode)
wlf = left by word
wrt = right by word


                vscode1 (navigation)
╭─────────────────────────╮ ╭──────────────────────────────────────────╮
│ __  __   __    __    __ │ │ __  __        __        __        __     │
│ __  exp  term  win   __ │ │ __  tab_lf    panel_up  tab_rt    tab_rt │
│ VS2 __   close open  __ │ │ __  panel_lf  panel_dn  panel_lf  __     │
│ __  __   __    __    __ │ │ __  __        __        __        __     │
╰───────╮  __    XX    __ │ │ __  __        __ ╭───────────────────────╯
        ╰─────────────────╯ ╰──────────────────╯
VS2 = activate vscode2 layer
exp = show/hide explorer
term = show/hind terminal
win = choose workspace
close = close tab
open = chose file to open

             vscode2 (pane management)
╭─────────────────────╮ ╭──────────────────────────────────────╮
│ __  __  __  __  __  │ │ __  __        __        __        __ │
│ __  __  __  __  __  │ │ __  grow      split_up  shrink    __ │
│ XX  __  __  __  __  │ │ __  split_lf  split_dn  split_rt  __ │
│ __  __  __  __  __  │ │ __  __        __        __        __ │
╰───────╮ __  __  __  │ │ __  __        __ ╭───────────────────╯
        ╰─────────────╯ ╰──────────────────╯        

XX = modifer
```