alias cloc="~/cloc.pl"
alias da="ls -lrt $1;date"
alias yangtze="ssh -l ebapras yangtze-1.lab.redback.com"
alias sims="cd /ssrsim/ebapras/ssr-sdk/chassis"
alias sim="cd ~/sim/"
alias gtags="/home/ebapras/env/bin/gtags; export GTAGSDBPATH=$PWD;"
alias gvim="/home/ebapras/env/bin/gvim"
alias vi="/home/ebapras/env/bin/vim"
alias vim="/home/ebapras/env/bin/vim"
alias gdb="/home/ebapras/env/bin/gdb"
alias vd="/home/ebapras/env/bin/vimdiff"
alias source="source ~/.bashrc"
alias bash="/home/ebapras/mystuff/bash/inst/bin/bash"
alias brc="vi ~/.bashrc"
alias vrc="vi ~/.vimrc"
#alias scra="cd /scratch/3/ebapras"
alias scra="cd /workspace/scratch/ebapras;ls -1"
alias tscra="cd /workspace/scratch/ebapras;ls -1"
alias thm="cd /workspace/git/ebapras;ls -1"
alias devt="ch --pool=blr_rout"
alias sqat="ch --pool=blr_sqa"
alias vplug="vi /home/ebapras/.vim/plugin"
alias vsrc="vi ~/.screenrc"
alias vgdb="vi ~/.gdbinit"
alias mgdb="/tools/swdev/bin/mips64-netbsdelf-gdb"
alias lsp=lsp
alias rs=rs
alias dm="date | sed 's/ /_/g' | xargs -n1 mkdir"
#alias pwd="pwd;pwd  > ~/tip.tmp;screen -X readbuf ~/tip.tmp; rm -f ~/tip.tmp"
alias pb="cd ~/pb; lsp; cd -"
alias clonensr="git clone ssh://git.sj.us.am.ericsson.se/project/rbnlinux/sprint/tcpnsr.git $1"
alias gnode="ssh -l ebapras asglx-1-300.redback.com"
alias hgnode="ssh -l ebapras gmake.sj.us.am.ericsson.se"
alias work="cd $PROJDIR"
alias xap2="ssh -l ebapras lxapp-2.sj.us.am.ericsson.se"
alias xap1="ssh -l lxapp-1.sj.us.am.ericsson.se"
alias tree=tree
alias glb="/home/ebapras/global/inst/bin/global"
alias glt="/home/ebapras/global/inst/bin/gtags"
alias gclean="git clean -xfd -e GTAGS -e GRTAGS -e GPATH"
alias ecp="~/ecp" 
alias myp=myp
alias refchassis="emq PRODUCT=REF-CHASSIS-X86-64"
alias refpizza="emq PRODUCT=REF-PIZZA-X86-64"
#export PROJDIR=/project/swbuild14/ebapras
#declare -x LESS="-M -I"
export LESS="-M -I"
export LS_COLORS='no=00:fi=00:di=00;40:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

export sc="/workspace/scratch/ebapras"
#
alias sp=sp
function sp() {
    export PROJDIR=/workspace/git/ebapras
    echo "on ts.."
    export MYHOST="ts"
    echo $PROJDIR
    echo $SCMVIEW
    code_alias
    cd /workspace/git/ebapras
}

function fap() {
    op=$(echo "$2" | awk '{print tolower($0)}')
    echo "show card $1 fabl api log all det | join | inc $op" > /tmp/tip.tmp.1
    if [ $TMUX ] 
    then
        echo /tmp/tip.tmp.1 | tmux2 loadb -
    else
        screen -X readbuf /tmp/tip.tmp.1
    fi
}

function gpw() {
    export $GTAGSLIBPATH=$GTAGSLIBPATH:$PROJDIR/$SCMVIEW"/pkt/sw/se/xc/bsd/routing/mpls/lm"
    echo $GTAGSLIBPATH
}

#env for gerrit
export ERICSSON_USERID=ebapras

function e() {
    echo `f "\<$1\>"`
}

function gpath() {
    gtags
    export GTAGSLIBPATH=$GTAGSLIBPATH:$PWD
}

function cbldssr() {
    echo "starting a clean build"
    hm; 
# gclean;
    set pwd=`echo $PWD | sed 's/.*ebapras//' | tr -d /`
    echo $pwd
        return
    rmb $pwd;
    hm; cd pkt; #bldssr;
    echo $PWD
}

function rmb() {
    scra;
    mv $1 $1.del;
    echo "removing $1";
    mkdir $1;
    ls;
    rm -fr $1.del&
    export pwd=$PWD
    hm; scratch-config --force-cleanup; scratch-config $pwd/$1
}

function myp() {
    cd /project/swbuild14/ebapras
    export PROJDIR=/project/swbuild14/ebapras
    vs
}

function tree() 
{
    find $1 -print | sort | sed 's;[^/]*/;|___;g;s;___|; |;g'
}

export LANG= 
export TMPDIR="/scratch/14/ebapras/tmpdir/"

#bash bindings

bind -m vi-insert  '",o":"\"\\<"'
bind -m vi-insert  '",l":"\\>\""'
bind -m vi-insert  '",1":"!"'
bind -m vi-insert  '",2":"@"'
bind -m vi-insert  '",3":"#"'
bind -m vi-insert  '",4":"$"'
bind -m vi-insert  '",5":"%"'
bind -m vi-insert  '",6":"^"'

bind -m vi-insert '",i:"`"'
bind -m vi-insert  '",a":"&"'
bind -m vi-insert  '",b":"()"'
bind -m vi-insert  '",c":"\C-_"'
bind -m vi-insert  '",d":","'
bind -m vi-insert  '",d":"_"'
bind -m vi-insert  '",e":"|"'
bind -m vi-insert  '",f":""'
bind -m vi-insert  '",g":" | grep "'
bind -m vi-insert  '",h":"~/"'
#bind -m vi-insert  '",l":"ls"'
bind -m vi-insert  '",m":"\,"'
bind -m vi-insert  '",n":" | "'
bind -m vi-insert  '",q":"\"\"OD"'
bind -m vi-insert  '",q":"""'
bind -m vi-insert  '",r":reverse-search-history'
bind -m vi-insert  '",s":"*"'
bind -m vi-insert  '",w":"pwd"'
bind -m vi-insert  '",t":""'
bind -m vi-insert  '",t":"/scratch/14/ebapras/"'
bind -m vi-insert  '",u":""'
bind -m vi-insert  '",u":"ebapras@147.117.53.70:~/"'
bind -m vi-insert  '",x":"ebapras@147.117.58.241:~/"'
bind -m vi-insert  '",y":"ebapras@10.10.10.22:~/"'


#bind -m '",s":"`["'

#    bind -m vi-insert  .ff  <C-N>
#    bind -m vi-insert  .fg <><ESC>i
#    bind -m vi-insert  .fi if ()<ESC>i
#    bind -m vi-insert  .fr for (;;)<Left><Left><Left>
#    bind -m vi-insert  .fs <End><Insert>;<ESC>
#    bind -m vi-insert  .fv <Space>+=<Space>
#    bind -m vi-insert  .fu <Space>-=<Space>
#    bind -m vi-insert  .fut uint32_t<space>
#    bind -m vi-insert  .fus uint16_t<space>
#    bind -m vi-insert  .fpr ldp_peer_t<space>
#    bind -m vi-insert  .fcx ldp_ctx_t<space>
#    bind -m vi-insert  .g <Space>><Space>
#    bind -m vi-insert   <expr> .g Map('>')
#    bind -m vi-insert  .h #
#    bind -m vi-insert  .i !
#    bind -m vi-insert  .k  <ESC>/;<CR><Right><Insert>
#    bind -m vi-insert  <expr> .k  Imove()
#    bind -m vi-insert  .l <Space><<Space>
#    bind -m vi-insert  .m --
#    bind -m vi-insert  .p ++
#    bind -m vi-insert  .q ""<left>
#    bind -m vi-insert  .r <Space>\|\| 
#    bind -m vi-insert  .s *
#    bind -m vi-insert  .n <Space>&&<Space>
#    bind -m vi-insert  .t  <End><Insert><Space>{<CR>}<ESC><Up>o
#    bind -m vi-insert  .u <Space>- 
#    bind -m vi-insert  .v <Space>+ 
#    bind -m vi-insert  .v <ESC>lbe<Insert> \+ 
#    bind -m vi-insert  .y []<ESC>i
#    bind -m vi-insert  .z <ESC>bg~
#    bind -m vi-insert  .z <ESC>?\u<CR>lg~
#    bind -m vi-insert  - _
#    bind -m vi-insert  .4 $
#    bind -m vi-insert  .5 %
#    bind -m vi-insert  .; :
#    bind -m vi-insert   ; ;<ESC>o
#    bind -m vi-insert  .= <Space>==<Space>
#    bind -m vi-insert  = <Space>=<Space>

if [ "git" == "$SCM" ]; then
    alias lc="git status ."
else
    alias lc="cvsm -Q status | grep -i 'local\|merge'"
fi

alias gd=gd

function gd() {
    echo -n "\$GTAGSROOT :"
    echo $GTAGSROOT
    echo -n "\$GTAGSDBPATH: "
    echo $GTAGSDBPATH
    echo -n "\$GTAGSLIBPATH: "
    echo $GTAGSLIBPATH
}

alias go=go
function go() {
    export GO='yes'
    export GTAGSROOT=`pwd`
    gtags /home/ebapras/
    export GTAGSDBPATH="/home/ebapras/"
}

function gos() {
    export GTAGSDBPATH=`pwd`
    export GTAGSROOT=`pwd`
}

alias nogo=nogo
function nogo() {
    unset GO
    unset GTAGSDBPATH 
    unset GTAGSROOT 
}

alias gb=gb
function gb() {
    export GITBRANCH=`git branch | grep \* | sed 's/\*//' | sed 's/ //'`
    export GITPREFIX="git#"
}

alias autoconf="/home/ebapras/autoconf-2.69/inst/bin/autoconf"
#export GTAGSLIBPATH="$PROJDIR/codebase/pkt/sw/se/xc/bsd:$PROJDIR/codebase/pkt/sw/include:$PROJDIR/codebase/comp"
#export GTAGSLIBPATH="$PROJDIR/corelibs/"
#export GTAGSLIBPATH=$GTAGSLIBPATH:"$PROJDIR/core-data-types/"
export TERM="xterm-256color"

export PROJDIR="$PROJDIR"
alias hm=hm
function hm() {
    if [ "$SCMVIEW" != "~" ]; then
        cd $PROJDIR/$SCMVIEW
    else 
        cd $PROJDIR
    fi
}

#tmux related stuff
alias tmux="/home/ebapras/mystuff/inst/bin/tmux"
#alias tmux2="export TMUX=1;/home/ebapras/tmux/inst2/bin/tmux"
alias tconf="vi ~/.tmux.conf"
alias tl="tmux2 list-session"

alias ta=ta
function ta() {
    if [ $# != 1 ]; then
        echo "specify session id"
        return
    fi
    tmux2 attach-session -t $1
}

function tmux_rtr_binds() {
    tmux bind-key l send-keys "show ldp neighbor"
    tmux bind-key b send-keys "endconfport ether "
    tmux bind-key h send-keys "confcontext local router ldp"
    tmux bind-key i send-keys "show ldp l2vpn fec "
    tmux bind-key j send-keys "show ldp neigh"
    tmux bind-key J send-keys "show ldp neigh | "
    tmux bind-key k send-keys "show ldp neigh det "
    tmux bind-key K send-keys "show ldp neigh det | "
    tmux bind-key l send-keys "daffodil6"
    tmux bind-key m send-keys "ebapras@147.128.148.144:~/"
    tmux bind-key , send-keys "ebapras@155.53.13.233:~/"
    tmux bind-key h send-keys "show conf ldp confcontext local router ldp"
    tmux bind-key o send-keys "show xc"
    tmux bind-key p send-keys "show xc det"
    tmux bind-key P send-keys "show xc det | "
    tmux bind-key \ send-keys "show mpls lsp"
    tmux bind-key u send-keys "confcontext local"
    tmux bind-key v send-keys "show conf port "
    tmux bind-key x send-keys "scrollback 0" "clear" "scrollback 1000000"
    tmux bind-key - send-keys "show ip interface brief "
    tmux bind-key = send-keys "show ip route "
    tmux bind-key ; send-keys "show ldp bind-key "
    tmux bind-key r send-keys "show ospf neigh "
    tmux bind-key e send-keys "show port "
    tmux bind-key t send-keys "show conf ospf end conf context localrouter ospf 1area 0 interface "
    tmux bind-key . send-keys "show conf "
    tmux bind-key w send-keys "OA"
    tmux bind-key 0 send-keys "show conf mpls endconfcontext localrouter mpls interface "
}

export MUX="tmux"
alias ts="ssh -l ebapras eussjlx9007.sj.us.am.ericsson.se"
alias thm="cd /workspace/git/ebapras/"

# git related stuff 
#alias git="/home/ebapras/git.latest/inst/bin/git"
alias gh="cd /home/ebapras/git-1.7.11.1/Documentation"
alias gconf="vi ~/.gitconfig" 
alias gts="git tag | grep v12 | sort -t . -k 5,5n"
alias branch="git branch"
alias gslist="git stash list | grep ."
alias gclone="git clone ssh://git.sj.us.am.ericsson.se/project/rbnlinux/swfeature_int.git $1"
alias gclonensr="git clone ssh://git.sj.us.am.ericsson.se/project/rbnlinux/sprint/tcpnsr.git"
alias test="echo $1"

export bangip=147.128.148.144
export sjip=10.10.10.22

alias bldtime="version-decode --timestamp"
alias bldse="bld;emq seos PRODUCT=SE1200"
alias cbldse="bld;emq clean PRODUCT=SE1200"
alias bldall="bld;emq seos-all"
alias bldssr="bld;emq PRODUCT=ASG"
#alias cbldssr="bld;emq clean PRODUCT=ASG"
#alias cbldssr=cbldssr

alias bssr="export BLDPRODUCT=ASG;source"
alias bse="export BLDPRODUCT=SE1200;source"

alias onp="telnet 10.126.191.53 53058"

if [ "$BLDPRODUCT" == "ASG" ]; then
    if [ "$MUX" == "tmux" ]; then
        alias slm="binr;cp lm ~/; echo 'rm -f /usr/lib/siara/bin/lm;scp ebapras@$sjip:~/lm /usr/lib/siara/bin' | tmux loadb -"
        alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"

        alias sldp="binr;cp ldpd ~/; echo 'rm -f /usr/lib/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/lib/siara/bin'| tmux loadb -"
        alias sfldp="binr;cp ldpd ~/; echo 'rm -f /usr/lib/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/lib/siara/bin'| tmux loadb -"
        alias sbgp="binr;cp bgpd ~/; echo 'rm -f /usr/lib/siara/bin/bgpd;scp ebapras@$sjip:~/bgpd /usr/lib/siara/bin'| tmux loadb -"
        alias ldpb="binr; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
        alias bgpb="binr; rm -f bgpd;dbld;echo 'Building bgp for $BLDPRODUCT';emq bgpd PRODUCT=$BLDPRODUCT;sbgp"
        alias gbgpb="binr; rm -f bgpd;dbld;echo 'Building bgp for $BLDPRODUCT';gmake bgpd DBG=yes PRODUCT=$BLDPRODUCT;sbgp"
        alias gldpb="binr; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';gmake ldpd PRODUCT=$BLDPRODUCT DBG=yes;sldp"

        alias sexec_cli="binr;cp exec_cli ~/; echo 'rm -f /usr/lib/siara/bin/exec_cli;scp ebapras@$sjip:~/exec_cli /usr/lib/siara/bin' > ~/tip.tmp.2; | tmux loadb -"
        alias clib="binr; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"
    else
        alias slm="binr;cp lm ~/; echo 'rm -f /usr/lib/siara/bin/lm;scp ebapras@$sjip:~/lm /usr/lib/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"

        alias sldp="binr;cp ldpd ~/; echo 'rm -f /usr/lib/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/lib/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias ldpb="binr; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
        alias gbgpb="binr; rm -f bgpd;dbld;echo 'Building bgp for $BLDPRODUCT';gmake bgpd DBG=yes PRODUCT=$BLDPRODUCT;sbgp"
        alias gldpb="binr; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';gmake ldpd PRODUCT=$BLDPRODUCT DBG=yes;sldp"

        alias sexec_cli="binr;cp exec_cli ~/; echo 'rm -f /usr/lib/siara/bin/exec_cli;scp ebapras@$sjip:~/exec_cli /usr/lib/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias clib="binr; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"
    fi
else
    if [ "$MUX" == "tmux" ]; then
        alias slm="bin;cp lm ~/; echo 'rm -f /usr/siara/bin/lm;scp ebapras@$sjip:~/lm /usr/siara/bin' | tmux loadb -"
        alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"

        alias sldp="bin;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' | tmux loadb -"
        alias sldp62="bin62;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' | tmux loadb -"
        alias ldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
        alias gldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';gmake ldpd PRODUCT=SE1200 DBG=yes;sldp"
        alias ldp62="bin62; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT PLATFORM=xc ARCH=sb1-mips;sldp62"

        alias sexec_cli="bin;cp exec_cli ~/; echo 'rm -f /usr/siara/bin/exec_cli;scp ebapras@$sjip:~/exec_cli /usr/siara/bin' | tmux loadb -"
        alias clib="bin; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"
    else
        alias slm="bin;cp lm ~/; echo 'rm -f /usr/siara/bin/lm;scp ebapras@$sjip:~/lm /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"

        alias sldp="bin;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias sldp62="bin62;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias ldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
        alias gldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';gmake ldpd PRODUCT=SE1200 DBG=yes;sldp"
        alias ldp62="bin62; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT PLATFORM=xc ARCH=sb1-mips;sldp62"

        alias sexec_cli="bin;cp exec_cli ~/; echo 'rm -f /usr/siara/bin/exec_cli;scp ebapras@$sjip:~/exec_cli /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
        alias clib="bin; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"
    fi
fi

#alias slm="bin;cp lm ~/; echo 'rm -f /usr/siara/bin/lm;scp ebapras@$sjip:~/lm /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"
#
#alias sldp="bin;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias sldp62="bin62;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp ebapras@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias ldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
#alias ldp62="bin62; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT PLATFORM=xc ARCH=sb1-mips;sldp62"
#
#alias sexec_cli="bin;cp exec_cli ~/; echo 'rm -f /usr/siara/bin/exec_cli;scp ebapras@$sjip:~/exec_cli /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias clib="bin; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"

function code_alias() {

    if [ "$SCMVIEW" != "~" ]; then
        if [ "$SCMVIEW" != " " ]; then
            alias img="cd $PROJDIR/$SCMVIEW/images"
                alias bld="cd $PROJDIR/$SCMVIEW/pkt"
                alias dbld="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd"

                if [ "ssr" == "$PRO" ]; then
                    alias binl="cd $PROJDIR/$SCMVIEW/obj/xc-linux-x86-64/Bin"
                    alias binp="cd $PROJDIR/$SCMVIEW/obj/ref-linux-x86-64/Bin"
                else 
                    alias bin="cd $PROJDIR/$SCMVIEW/pkt/xc-sb1-mips/netbsd/Bin"
                fi 
                        alias binl="cd $PROJDIR/$SCMVIEW/pkt/xc-linux-x86-64/linux/Bin"
                        alias binp="cd $PROJDIR/$SCMVIEW/obj/ref-linux-x86-64/Bin"
                        alias bin62="cd $PROJDIR/$SCMVIEW/pkt/xc-sb1-mips/bsd/Bin"
                        alias obj="cd $PROJDIR/$SCMVIEW/pkt/xc-sb1-mips/netbsd/sw/se/xc/bsd/"
                        alias oldp="cd $PROJDIR/$SCMVIEW/pkt/xc-sb1-mips/netbsd/sw/se/xc/bsd/routing/mpls/ldp/src"
                        alias ism="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/config/ism2;vi"
                        alias inc="cd $PROJDIR/$SCMVIEW/pkt/sw/include;"
                        alias binc="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/include"
                        alias vbinc="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/include;vi"
                        alias libsrc="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/libsrc/"
                        alias mpls="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls"
                        alias rout="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/"
                        alias ospf="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/ospf"
                        alias lib="cd $PROJDIR/$SCMVIEW/pkt/xc-linux-x86-64/linux/Lib"
                        alias static="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/staticd"
                        alias arp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/config/arp"
                        alias kern="cd $PROJDIR/$SCMVIEW/plat/asg/rpsw/kernel"
                        alias bgp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/bgp"
                        alias tcpnsr="cd $PROJDIR/$SCMVIEW/comp/comp/tcpnsr/src"
                        alias ipsec="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/services/ipsec"
                        alias ike="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/services/ike"
                        alias ase="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/services/ased"
                        alias config="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/config/"
                        alias isis="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/isisd"
                        alias pim="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/ipmulticast/pim"
                        alias ppa="cd $PROJDIR/$SCMVIEW/pkt/sw/se/ppa"
                        alias igmp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/ipmulticast/igmp"
                        alias mld="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/ipmulticast/mld"
                        alias nd="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/nd"
                        alias vldp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/ldp;vi"
                        alias vcspf="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/cspf;vi"
                        alias vl2vpn="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/l2vpn;vi"
                        alias vlm="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/lm;vi"
                        alias vrcm="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/rcm;vi"
                        alias vrsvp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/rsvp;vi"
                        alias vmpls="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls;vi"
                        alias ldp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/ldp;"
                        alias vlan="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/config/vlan"
                        alias tcpnsr="cd $PROJDIR/$SCMVIEW/comp/tcpnsr"
                        alias rib="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/rib;"
                        alias fabl="cd $PROJDIR/$SCMVIEW/pkt/sw/fabl"
                        alias mfabl="cd $PROJDIR/$SCMVIEW/pkt/sw/fabl/layer3/mpls"
                        alias cfm="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/cfm"
                        alias sw="cd $PROJDIR/$SCMVIEW/pkt/sw;"
                        alias cspf="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/cspf;"
                        alias l2vpn="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/l2vpn;"
                        alias lm="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/lm;"
                        alias rcm="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/rcm;"
                        alias rsvp="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/mpls/rsvp;"
                        alias src="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd"
                        alias pwe="cd $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/routing/pwe3"
                        alias crsvp="rsvp;cscope -R -s $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/include -s $PROJDIR/$SCMVIEW/pkt/sw/se/include"
                        alias cldp="ldp;cscope -R -q -s $PROJDIR/$SCMVIEW/pkt/sw/se/xc/bsd/include -s $PROJDIR/$SCMVIEW/pkt/sw/se/include"
                        fi
                        fi
}

code_alias
function sv() {
    export PROJDIR=`pwd|sed s/'\w*$'//`
    export SCMVIEW=${PWD##*/}
    code_alias
    scg
}

alias bang="ssh -l ebapras 147.128.148.144"
alias cvsd='cd $PROJDIR'


alias pcref54="echo $1;ssh -l root 10.184.19.54"
alias pcref55="echo $1;ssh -l root 10.184.19.55"
alias pcref56="echo $1;ssh -l root 10.184.19.56"
alias pcref57="echo $1;ssh -l root 10.184.19.57"
alias pcref58="echo $1;ssh -l root 10.184.19.58"
alias pcref59="echo $1;ssh -l root 10.184.19.59"
alias dbg="cd /home/ebapras/gdb"

export console1=10.184.19.27
export console2=10.184.19.26

tnet="/home/ebapras/.tnet"
btnet="/home/ebapras/.btnet"

screentitlecmd="screen -X title" 
tmuxtitlecmd="tmux rename-window" 

if [ "$MUX" == "tmux" ]; then
    titlecmd=$tmuxtitlecmd
else
    titlecmd=$screentitlecmd
fi

alias mrv="telnet 10.126.138.244"
alias mpbn-r1="$titlecmd mpbn-r1;$tnet 10.126.66.25 1 0; $titlecmd bash"
alias mpbn-r2="$titlecmd mpbn-r1;$tnet 10.126.66.26 1 0; $titlecmd bash"
alias mpbn-r3="$titlecmd mpbn-r1;$tnet 10.126.66.27 1 0; $titlecmd bash"
alias mpbn-r4="$titlecmd mpbn-r1;$tnet 10.126.66.29 1 0; $titlecmd bash"
alias mpbn-r5="$titlecmd mpbn-r1;$tnet 10.126.66.30 1 0; $titlecmd bash"
alias mpbn-r6="$titlecmd mpbn-r1;$tnet 10.126.66.28 1 0; $titlecmd bash"
alias mpbn-r7="$titlecmd mpbn-r1;$tnet 10.126.66.31 1 0; $titlecmd bash"
alias mpbn-r8="$titlecmd mpbn-r1;$tnet 10.126.66.18 1 0; $titlecmd bash"

alias robson="$titlecmd robson;$tnet robson.lab 1 0; $titlecmd bash"
alias crobson="$titlecmd c-robson;$tnet robson-con1.lab 1 1; $titlecmd bash"
alias lilpony="$titlecmd lilpony;$tnet lilpony.lab 1 0; $titlecmd bash"
alias clilpony="$titlecmd c-lilpony;$tnet lilpony-con1.lab 1 1; $titlecmd bash"
alias iyago="$titlecmd iyago;$tnet iyago.lab 1 0; $titlecmd bash"
alias ciyago="$titlecmd c-iyago;$tnet iyago-con1.lab 1 1; $titlecmd bash"
alias padme="$titlecmd padme;$tnet padme.lab 1 0; $titlecmd bash"
alias cpadme="$titlecmd c-padme;$tnet padme-con1.lab 1 1; $titlecmd bash"
alias nyc="$titlecmd nyc;$tnet nyc.lab 1 0; $titlecmd bash"
alias cnyc="$titlecmd c-nyc;$tnet nyc-con1.lab 1 1; $titlecmd bash"
alias lepton="$titlecmd lepton;$tnet lepton.lab 1 0;$titlecmd bash"
alias clepton="$titlecmd c-lepton;$tnet lepton-con1.lab 1 1;$titlecmd bash"
alias indiana="$titlecmd indiana;$tnet indiana.lab 1 0;$titlecmd bash"
alias cindiana="$titlecmd c-indiana;$tnet indiana-con1.lab 1 1;$titlecmd bash"
alias proto1="$titlecmd protodt-01;$tnet protodt-01.lab 1 0;$titlecmd bash"
alias cproto1="$titlecmd protodt-01-con;$tnet protodt-01-con1.lab 1 1;$titlecmd bash"
alias bittor="$titlecmd bittor;$tnet bittor.lab 0 0;$titlecmd bash"
alias cbittor="$titlecmd c-bittor;$tnet bittor-con1.lab 0 1;$titlecmd bash"
alias dodgers="$titlecmd dodgers;$tnet dodgers.lab 1 0;$titlecmd bash"
alias cdodgers="$titlecmd c-dodgers;$tnet dodgers-con1.lab 1 1;$titlecmd bash"
alias star2="$titlecmd star2;$tnet star2.lab 1 0;$titlecmd bash"
alias cstar2="$titlecmd c-star2;$tnet star2-con1.lab 1 1;$titlecmd bash"
alias tennis="$titlecmd tennis;$tnet tennis.lab 1 0;$titlecmd bash"
alias ctennis="$titlecmd c-tennis;$tnet tennis-con1.lab 1 1;$titlecmd bash"
alias tennis="$titlecmd tennis;$tnet tennis.lab 1 0;$titlecmd bash"
alias ctennis="$titlecmd c-tennis;$tnet tennis-con1.lab 1 1;$titlecmd bash"
alias lac400="$titlecmd lac400;$tnet lac400.lab 1 0;$titlecmd bash"
alias clac400="$titlecmd c-lac400;$tnet lac400-con1.lab 1 1;$titlecmd bash"
alias shiraz="$titlecmd shiraz;$tnet shiraz.lab 1 0;$titlecmd bash"
alias cshiraz="$titlecmd c-shiraz;$tnet shiraz-con1.lab 1 1;$titlecmd bash"
alias ins800="$titlecmd ins800;$tnet ins800.lab 1 0;$titlecmd bash"
alias cins800="$titlecmd c-ins800;$tnet ins800-con1.lab 1 1;$titlecmd bash"
alias bilbo="$titlecmd bilbo;$tnet bilbo.lab 1 0;$titlecmd bash"
alias cbilbo="$titlecmd c-bilbo;$tnet bilbo-con1.lab 1 1;$titlecmd bash"
alias colorado="$titlecmd colorado;$tnet colorado.lab 1 0;$titlecmd bash"
alias ccolorado="$titlecmd c-colorado;$tnet colorado-con1.lab 1 1;$titlecmd bash"
alias qse3="$titlecmd q-se3;$tnet q-se3.lab 1 0;$titlecmd bash"
alias cqse3="$titlecmd c-q-se3;$tnet q-se3-con1.lab 1 1;$titlecmd bash"
alias qse6="$titlecmd q-se6;$tnet q-se6.lab 1 0;$titlecmd bash"
alias cqse6="$titlecmd c-q-se6;$tnet q-se6-con1.lab 1 1;$titlecmd bash"
alias p2pse12001="$titlecmd p2p-se1200-1;$tnet p2p-se1200-1.lab 1 0;$titlecmd bash"
alias cp2pse12001="$titlecmd c-p2p-se1200-1;$tnet p2p-se1200-1-con1.lab 1 1;$titlecmd bash"
alias alaska="$titlecmd alaska;$tnet alaska.lab 0 0;$titlecmd bash"
alias ratchet="$titlecmd ratchet;$tnet ratchet.lab 1 0;$titlecmd bash"
alias cratchet="$titlecmd c-ratchet;$tnet ratchet-con1.lab 1 1;$titlecmd bash"
alias calaska="$titlecmd c-alaska;$tnet alaska-con1.lab 0 1;$titlecmd bash"
alias anatom4-se1="$titlecmd Anatom4-se1;$tnet Anatom4-se1.lab 1 0;$titlecmd bash"
alias canatom4-se1="$titlecmd c-Anatom4-se1;$tnet Anatom4-se1-con1.lab 1 1;$titlecmd bash"
alias wvviolet="$titlecmd wvviolet;$tnet WVViolet.lab 1 0;$titlecmd bash"
alias cwvviolet="$titlecmd c-wvviolet;$tnet WVViolet-con1.lab 1 1;$titlecmd bash"
alias sqassr7="$titlecmd sqassr7;$tnet sqassr7.lab 1 0;$titlecmd bash"
alias csqassr7="$titlecmd c-sqassr7;$tnet sqassr7-con1.lab 1 1;$titlecmd bash"
alias sqassr13="$titlecmd sqassr13;$tnet sqassr13.lab 1 0;$titlecmd bash"
alias csqassr13="$titlecmd c-sqassr13;$tnet sqassr13-con1.lab 1 1;$titlecmd bash"
alias sqassr14="$titlecmd sqassr14;$tnet sqassr14.lab 0 0;$titlecmd bash"
alias csqassr14="$titlecmd c-sqassr14;$tnet sqassr14-con1.lab 0 1;$titlecmd bash"
alias sqassr14="$titlecmd sqassr14;$tnet sqassr14.lab 1 0;$titlecmd bash"
alias csqassr14="$titlecmd c-sqassr14;$tnet sqassr14-con1.lab 1 1;$titlecmd bash"
alias st-tb3-se3="$titlecmd sqassr14;$tnet st-tb3-se3.lab 1 0;$titlecmd bash"
alias cst-tb3-se3.lab="$titlecmd c-st-tb3-se3.lab;$tnet st-tb3-se3.lab-con1.lab 1 1;$titlecmd bash"
alias goa="$titlecmd goa;$tnet goa.lab 1 0;$titlecmd bash"
alias cgoa="$titlecmd c-goa;$tnet goa-con1.lab 1 0;$titlecmd bash"
alias gucci="$titlecmd gucci;$tnet gucci.lab 1 0;$titlecmd bash"
alias cgucci="$titlecmd c-gucci;$tnet gucci-con1.lab 1 0;$titlecmd bash"
alias l4l7-6="$titlecmd l4l7-6;$tnet l4l7-6.lab 1 0;$titlecmd bash"
alias c-l4l7-6="$titlecmd l4l7-6;$tnet l4l7-6-con1.lab 1 0;$titlecmd bash"
alias l4l7-2="$titlecmd l4l7-2;$tnet l4l7-2.lab 1 0;$titlecmd bash"
alias c-l4l7-2="$titlecmd l4l7-2;$tnet l4l7-2-con1.lab 1 0;$titlecmd bash"
alias l4l7-9="$titlecmd l4l7-9;$tnet l4l7-9.lab 1 0;$titlecmd bash"
alias c-l4l7-9="$titlecmd l4l7-9;$tnet l4l7-9-con1.lab 1 0;$titlecmd bash"
alias optimus="$titlecmd optimus;$tnet optimus.lab 1 0;$titlecmd bash"
alias coptimus="$titlecmd c-optimus;$tnet optimus-con1.lab 0 0;$titlecmd bash"
alias ooptimus="$titlecmd o-optimus;$tnet optimus-con2.lab 0 0;$titlecmd bash"
alias flux2="$titlecmd flux2;$tnet flux2.lab 1 0;$titlecmd bash"
alias india1="$titlecmd india1;$tnet india1.lab 1 0;$titlecmd bash"
alias cindia1="$titlecmd c-india1;$tnet india1-con1.lab 1 1;$titlecmd bash"
alias india2="$titlecmd india2;$tnet india2.lab 0 0;$titlecmd bash"
alias cindia2="$titlecmd c-india2;$tnet india2-con1.lab 0 1;$titlecmd bash"
alias banglore="$titlecmd banglore;$tnet banglore.lab 1 0;$titlecmd bash"
alias diemmy="$titlecmd diemmy-1;$tnet diemmy-1.lab 1 1;$titlecmd bash"
alias cdiemmy="$titlecmd c-diemmy-1;$tnet diemmy-1-con1.lab 1 0;$titlecmd bash"
alias se4="$titlecmd se4;$tnet se4.lab 1 1;$titlecmd bash"
alias cse4="$titlecmd c-se4;$tnet se4-con1.lab 1 0;$titlecmd bash"
alias se5="$titlecmd se5;$tnet se5.lab 1 1;$titlecmd bash"
alias cse5="$titlecmd c-se5;$tnet se5-con1.lab 1 0;$titlecmd bash"
alias ose5="$titlecmd c-se5;$tnet se5-con2.lab 1 1;$titlecmd bash"
alias arkansas="$titlecmd arkansas;$tnet arkansas.lab 1 0;$titlecmd bash"
alias carkansas="$titlecmd c-arkansas;$tnet arkansas-con1.lab 1 1;$titlecmd bash"
alias graviton="$titlecmd graviton;$tnet graviton.lab 1 0;$titlecmd bash"
alias cgraviton="$titlecmd c-graviton;$tnet graviton-con1.lab 1 1;$titlecmd bash"
alias proto2="$titlecmd protodt-02;tmux_rtr_binds;$tnet protodt-02.lab 1 0;$titlecmd bash"
alias cproto2="$titlecmd protodt-c-02;$tnet protodt-02-con1.lab 1 1;$titlecmd bash"
alias giants="$titlecmd giants;$tnet giants.lab 1 0;$titlecmd bash"
alias cgiants="$titlecmd c-giants;$tnet giants-con1.lab 1 1;$titlecmd bash"
alias bilbo="$titlecmd bilbo;$tnet bilbo.lab 1 0;$titlecmd bash"
alias cbilbo="$titlecmd c-bilbo;$tnet bilbo-con1.lab 1 1;$titlecmd bash"
alias softball="$titlecmd softball;$tnet softball.lab 1 0;$titlecmd bash"
alias csoftball="$titlecmd c-softball;$tnet softball-con1.lab 1 1;$titlecmd bash"
alias mets="$titlecmd mets;$tnet mets.lab 1 0;$titlecmd bash"
alias cmets="$titlecmd c-mets;$tnet mets-con1.lab 1 1;$titlecmd bash"
alias cmets="$titlecmd c-mets;$tnet mets-con1.lab 1 0;$titlecmd bash"
alias cgiants="$titlecmd c-giants;$tnet giants-con1.lab 1 1;$titlecmd bash"
alias lilpony="$titlecmd lilpony;$tnet lilpony.lab 1 0;$titlecmd bash"
alias clilpony="$titlecmd c-lilpony;$tnet lilpony-con1.lab 1 1;$titlecmd bash"
alias fatcat="$titlecmd fatcat;$tnet fatcat.lab 1 0;$titlecmd bash"
alias cfatcat="$titlecmd c-fatcat;$tnet fatcat-con1.lab 1 1;$titlecmd bash"
alias denmark="$titlecmd denmark;$tnet denmark.lab 1 0;$titlecmd bash"
alias cdenmark="$titlecmd c-denmark;$tnet denmark-con1.lab 1 1;$titlecmd bash"
alias golf="$titlecmd golf;$tnet golf.lab 1 0;$titlecmd bash"
alias cgolf="$titlecmd c-golf;$tnet golf-con1.lab 1 1;$titlecmd bash"
alias kamal="$titlecmd kamal;$tnet kamal.lab 1 0;$titlecmd bash"
alias ckamal="$titlecmd c-kamal;$tnet kamal-con1.lab 1 1;$titlecmd bash"
alias se3="$titlecmd se3;$tnet se3.lab 1 0;$titlecmd bash"
alias cse3="$titlecmd c-se3;$tnet se3-con1.lab 1 1;$titlecmd bash"
alias se131="$titlecmd se131;$tnet se131.lab 1 0;$titlecmd bash"
alias cse131="$titlecmd c-se131;$tnet se131-con1.lab 1 1;$titlecmd bash"
alias soccer="$titlecmd soccer;$tnet soccer.lab 1 0;$titlecmd bash"
alias csoccer="$titlecmd c-soccer;$tnet soccer-con1.lab 1 1;$titlecmd bash"
alias webb="$titlecmd webb;$tnet webb.lab 0 0;$titlecmd bash"
alias cwebb="$titlecmd c-webb;$tnet webb-con1.lab 0 1;$titlecmd bash"
alias se2="$titlecmd se2;$tnet se2.lab 1 0;$titlecmd bash"
alias cse2="$titlecmd c-se2;$tnet se2-con1.lab 1 1;$titlecmd bash"
alias compton="$titlecmd compton;$tnet compton.lab 1 0;$titlecmd bash"
alias iowa="$titlecmd iowa;$tnet iowa.lab 1 1;$titlecmd bash"
alias ciowa="$titlecmd c-iowa;$tnet iowa-con1.lab 1 0;$titlecmd bash"
alias i1="$titlecmd india1;$tnet india1.lab 1 1;$titlecmd bash"
alias ci1="$titlecmd c-india1;$tnet india1-con1.lab 1 0;$titlecmd bash"
alias i2="$titlecmd india2;$tnet india2.lab 1 1;$titlecmd bash"
alias ci2="$titlecmd c-india2;$tnet india2-con1.lab 1 0;$titlecmd bash"
alias in="$titlecmd indiana;$tnet indiana.lab 1 1;$titlecmd bash"
alias cin="$titlecmd c-indiana;$tnet indiana-con1.lab 1 0;$titlecmd bash"
alias star5="$titlecmd star5;$tnet star5.lab 1 0 1 1;$titlecmd bash"
alias cstar5="$titlecmd c-star5;$tnet star5-con1.lab 1 1;$titlecmd bash"
alias chennai="$titlecmd chennai;$tnet chennai.lab 0 0;$titlecmd bash"
alias cchennai="$titlecmd c-chennai;$tnet chennai-con1.lab 0 1;$titlecmd bash"
alias ochennai="$titlecmd c-chennai;$tnet chennai-con2.lab 0 1;$titlecmd bash"
alias gluon="$titlecmd gluon;$tnet gluon.lab 1 0;$titlecmd bash"
alias cgluon="$titlecmd c-gluon;$tnet gluon-con1.lab 1 1;$titlecmd bash"
alias hadron="$titlecmd hadron;$tnet hadron.lab 1 0;$titlecmd bash"
alias chadron="$titlecmd c-hadron;$tnet hadron-con1.lab 1 1;$titlecmd bash"
alias photon="$titlecmd photon;$tnet photon.lab 1 0;$titlecmd bash"
alias cphoton="$titlecmd c-photon;$tnet photon-con1.lab 1 1;$titlecmd bash"
alias badminton="$titlecmd badminton;$tnet badminton.lab 1 0;$titlecmd bash"
alias cbadminton="$titlecmd c-badminton;$tnet badminton-con1.lab 1 1;$titlecmd bash"
alias belgium="$titlecmd belgium;$tnet belgium.lab 1 0;$titlecmd bash"
alias cbelgium="$titlecmd c-belgium;$tnet belgium-con1.lab 1 1;$titlecmd bash"
alias iroute2-se1="$titlecmd iroute2-se1;$tnet 10.192.34.149 1 0;$titlecmd bash"
alias iroute2-se2="$titlecmd iroute2-se2;$tnet 10.192.34.152 1 0;$titlecmd bash"
alias iroute2-se3="$titlecmd iroute2-se3;$tnet 10.192.34.155 1 0;$titlecmd bash"

#ecp pool
alias s1="$titlecmd essr1;$tnet sjl3-ecp-ssr01.lab 0 0;$titlecmd bash"
alias s2="$titlecmd essr1;$tnet sjl3-ecp-ssr02.lab 0 0;$titlecmd bash"
alias s3="$titlecmd essr1;$tnet sjl3-ecp-ssr03.lab 0 0;$titlecmd bash"
alias s4="$titlecmd essr1;$tnet sjl3-ecp-ssr04.lab 0 0;$titlecmd bash"
alias s5="$titlecmd essr1;$tnet sjl3-ecp-ssr05.lab 0 0;$titlecmd bash"
alias s6="$titlecmd essr1;$tnet sjl3-ecp-ssr06.lab 0 0;$titlecmd bash"
alias s7="$titlecmd essr1;$tnet sjl3-ecp-ssr07.lab 0 0;$titlecmd bash"
alias s8="$titlecmd essr1;$tnet sjl3-ecp-ssr08.lab 0 0;$titlecmd bash"
alias s9="$titlecmd essr1;$tnet sjl3-ecp-ssr09.lab 0 0;$titlecmd bash"
alias s10="$titlecmd essr1;$tnet sjl3-ecp-ssr10.eld 0 0;$titlecmd bash"
alias cs10="$titlecmd m-essr1;$tnet sjl3-ecp-ssr10-con1.eld 0 0;$titlecmd bash"
alias os10="$titlecmd s-essr1;$tnet sjl3-ecp-ssr10-con2.eld 0 0;$titlecmd bash"
alias s11="$titlecmd essr1;$tnet sjl3-ecp-ssr11.eld 0 0;$titlecmd bash"
alias s12="$titlecmd essr1;$tnet sjl3-ecp-ssr12.eld 0 0;$titlecmd bash"
alias s13="$titlecmd essr1;$tnet sjl3-ecp-ssr13.eld 0 0;$titlecmd bash"
alias s14="$titlecmd essr1;$tnet sjl3-ecp-ssr14.lab 0 0;$titlecmd bash"
alias s15="$titlecmd essr1;$tnet sjl3-ecp-ssr15.lab 0 0;$titlecmd bash"
alias s16="$titlecmd essr1;$tnet sjl3-ecp-ssr16.lab 0 0;$titlecmd bash"
alias s17="$titlecmd essr1;$tnet sjl3-ecp-ssr17.lab 0 0;$titlecmd bash"
alias s22="$titlecmd essr1;$tnet sjl3-ecp-ssr22.eld 0 0;$titlecmd bash"
alias s28="$titlecmd essr1;$tnet sjl3-ecp-ssr028.lab 0 0;$titlecmd bash"
alias s29="$titlecmd essr1;$tnet sjl3-ecp-ssr029.lab 0 0;$titlecmd bash"
alias s30="$titlecmd essr1;$tnet sjl3-ecp-ssr030.lab 0 0;$titlecmd bash"
alias se8="$titlecmd se08;$tnet sjl3-ecp-se08.eld 0 0;$titlecmd bash"
alias s33="$titlecmd s33;$tnet sjl3-ecp-ssr33.eld 0 0;$titlecmd bash"
alias s34="$titlecmd s34;$tnet sjl3-ecp-ssr34.eld 0 0;$titlecmd bash"
alias s35="$titlecmd s34;$tnet sjl3-ecp-ssr35.eld 0 0;$titlecmd bash"

alias divy="ch -pool=blr_sqa detail ivy"
alias ivy="$tnet 10.184.22.56"
alias civy="$tnet $console1 7019"
alias oivy="$tnet $console2 7006"
alias pivy="ping 10.184.22.56"

alias drose="ch -pool=blr_sqa detail rose"
alias rose="$btnet 10.184.22.11"
alias crose="$tnet $console1 7001" 
alias prose="ping 10.184.22.11" 

alias dvaigai="ch -pool=blr_sqa detail vaigai"
alias vaig="$tnet 10.184.22.29"
alias cvaig="$tnet $console1 7019"
alias ovaig="$tnet $console2 7006"
alias pvaig="ping 10.184.22.29"

alias dlily="ch -pool=blr_sqa detail lily"
alias lily="$tnet 10.184.22.12"
alias clily="$tnet $console1 7002"
alias olily="$tnet $console2 7021"
alias plily="ping 10.184.22.12"

alias djasmine="ch -pool=blr_sqa detail jasmine"
alias jasmine="$tnet 10.184.22.13"
alias cjasmine="$tnet $console1 7003"
alias pjasmine="ping 10.184.22.13"

alias dlotus="ch -pool=blr_sqa detail lotus"
alias lotus="$tnet 10.184.22.14"
alias clotus="$tnet $console1 7004"
alias plotus="ping 10.184.22.14"

export mapleip="10.184.22.22"
alias dmaple="ch -pool=blr_sqa detail maple"
alias maple="$btnet 10.184.22.22"
alias cmaple="$tnet $console1 7012"
alias pmaple="ping 10.184.22.22"

export oliveip="10.184.22.52"
alias dolive="ch -pool=blr_sqa detail olive"
alias olive="$btnet $oliveip"
alias colive="$tnet $console1 7042"
alias polive="ping $oliveip"

alias dcarna="ch -pool=blr_sqa detail carnation"
alias carna="$tnet 10.184.22.50"
alias mcarna="$tnet 10.184.22.168"
alias ccarna="$tnet $console1 7040"
alias pcarna="ping 10.184.22.50"
alias ocarna="$tnet $console2 7018"

alias street="$tnet street.lab"
alias market="$tnet market.lab"
alias xdela="$tnet xdela.lab"
alias redkite="$tnet redkite.lab"
alias perf-sm480-11="$tnet perf-sm480-11.lab"
alias blackite="$tnet blackite.lab"
alias hellboy="$tnet hellboy.lab"

alias alu="$tnet 10.126.70.27"


alias vtip="vi ~/.tip.c"
alias rfc="cd /home/ebapras/rfc"
alias sj="ssh -l ebapras lxlogin.redback.com"
alias sysbld="cd /home/sysbuild/images"
alias v=cvssettree
alias vs=cvslisttrees
alias ls1="ls -1 $PWD/"
#alias cvsm=cvscheckout
alias scg=scg
alias scc=scc
alias pssr=psr
alias pse=pse

function psr() {
    export PRO="ssr"
    code_alias
}

function pse() {
    export PRO="se"
    code_alias
}

function scg() {
export SCM=git
if [ "git" == "$SCM" ]; then
#PS1='[\u@\h \W$(--git-ps1 " (%s)")]\$ '
#    export PS1="\u@\h:\w\[$txtcyn\]\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/') \$ \[$txtrst\]"
#    export PS1='\u@\h$(__git_ps1 \[$txtcyn\]" ($SCMVIEW/%s)\[$txtrst\]")\$ '
#     export PS1='\u@\h$(__git_ps1 " (\[$txtgrn\]$SCMVIEW/\[$txtcyn\]%s)\[$txtrst\]")\$ '
    if [ -z "$STATE" ]; then
        if [ "$MYHOST" == "ts" ]; then
            export PS1='\h$(__git_ps1 " (\[$txtred\]$SCMVIEW/\[$txtcyn\]%s\[$txtrst\]/\W)")>> ';
        else
            export PS1='\h$(__git_ps1 " (\[$txtgrn\]$SCMVIEW/\[$txtcyn\]%s\[$txtrst\]/\W)")>> ';
        fi
    else
        if [ "$MYHOST" == "ts" ]; then
            export PS1='\h$(__git_ps1 " (\[$txtred\]$SCMVIEW/\[$txtcyn\]%s\[$txtrst\]/\W)")> ';
        else
            export PS1='\h$(__git_ps1 " (\[$txtgrn\]$SCMVIEW/\[$txtcyn\]%s\[$txtrst\]/\W)")> ';
        fi
    fi
    export PROMPT_COMMAND=
else
    export PROMPT_COMMAND=prompt_cmd_cvs
fi
}

function scc() {
export SCM=cvs
if [ "git" == "$SCM" ]; then
#PS1='[\u@\h \W$(--git-ps1 " (%s)")]\$ '
#    export PS1="\u@\h:\w\[$txtcyn\]\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/') \$ \[$txtrst\]"
#    export PS1='\u@\h$(__git_ps1 \[$txtcyn\]" ($SCMVIEW/%s)\[$txtrst\]")\$ '
#    export PS1='\u@\h$(__git_ps1 " (\[$txtgrn]$SCMVIEW/\[$txtcyn\]%s)\[$txtrst\]")\$ '
     export PS1='\h$(__git_ps1 " (\[$txtgrn\]$SCMVIEW/\[$txtcyn\]%s\[$txtrst\]/\W)")> ';
    export PROMPT_COMMAND=
else
    export PROMPT_COMMAND=prompt_cmd_cvs
fi
}


alias cop=cop
function cop() {
    echo "Copying $1 to $2"
    if [ "$2" == "olive" ]; then
        scp $1 redback@$oliveip:/usr/siara/bin
            elif [ "$2" == "maple" ]; then
        scp $1 redback@$mapleip:/usr/siara/bin
    fi
}

alias ct=check_out_tree
function check_out_tree() {
    if [ "$PWD" != "$PROJDIR" ]; then
        echo "Not in base cvs dir"
        return
    fi 

    cd $PROJDIR/
    echo "Entering $PWD"
    if [ -d "sfi_$1" ]; then
        echo "cvs tree already exists!"
        return 
    fi
    echo "Making cvs dir sfi_$1"
    mkdir "sfi_$1"
    cd "sfi_$1"
    echo "Entering $PWD"
    hmfld=`pwd`
    tmpstr=`version-decode --timestamp $1`
    cvsm_cmd="cvsm co -rswfeature_int -D\"${tmpstr:26}\" se_all"
    export SCMVIEW="sfi_$1"
    source ~/.bashrc
    echo "Current view set to $SCMVIEW"
    eval $cvsm_cmd
    scra
    echo "Making scratch-folder sfi_$1"
    mkdir "sfi_$1"
    cd sfi_$1
    scra_dir=`pwd`
    cd $hmfld
    cd $PROJDIR/sfi_$1/pkt
    echo "Entering bld $PWD"
    echo "configuring scratch scratch-config $scra_dir"
    scratch-config $scra_dir
    cd $hmfld
    echo "Entering $PWD"
}

alias cs=~/calltree.sh
#alias cs=cvs_file_status
function cvs_file_status() {
    cvsm -Q status $1
}

function cvs_checkout_files() {
    echo -n [
    for i in `lc | sed 's/File: //g' | sed 's/Status:.*//g' | sed 's/\./\\\./g'`
        do
            i="/"$i
            cmd=$(global -P $i)
            nout=`printf "{'bufnr':'0', 'filename':'%s', 'lnum':'1', 'type':'I', 'text':'%s'}," $cmd`
            echo -n "$nout"
       done
    echo -n {}]
}

if [ "git" == "$SCM" ]; then
    alias cf=git_checkout_files
else
    alias cf=cvs_checkout_files
fi

function git_checkout_files() {
    echo -n [
    for i in `git status . --short | grep -w M | sed 's/M//' | sed 's/ *//'`
        do
            i="/"$i
            cmd=$(global -P $i)
            nout=`printf "{'bufnr':'0', 'filename':'%s', 'lnum':'1', 'type':'I', 'text':'%s'}," $cmd`
            echo -n "$nout"
       done
    echo -n {}]
}

alias f=f
# gives the path of a cvs file
function f() {
    global -P  $1 > ~/tip.tmp
    cat ~/tip.tmp
#
#    if [ "$MUX" == "tmux" ]; then
#        echo ~/tip.tmp | tmux loadb -
#    else
#        screen -X readbuf ~/tip.tmp
#    fi
#
    rm -f ~/tip.tmp
}

alias ff=ff
# gives the path of a cvs file
function ff() {
    global -P  $1 > ~/tip.tmp

    cat ~/tip.tmp | awk -v r=$PWD '{print r $0}'
#
#    if [ "$MUX" == "tmux" ]; then
#        echo ~/tip.tmp | tmux loadb -
#    else
#        screen -X readbuf ~/tip.tmp
#    fi
#
    rm -f ~/tip.tmp
}

function cvslisttrees() {
index=1
for i in `ls -1 $PROJDIR/`
do 
    j=0

    trees[$index]=$i
    echo -n $index" "
    index=$(($index+1))

    if [ "$SCMVIEW" == "$i" ]; then
        cview="<"$i">"
        printf %-25s $cview
    else
        printf %-25s $i
    fi

    if [ -f $PROJDIR/$i/cvs.string ]; then
        while read line
        do
            echo $line
            printf %-26s ""
            j=$(($j+1))
        done <$PROJDIR/$i/cvs.string

        echo ""
    else
        printf %s "[No-Info]"
        echo ""
        export SCMVIEW= 
        code_alias
    fi
done

echo -n $index 
printf %-25s " Unset the current view."
echo ""

read -s -n 2 sel

while ! [[ "$sel" =~ ^[0-9]+$ ]] 
do
    read -s -n 1 sel
done

if [ "$sel" -ne 0 ]; then
    if [ "$sel" -eq "$index" ]; then
        cvssettree "none"
    else
        cvssettree ${trees[$sel]}
        export curview=${trees[$sel]}
    fi
fi
}

function cvscheckout() {
pplen=30
nargs=$#
cmd="cvsm $*"

if [ "$1" != "co" ]; then
    unalias cvsm
    eval "$cmd"
    alias cvsm=cvs_checkout
    return 1
fi

if [ "$SCMVIEW" == "~" ]; then
    echo "No cvs tree is set!"
    return 1
elif [ "$SCMVIEW" == " " ]; then
    echo "No cvs tree is set!"
    return 1
fi

cdir=$PWD"/"
cvlen=`expr index "${cdir:$pplen}" "/"`

if [ $cvlen -ne 0 ]; then
    cview=${cdir:$pplen:$cvlen-1}

    if [ "$cview" == "$SCMVIEW" ]; then
        if [ -f $PROJDIR/$cview/cvs.string ]; then
            chmod +w cvs.string
            echo "[$cmd]" >> ./cvs.string
            echo `date` >> ./cvs.string

        else
            echo "[$cmd]"  > ./cvs.string
            echo `date` >> ./cvs.string
        fi
        chmod -w cvs.string
        unalias cvsm
        echo "executing $cmd"
        eval "$cmd"
        alias cvsm=cvscheckout
    else
        echo "Trying to checkout in the wrong dir!"
    fi
else
    echo "Trying to checkout in the wrong dir!"
fi
}

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

function prompt_cmd_cvs() {
    cdir=$PWD"/"
    pplen=30
    out=1

    if [ "$SCMVIEW" != "~" ]; then
        cvlen=`expr index "${cdir:$pplen}" "/"`

        if [ $cvlen -ne 0 ]; then
            cview=${cdir:$pplen:$cvlen-1}

            if [ "$cview" == "$SCMVIEW" ]; then
                out=0
            fi
        fi

        if [ $out -eq 0 ]; then
            export PS1="\u@\h (cvs)\[$txtgrn\][$SCMVIEW]# \[$txtrst\]"
        else
            export PS1="\u@\h (cvs)\[$txtgrn\][<$SCMVIEW>]# \[$txtrst\]"
        fi
    else
            export PS1="\u@\h (cvs)\[$txtgrn\][~]# \[$txtrst\]"
    fi
}

function cvssettree() {

if [ "$SCMVIEW" != "~" ]; then
    if [ "$SCMVIEW" != "" ]; then
        if [ "$1" != "none" ]; then
            if [ "$1" != "$SCMVIEW" ]; then
                echo "Unset the current tree first!"
            fi
        fi
    fi
fi

if [ -d "$PROJDIR/$1" ]; then

    cvlen=`expr index "${1}" "/"`

    if [ $cvlen -ne 0 ]; then
        export SCMVIEW=${1:0:$cvlen-1}
    else
        export SCMVIEW=$1
    fi
	cd "$PROJDIR/$1"
    source
elif [ $1 == "none" ]; then
	export SCMVIEW="~"
    export PS1="\u@\h[$SCMVIEW]#"
	cvsd
    source
else
	echo "No such view"
fi
}


export pathip=147.117.54.107
alias bpath=bpath

function bpath() {
nargs=$#
index=1

if [ $nargs -eq 0 ]; then
    if [ "$SCMVIEW" == "~" ]; then
        return 1
    fi

    if [ "$SCMVIEW" == "" ]; then
        return 1
    fi
fi

if [ $nargs -eq 0 ]; then
    cd "$PROJDIR/$SCMVIEW/images"
    for i in `ls -1 *.gz`; do
        array[$index]="release download scp://ebapras@$pathip/$PWD/$i"
        echo $index ${array[$index]}
        index=$(($index+1))
    done
else
    echo "release download scp://ebapras@$pathip/$PWD/$1"
fi

read -s -n 1 sel

while ! [[ "$sel" =~ ^[0-9]+$ ]] 
do
    read -s -n 1 sel
done

if [ $sel -ne 0 ]; then
    if [ "$MUX" == "tmux" ]; then
        echo ${array[$sel]} | tmux loadb -
    else
        echo ${array[$sel]} > ~/tip.tmp
        screen -X readbuf ~/tip.tmp
        rm -f ~/tip.tmp
    fi
fi
}
alias pssr=pssr

function pssr()  {
    cd "$PROJDIR/$SCMVIEW/images"
    f="pkg-SSR.tar.gz"
    echo "release download ftp://arts:GodZilla@155.53.12.7//$PWD/$f"
    echo "release download ftp://arts:GodZilla@155.53.12.7//$PWD/$f" | tmux loadb -
}

alias bfpath=bfpath
function bfpath() {
nargs=$#
index=1

if [ $nargs -eq 0 ]; then
    if [ "$SCMVIEW" == "~" ]; then
        return 1
    fi

    if [ "$SCMVIEW" == "" ]; then
        return 1
    fi
fi

if [ $nargs -eq 0 ]; then
    cd "$PROJDIR/$SCMVIEW/images"
    for i in `ls -1 *.gz`; do
        array[$index]="release download ftp://arts:GodZilla@$pathip//$PWD/$i"
        echo $index ${array[$index]}
        index=$(($index+1))
    done
else
    echo "release download ftp://arts:GodZilla@$pathip//$PWD/$1"
fi

read -s -n 1 sel

while ! [[ "$sel" =~ ^[0-9]+$ ]] 
do
    read -s -n 1 sel
done

if [ $sel -ne 0 ]; then
    if [ "$MUX" == "tmux" ]; then
        echo ${array[$sel]} | tmux loadb -
    else
        echo ${array[$sel]} > ~/tip.tmp
        screen -X readbuf ~/tip.tmp
        rm -f ~/tip.tmp
    fi
fi
}

function rs() { 
    if [ "$MUX" == "tmux" ]; then
        tmux loadb $1
    else
        screen -X readbuf $1
    fi
}

function lsp() {
nargs=$#
oifs=$IFS
index=1
IFS=$'\r'

if [ $nargs -eq 0 ]; then
        while read line
        do
        array[$index]="$PWD/$line"
        echo $index ${array[$index]}
        index=$(($index+1))
    done <<< `ls -1`
else
    ls $PWD/$1
fi
IFS=$oifs

if [ $index -gt 2 ]; then
    if [ $index -lt 10 ]; then
        read -s -n 1 sel
        while ! [[ "$sel" =~ ^[0-9]+$ ]] 
        do
            read -s -n 1 sel
        done
    elif [ $index -lt 100 ]; then
        read -s -n 2 sel
        while ! [[ "$sel" =~ ^[0-9]+$ ]] 
        do
            read -s -n 2 sel
        done
    else
        read -s sel
        while ! [[ "$sel" =~ ^[0-9]+$ ]] 
        do
            read -s sel
        done
    fi

    if [ $sel -ne 0 ]; then
        if [ "$MUX" == "tmux" ]; then
            echo ${array[$sel]} | tmux loadb -
        else
            echo ${array[$sel]} > ~/tip.tmp
            screen -X readbuf ~/tip.tmp
            rm -f ~/tip.tmp
        fi
    fi
else
        if [ "$MUX" == "tmux" ]; then
            echo ${array[1]} | tmux loadb -
        else
            echo ${array[1]} > ~/tip.tmp
            screen -X readbuf ~/tip.tmp
            rm -f ~/tip.tmp
        fi
fi

}

function send() {
olive="10.184.22.52"

if [ "$1" == "olive" ]; then
scp $PROJDIR/$SCMVIEW/pkt/xc-sb1-mips/netbsd/Bin/$2 $2 redback@$olive:/usr/siara/bin
fi

}

function tip() {
i=1
oifs=$IFS
IFS=$'\r'

while read line
do
    echo $i $line
    array[$i]=$line
    i=$(($i+1))
done <<< `grep -i $1 ~/.tip.c`

IFS=$oifs

if [ $i -lt 11 ]; then
    read -s -n 1 sel
    while ! [[ "$sel" =~ ^[0-9]+$ ]] 
    do
        read -s -n 1 sel
    done
elif [ $i -lt 101 ]; then
    read -s -n 2 sel
    while ! [[ "$sel" =~ ^[0-9]+$ ]] 
    do
        read -s -n 2 sel
    done
else
    read -s sel
    while ! [[ "$sel" =~ ^[0-9]+$ ]] 
    do
        read -s sel
    done
fi

if [ $sel -ne 0 ]; then
    if [ "$MUX" == "tmux" ]; then
        echo ${array[$sel]} | tmux loadb - 
    else
        echo ${array[$sel]} > ~/tip.tmp
        screen -X readbuf ~/tip.tmp
        rm -f ~/tip.tmp
    fi
fi
}

#alias ls="ls $PWD/*"

#function prompt() {
#	echo "one:"
#}

#export PROMPT_COMMAND='prompt' 

#function tip() {
	#grep -i $1 ~/.tip.c
#}

alias t=tip

#export PS1="\u@\h[$SCMVIEW]# "
#export PS1="\j@`grep cvs pwd`:"
export CSCOPE_EDITOR="vim"
export SHELL="/bin/bash"
export PATH=/tools/swdev/bin:$PATH
#export PATH=/home/ebapras/bin:$PATH
#export PATH=/home/ebapras/mystuff/inst/:$PATH
#export PATH=/home/ebapras/pb/src/ccglue/bin:$PATH
#export PATH=/home/ebapras/simscripts:$PATH
export PATH=/home/ebapras/env/bin:$PATH
#export PATH=/home/ebapras/env/lib:$PATH
#export PATH=/home/eanmich/bin:$PATH
#export PATH=/project/swbuild14/ebapras/scripts:$PATH
#export PATH=/project/swbuild45/ewarobiadm/tools/scripts:$PATH
export PATH=/home/gerrit/bin:$PATH

export CH_POOL=blr_rout
export EDITOR=vi

set -o vi
#
# Set up CVS
# Uncomment the lines below and set CVSROOT to your groups root cvs path.
#
#export CVSROOT=admin:/build/cvs

export CVS_RSH=ssh
export CVSROOT=:pserver:`whoami`@cvs-master.redback.com:/cvsroot

#
# OS dependant section. Place OS dependant settings here
#


# Common PATH variable
#export PATH=$PATH:/tools/swdev/bin:.:~jlynam/bin:~/tools/test
#export PATH=$PATH:/project/arts/trees/current_tree/sqa/ARTS/infra/bin
#export PATH=$PATH:/usr/local/mysql5/bin
#export PATH=$PATH:~mikea/bin
#export PATH=/home/ebapras/curl-7.25.0/inst/bin:$PATH
#export PATH=/home/ebapras/env/bin:$PATH

#HOSTTYPE=`uname -s`
#case $HOSTTYPE in
# "NetBSD")
#  export PATH=$HOME/bin:/usr/local/bin:/bin:/sbin:/usr/sbin:/usr/pkg/bin:/usr/bin:/usr/X11R6/bin
# ;;
# "Linux")
#  export PATH=$HOME/bin:/usr/local/bin:/bin:/sbin:/usr/sbin:/usr/pkg:/usr/bin:/usr/X11R6/bin
# ;;
#  "SunOS")
#  export PATH=$HOME/bin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/openwin/bin:/usr/dt/bin
#  export MOZILLA_HOME=/usr/local/netscape45
#  export OPENWINHOME=/usr/openwin
#  export MANPATH=/usr/share/man:/usr/man:/usr/local/man
#;;
# *)
#  ;;
#esac



# test start
#!bash
#
# bash/zsh completion support for core Git.
#
# Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>
# Conceptually based on gitcompletion (http://gitweb.hawaga.org.uk/).
# Distributed under the GNU General Public License, version 2.0.
#
# The contained completion routines provide support for completing:
#
#    *) local and remote branch names
#    *) local and remote tag names
#    *) .git/remotes file names
#    *) git 'subcommands'
#    *) tree paths within 'ref:path/to/file' expressions
#    *) common --long-options
#
# To use these routines:
#
#    1) Copy this file to somewhere (e.g. ~/.git-completion.sh).
#    2) Add the following line to your .bashrc/.zshrc:
#        source ~/.git-completion.sh
#
#    3) Consider changing your PS1 to also show the current branch:
#         Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#         ZSH:  PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
#
#       The argument to __git_ps1 will be displayed only if you
#       are currently in a git repository.  The %s token will be
#       the name of the current branch.
#
#       In addition, if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty
#       value, unstaged (*) and staged (+) changes will be shown next
#       to the branch name.  You can configure this per-repository
#       with the bash.showDirtyState variable, which defaults to true
#       once GIT_PS1_SHOWDIRTYSTATE is enabled.
#
#       You can also see if currently something is stashed, by setting
#       GIT_PS1_SHOWSTASHSTATE to a nonempty value. If something is stashed,
#       then a '$' will be shown next to the branch name.
#
#       If you would like to see if there're untracked files, then you can
#       set GIT_PS1_SHOWUNTRACKEDFILES to a nonempty value. If there're
#       untracked files, then a '%' will be shown next to the branch name.
#
#       If you would like to see the difference between HEAD and its
#       upstream, set GIT_PS1_SHOWUPSTREAM="auto".  A "<" indicates
#       you are behind, ">" indicates you are ahead, and "<>"
#       indicates you have diverged.  You can further control
#       behaviour by setting GIT_PS1_SHOWUPSTREAM to a space-separated
#       list of values:
#           verbose       show number of commits ahead/behind (+/-) upstream
#           legacy        don't use the '--count' option available in recent
#                         versions of git-rev-list
#           git           always compare HEAD to @{upstream}
#           svn           always compare HEAD to your SVN upstream
#       By default, __git_ps1 will compare HEAD to your SVN upstream
#       if it can find one, or @{upstream} otherwise.  Once you have
#       set GIT_PS1_SHOWUPSTREAM, you can override it on a
#       per-repository basis by setting the bash.showUpstream config
#       variable.
#

if [[ -n ${ZSH_VERSION-} ]]; then
	autoload -U +X bashcompinit && bashcompinit
fi

case "$COMP_WORDBREAKS" in
*:*) : great ;;
*)   COMP_WORDBREAKS="$COMP_WORDBREAKS:"
esac

# __gitdir accepts 0 or 1 arguments (i.e., location)
# returns location of .git repo
__gitdir ()
{
	if [ -z "${1-}" ]; then
		if [ -n "${__git_dir-}" ]; then
			echo "$__git_dir"
		elif [ -d .git ]; then
			echo .git
		else
			git rev-parse --git-dir 2>/dev/null
		fi
	elif [ -d "$1/.git" ]; then
		echo "$1/.git"
	else
		echo "$1"
	fi
}

# stores the divergence from upstream in $p
# used by GIT_PS1_SHOWUPSTREAM
__git_ps1_show_upstream ()
{
	local key value
	local svn_remote svn_url_pattern count n
	local upstream=git legacy="" verbose=""

	svn_remote=()
	# get some config options from git-config
	local output="$(git config -z --get-regexp '^(svn-remote\..*\.url|bash\.showupstream)$' 2>/dev/null | tr '\0\n' '\n ')"
	while read -r key value; do
		case "$key" in
		bash.showupstream)
			GIT_PS1_SHOWUPSTREAM="$value"
			if [[ -z "${GIT_PS1_SHOWUPSTREAM}" ]]; then
				p=""
				return
			fi
			;;
		svn-remote.*.url)
			svn_remote[ $((${#svn_remote[@]} + 1)) ]="$value"
			svn_url_pattern+="\\|$value"
			upstream=svn+git # default upstream is SVN if available, else git
			;;
		esac
	done <<< "$output"

	# parse configuration values
	for option in ${GIT_PS1_SHOWUPSTREAM}; do
		case "$option" in
		git|svn) upstream="$option" ;;
		verbose) verbose=1 ;;
		legacy)  legacy=1  ;;
		esac
	done

	# Find our upstream
	case "$upstream" in
	git)    upstream="@{upstream}" ;;
	svn*)
		# get the upstream from the "git-svn-id: ..." in a commit message
		# (git-svn uses essentially the same procedure internally)
		local svn_upstream=($(git log --first-parent -1 \
					--grep="^git-svn-id: \(${svn_url_pattern#??}\)" 2>/dev/null))
		if [[ 0 -ne ${#svn_upstream[@]} ]]; then
			svn_upstream=${svn_upstream[ ${#svn_upstream[@]} - 2 ]}
			svn_upstream=${svn_upstream%@*}
			local n_stop="${#svn_remote[@]}"
			for ((n=1; n <= n_stop; n++)); do
				svn_upstream=${svn_upstream#${svn_remote[$n]}}
			done

			if [[ -z "$svn_upstream" ]]; then
				# default branch name for checkouts with no layout:
				upstream=${GIT_SVN_ID:-git-svn}
			else
				upstream=${svn_upstream#/}
			fi
		elif [[ "svn+git" = "$upstream" ]]; then
			upstream="@{upstream}"
		fi
		;;
	esac

	# Find how many commits we are ahead/behind our upstream
	if [[ -z "$legacy" ]]; then
		count="$(git rev-list --count --left-right \
				"$upstream"...HEAD 2>/dev/null)"
	else
		# produce equivalent output to --count for older versions of git
		local commits
		if commits="$(git rev-list --left-right "$upstream"...HEAD 2>/dev/null)"
		then
			local commit behind=0 ahead=0
			for commit in $commits
			do
				case "$commit" in
				"<"*) ((behind++)) ;;
				*)    ((ahead++))  ;;
				esac
			done
			count="$behind	$ahead"
		else
			count=""
		fi
	fi

	# calculate the result
	if [[ -z "$verbose" ]]; then
		case "$count" in
		"") # no upstream
			p="" ;;
		"0	0") # equal to upstream
			p="=" ;;
		"0	"*) # ahead of upstream
			p=">" ;;
		*"	0") # behind upstream
			p="<" ;;
		*)	    # diverged from upstream
			p="<>" ;;
		esac
	else
		case "$count" in
		"") # no upstream
			p="" ;;
		"0	0") # equal to upstream
			p=" u=" ;;
		"0	"*) # ahead of upstream
			p=" u+${count#0	}" ;;
		*"	0") # behind upstream
			p=" u-${count%	0}" ;;
		*)	    # diverged from upstream
			p=" u+${count#*	}-${count%	*}" ;;
		esac
	fi

}


# __git_ps1 accepts 0 or 1 arguments (i.e., format string)
# returns text to add to bash PS1 prompt (includes branch name)
__git_ps1 ()
{
	local g="$(__gitdir)"
	if [ -n "$g" ]; then
		local r=""
		local b=""
		if [ -f "$g/rebase-merge/interactive" ]; then
			r="|REBASE-i"
			b="$(cat "$g/rebase-merge/head-name")"
		elif [ -d "$g/rebase-merge" ]; then
			r="|REBASE-m"
			b="$(cat "$g/rebase-merge/head-name")"
		else
			if [ -d "$g/rebase-apply" ]; then
				if [ -f "$g/rebase-apply/rebasing" ]; then
					r="|REBASE"
				elif [ -f "$g/rebase-apply/applying" ]; then
					r="|AM"
				else
					r="|AM/REBASE"
				fi
			elif [ -f "$g/MERGE_HEAD" ]; then
				r="|MERGING"
			elif [ -f "$g/CHERRY_PICK_HEAD" ]; then
				r="|CHERRY-PICKING"
			elif [ -f "$g/BISECT_LOG" ]; then
				r="|BISECTING"
			fi

			b="$(git symbolic-ref HEAD 2>/dev/null)" || {

				b="$(
				case "${GIT_PS1_DESCRIBE_STYLE-}" in
				(contains)
					git describe --contains HEAD ;;
				(branch)
					git describe --contains --all HEAD ;;
				(describe)
					git describe HEAD ;;
				(* | default)
					git describe --tags --exact-match HEAD ;;
				esac 2>/dev/null)" ||

				b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." ||
				b="unknown"
				b="($b)"
			}
		fi

		local w=""
		local i=""
		local s=""
		local u=""
		local c=""
		local p=""

		if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
			if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
				c="BARE:"
			else
				b="GIT_DIR!"
			fi
		elif [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
			if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
				if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
					git diff --no-ext-diff --quiet --exit-code || w="*"
					if git rev-parse --quiet --verify HEAD >/dev/null; then
						git diff-index --cached --quiet HEAD -- || i="+"
					else
						i="#"
					fi
				fi
			fi
			if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
				git rev-parse --verify refs/stash >/dev/null 2>&1 && s="$"
			fi

			if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
				if [ -n "$(git ls-files --others --exclude-standard)" ]; then
					u="%"
				fi
			fi

			if [ -n "${GIT_PS1_SHOWUPSTREAM-}" ]; then
				__git_ps1_show_upstream
			fi
		fi

		local f="$w$i$s$u"
		printf -- "${1:- (%s)}" "$c${b##refs/heads/}${f:+ $f}$r$p"
	fi
}

__gitcomp_1 ()
{
	local c IFS=$' \t\n'
	for c in $1; do
		c="$c$2"
		case $c in
		--*=*|*.) ;;
		*) c="$c " ;;
		esac
		printf '%s\n' "$c"
	done
}

# The following function is based on code from:
#
#   bash_completion - programmable completion functions for bash 3.2+
#
#   Copyright © 2006-2008, Ian Macdonald <ian@caliban.org>
#             © 2009-2010, Bash Completion Maintainers
#                     <bash-completion-devel@lists.alioth.debian.org>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
#   The latest version of this software can be obtained here:
#
#   http://bash-completion.alioth.debian.org/
#
#   RELEASE: 2.x

# This function can be used to access a tokenized list of words
# on the command line:
#
#	__git_reassemble_comp_words_by_ref '=:'
#	if test "${words_[cword_-1]}" = -w
#	then
#		...
#	fi
#
# The argument should be a collection of characters from the list of
# word completion separators (COMP_WORDBREAKS) to treat as ordinary
# characters.
#
# This is roughly equivalent to going back in time and setting
# COMP_WORDBREAKS to exclude those characters.  The intent is to
# make option types like --date=<type> and <rev>:<path> easy to
# recognize by treating each shell word as a single token.
#
# It is best not to set COMP_WORDBREAKS directly because the value is
# shared with other completion scripts.  By the time the completion
# function gets called, COMP_WORDS has already been populated so local
# changes to COMP_WORDBREAKS have no effect.
#
# Output: words_, cword_, cur_.

__git_reassemble_comp_words_by_ref()
{
	local exclude i j first
	# Which word separators to exclude?
	exclude="${1//[^$COMP_WORDBREAKS]}"
	cword_=$COMP_CWORD
	if [ -z "$exclude" ]; then
		words_=("${COMP_WORDS[@]}")
		return
	fi
	# List of word completion separators has shrunk;
	# re-assemble words to complete.
	for ((i=0, j=0; i < ${#COMP_WORDS[@]}; i++, j++)); do
		# Append each nonempty word consisting of just
		# word separator characters to the current word.
		first=t
		while
			[ $i -gt 0 ] &&
			[ -n "${COMP_WORDS[$i]}" ] &&
			# word consists of excluded word separators
			[ "${COMP_WORDS[$i]//[^$exclude]}" = "${COMP_WORDS[$i]}" ]
		do
			# Attach to the previous token,
			# unless the previous token is the command name.
			if [ $j -ge 2 ] && [ -n "$first" ]; then
				((j--))
			fi
			first=
			words_[$j]=${words_[j]}${COMP_WORDS[i]}
			if [ $i = $COMP_CWORD ]; then
				cword_=$j
			fi
			if (($i < ${#COMP_WORDS[@]} - 1)); then
				((i++))
			else
				# Done.
				return
			fi
		done
		words_[$j]=${words_[j]}${COMP_WORDS[i]}
		if [ $i = $COMP_CWORD ]; then
			cword_=$j
		fi
	done
}

if ! type _get_comp_words_by_ref >/dev/null 2>&1; then
if [[ -z ${ZSH_VERSION:+set} ]]; then
_get_comp_words_by_ref ()
{
	local exclude cur_ words_ cword_
	if [ "$1" = "-n" ]; then
		exclude=$2
		shift 2
	fi
	__git_reassemble_comp_words_by_ref "$exclude"
	cur_=${words_[cword_]}
	while [ $# -gt 0 ]; do
		case "$1" in
		cur)
			cur=$cur_
			;;
		prev)
			prev=${words_[$cword_-1]}
			;;
		words)
			words=("${words_[@]}")
			;;
		cword)
			cword=$cword_
			;;
		esac
		shift
	done
}
else
_get_comp_words_by_ref ()
{
	while [ $# -gt 0 ]; do
		case "$1" in
		cur)
			cur=${COMP_WORDS[COMP_CWORD]}
			;;
		prev)
			prev=${COMP_WORDS[COMP_CWORD-1]}
			;;
		words)
			words=("${COMP_WORDS[@]}")
			;;
		cword)
			cword=$COMP_CWORD
			;;
		-n)
			# assume COMP_WORDBREAKS is already set sanely
			shift
			;;
		esac
		shift
	done
}
fi
fi

# Generates completion reply with compgen, appending a space to possible
# completion words, if necessary.
# It accepts 1 to 4 arguments:
# 1: List of possible completion words.
# 2: A prefix to be added to each possible completion word (optional).
# 3: Generate possible completion matches for this word (optional).
# 4: A suffix to be appended to each possible completion word (optional).
__gitcomp ()
{
	local cur_="${3-$cur}"

	case "$cur_" in
	--*=)
		COMPREPLY=()
		;;
	*)
		local IFS=$'\n'
		COMPREPLY=($(compgen -P "${2-}" \
			-W "$(__gitcomp_1 "${1-}" "${4-}")" \
			-- "$cur_"))
		;;
	esac
}

# Generates completion reply with compgen from newline-separated possible
# completion words by appending a space to all of them.
# It accepts 1 to 4 arguments:
# 1: List of possible completion words, separated by a single newline.
# 2: A prefix to be added to each possible completion word (optional).
# 3: Generate possible completion matches for this word (optional).
# 4: A suffix to be appended to each possible completion word instead of
#    the default space (optional).  If specified but empty, nothing is
#    appended.
__gitcomp_nl ()
{
	local IFS=$'\n'
	COMPREPLY=($(compgen -P "${2-}" -S "${4- }" -W "$1" -- "${3-$cur}"))
}

__git_heads ()
{
	local dir="$(__gitdir)"
	if [ -d "$dir" ]; then
		git --git-dir="$dir" for-each-ref --format='%(refname:short)' \
			refs/heads
		return
	fi
}

__git_tags ()
{
	local dir="$(__gitdir)"
	if [ -d "$dir" ]; then
		git --git-dir="$dir" for-each-ref --format='%(refname:short)' \
			refs/tags
		return
	fi
}

# __git_refs accepts 0, 1 (to pass to __gitdir), or 2 arguments
# presence of 2nd argument means use the guess heuristic employed
# by checkout for tracking branches
__git_refs ()
{
	local i hash dir="$(__gitdir "${1-}")" track="${2-}"
	local format refs
	if [ -d "$dir" ]; then
		case "$cur" in
		refs|refs/*)
			format="refname"
			refs="${cur%/*}"
			track=""
			;;
		*)
			for i in HEAD FETCH_HEAD ORIG_HEAD MERGE_HEAD; do
				if [ -e "$dir/$i" ]; then echo $i; fi
			done
			format="refname:short"
			refs="refs/tags refs/heads refs/remotes"
			;;
		esac
		git --git-dir="$dir" for-each-ref --format="%($format)" \
			$refs
		if [ -n "$track" ]; then
			# employ the heuristic used by git checkout
			# Try to find a remote branch that matches the completion word
			# but only output if the branch name is unique
			local ref entry
			git --git-dir="$dir" for-each-ref --shell --format="ref=%(refname:short)" \
				"refs/remotes/" | \
			while read -r entry; do
				eval "$entry"
				ref="${ref#*/}"
				if [[ "$ref" == "$cur"* ]]; then
					echo "$ref"
				fi
			done | uniq -u
		fi
		return
	fi
	case "$cur" in
	refs|refs/*)
		git ls-remote "$dir" "$cur*" 2>/dev/null | \
		while read -r hash i; do
			case "$i" in
			*^{}) ;;
			*) echo "$i" ;;
			esac
		done
		;;
	*)
		git ls-remote "$dir" HEAD ORIG_HEAD 'refs/tags/*' 'refs/heads/*' 'refs/remotes/*' 2>/dev/null | \
		while read -r hash i; do
			case "$i" in
			*^{}) ;;
			refs/*) echo "${i#refs/*/}" ;;
			*) echo "$i" ;;
			esac
		done
		;;
	esac
}

# __git_refs2 requires 1 argument (to pass to __git_refs)
__git_refs2 ()
{
	local i
	for i in $(__git_refs "$1"); do
		echo "$i:$i"
	done
}

# __git_refs_remotes requires 1 argument (to pass to ls-remote)
__git_refs_remotes ()
{
	local i hash
	git ls-remote "$1" 'refs/heads/*' 2>/dev/null | \
	while read -r hash i; do
		echo "$i:refs/remotes/$1/${i#refs/heads/}"
	done
}

__git_remotes ()
{
	local i IFS=$'\n' d="$(__gitdir)"
	test -d "$d/remotes" && ls -1 "$d/remotes"
	for i in $(git --git-dir="$d" config --get-regexp 'remote\..*\.url' 2>/dev/null); do
		i="${i#remote.}"
		echo "${i/.url*/}"
	done
}

__git_list_merge_strategies ()
{
	git merge -s help 2>&1 |
	sed -n -e '/[Aa]vailable strategies are: /,/^$/{
		s/\.$//
		s/.*://
		s/^[ 	]*//
		s/[ 	]*$//
		p
	}'
}

__git_merge_strategies=
# 'git merge -s help' (and thus detection of the merge strategy
# list) fails, unfortunately, if run outside of any git working
# tree.  __git_merge_strategies is set to the empty string in
# that case, and the detection will be repeated the next time it
# is needed.
__git_compute_merge_strategies ()
{
	test -n "$__git_merge_strategies" ||
	__git_merge_strategies=$(__git_list_merge_strategies)
}

__git_complete_revlist_file ()
{
	local pfx ls ref cur_="$cur"
	case "$cur_" in
	*..?*:*)
		return
		;;
	?*:*)
		ref="${cur_%%:*}"
		cur_="${cur_#*:}"
		case "$cur_" in
		?*/*)
			pfx="${cur_%/*}"
			cur_="${cur_##*/}"
			ls="$ref:$pfx"
			pfx="$pfx/"
			;;
		*)
			ls="$ref"
			;;
		esac

		case "$COMP_WORDBREAKS" in
		*:*) : great ;;
		*)   pfx="$ref:$pfx" ;;
		esac

		__gitcomp_nl "$(git --git-dir="$(__gitdir)" ls-tree "$ls" \
				| sed '/^100... blob /{
				           s,^.*	,,
				           s,$, ,
				       }
				       /^120000 blob /{
				           s,^.*	,,
				           s,$, ,
				       }
				       /^040000 tree /{
				           s,^.*	,,
				           s,$,/,
				       }
				       s/^.*	//')" \
			"$pfx" "$cur_" ""
		;;
	*...*)
		pfx="${cur_%...*}..."
		cur_="${cur_#*...}"
		__gitcomp_nl "$(__git_refs)" "$pfx" "$cur_"
		;;
	*..*)
		pfx="${cur_%..*}.."
		cur_="${cur_#*..}"
		__gitcomp_nl "$(__git_refs)" "$pfx" "$cur_"
		;;
	*)
		__gitcomp_nl "$(__git_refs)"
		;;
	esac
}


__git_complete_file ()
{
	__git_complete_revlist_file
}

__git_complete_revlist ()
{
	__git_complete_revlist_file
}

__git_complete_remote_or_refspec ()
{
	local cur_="$cur" cmd="${words[1]}"
	local i c=2 remote="" pfx="" lhs=1 no_complete_refspec=0
	if [ "$cmd" = "remote" ]; then
		((c++))
	fi
	while [ $c -lt $cword ]; do
		i="${words[c]}"
		case "$i" in
		--mirror) [ "$cmd" = "push" ] && no_complete_refspec=1 ;;
		--all)
			case "$cmd" in
			push) no_complete_refspec=1 ;;
			fetch)
				COMPREPLY=()
				return
				;;
			*) ;;
			esac
			;;
		-*) ;;
		*) remote="$i"; break ;;
		esac
		((c++))
	done
	if [ -z "$remote" ]; then
		__gitcomp_nl "$(__git_remotes)"
		return
	fi
	if [ $no_complete_refspec = 1 ]; then
		COMPREPLY=()
		return
	fi
	[ "$remote" = "." ] && remote=
	case "$cur_" in
	*:*)
		case "$COMP_WORDBREAKS" in
		*:*) : great ;;
		*)   pfx="${cur_%%:*}:" ;;
		esac
		cur_="${cur_#*:}"
		lhs=0
		;;
	+*)
		pfx="+"
		cur_="${cur_#+}"
		;;
	esac
	case "$cmd" in
	fetch)
		if [ $lhs = 1 ]; then
			__gitcomp_nl "$(__git_refs2 "$remote")" "$pfx" "$cur_"
		else
			__gitcomp_nl "$(__git_refs)" "$pfx" "$cur_"
		fi
		;;
	pull|remote)
		if [ $lhs = 1 ]; then
			__gitcomp_nl "$(__git_refs "$remote")" "$pfx" "$cur_"
		else
			__gitcomp_nl "$(__git_refs)" "$pfx" "$cur_"
		fi
		;;
	push)
		if [ $lhs = 1 ]; then
			__gitcomp_nl "$(__git_refs)" "$pfx" "$cur_"
		else
			__gitcomp_nl "$(__git_refs "$remote")" "$pfx" "$cur_"
		fi
		;;
	esac
}

__git_complete_strategy ()
{
	__git_compute_merge_strategies
	case "$prev" in
	-s|--strategy)
		__gitcomp "$__git_merge_strategies"
		return 0
	esac
	case "$cur" in
	--strategy=*)
		__gitcomp "$__git_merge_strategies" "" "${cur##--strategy=}"
		return 0
		;;
	esac
	return 1
}

__git_list_all_commands ()
{
	local i IFS=" "$'\n'
	for i in $(git help -a|egrep '^  [a-zA-Z0-9]')
	do
		case $i in
		*--*)             : helper pattern;;
		*) echo $i;;
		esac
	done
}

__git_all_commands=
__git_compute_all_commands ()
{
	test -n "$__git_all_commands" ||
	__git_all_commands=$(__git_list_all_commands)
}

__git_list_porcelain_commands ()
{
	local i IFS=" "$'\n'
	__git_compute_all_commands
	for i in "help" $__git_all_commands
	do
		case $i in
		*--*)             : helper pattern;;
		applymbox)        : ask gittus;;
		applypatch)       : ask gittus;;
		archimport)       : import;;
		cat-file)         : plumbing;;
		check-attr)       : plumbing;;
		check-ref-format) : plumbing;;
		checkout-index)   : plumbing;;
		commit-tree)      : plumbing;;
		count-objects)    : infrequent;;
		credential-cache) : credentials helper;;
		credential-store) : credentials helper;;
		cvsexportcommit)  : export;;
		cvsimport)        : import;;
		cvsserver)        : daemon;;
		daemon)           : daemon;;
		diff-files)       : plumbing;;
		diff-index)       : plumbing;;
		diff-tree)        : plumbing;;
		fast-import)      : import;;
		fast-export)      : export;;
		fsck-objects)     : plumbing;;
		fetch-pack)       : plumbing;;
		fmt-merge-msg)    : plumbing;;
		for-each-ref)     : plumbing;;
		hash-object)      : plumbing;;
		http-*)           : transport;;
		index-pack)       : plumbing;;
		init-db)          : deprecated;;
		local-fetch)      : plumbing;;
		lost-found)       : infrequent;;
		ls-files)         : plumbing;;
		ls-remote)        : plumbing;;
		ls-tree)          : plumbing;;
		mailinfo)         : plumbing;;
		mailsplit)        : plumbing;;
		merge-*)          : plumbing;;
		mktree)           : plumbing;;
		mktag)            : plumbing;;
		pack-objects)     : plumbing;;
		pack-redundant)   : plumbing;;
		pack-refs)        : plumbing;;
		parse-remote)     : plumbing;;
		patch-id)         : plumbing;;
		peek-remote)      : plumbing;;
		prune)            : plumbing;;
		prune-packed)     : plumbing;;
		quiltimport)      : import;;
		read-tree)        : plumbing;;
		receive-pack)     : plumbing;;
		remote-*)         : transport;;
		repo-config)      : deprecated;;
		rerere)           : plumbing;;
		rev-list)         : plumbing;;
		rev-parse)        : plumbing;;
		runstatus)        : plumbing;;
		sh-setup)         : internal;;
		shell)            : daemon;;
		show-ref)         : plumbing;;
		send-pack)        : plumbing;;
		show-index)       : plumbing;;
		ssh-*)            : transport;;
		stripspace)       : plumbing;;
		symbolic-ref)     : plumbing;;
		tar-tree)         : deprecated;;
		unpack-file)      : plumbing;;
		unpack-objects)   : plumbing;;
		update-index)     : plumbing;;
		update-ref)       : plumbing;;
		update-server-info) : daemon;;
		upload-archive)   : plumbing;;
		upload-pack)      : plumbing;;
		write-tree)       : plumbing;;
		var)              : infrequent;;
		verify-pack)      : infrequent;;
		verify-tag)       : plumbing;;
		*) echo $i;;
		esac
	done
}

__git_porcelain_commands=
__git_compute_porcelain_commands ()
{
	__git_compute_all_commands
	test -n "$__git_porcelain_commands" ||
	__git_porcelain_commands=$(__git_list_porcelain_commands)
}

__git_pretty_aliases ()
{
	local i IFS=$'\n'
	for i in $(git --git-dir="$(__gitdir)" config --get-regexp "pretty\..*" 2>/dev/null); do
		case "$i" in
		pretty.*)
			i="${i#pretty.}"
			echo "${i/ */}"
			;;
		esac
	done
}

__git_aliases ()
{
	local i IFS=$'\n'
	for i in $(git --git-dir="$(__gitdir)" config --get-regexp "alias\..*" 2>/dev/null); do
		case "$i" in
		alias.*)
			i="${i#alias.}"
			echo "${i/ */}"
			;;
		esac
	done
}

# __git_aliased_command requires 1 argument
__git_aliased_command ()
{
	local word cmdline=$(git --git-dir="$(__gitdir)" \
		config --get "alias.$1")
	for word in $cmdline; do
		case "$word" in
		\!gitk|gitk)
			echo "gitk"
			return
			;;
		\!*)	: shell command alias ;;
		-*)	: option ;;
		*=*)	: setting env ;;
		git)	: git itself ;;
		*)
			echo "$word"
			return
		esac
	done
}

# __git_find_on_cmdline requires 1 argument
__git_find_on_cmdline ()
{
	local word subcommand c=1
	while [ $c -lt $cword ]; do
		word="${words[c]}"
		for subcommand in $1; do
			if [ "$subcommand" = "$word" ]; then
				echo "$subcommand"
				return
			fi
		done
		((c++))
	done
}

__git_has_doubledash ()
{
	local c=1
	while [ $c -lt $cword ]; do
		if [ "--" = "${words[c]}" ]; then
			return 0
		fi
		((c++))
	done
	return 1
}

__git_whitespacelist="nowarn warn error error-all fix"

_git_am ()
{
	local dir="$(__gitdir)"
	if [ -d "$dir"/rebase-apply ]; then
		__gitcomp "--skip --continue --resolved --abort"
		return
	fi
	case "$cur" in
	--whitespace=*)
		__gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}"
		return
		;;
	--*)
		__gitcomp "
			--3way --committer-date-is-author-date --ignore-date
			--ignore-whitespace --ignore-space-change
			--interactive --keep --no-utf8 --signoff --utf8
			--whitespace= --scissors
			"
		return
	esac
	COMPREPLY=()
}

_git_apply ()
{
	case "$cur" in
	--whitespace=*)
		__gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}"
		return
		;;
	--*)
		__gitcomp "
			--stat --numstat --summary --check --index
			--cached --index-info --reverse --reject --unidiff-zero
			--apply --no-add --exclude=
			--ignore-whitespace --ignore-space-change
			--whitespace= --inaccurate-eof --verbose
			"
		return
	esac
	COMPREPLY=()
}

_git_add ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "
			--interactive --refresh --patch --update --dry-run
			--ignore-errors --intent-to-add
			"
		return
	esac
	COMPREPLY=()
}

_git_archive ()
{
	case "$cur" in
	--format=*)
		__gitcomp "$(git archive --list)" "" "${cur##--format=}"
		return
		;;
	--remote=*)
		__gitcomp_nl "$(__git_remotes)" "" "${cur##--remote=}"
		return
		;;
	--*)
		__gitcomp "
			--format= --list --verbose
			--prefix= --remote= --exec=
			"
		return
		;;
	esac
	__git_complete_file
}

_git_bisect ()
{
	__git_has_doubledash && return

	local subcommands="start bad good skip reset visualize replay log run"
	local subcommand="$(__git_find_on_cmdline "$subcommands")"
	if [ -z "$subcommand" ]; then
		if [ -f "$(__gitdir)"/BISECT_START ]; then
			__gitcomp "$subcommands"
		else
			__gitcomp "replay start"
		fi
		return
	fi

	case "$subcommand" in
	bad|good|reset|skip|start)
		__gitcomp_nl "$(__git_refs)"
		;;
	*)
		COMPREPLY=()
		;;
	esac
}

_git_branch ()
{
	local i c=1 only_local_ref="n" has_r="n"

	while [ $c -lt $cword ]; do
		i="${words[c]}"
		case "$i" in
		-d|-m)	only_local_ref="y" ;;
		-r)	has_r="y" ;;
		esac
		((c++))
	done

	case "$cur" in
	--*)
		__gitcomp "
			--color --no-color --verbose --abbrev= --no-abbrev
			--track --no-track --contains --merged --no-merged
			--set-upstream --edit-description --list
			"
		;;
	*)
		if [ $only_local_ref = "y" -a $has_r = "n" ]; then
			__gitcomp_nl "$(__git_heads)"
		else
			__gitcomp_nl "$(__git_refs)"
		fi
		;;
	esac
}

_git_bundle ()
{
	local cmd="${words[2]}"
	case "$cword" in
	2)
		__gitcomp "create list-heads verify unbundle"
		;;
	3)
		# looking for a file
		;;
	*)
		case "$cmd" in
			create)
				__git_complete_revlist
			;;
		esac
		;;
	esac
}

_git_checkout ()
{
	__git_has_doubledash && return

	case "$cur" in
	--conflict=*)
		__gitcomp "diff3 merge" "" "${cur##--conflict=}"
		;;
	--*)
		__gitcomp "
			--quiet --ours --theirs --track --no-track --merge
			--conflict= --orphan --patch
			"
		;;
	*)
		# check if --track, --no-track, or --no-guess was specified
		# if so, disable DWIM mode
		local flags="--track --no-track --no-guess" track=1
		if [ -n "$(__git_find_on_cmdline "$flags")" ]; then
			track=''
		fi
		__gitcomp_nl "$(__git_refs '' $track)"
		;;
	esac
}

_git_cherry ()
{
	__gitcomp "$(__git_refs)"
}

_git_cherry_pick ()
{
	case "$cur" in
	--*)
		__gitcomp "--edit --no-commit"
		;;
	*)
		__gitcomp_nl "$(__git_refs)"
		;;
	esac
}

_git_clean ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "--dry-run --quiet"
		return
		;;
	esac
	COMPREPLY=()
}

_git_clone ()
{
	case "$cur" in
	--*)
		__gitcomp "
			--local
			--no-hardlinks
			--shared
			--reference
			--quiet
			--no-checkout
			--bare
			--mirror
			--origin
			--upload-pack
			--template=
			--depth
			"
		return
		;;
	esac
	COMPREPLY=()
}

_git_commit ()
{
	__git_has_doubledash && return

	case "$cur" in
	--cleanup=*)
		__gitcomp "default strip verbatim whitespace
			" "" "${cur##--cleanup=}"
		return
		;;
	--reuse-message=*|--reedit-message=*|\
	--fixup=*|--squash=*)
		__gitcomp_nl "$(__git_refs)" "" "${cur#*=}"
		return
		;;
	--untracked-files=*)
		__gitcomp "all no normal" "" "${cur##--untracked-files=}"
		return
		;;
	--*)
		__gitcomp "
			--all --author= --signoff --verify --no-verify
			--edit --amend --include --only --interactive
			--dry-run --reuse-message= --reedit-message=
			--reset-author --file= --message= --template=
			--cleanup= --untracked-files --untracked-files=
			--verbose --quiet --fixup= --squash=
			"
		return
	esac
	COMPREPLY=()
}

_git_describe ()
{
	case "$cur" in
	--*)
		__gitcomp "
			--all --tags --contains --abbrev= --candidates=
			--exact-match --debug --long --match --always
			"
		return
	esac
	__gitcomp_nl "$(__git_refs)"
}

__git_diff_common_options="--stat --numstat --shortstat --summary
			--patch-with-stat --name-only --name-status --color
			--no-color --color-words --no-renames --check
			--full-index --binary --abbrev --diff-filter=
			--find-copies-harder
			--text --ignore-space-at-eol --ignore-space-change
			--ignore-all-space --exit-code --quiet --ext-diff
			--no-ext-diff
			--no-prefix --src-prefix= --dst-prefix=
			--inter-hunk-context=
			--patience
			--raw
			--dirstat --dirstat= --dirstat-by-file
			--dirstat-by-file= --cumulative
"

_git_diff ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "--cached --staged --pickaxe-all --pickaxe-regex
			--base --ours --theirs --no-index
			$__git_diff_common_options
			"
		return
		;;
	esac
	__git_complete_revlist_file
}

__git_mergetools_common="diffuse ecmerge emerge kdiff3 meld opendiff
			tkdiff vimdiff gvimdiff xxdiff araxis p4merge bc3
"

_git_difftool ()
{
	__git_has_doubledash && return

	case "$cur" in
	--tool=*)
		__gitcomp "$__git_mergetools_common kompare" "" "${cur##--tool=}"
		return
		;;
	--*)
		__gitcomp "--cached --staged --pickaxe-all --pickaxe-regex
			--base --ours --theirs
			--no-renames --diff-filter= --find-copies-harder
			--relative --ignore-submodules
			--tool="
		return
		;;
	esac
	__git_complete_file
}

__git_fetch_options="
	--quiet --verbose --append --upload-pack --force --keep --depth=
	--tags --no-tags --all --prune --dry-run
"

_git_fetch ()
{
	case "$cur" in
	--*)
		__gitcomp "$__git_fetch_options"
		return
		;;
	esac
	__git_complete_remote_or_refspec
}

_git_format_patch ()
{
	case "$cur" in
	--thread=*)
		__gitcomp "
			deep shallow
			" "" "${cur##--thread=}"
		return
		;;
	--*)
		__gitcomp "
			--stdout --attach --no-attach --thread --thread=
			--output-directory
			--numbered --start-number
			--numbered-files
			--keep-subject
			--signoff --signature --no-signature
			--in-reply-to= --cc=
			--full-index --binary
			--not --all
			--cover-letter
			--no-prefix --src-prefix= --dst-prefix=
			--inline --suffix= --ignore-if-in-upstream
			--subject-prefix=
			"
		return
		;;
	esac
	__git_complete_revlist
}

_git_fsck ()
{
	case "$cur" in
	--*)
		__gitcomp "
			--tags --root --unreachable --cache --no-reflogs --full
			--strict --verbose --lost-found
			"
		return
		;;
	esac
	COMPREPLY=()
}

_git_gc ()
{
	case "$cur" in
	--*)
		__gitcomp "--prune --aggressive"
		return
		;;
	esac
	COMPREPLY=()
}

_git_gitk ()
{
	_gitk
}

__git_match_ctag() {
	awk "/^${1////\\/}/ { print \$1 }" "$2"
}

_git_grep ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "
			--cached
			--text --ignore-case --word-regexp --invert-match
			--full-name --line-number
			--extended-regexp --basic-regexp --fixed-strings
			--perl-regexp
			--files-with-matches --name-only
			--files-without-match
			--max-depth
			--count
			--and --or --not --all-match
			"
		return
		;;
	esac

	case "$cword,$prev" in
	2,*|*,-*)
		if test -r tags; then
			__gitcomp_nl "$(__git_match_ctag "$cur" tags)"
			return
		fi
		;;
	esac

	__gitcomp_nl "$(__git_refs)"
}

_git_help ()
{
	case "$cur" in
	--*)
		__gitcomp "--all --info --man --web"
		return
		;;
	esac
	__git_compute_all_commands
	__gitcomp "$__git_all_commands $(__git_aliases)
		attributes cli core-tutorial cvs-migration
		diffcore gitk glossary hooks ignore modules
		namespaces repository-layout tutorial tutorial-2
		workflows
		"
}

_git_init ()
{
	case "$cur" in
	--shared=*)
		__gitcomp "
			false true umask group all world everybody
			" "" "${cur##--shared=}"
		return
		;;
	--*)
		__gitcomp "--quiet --bare --template= --shared --shared="
		return
		;;
	esac
	COMPREPLY=()
}

_git_ls_files ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "--cached --deleted --modified --others --ignored
			--stage --directory --no-empty-directory --unmerged
			--killed --exclude= --exclude-from=
			--exclude-per-directory= --exclude-standard
			--error-unmatch --with-tree= --full-name
			--abbrev --ignored --exclude-per-directory
			"
		return
		;;
	esac
	COMPREPLY=()
}

_git_ls_remote ()
{
	__gitcomp_nl "$(__git_remotes)"
}

_git_ls_tree ()
{
	__git_complete_file
}

# Options that go well for log, shortlog and gitk
__git_log_common_options="
	--not --all
	--branches --tags --remotes
	--first-parent --merges --no-merges
	--max-count=
	--max-age= --since= --after=
	--min-age= --until= --before=
	--min-parents= --max-parents=
	--no-min-parents --no-max-parents
"
# Options that go well for log and gitk (not shortlog)
__git_log_gitk_options="
	--dense --sparse --full-history
	--simplify-merges --simplify-by-decoration
	--left-right --notes --no-notes
"
# Options that go well for log and shortlog (not gitk)
__git_log_shortlog_options="
	--author= --committer= --grep=
	--all-match
"

__git_log_pretty_formats="oneline short medium full fuller email raw format:"
__git_log_date_formats="relative iso8601 rfc2822 short local default raw"

_git_log ()
{
	__git_has_doubledash && return

	local g="$(git rev-parse --git-dir 2>/dev/null)"
	local merge=""
	if [ -f "$g/MERGE_HEAD" ]; then
		merge="--merge"
	fi
	case "$cur" in
	--pretty=*|--format=*)
		__gitcomp "$__git_log_pretty_formats $(__git_pretty_aliases)
			" "" "${cur#*=}"
		return
		;;
	--date=*)
		__gitcomp "$__git_log_date_formats" "" "${cur##--date=}"
		return
		;;
	--decorate=*)
		__gitcomp "long short" "" "${cur##--decorate=}"
		return
		;;
	--*)
		__gitcomp "
			$__git_log_common_options
			$__git_log_shortlog_options
			$__git_log_gitk_options
			--root --topo-order --date-order --reverse
			--follow --full-diff
			--abbrev-commit --abbrev=
			--relative-date --date=
			--pretty= --format= --oneline
			--cherry-pick
			--graph
			--decorate --decorate=
			--walk-reflogs
			--parents --children
			$merge
			$__git_diff_common_options
			--pickaxe-all --pickaxe-regex
			"
		return
		;;
	esac
	__git_complete_revlist
}

__git_merge_options="
	--no-commit --no-stat --log --no-log --squash --strategy
	--commit --stat --no-squash --ff --no-ff --ff-only --edit --no-edit
"

_git_merge ()
{
	__git_complete_strategy && return

	case "$cur" in
	--*)
		__gitcomp "$__git_merge_options"
		return
	esac
	__gitcomp_nl "$(__git_refs)"
}

_git_mergetool ()
{
	case "$cur" in
	--tool=*)
		__gitcomp "$__git_mergetools_common tortoisemerge" "" "${cur##--tool=}"
		return
		;;
	--*)
		__gitcomp "--tool="
		return
		;;
	esac
	COMPREPLY=()
}

_git_merge_base ()
{
	__gitcomp_nl "$(__git_refs)"
}

_git_mv ()
{
	case "$cur" in
	--*)
		__gitcomp "--dry-run"
		return
		;;
	esac
	COMPREPLY=()
}

_git_name_rev ()
{
	__gitcomp "--tags --all --stdin"
}

_git_notes ()
{
	local subcommands='add append copy edit list prune remove show'
	local subcommand="$(__git_find_on_cmdline "$subcommands")"

	case "$subcommand,$cur" in
	,--*)
		__gitcomp '--ref'
		;;
	,*)
		case "$prev" in
		--ref)
			__gitcomp_nl "$(__git_refs)"
			;;
		*)
			__gitcomp "$subcommands --ref"
			;;
		esac
		;;
	add,--reuse-message=*|append,--reuse-message=*|\
	add,--reedit-message=*|append,--reedit-message=*)
		__gitcomp_nl "$(__git_refs)" "" "${cur#*=}"
		;;
	add,--*|append,--*)
		__gitcomp '--file= --message= --reedit-message=
				--reuse-message='
		;;
	copy,--*)
		__gitcomp '--stdin'
		;;
	prune,--*)
		__gitcomp '--dry-run --verbose'
		;;
	prune,*)
		;;
	*)
		case "$prev" in
		-m|-F)
			;;
		*)
			__gitcomp_nl "$(__git_refs)"
			;;
		esac
		;;
	esac
}

_git_pull ()
{
	__git_complete_strategy && return

	case "$cur" in
	--*)
		__gitcomp "
			--rebase --no-rebase
			$__git_merge_options
			$__git_fetch_options
		"
		return
		;;
	esac
	__git_complete_remote_or_refspec
}

_git_push ()
{
	case "$prev" in
	--repo)
		__gitcomp_nl "$(__git_remotes)"
		return
	esac
	case "$cur" in
	--repo=*)
		__gitcomp_nl "$(__git_remotes)" "" "${cur##--repo=}"
		return
		;;
	--*)
		__gitcomp "
			--all --mirror --tags --dry-run --force --verbose
			--receive-pack= --repo= --set-upstream
		"
		return
		;;
	esac
	__git_complete_remote_or_refspec
}

_git_rebase ()
{
	local dir="$(__gitdir)"
	if [ -d "$dir"/rebase-apply ] || [ -d "$dir"/rebase-merge ]; then
		__gitcomp "--continue --skip --abort"
		return
	fi
	__git_complete_strategy && return
	case "$cur" in
	--whitespace=*)
		__gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}"
		return
		;;
	--*)
		__gitcomp "
			--onto --merge --strategy --interactive
			--preserve-merges --stat --no-stat
			--committer-date-is-author-date --ignore-date
			--ignore-whitespace --whitespace=
			--autosquash
			"

		return
	esac
	__gitcomp_nl "$(__git_refs)"
}

_git_reflog ()
{
	local subcommands="show delete expire"
	local subcommand="$(__git_find_on_cmdline "$subcommands")"

	if [ -z "$subcommand" ]; then
		__gitcomp "$subcommands"
	else
		__gitcomp_nl "$(__git_refs)"
	fi
}

__git_send_email_confirm_options="always never auto cc compose"
__git_send_email_suppresscc_options="author self cc bodycc sob cccmd body all"

_git_send_email ()
{
	case "$cur" in
	--confirm=*)
		__gitcomp "
			$__git_send_email_confirm_options
			" "" "${cur##--confirm=}"
		return
		;;
	--suppress-cc=*)
		__gitcomp "
			$__git_send_email_suppresscc_options
			" "" "${cur##--suppress-cc=}"

		return
		;;
	--smtp-encryption=*)
		__gitcomp "ssl tls" "" "${cur##--smtp-encryption=}"
		return
		;;
	--*)
		__gitcomp "--annotate --bcc --cc --cc-cmd --chain-reply-to
			--compose --confirm= --dry-run --envelope-sender
			--from --identity
			--in-reply-to --no-chain-reply-to --no-signed-off-by-cc
			--no-suppress-from --no-thread --quiet
			--signed-off-by-cc --smtp-pass --smtp-server
			--smtp-server-port --smtp-encryption= --smtp-user
			--subject --suppress-cc= --suppress-from --thread --to
			--validate --no-validate"
		return
		;;
	esac
	COMPREPLY=()
}

_git_stage ()
{
	_git_add
}

__git_config_get_set_variables ()
{
	local prevword word config_file= c=$cword
	while [ $c -gt 1 ]; do
		word="${words[c]}"
		case "$word" in
		--global|--system|--file=*)
			config_file="$word"
			break
			;;
		-f|--file)
			config_file="$word $prevword"
			break
			;;
		esac
		prevword=$word
		c=$((--c))
	done

	git --git-dir="$(__gitdir)" config $config_file --list 2>/dev/null |
	while read -r line
	do
		case "$line" in
		*.*=*)
			echo "${line/=*/}"
			;;
		esac
	done
}

_git_config ()
{
	case "$prev" in
	branch.*.remote)
		__gitcomp_nl "$(__git_remotes)"
		return
		;;
	branch.*.merge)
		__gitcomp_nl "$(__git_refs)"
		return
		;;
	remote.*.fetch)
		local remote="${prev#remote.}"
		remote="${remote%.fetch}"
		if [ -z "$cur" ]; then
			COMPREPLY=("refs/heads/")
			return
		fi
		__gitcomp_nl "$(__git_refs_remotes "$remote")"
		return
		;;
	remote.*.push)
		local remote="${prev#remote.}"
		remote="${remote%.push}"
		__gitcomp_nl "$(git --git-dir="$(__gitdir)" \
			for-each-ref --format='%(refname):%(refname)' \
			refs/heads)"
		return
		;;
	pull.twohead|pull.octopus)
		__git_compute_merge_strategies
		__gitcomp "$__git_merge_strategies"
		return
		;;
	color.branch|color.diff|color.interactive|\
	color.showbranch|color.status|color.ui)
		__gitcomp "always never auto"
		return
		;;
	color.pager)
		__gitcomp "false true"
		return
		;;
	color.*.*)
		__gitcomp "
			normal black red green yellow blue magenta cyan white
			bold dim ul blink reverse
			"
		return
		;;
	help.format)
		__gitcomp "man info web html"
		return
		;;
	log.date)
		__gitcomp "$__git_log_date_formats"
		return
		;;
	sendemail.aliasesfiletype)
		__gitcomp "mutt mailrc pine elm gnus"
		return
		;;
	sendemail.confirm)
		__gitcomp "$__git_send_email_confirm_options"
		return
		;;
	sendemail.suppresscc)
		__gitcomp "$__git_send_email_suppresscc_options"
		return
		;;
	--get|--get-all|--unset|--unset-all)
		__gitcomp_nl "$(__git_config_get_set_variables)"
		return
		;;
	*.*)
		COMPREPLY=()
		return
		;;
	esac
	case "$cur" in
	--*)
		__gitcomp "
			--global --system --file=
			--list --replace-all
			--get --get-all --get-regexp
			--add --unset --unset-all
			--remove-section --rename-section
			"
		return
		;;
	branch.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "remote merge mergeoptions rebase" "$pfx" "$cur_"
		return
		;;
	branch.*)
		local pfx="${cur%.*}." cur_="${cur#*.}"
		__gitcomp_nl "$(__git_heads)" "$pfx" "$cur_" "."
		return
		;;
	guitool.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "
			argprompt cmd confirm needsfile noconsole norescan
			prompt revprompt revunmerged title
			" "$pfx" "$cur_"
		return
		;;
	difftool.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "cmd path" "$pfx" "$cur_"
		return
		;;
	man.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "cmd path" "$pfx" "$cur_"
		return
		;;
	mergetool.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "cmd path trustExitCode" "$pfx" "$cur_"
		return
		;;
	pager.*)
		local pfx="${cur%.*}." cur_="${cur#*.}"
		__git_compute_all_commands
		__gitcomp_nl "$__git_all_commands" "$pfx" "$cur_"
		return
		;;
	remote.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "
			url proxy fetch push mirror skipDefaultUpdate
			receivepack uploadpack tagopt pushurl
			" "$pfx" "$cur_"
		return
		;;
	remote.*)
		local pfx="${cur%.*}." cur_="${cur#*.}"
		__gitcomp_nl "$(__git_remotes)" "$pfx" "$cur_" "."
		return
		;;
	url.*.*)
		local pfx="${cur%.*}." cur_="${cur##*.}"
		__gitcomp "insteadOf pushInsteadOf" "$pfx" "$cur_"
		return
		;;
	esac
	__gitcomp "
		add.ignoreErrors
		advice.commitBeforeMerge
		advice.detachedHead
		advice.implicitIdentity
		advice.pushNonFastForward
		advice.resolveConflict
		advice.statusHints
		alias.
		am.keepcr
		apply.ignorewhitespace
		apply.whitespace
		branch.autosetupmerge
		branch.autosetuprebase
		browser.
		clean.requireForce
		color.branch
		color.branch.current
		color.branch.local
		color.branch.plain
		color.branch.remote
		color.decorate.HEAD
		color.decorate.branch
		color.decorate.remoteBranch
		color.decorate.stash
		color.decorate.tag
		color.diff
		color.diff.commit
		color.diff.frag
		color.diff.func
		color.diff.meta
		color.diff.new
		color.diff.old
		color.diff.plain
		color.diff.whitespace
		color.grep
		color.grep.context
		color.grep.filename
		color.grep.function
		color.grep.linenumber
		color.grep.match
		color.grep.selected
		color.grep.separator
		color.interactive
		color.interactive.error
		color.interactive.header
		color.interactive.help
		color.interactive.prompt
		color.pager
		color.showbranch
		color.status
		color.status.added
		color.status.changed
		color.status.header
		color.status.nobranch
		color.status.untracked
		color.status.updated
		color.ui
		commit.status
		commit.template
		core.abbrev
		core.askpass
		core.attributesfile
		core.autocrlf
		core.bare
		core.bigFileThreshold
		core.compression
		core.createObject
		core.deltaBaseCacheLimit
		core.editor
		core.eol
		core.excludesfile
		core.fileMode
		core.fsyncobjectfiles
		core.gitProxy
		core.ignoreCygwinFSTricks
		core.ignoreStat
		core.ignorecase
		core.logAllRefUpdates
		core.loosecompression
		core.notesRef
		core.packedGitLimit
		core.packedGitWindowSize
		core.pager
		core.preferSymlinkRefs
		core.preloadindex
		core.quotepath
		core.repositoryFormatVersion
		core.safecrlf
		core.sharedRepository
		core.sparseCheckout
		core.symlinks
		core.trustctime
		core.warnAmbiguousRefs
		core.whitespace
		core.worktree
		diff.autorefreshindex
		diff.statGraphWidth
		diff.external
		diff.ignoreSubmodules
		diff.mnemonicprefix
		diff.noprefix
		diff.renameLimit
		diff.renames
		diff.suppressBlankEmpty
		diff.tool
		diff.wordRegex
		difftool.
		difftool.prompt
		fetch.recurseSubmodules
		fetch.unpackLimit
		format.attach
		format.cc
		format.headers
		format.numbered
		format.pretty
		format.signature
		format.signoff
		format.subjectprefix
		format.suffix
		format.thread
		format.to
		gc.
		gc.aggressiveWindow
		gc.auto
		gc.autopacklimit
		gc.packrefs
		gc.pruneexpire
		gc.reflogexpire
		gc.reflogexpireunreachable
		gc.rerereresolved
		gc.rerereunresolved
		gitcvs.allbinary
		gitcvs.commitmsgannotation
		gitcvs.dbTableNamePrefix
		gitcvs.dbdriver
		gitcvs.dbname
		gitcvs.dbpass
		gitcvs.dbuser
		gitcvs.enabled
		gitcvs.logfile
		gitcvs.usecrlfattr
		guitool.
		gui.blamehistoryctx
		gui.commitmsgwidth
		gui.copyblamethreshold
		gui.diffcontext
		gui.encoding
		gui.fastcopyblame
		gui.matchtrackingbranch
		gui.newbranchtemplate
		gui.pruneduringfetch
		gui.spellingdictionary
		gui.trustmtime
		help.autocorrect
		help.browser
		help.format
		http.lowSpeedLimit
		http.lowSpeedTime
		http.maxRequests
		http.minSessions
		http.noEPSV
		http.postBuffer
		http.proxy
		http.sslCAInfo
		http.sslCAPath
		http.sslCert
		http.sslCertPasswordProtected
		http.sslKey
		http.sslVerify
		http.useragent
		i18n.commitEncoding
		i18n.logOutputEncoding
		imap.authMethod
		imap.folder
		imap.host
		imap.pass
		imap.port
		imap.preformattedHTML
		imap.sslverify
		imap.tunnel
		imap.user
		init.templatedir
		instaweb.browser
		instaweb.httpd
		instaweb.local
		instaweb.modulepath
		instaweb.port
		interactive.singlekey
		log.date
		log.decorate
		log.showroot
		mailmap.file
		man.
		man.viewer
		merge.
		merge.conflictstyle
		merge.log
		merge.renameLimit
		merge.renormalize
		merge.stat
		merge.tool
		merge.verbosity
		mergetool.
		mergetool.keepBackup
		mergetool.keepTemporaries
		mergetool.prompt
		notes.displayRef
		notes.rewrite.
		notes.rewrite.amend
		notes.rewrite.rebase
		notes.rewriteMode
		notes.rewriteRef
		pack.compression
		pack.deltaCacheLimit
		pack.deltaCacheSize
		pack.depth
		pack.indexVersion
		pack.packSizeLimit
		pack.threads
		pack.window
		pack.windowMemory
		pager.
		pretty.
		pull.octopus
		pull.twohead
		push.default
		rebase.autosquash
		rebase.stat
		receive.autogc
		receive.denyCurrentBranch
		receive.denyDeleteCurrent
		receive.denyDeletes
		receive.denyNonFastForwards
		receive.fsckObjects
		receive.unpackLimit
		receive.updateserverinfo
		remotes.
		repack.usedeltabaseoffset
		rerere.autoupdate
		rerere.enabled
		sendemail.
		sendemail.aliasesfile
		sendemail.aliasfiletype
		sendemail.bcc
		sendemail.cc
		sendemail.cccmd
		sendemail.chainreplyto
		sendemail.confirm
		sendemail.envelopesender
		sendemail.from
		sendemail.identity
		sendemail.multiedit
		sendemail.signedoffbycc
		sendemail.smtpdomain
		sendemail.smtpencryption
		sendemail.smtppass
		sendemail.smtpserver
		sendemail.smtpserveroption
		sendemail.smtpserverport
		sendemail.smtpuser
		sendemail.suppresscc
		sendemail.suppressfrom
		sendemail.thread
		sendemail.to
		sendemail.validate
		showbranch.default
		status.relativePaths
		status.showUntrackedFiles
		status.submodulesummary
		submodule.
		tar.umask
		transfer.unpackLimit
		url.
		user.email
		user.name
		user.signingkey
		web.browser
		branch. remote.
	"
}

_git_remote ()
{
	local subcommands="add rename rm set-head set-branches set-url show prune update"
	local subcommand="$(__git_find_on_cmdline "$subcommands")"
	if [ -z "$subcommand" ]; then
		__gitcomp "$subcommands"
		return
	fi

	case "$subcommand" in
	rename|rm|set-url|show|prune)
		__gitcomp_nl "$(__git_remotes)"
		;;
	set-head|set-branches)
		__git_complete_remote_or_refspec
		;;
	update)
		local i c='' IFS=$'\n'
		for i in $(git --git-dir="$(__gitdir)" config --get-regexp "remotes\..*" 2>/dev/null); do
			i="${i#remotes.}"
			c="$c ${i/ */}"
		done
		__gitcomp "$c"
		;;
	*)
		COMPREPLY=()
		;;
	esac
}

_git_replace ()
{
	__gitcomp_nl "$(__git_refs)"
}

_git_reset ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "--merge --mixed --hard --soft --patch"
		return
		;;
	esac
	__gitcomp_nl "$(__git_refs)"
}

_git_revert ()
{
	case "$cur" in
	--*)
		__gitcomp "--edit --mainline --no-edit --no-commit --signoff"
		return
		;;
	esac
	__gitcomp_nl "$(__git_refs)"
}

_git_rm ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "--cached --dry-run --ignore-unmatch --quiet"
		return
		;;
	esac
	COMPREPLY=()
}

_git_shortlog ()
{
	__git_has_doubledash && return

	case "$cur" in
	--*)
		__gitcomp "
			$__git_log_common_options
			$__git_log_shortlog_options
			--numbered --summary
			"
		return
		;;
	esac
	__git_complete_revlist
}

_git_show ()
{
	__git_has_doubledash && return

	case "$cur" in
	--pretty=*|--format=*)
		__gitcomp "$__git_log_pretty_formats $(__git_pretty_aliases)
			" "" "${cur#*=}"
		return
		;;
	--*)
		__gitcomp "--pretty= --format= --abbrev-commit --oneline
			$__git_diff_common_options
			"
		return
		;;
	esac
	__git_complete_file
}

_git_show_branch ()
{
	case "$cur" in
	--*)
		__gitcomp "
			--all --remotes --topo-order --current --more=
			--list --independent --merge-base --no-name
			--color --no-color
			--sha1-name --sparse --topics --reflog
			"
		return
		;;
	esac
	__git_complete_revlist
}

_git_stash ()
{
	local save_opts='--keep-index --no-keep-index --quiet --patch'
	local subcommands='save list show apply clear drop pop create branch'
	local subcommand="$(__git_find_on_cmdline "$subcommands")"
	if [ -z "$subcommand" ]; then
		case "$cur" in
		--*)
			__gitcomp "$save_opts"
			;;
		*)
			if [ -z "$(__git_find_on_cmdline "$save_opts")" ]; then
				__gitcomp "$subcommands"
			else
				COMPREPLY=()
			fi
			;;
		esac
	else
		case "$subcommand,$cur" in
		save,--*)
			__gitcomp "$save_opts"
			;;
		apply,--*|pop,--*)
			__gitcomp "--index --quiet"
			;;
		show,--*|drop,--*|branch,--*)
			COMPREPLY=()
			;;
		show,*|apply,*|drop,*|pop,*|branch,*)
			__gitcomp_nl "$(git --git-dir="$(__gitdir)" stash list \
					| sed -n -e 's/:.*//p')"
			;;
		*)
			COMPREPLY=()
			;;
		esac
	fi
}

_git_submodule ()
{
	__git_has_doubledash && return

	local subcommands="add status init update summary foreach sync"
	if [ -z "$(__git_find_on_cmdline "$subcommands")" ]; then
		case "$cur" in
		--*)
			__gitcomp "--quiet --cached"
			;;
		*)
			__gitcomp "$subcommands"
			;;
		esac
		return
	fi
}

_git_svn ()
{
	local subcommands="
		init fetch clone rebase dcommit log find-rev
		set-tree commit-diff info create-ignore propget
		proplist show-ignore show-externals branch tag blame
		migrate mkdirs reset gc
		"
	local subcommand="$(__git_find_on_cmdline "$subcommands")"
	if [ -z "$subcommand" ]; then
		__gitcomp "$subcommands"
	else
		local remote_opts="--username= --config-dir= --no-auth-cache"
		local fc_opts="
			--follow-parent --authors-file= --repack=
			--no-metadata --use-svm-props --use-svnsync-props
			--log-window-size= --no-checkout --quiet
			--repack-flags --use-log-author --localtime
			--ignore-paths= $remote_opts
			"
		local init_opts="
			--template= --shared= --trunk= --tags=
			--branches= --stdlayout --minimize-url
			--no-metadata --use-svm-props --use-svnsync-props
			--rewrite-root= --prefix= --use-log-author
			--add-author-from $remote_opts
			"
		local cmt_opts="
			--edit --rmdir --find-copies-harder --copy-similarity=
			"

		case "$subcommand,$cur" in
		fetch,--*)
			__gitcomp "--revision= --fetch-all $fc_opts"
			;;
		clone,--*)
			__gitcomp "--revision= $fc_opts $init_opts"
			;;
		init,--*)
			__gitcomp "$init_opts"
			;;
		dcommit,--*)
			__gitcomp "
				--merge --strategy= --verbose --dry-run
				--fetch-all --no-rebase --commit-url
				--revision --interactive $cmt_opts $fc_opts
				"
			;;
		set-tree,--*)
			__gitcomp "--stdin $cmt_opts $fc_opts"
			;;
		create-ignore,--*|propget,--*|proplist,--*|show-ignore,--*|\
		show-externals,--*|mkdirs,--*)
			__gitcomp "--revision="
			;;
		log,--*)
			__gitcomp "
				--limit= --revision= --verbose --incremental
				--oneline --show-commit --non-recursive
				--authors-file= --color
				"
			;;
		rebase,--*)
			__gitcomp "
				--merge --verbose --strategy= --local
				--fetch-all --dry-run $fc_opts
				"
			;;
		commit-diff,--*)
			__gitcomp "--message= --file= --revision= $cmt_opts"
			;;
		info,--*)
			__gitcomp "--url"
			;;
		branch,--*)
			__gitcomp "--dry-run --message --tag"
			;;
		tag,--*)
			__gitcomp "--dry-run --message"
			;;
		blame,--*)
			__gitcomp "--git-format"
			;;
		migrate,--*)
			__gitcomp "
				--config-dir= --ignore-paths= --minimize
				--no-auth-cache --username=
				"
			;;
		reset,--*)
			__gitcomp "--revision= --parent"
			;;
		*)
			COMPREPLY=()
			;;
		esac
	fi
}

_git_tag ()
{
	local i c=1 f=0
	while [ $c -lt $cword ]; do
		i="${words[c]}"
		case "$i" in
		-d|-v)
			__gitcomp_nl "$(__git_tags)"
			return
			;;
		-f)
			f=1
			;;
		esac
		((c++))
	done

	case "$prev" in
	-m|-F)
		COMPREPLY=()
		;;
	-*|tag)
		if [ $f = 1 ]; then
			__gitcomp_nl "$(__git_tags)"
		else
			COMPREPLY=()
		fi
		;;
	*)
		__gitcomp_nl "$(__git_refs)"
		;;
	esac
}

_git_whatchanged ()
{
	_git_log
}

__git_main ()
{
	local i c=1 command __git_dir

	while [ $c -lt $cword ]; do
		i="${words[c]}"
		case "$i" in
		--git-dir=*) __git_dir="${i#--git-dir=}" ;;
		--bare)      __git_dir="." ;;
		--help) command="help"; break ;;
		-c) c=$((++c)) ;;
		-*) ;;
		*) command="$i"; break ;;
		esac
		((c++))
	done

	if [ -z "$command" ]; then
		case "$cur" in
		--*)   __gitcomp "
			--paginate
			--no-pager
			--git-dir=
			--bare
			--version
			--exec-path
			--exec-path=
			--html-path
			--info-path
			--work-tree=
			--namespace=
			--no-replace-objects
			--help
			"
			;;
		*)     __git_compute_porcelain_commands
		       __gitcomp "$__git_porcelain_commands $(__git_aliases)" ;;
		esac
		return
	fi

	local completion_func="_git_${command//-/_}"
	declare -f $completion_func >/dev/null && $completion_func && return

	local expansion=$(__git_aliased_command "$command")
	if [ -n "$expansion" ]; then
		completion_func="_git_${expansion//-/_}"
		declare -f $completion_func >/dev/null && $completion_func
	fi
}

__gitk_main ()
{
	__git_has_doubledash && return

	local g="$(__gitdir)"
	local merge=""
	if [ -f "$g/MERGE_HEAD" ]; then
		merge="--merge"
	fi
	case "$cur" in
	--*)
		__gitcomp "
			$__git_log_common_options
			$__git_log_gitk_options
			$merge
			"
		return
		;;
	esac
	__git_complete_revlist
}

__git_func_wrap ()
{
	if [[ -n ${ZSH_VERSION-} ]]; then
		emulate -L bash
		setopt KSH_TYPESET

		# workaround zsh's bug that leaves 'words' as a special
		# variable in versions < 4.3.12
		typeset -h words

		# workaround zsh's bug that quotes spaces in the COMPREPLY
		# array if IFS doesn't contain spaces.
		typeset -h IFS
	fi
	local cur words cword prev
	_get_comp_words_by_ref -n =: cur words cword prev
	$1
}

# Setup completion for certain functions defined above by setting common
# variables and workarounds.
# This is NOT a public function; use at your own risk.
__git_complete ()
{
	local wrapper="__git_wrap${2}"
	eval "$wrapper () { __git_func_wrap $2 ; }"
	complete -o bashdefault -o default -o nospace -F $wrapper $1 2>/dev/null \
		|| complete -o default -o nospace -F $wrapper $1
}

# wrapper for backwards compatibility
_git ()
{
	__git_wrap__git_main
}

# wrapper for backwards compatibility
_gitk ()
{
	__git_wrap__gitk_main
}

__git_complete git __git_main
__git_complete gitk __gitk_main

# The following are necessary only for Cygwin, and only are needed
# when the user has tab-completed the executable name and consequently
# included the '.exe' suffix.
#
if [ Cygwin = "$(uname -o 2>/dev/null)" ]; then
__git_complete git.exe __git_main
fi
# test end


#ssh_agent start
# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env
#ssh_agent end
