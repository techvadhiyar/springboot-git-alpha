# Install the JDK
FROM openjdk:8-jdk-alpine

# Install maven and copy project for compilation
FROM maven:latest as builder

RUN mvn clean install

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]