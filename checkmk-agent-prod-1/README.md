#  USE https://github.com/donimax/unraid-check-mk-agent

#Command to run 

docker run -it --rm -v $(pwd)/:/build vbatts/slackware:15.0 sh /build/source/compile_docker.sh

Docker local build

The Checkmk agent file can be downloaded manually into the "check_mk_agent" directory, or downloaded by the container by setting the environment variable -e "CHECK_MK_URL=https://<check_mk_host>/<check_mk_site>/check_mk/agents/check-mk-agent_<check_mk_version>_all.deb".
Replace <check_mk_host> with your Checkmk server url and <check_mk_site> with your Checkmk site name. Example: http://localhost:5000/main/


Checkmk docker and smart plugin

Requirements:

    Python 3 for UNRAID plugin
    User Scripts plugin
    Checkmk server

Create a script scheduled to run "At Startup of Array" to automatically install Checkmk, Docker and Smart plugin.
Replace <check_mk_host> with your Checkmk server url and <check_mk_site> with your Checkmk site name.