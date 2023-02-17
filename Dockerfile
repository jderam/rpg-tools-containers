FROM python:3.11-slim-bullseye

RUN apt-get update
RUN apt-get install git -y

RUN groupadd -r user && useradd -r -m -g user user

USER user

WORKDIR /home/user
COPY requirements.txt .
COPY main.py .

RUN python -m pip install --upgrade pip wheel
RUN python -m pip install -r requirements.txt

# install rpg_tools from github
# RUN python -m pip install git+https://github.com/jderam/rpg_tools.git@v0.1.1
RUN git clone https://github.com/jderam/rpg_tools.git
RUN python -m pip install -e rpg_tools

# install hyperborea3 from pypi
RUN python -m pip install hyperborea3==0.6.0

CMD ["python", "-m", "uvicorn", "main:app", "--workers", "2", "--host", "0.0.0.0", "--port", "8000"]
