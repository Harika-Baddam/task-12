FROM node:22-alpine
 
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
 
# -------- ENV for database config --------
ENV DATABASE_CLIENT=postgress
ENV DATABASE_HOST=127.0.0.1
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=strapi
ENV DATABASE_USERNAME=strapi
ENV DATABASE_PASSWORD=password
ENV DATABASE_SSL=false
 
#--------Copying Local App directory--------------
WORKDIR /strapi/
COPY . /strapi/
 
#--------Installing dependencies--------------
RUN npm install --nocache --no-audit --progress=false --prefer-offline
RUN npm run build --verbose
 
EXPOSE 1337
 
CMD ["npm", "run", "develop"]
 