# 사용할 베이스 이미지
FROM openjdk:17

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드를 현재 위치로 복사
COPY ./target/spring-petclinic.war /app/app.war

# 애플리케이션의 포트 노출 (Spring Boot 기본 포트는 8080)
EXPOSE 81

# 애플리케이션 실행 명령
CMD ["java", "-jar", "app.war"]
