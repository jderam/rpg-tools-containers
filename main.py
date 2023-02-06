from typing import Any, Dict, List, Optional

from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
from hyperborea3.monsters import get_all_monsters
from hyperborea3.namegen import generate_name
from hyperborea3.player_character import PlayerCharacter
from hyperborea3.spells import get_all_spells, get_spell
from hyperborea3.valid_data import VALID_RACES_BY_ID
import rpg_tools.tiny_dungeon.char as td_char
import rpg_tools.gamma5.char as gamma5_char
import rpg_tools.maze_rats.char as maze_rats_char


app = FastAPI()

# https://fastapi.tiangolo.com/tutorial/cors/
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    # allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "rpg-tools"}


# ~~~ hyperborea3 ~~~


@app.get("/hyperborea3/random")
async def random_char(
    method: Optional[int] = Query(3),
    subclasses: Optional[int] = Query(2),
    xp: Optional[int] = Query(0),
    ac_type: Optional[str] = Query("ascending"),
) -> Dict:
    pc = PlayerCharacter(
        method=method,
        subclasses=subclasses,
        xp=xp,
        ac_type=ac_type,
    )
    return pc.to_dict()


@app.get("/hyperborea3/class_id/{class_id}")
async def specific_class(
    class_id: int,
    xp: Optional[int] = Query(0),
    ac_type: Optional[str] = Query("ascending"),
) -> Dict:
    pc = PlayerCharacter(
        class_id=class_id,
        xp=xp,
        ac_type=ac_type,
    )
    return pc.to_dict()


@app.get("/hyperborea3/spells/all")
async def hyperborea_spells() -> List[Dict[str, Any]]:
    return get_all_spells()


@app.get("/hyperborea3/spells/{spell_id}")
async def hyperborea_spell(spell_id: int) -> Dict:
    return get_spell(spell_id)


@app.get("/hyperborea3/monsters/all")
async def hyperborea_monsters() -> List[Dict[str, Any]]:
    return get_all_monsters()


@app.get("/hyperborea3/namegen")
async def gen_name(
    race_id: Optional[int] = Query(0),
    gender: Optional[str] = Query("random"),
) -> Dict[str, str]:
    name = generate_name(race_id=race_id, gender=gender)
    return {"name": name}


@app.get("/hyperborea3/races")
async def race_map() -> Dict[int, str]:
    return VALID_RACES_BY_ID


# ~~~ rpg_tools ~~~


@app.get("/rpg-tools/tiny-dungeon")
async def tiny_dungeon_character():
    return td_char.PlayerCharacter().to_dict()


@app.get("/rpg-tools/gamma5")
async def gamma5_character():
    return gamma5_char.PlayerCharacter().to_dict()


@app.get("/rpg-tools/maze-rats")
async def maze_rats_character():
    return maze_rats_char.PlayerCharacter().to_dict()
