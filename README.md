# Haunted Spouse

A top-down ghost-cleanup game made in Godot for **Brackeys Game Jam 2025.1** by the SkubbLabs team.

**[Play it on itch.io](https://tspenc97.itch.io/haunted-spouse)** (HTML5, runs in the browser)

![Godot 4.3](https://img.shields.io/badge/Godot-4.3-478cbf?logo=godotengine&logoColor=white)
![Game Jam](https://img.shields.io/badge/Brackeys%20Game%20Jam-2025.1-orange)

## About the game

Your partner leaves to pick up the in-laws and reminds you that "nothing can go wrong" and the house has to be spotless. To make the chores easier, you try to summon a cleaning ghost. Instead you open a portal that lets in a crowd of trickster ghosts who want to wreck every room.

Explore the house, fix the messes, and cleanse the ghosts. The jam build has several minigames, a finished kitchen, a full first floor to explore, and an easter egg if you can get outside the house.

### Controls

| Key | Action |
| --- | --- |
| WASD | Move |
| Tab | Toggle task list |
| Space | Toggle inventory |
| Mouse | Minigames |

## My contributions

I'm Evan Patterson ([@EvanNavel](https://github.com/EvanNavel)). On this project I did programming and pixel art.

**Programming**
- Title screen and its animated ghosts: `scenes/ui/title_screen.*`, `scenes/ui/title_animation.gd`
- Settings menu: `scenes/ui/settings.*`
- Pause screen: `scenes/ui/pause_screen.*`
- Intro text and dialogue text box: `scenes/ui/textbox.*`

**Art**
- Title and settings screen art: `assets/ui/logo.png`, `assets/ui/title_ghost_1-6.png`
- Player sprites: `assets/player/`
- Kylin, plate, key and item sprites (mop, cleansing book, fire extinguisher)

[See my commits](https://github.com/EvanNavel/HauntedSpouse/commits?author=EvanNavel)

## Team

- **Programming:** Travis S., Cameron C., Evan P.
- **Art:** Evan P.
- **Music:** Jack Mellen

This repo is my fork of the team repo, [Tdspenc97/HauntedSpouse](https://github.com/Tdspenc97/HauntedSpouse).

## Third-party assets

- [Interior Oddities](https://acursedpixel.itch.io/interior-oddities) by AcursedPixel (tilesets and furniture)
- [Top-Down Pixel Ghost Character Sprite Pack](https://craftpix.net/product/top-down-pixel-ghost-character-sprite-pack/) by CraftPix

## Running locally

1. Install [Godot 4.3](https://godotengine.org/download/archive/4.3-stable/).
2. Open `hauntedspouse/project.godot` in Godot.
3. Press F5. The game starts on the title screen.
