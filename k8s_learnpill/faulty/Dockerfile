FROM python:3-slim-bullseye
WORKDIR /app
RUN pip install fastapi uvicorn
COPY main.py /app
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
