# Use Debian-based Node image
FROM node:20

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install Strapi dependencies
RUN npm install strapi@latest --legacy-peer-deps

#copy the rest of the application code
COPY . .

# Install application dependencies
ENV NODE_ENV=production
ENV DATABASE_CLIENT=sqlite
ENV DATABASE_FILENAME=.tmp/data.db

RUN npm run build


EXPOSE 1337

CMD ["npm", "start"]
