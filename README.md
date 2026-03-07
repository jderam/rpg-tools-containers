# rpg-tools-containers

Dockerfiles for running my tools on https://rpg-tools.onrender.com

## Endpoints

Base URL: `https://rpg-tools.onrender.com`

### Hyperborea 3

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/hyperborea3/random`](https://rpg-tools.onrender.com/hyperborea3/random) | Generate a random character. Query params: `method` (default 3), `subclasses` (default 2), `xp` (default 0), `ac_type` (default `ascending`) |
| GET | `/hyperborea3/class_id/{class_id}` | Generate a character with a specific class. Query params: `xp` (default 0), `ac_type` (default `ascending`) |
| GET | [`/hyperborea3/races`](https://rpg-tools.onrender.com/hyperborea3/races) | List all valid races with their IDs |
| GET | [`/hyperborea3/spells/all`](https://rpg-tools.onrender.com/hyperborea3/spells/all) | List all spells |
| GET | `/hyperborea3/spells/{spell_id}` | Get a spell by ID |
| GET | [`/hyperborea3/monsters/all`](https://rpg-tools.onrender.com/hyperborea3/monsters/all) | List all monsters |
| GET | [`/hyperborea3/namegen`](https://rpg-tools.onrender.com/hyperborea3/namegen) | Generate names. Query params: `race_id` (default 0), `gender` (default `random`), `qty` (default 1) |
| GET | [`/hyperborea3/testpc`](https://rpg-tools.onrender.com/hyperborea3/testpc) | Return a static test character |

### Tiny Dungeon

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/tiny-dungeon/char`](https://rpg-tools.onrender.com/tiny-dungeon/char) | Generate a random Tiny Dungeon character |

### Gamma 5

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/rpg-tools/gamma5`](https://rpg-tools.onrender.com/rpg-tools/gamma5) | Generate a random Gamma 5 character |

### Maze Rats

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/rpg-tools/maze-rats`](https://rpg-tools.onrender.com/rpg-tools/maze-rats) | Generate a random Maze Rats character |

### FREEd6

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/free_d6/char`](https://rpg-tools.onrender.com/free_d6/char) | Generate a random FREEd6 character. Query params: `level` (default 1) |

### Zothique Names

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [`/rpg-tools/zothique-names`](https://rpg-tools.onrender.com/rpg-tools/zothique-names) | Generate a random Zothique name. Query params: `gender` (`male`, `female`, or `any`) |
