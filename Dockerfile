## Build
FROM beevelop/ionic AS ionic
# Create app directory

WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install
# Bundle app source
COPY . .
RUN ionic build

## Run
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html

#-----
# Prepare your application by compiling them into static files.
# ionic build
 
# Run the application locally using files created from the `ionic build` command.
#ionic serve