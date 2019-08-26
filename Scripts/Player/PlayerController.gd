extends KinematicBody2D

const UP = Vector2(0, -1)
var move = Vector2()

var        delayToJump  = false
var        isJumping    = false
var        jumpTimes    = 2

func _process(delta):
	move.y += PlayerVariables.gravity * delta

	if Input.is_action_pressed("ui_right"):
		move.x = min(PlayerVariables.moveXMax, move.x + PlayerVariables.moveXForce)
		
		$Animated.flip_h = false
		if !isJumping:
			$Animated.animation = "walking"
			$Animated.playing = true
	
	elif Input.is_action_pressed("ui_left"):
		move.x = max(-PlayerVariables.moveXMax, move.x - PlayerVariables.moveXForce)
		
		$Animated.flip_h = true
		if !isJumping:
			$Animated.animation = "walking"
			$Animated.playing = true
	
	elif move.x > 0:
		move.x -= PlayerVariables.moveXSlide
		if !isJumping:
			$Animated.animation = "stopping"
			$Animated.playing = false
	
	elif move.x < 0:
		move.x += PlayerVariables.moveXSlide
		if !isJumping:
			$Animated.animation = "stopping"
			$Animated.playing = false
		
	elif !isJumping:
		$Animated.animation = "idle"
		$Animated.playing = false
	else:
		$Animated.animation = "idle"
		$Animated.playing = false
		
	if jumpTimes > 0 and !delayToJump and Input.is_action_pressed("ui_up"):
		jumpTimes -= 1
		delayToJump = true
		isJumping = true
		move.y -= PlayerVariables.jumpForce
		$Animated.animation = "jumping"
		$Animated.playing = false
	
	elif Input.is_action_just_released("ui_up"):
		delayToJump = false
		
	elif is_on_floor():
		if Input.is_action_pressed("ui_down"):
			$Animated.animation = "ducking"
			$Animated.playing = false
			
		move.y = 0
		delayToJump = false
		isJumping = false
		jumpTimes = PlayerVariables.maxJumpTimes
		
	move_and_slide(move, UP)