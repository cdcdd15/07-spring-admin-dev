echo ' '
echo '<step1>kind of prerequisite: stop, delete and check no images, containers, networks exist on local Docker'
./clean-local-docker-env.sh

echo '<step3>Build images locally'
mvn clean package -DskipTests

echo ' '
echo '<step4>List all images locally'
docker images

echo ' '
echo '<step5>List all containers locally'
docker container list -a

echo ' '
echo '<step6>Create network'
docker network create spring-admin-net

echo ' '
echo '<step7>Run containers with docker compuse (this will first download all necessary images on the local Docker)'
docker compose -f ../docker-compose.yml up -d

echo ' '
echo '<step8>List all containers locally'
docker container list -a