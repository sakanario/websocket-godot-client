extends Control

export var SOCKET_URL = "ws://0.0.0.0:3000"
#https://ws-test12.herokuapp.com/
#export var SOCKET_URL = "ws://ws-test12.herokuapp.com/"

var _client = WebSocketClient.new()

func _ready():
	_client.connect("connection_closed",self,"_on_connection_closed")
	_client.connect("connection_error",self,"_on_connection_closed") 
	_client.connect("connection_established",self,"_on_connected")
	_client.connect("data_received",self,"_on_data")
	
	var err = _client.connect_to_url(SOCKET_URL)
	
	if err != OK :
		print("Unable to connect")
		set_process(false)
		
func _process(delta):
	_client.poll()

func _on_connection_closed(was_clean = false):
	print("Closed, clean : ",was_clean)
	set_process(false)

func _on_connected(proto = ""):
	print("Connected with protocol : ",proto)

func _on_data():
	var payload = JSON.parse(_client.get_peer(1).get_packet().get_string_from_utf8()).result
	print("Received data : ",payload)
	
	var main = get_tree().get_root().get_node("Main")
	if payload.type != null:
		if payload.type == "200":
			main.call("change_label",payload.message)
		elif payload.type == "button":
			main.call("change_label",payload.message)
			
			
			
#	var script = get_node("/root/Main").get_script()
	
#	print(payload)
	_send()

func _send():
	_client.get_peer(1).put_packet(JSON.print({"Name" : "Satria Laksana"}).to_utf8())
	
func _send_button(value):	
	_client.get_peer(1).put_packet(JSON.print(value).to_utf8())



	
	
