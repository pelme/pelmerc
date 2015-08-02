function hssh
    set ssh_target $argv[1]

    set mac_address (networksetup -listallhardwareports|grep Ethernet|grep -v 'N/A'|sort|sed -E 's/Ethernet Address|:| //g'|head -n1)

    set HSSH_REMOTE_DIR .hssh-$USER-$mac_address

    ssh $ssh_target "mkdir -p $HSSH_REMOTE_DIR"
    rsync -avzL $HOME/.vimrc $ssh_target:$HSSH_REMOTE_DIR/

    ssh -t $ssh_target "HSSH=$HSSH_REMOTE_DIR VIMRC=$HSSH_REMOTE_DIR/.vimrc /bin/bash"
end
