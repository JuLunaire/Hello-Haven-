Hi! 
I'm JuLunaire (or julu2009 in Slack), and welcome to my project, Hello Haven!

(If you just want to make the game work, just open the main.tscn with godot
and press "Play" button in the top left. Enjoy!)

For all the rest interested in the structure, you may keep reading. (^_^)/

In this README I'll make a quick explanation of how this game works.
It is divided in 3 parts:
	-Game characteristics
	-Scenery
	-Reusable Nodes
	
Let's begin!

1. Game characteristics:
	- The game "screen" size is 700x400 pixels
	- The tile size used is 50x50 pixels
	- Gravity is set to 1500 px/s^2
	- Global interactions are set in game_controller.gd , and the signals are sent
	  from event_controller.gd
	- For future updates, collectables are ubicated in the collectables_ui.gd
	  (Could evolve to represent all the UI of the game in the future)
	- Game is set to "end" when all strawberries are collected (or the value of Strawberry_collected is equal to 8)
	  (collectables_ui will change to a placeholder scene) 

2. Scenery:
	- Used tilemap is located in "Earth layer" ("Test layer is an unused tilemap from alpha vers.)
	  It has two types of tiles: Solid ones (have physics property) and background ones (darker, just decoration)
	- Background is set in ParallaxBackground node, mirroring the "screen" size
	- Borders are defined as a reusable and reacommodable "hitbox" node, called Border
	  It works by covering the whole playable map, and sending a signal (Border_crossed)
	  when the player leaves it, forcing the player to respawn in the beginning, without erasing progress.
	
3. Reusable Nodes (all of them can be dropped into the scene and placed to your preference.)
	- Player: Porcupine is the standard playable character, who is slightly smaller than the tiles.
	  SPEED variable in 600 and JUMP_VELOCITY in -1000 (for the height). 
	  Camera is constantly following the player (it uses position smoothing, 3 px/s)
		It can move in 4 directions:
			-Left: "A" key, left arrow key
			-Right: "D" key, right arrow key
			-Jump: "W" key, up arrow key, spacebar
			-Drop (Only if airborne, duplicates gravity effect): "S" key, down arrow key
		It has two sprites: static when idle, and rolling animation when moving left or right
	- Smol Glob: These are the "signs" of the game. (Random fact: originally coded for being a playable character)
		These smol dudes have an idle animation, and a label node for "speaking"
		(If added, they need to have a different .gd script for their different messages)
		They have a hitbox in the main body
	-Strawberries: The main collectible of the game.
	 Static sprites, their only meaning of existence is to dissapear when the player touches them
	 and add a count to the value of Strawberry_collected
	
That's mostly all the relevant information. 
All sprites and backgrounds were drawn by me. (Check my pixilart!)
All code is aimed to ease the creation of new levels! (excepting smol_glob. Their script must be reconstructed lol).

Thanks for reading, and enjoy the game!

	
