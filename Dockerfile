FROM ghcr.io/astral-sh/uv:0.10.9-python3.14-trixie-slim

RUN apt-get update
RUN apt-get install git -y

RUN groupadd -r user && useradd -r -m -g user user

USER user

WORKDIR /home/user
COPY requirements.txt .
COPY test_pc.json .
COPY main.py .

RUN uv venv --python 3.14
RUN uv pip install -r requirements.txt

# install rpg_tools from github
RUN git clone https://github.com/jderam/rpg_tools.git
RUN uv pip install -e rpg_tools

# install hyperborea3 from pypi
RUN uv pip install hyperborea3

# install tiny dungeon from pypi
RUN uv pip install tiny-dungeon

# install free-d6 from pypi
RUN uv pip install free-d6

CMD ["uv", "run", "uvicorn", "main:app", "--workers", "4", "--host", "0.0.0.0", "--port", "8000"]
