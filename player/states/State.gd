class_name State extends Node

## Stores ref to player
static var player: Player

## What happens when the player enters this State?
func enter() -> void:
	pass
	
## What happens when the player exits this State?
func exit():
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	return null

## What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null
	
## What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	return null
	
