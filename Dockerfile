
FROM mykro/java8-jre:latest
LABEL Name=powerapi Version=0.0.1
RUN apt-get update  
ADD . . 
#ENTRYPOINT ["./analyse.sh"]
ENTRYPOINT ["./analyse.sh"]
CMD ["sleep", "5"]