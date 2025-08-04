# Use Debian-based Node image
FROM node:20

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install Strapi dependencies
RUN npm install strapi@latest --legacy-peer-deps


# Copy and set env vars
COPY .env .env

# Run build
RUN npm run build


EXPOSE 1337

CMD ["npm", "start"]
