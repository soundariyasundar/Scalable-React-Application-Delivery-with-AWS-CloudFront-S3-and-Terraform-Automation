FROM node:18-alpine AS builder
WORKDIR /app
# COPY files
COPY package*.json .
# Install deps
RUN npm install
# COPY rest
COPY . .
# Build for production
RUN npm run build
# 2. Deployment stage
FROM nginx:alpine
# COPY build files from builder
COPY --from=builder /app/build /usr/share/nginx/html
# Expose port 80
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
