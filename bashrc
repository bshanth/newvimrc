set -o vi
alias source="source ~/.bashrc"
alias brc="vi ~/.bashrc"
alias vrc="vi ~/.vimrc"
alias dm="date | sed 's/ /_/g' | xargs -n1 mkdir"
alias tmux="sudo tmux -u"
alias tree=tree
#export LESS="-M -I"
#export LS_COLORS='no=00:fi=00:di=00;40:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

function tree() 
{
    find $1 -print | sort | sed 's;[^/]*/;|___;g;s;___|; |;g'
}

export CSCOPE_EDITOR="vim"
export SHELL="/bin/bash"
export EDITOR=vi


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
bind -m vi-insert  '",u":""'

alias gd=gd

function gd() {
    echo -n "\$GTAGSROOT :"
    echo $GTAGSROOT
    echo -n "\$GTAGSDBPATH: "
    echo $GTAGSDBPATH
    echo -n "\$GTAGSLIBPATH: "
    echo $GTAGSLIBPATH
}
export TERM="xterm-256color"

#tmux related stuff
alias tconf="vi ~/.tmux.conf"


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
    tmux bind-key m send-keys "prashant@147.128.148.144:~/"
    tmux bind-key , send-keys "prashant@155.53.13.233:~/"
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

#alias slm="bin;cp lm ~/; echo 'rm -f /usr/siara/bin/lm;scp prashant@$sjip:~/lm /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias lmb="dbld;echo 'Building lm for $BLDPRODUCT';emq lm PRODUCT=$BLDPRODUCT;slm"
#
#alias sldp="bin;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp prashant@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias sldp62="bin62;cp ldpd ~/; echo 'rm -f /usr/siara/bin/ldpd;scp prashant@$sjip:~/ldpd /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias ldpb="bin; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT;sldp"
#alias ldp62="bin62; rm -f ldpd;dbld;echo 'Building ldp for $BLDPRODUCT';emq ldpd PRODUCT=$BLDPRODUCT PLATFORM=xc ARCH=sb1-mips;sldp62"
#
#alias sexec_cli="bin;cp exec_cli ~/; echo 'rm -f /usr/siara/bin/exec_cli;scp prashant@$sjip:~/exec_cli /usr/siara/bin' > ~/tip.tmp.2; screen -X readbuf ~/tip.tmp.2"
#alias clib="bin; rm -f exec_cli;dbld;echo 'Building ldp for $BLDPRODUCT';emq exec_cli PRODUCT=$BLDPRODUCT;sexec_cli"

alias vtip="vi ~/.tip.c"
alias rfc="cd /home/prashant/rfc"

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

