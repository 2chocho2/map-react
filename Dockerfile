FROM    node AS builder
RUN     mkdir /kakao-map
WORKDIR /kakao-map
ARG     GIT_REPOSITORY_ADDRESS
RUN     git clone $GIT_REPOSITORY_ADDRESS
RUN     mv ./map-react/* ./
RUN     npm install -s
RUN     npm run --silent build

FROM    nginx AS runtime
COPY    --from=builder /kakao-map/build/ /usr/share/nginx/html
RUN     rm /etc/nginx/conf.d/default.conf
COPY    --from=builder /kakao-map/nginx.conf /etc/nginx/conf.d
CMD     [ "nginx", "-g","daemon off;" ]