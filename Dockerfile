FROM tomcat:9.0-jdk8-temurin

COPY dist/Car_Rental_System.war /usr/local/tomcat/webapps/Car_Rental_System.war

EXPOSE 8080

CMD ["catalina.sh", "run"]