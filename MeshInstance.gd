extends MeshInstance


var mdt = MeshDataTool.new()


# Called when the node enters the scene tree for the first time.
func _ready():
#	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, 
#	CubeMesh.new().get_mesh_arrays())
#	mdt.create_from_surface(mesh, 0)
#	for i in range(mdt.get_vertex_count()):
#		var vertex = mdt.get_vertex(i)
#	# 在这个例子中，我们将Mesh扩展了一个单元，这样就会产生分离的面，因为它是平面阴影。
#		vertex += Vector3(1,0,0)
#	# 保存你的改动。
#		mdt.set_vertex(i, vertex)
#	mesh.surface_remove(0)
#	mdt.commit_to_surface(mesh)


	var arr = []
	arr.resize(Mesh.ARRAY_MAX)
	
	# PoolVectorXXArrays for mesh construction.
	var verts = PoolVector3Array()
	var uvs = PoolVector2Array()
	var normals = PoolVector3Array()
	var indices = PoolIntArray()


	var top = -6.2
	var mid_width = 4 
	var dir_l = (Vector3(-mid_width/2,0,-1) - Vector3(0,0,top)).normalized()
	var dir_r = (Vector3(mid_width/2,0,-1) - Vector3(0,0,top)).normalized()
	var move_len = 0.2
	##head
	verts.push_back(Vector3(0,0,0))
	verts.push_back(Vector3(-mid_width/2,0,-1))
	verts.push_back(Vector3(mid_width/2,0,-1))
	
	verts.push_back(Vector3(-mid_width/2,0,-1))
	verts.push_back(Vector3(0,0,top))
	verts.push_back(Vector3(mid_width/2,0,-1))
	##left_body
	verts.push_back(dir_l * move_len)
	verts.push_back(Vector3(0,0,-top) + dir_l * move_len)
	verts.push_back(Vector3(-mid_width/2,0,-1) + dir_l * move_len)
	
	verts.push_back(Vector3(-mid_width/2,0,-1) + dir_l * move_len)
	verts.push_back(Vector3(0,0,-top) + dir_l * move_len)	
	verts.push_back(Vector3(-mid_width/2,0,-1) + dir_l * 3)
	##right_body
	verts.push_back(dir_r * move_len)
	verts.push_back(Vector3(mid_width/2,0,-1) + dir_r * move_len)	
	verts.push_back(Vector3(0,0,-top) + dir_r * move_len)
	
	verts.push_back(Vector3(mid_width/2,0,-1) + dir_r * move_len)
	verts.push_back(Vector3(mid_width/2,0,-1) + dir_r * 3)	
	verts.push_back(Vector3(0,0,-top) + dir_r * move_len)	
	##left_dot
	verts.push_back(Vector3(-2.5,0,4.5))
	verts.push_back(Vector3(-2.5,0,5.5))
	verts.push_back(Vector3(-3.5,0,4.5))

	verts.push_back(Vector3(-2.5,0,5.5))
	verts.push_back(Vector3(-3.5,0,5.5))
	verts.push_back(Vector3(-3.5,0,4.5))
	##right_dot
	verts.push_back(Vector3(2.5,0,4.5))
	verts.push_back(Vector3(3.5,0,4.5))	
	verts.push_back(Vector3(2.5,0,5.5))

	verts.push_back(Vector3(2.5,0,5.5))
	verts.push_back(Vector3(3.5,0,4.5))	
	verts.push_back(Vector3(3.5,0,5.5))
	

	# Assign arrays to mesh array.
	arr[Mesh.ARRAY_VERTEX] = verts
#	arr[Mesh.ARRAY_TEX_UV] = uvs
#	arr[Mesh.ARRAY_NORMAL] = normals
#	arr[Mesh.ARRAY_INDEX] = indices

	# Create mesh surface from mesh array.
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr) # No blendshapes or compression used.
#	print(arr)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
