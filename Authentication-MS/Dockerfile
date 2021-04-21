FROM openjdk:8u131-jdk-alpine
EXPOSE 8084
COPY ./target/authentication-service.jar authentication-service.jar 
ENTRYPOINT ["java","-jar","/authentication-service.jar"]