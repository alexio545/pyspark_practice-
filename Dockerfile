FROM apache/spark-py:v3.3.0

# Switch to root user for installations
USER root

# Add any additional Python packages you need
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir jupyterlab pandas notebook

# Set working directory
WORKDIR /workspace

# Copy requirements and data
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]