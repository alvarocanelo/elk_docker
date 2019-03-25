
# docker images
es_cont_img='elk_docker/elasticsearch:latest'
kb_cont_img='elk_docker/kibana:latest'
ls_cont_img='elk_docker/logstash:latest'

# container names
es_cont_name='elk_docker_elasticsearch'
kb_cont_name='elk_docker_kibana'
ls_cont_name='elk_docker_logstash'

start(){
  # Launch ES node
  echo "Launching ES container '$es_cont_name'..."
  docker run \
    --env "discovery.type=single-node" \
    --name "$es_cont_name" \
    --publish 9200:9200 \
    --publish 9300:9300 \
  "$es_cont_img"
}
case "$1" in
 start)
     start
     ;;
  
 stop)
     stop
     ;;
  
 *)
     echo $"Usage: $0 {start|stop|restart|condrestart|status}"
     exit 1
 
esac
