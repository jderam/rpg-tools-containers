FROM python:3.10-slim-bullseye

RUN apt-get update
RUN apt-get install git -y

RUN groupadd -r user && useradd -r -m -g user user

USER user

WORKDIR /home/user
COPY requirements.txt .
COPY main.py .

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# install rpg_tools from github
RUN python -m pip install git+https://github.com/jderam/rpg_tools.git

# install hyperborea3 from pypi
RUN python -m pip install hyperborea3==0.3.9

CMD ["python", "-m", "uvicorn", "main:app", "--workers", "2", "--host", "0.0.0.0", "--port", "8000"]
