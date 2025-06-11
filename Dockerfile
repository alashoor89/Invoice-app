
# Use an official Flutter image as a parent image

FROM instrumentisto/flutter:3.32.2 AS flutter

# Set the working directory

WORKDIR /app

# Copy the given directory contents contents into the container at /app

COPY . .

# Get the dependencies

RUN flutter pub get

# RUN build_runner build

RUN dart run build_runner build --delete-conflicting-outputs

# RUN Flutter web build

RUN flutter build web --release

# Set the working directory to the build/web directory

WORKDIR /app/build/web

# Install Python

FROM python:alpine3.19

COPY --from=flutter /app/build/web /app

WORKDIR /app

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080"]