# below is proxy bullshit, creds only live in the air, not in any repo, maybe
# on a post-it on the laptop lid, stick all creds in ~/.proxy.conf, if the file
# exist load it here

PROXY_CONF=${HOME}/.proxy.conf

proxy-on() {
    # load proxy config
    if [ -e "${PROXY_CONF}" ]
    then
      source ${PROXY_CONF}
      export https_proxy=${PROXY}
      export HTTPS_PROXY=${PROXY}

      export http_proxy=${PROXY}
      export HTTP_PROXY=${PROXY}

      export no_proxy=${NO_PROXY}
      export NO_PROXY=${NO_PROXY}
    else
      echo '${PROXY_CONF}' does not exist.
    fi

}

if [[ $(hostname) == "devarch" ]]
then
	echo "Proxy is configured"
	proxy-on
fi

proxy-off() {
    unset https_proxy
    unset http_proxy
    unset no_proxy
}


case "${MACHINE_LOCATION}" in
  WORK) proxy-on ;;
  *) ;;
esac
