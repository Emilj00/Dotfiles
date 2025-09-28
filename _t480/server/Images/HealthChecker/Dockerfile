FROM python:3.12-slim

WORKDIR /app

# Install requests and Flask
RUN pip install flask requests

# Copy the script
COPY proxy.py .

# Expose port 9000
EXPOSE 9000

# Run the proxy
CMD ["python", "proxy.py"]
