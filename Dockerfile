FROM python:3.13-slim

# Install uv
RUN pip install --no-cache-dir uv

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY pyproject.toml uv.lock .python-version ./

# Install dependencies from the lock file
RUN uv sync --locked

# Copy project files
COPY fakenewsKaggle.ipynb README.md ./

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token="]