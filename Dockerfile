FROM node:20-alpine

WORKDIR /app

# Copy dependencies file and install
COPY package*.json ./
RUN apt-get update && apt-get install -y python3 make g++ && npm install


# Copy the rest of the app
COPY . .

# Build Strapi admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
