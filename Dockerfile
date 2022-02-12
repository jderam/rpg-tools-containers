FROM python:3.10-slim-bullseye

RUN apt update
RUN apt install git -y

WORKDIR /app
COPY requirements.txt .
COPY main.py .

RUN python -m pip install -U pip
RUN python -m pip install -r requirements.txt

# install rpg_tools from github
RUN python -m pip install git+https://github.com/jderam/rpg_tools.git

# install hyperborea3 from github
RUN python -m pip install git+https://github.com/jderam/hyperborea3.git

CMD ["uvicorn", "main:app", "--workers", "2", "--host", "0.0.0.0", "--port", "8000"]
