# Use the official Tomcat image
FROM tomcat:9-jdk11-openjdk-slim

# Remove the default Tomcat webapp
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your JSP file into the Tomcat webapps folder
COPY index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp

# Expose port 8080 (inside container)
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
