# Use the official Node.js alpine runtime for a lightweight, secure container image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package descriptors
COPY package*.json ./

# Install only production-grade dependencies
RUN npm ci --omit=dev

# Copy the remaining codebase into the container
COPY . .

# Expose the application port
EXPOSE 3000

# Set environment defaults
ENV PORT=3000
ENV NODE_ENV=production

# Run the Express server
CMD ["node", "server.js"]
