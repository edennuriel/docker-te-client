repo_client_setup() {
  export host=${1:-repo-demo.dev.anaconda.com}
  export short=${host%%.*}
  conda create -n te -c ae-dev -c conda-forge -y conda-repo-cli jq yq git
  conda init
  eval "$(conda  shell.bash hook 2>/dev/null)"
  conda activate te

  conda repo config --set sites.${short}.url http://${host}/api
  conda repo config --set default_site $short

  # configure conda client
  conda config --set channel_alias http://$host/api/repo 
}

repo_client_setup repo-demo.dev.anaconda.com
