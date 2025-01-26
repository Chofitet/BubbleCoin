extends Node



func sfx(stream : AudioStream):
	var ins = AudioStreamPlayer.new()
	ins.stream = stream
	ins.bus = 1
	ins.finished.connect(remove.bind(ins))
	add_child(ins)
	ins.play()

func remove(instancia : AudioStreamPlayer):
	instancia.queue_free()
