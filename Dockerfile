# Start with a base image containing Java runtime
FROM openjdk:8u141-jre

ENV JVM_OPTS="-Xms2048m -Xmx2048m"
ENV JAVA_OPTIONS="-Dsun.stdout.encoding=UTF-8 -Dsun.err.encoding=UTF-8"
ARG name=Torres

# Set the environment variable key to the value
ENV name $name

# Use Run to install or update software
# Use shell form to excute commands
# RUN apt-get update && apt-get update
# RUN java -version
# RUN echo "Hello $name"
# RUN echo $my_arg
# CMD echo "Hello, $name"
# ENTRYPOINT echo "Hello, $name"
# ENTRYPOINT echo "Hello, $my_env"


# Use exec form to excute commands
# RUN ["java", "-version"]
# RUN ["apt-get", "update"]
# RUN ["echo", "$name"]
# CMD ["sh", "-c", "/bin/echo Hello, $name"]
# ENTRYPOINT ["/bin/bash", "-c", "echo Hello, $name"]

# ENTRYPOINT ["printenv"]

# Create a volume
# VOLUME /myVolume

# Create directory "app"
RUN mkdir /app

# # Make port 8080 available to the world outside this container
EXPOSE 8080

# # Print working directory
RUN pwd

# Define arg for the application's jar file
ARG JAR_FILE=target/spring-rest-api-0.0.1-SNAPSHOT.jar

# Copy the application's jar to the container
COPY target/spring-rest-api-0.0.1-SNAPSHOT.jar app/spring-rest-api.jar

# Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT, or RUN instructions that follow it in the Dockerfile
WORKDIR /app

# Run the jar file when container is started
#ENTRYPOINT java $JAVA_OPTS -jar rest-api.jar
#ENTRYPOINT ["java -Xms1024m -Xmx1024m", "-jar", "rest-api.jar" ]
ENTRYPOINT ["sh", "-c", "java -jar spring-rest-api.jar"]
# ENTRYPOINT ["sh", "-c", "/bin/echo Hello"]