function k --wraps kubectl ;
    if set --query $KUBECTL_NAMESPACE;
        kubectl $argv
    else
        kubectl --namespace=$KUBECTL_NAMESPACE $argv
    end
end
