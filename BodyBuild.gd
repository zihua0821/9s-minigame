extends Spatial


onready var head = $HeadPos/MeshInstance.mesh
onready var left_body = $LeftPos/MeshInstance.mesh
onready var right_body = $RightPos/MeshInstance.mesh
onready var left_dot = $LeftBackrPos/MeshInstance.mesh
onready var right_dot = $RightBackrPos/MeshInstance.mesh


# Called when the node enters the scene tree for the first time.
func _ready():
	var arr_head = []
	var arr_left_body = []
	var arr_right_body = []
	var arr_left_dot = []
	var arr_right_dot = []
	arr_head.resize(Mesh.ARRAY_MAX)
	arr_left_body.resize(Mesh.ARRAY_MAX)
	arr_right_body.resize(Mesh.ARRAY_MAX)
	arr_left_dot.resize(Mesh.ARRAY_MAX)
	arr_right_dot.resize(Mesh.ARRAY_MAX)
	var verts_head = PoolVector3Array()
	var verts_left_body = PoolVector3Array()
	var verts_right_body = PoolVector3Array()
	var verts_left_dot = PoolVector3Array()
	var verts_right_dot = PoolVector3Array()
	
	var top = -6.5
	var mid_width = 4 
	var dir_l = (Vector3(-mid_width/2,0,-1) - Vector3(0,0,top)).normalized()
	var dir_r = (Vector3(mid_width/2,0,-1) - Vector3(0,0,top)).normalized()
	var move_len = 0.2
	
	var cur_y = 0
	var a_down = Vector3(0,cur_y,0)
	var b_down = Vector3(-mid_width/2,cur_y,-1)
	var c_down = Vector3(0,cur_y,top)
	var d_down = Vector3(mid_width/2,cur_y,-1)
	var e_down = dir_l * move_len
	var f_down = Vector3(0,cur_y,-(top+2)) + dir_l * move_len
	var g_down = Vector3(-mid_width/2,cur_y,-1) + dir_l * 3
	var h_down = Vector3(-mid_width/2,cur_y,-1) + dir_l * move_len
	var i_down = dir_r * move_len
	var j_down = Vector3(mid_width/2,cur_y,-1) + dir_r * move_len
	var k_down = Vector3(mid_width/2,cur_y,-1) + dir_r * 3
	var l_down = Vector3(0,cur_y,-(top+2)) + dir_r * move_len
	

	cur_y = 1.5
	var a_up = Vector3(0,cur_y,0)
	var b_up = Vector3(-mid_width/2,cur_y,-1)
	var c_up = Vector3(0,cur_y,top)
	var d_up = Vector3(mid_width/2,cur_y,-1)
	var e_up = dir_l * move_len
	var f_up = Vector3(0,cur_y,-(top+2)) + dir_l * move_len
	var g_up = Vector3(-mid_width/2,cur_y,-1) + dir_l * 3
	var h_up = Vector3(-mid_width/2,cur_y,-1) + dir_l * move_len
	var i_up = dir_r * move_len
	var j_up = Vector3(mid_width/2,cur_y,-1) + dir_r * move_len
	var k_up = Vector3(mid_width/2,cur_y,-1) + dir_r * 3
	var l_up = Vector3(0,cur_y,-(top+2)) + dir_r * move_len
	
	var nor_l = ((b_down-c_down).cross(b_up-c_down)).normalized()
	var nor_r = ((d_up-c_down).cross(d_up-c_up)).normalized()
	var nor_lb = ((b_up-a_up).cross(b_down-a_up)).normalized()
	var nor_rb = ((d_down-a_up).cross(d_up-a_up)).normalized()
	var nor_body_l = ((g_up-f_up).cross(g_down-f_up)).normalized()
	var nor_body_r = ((k_down-l_up).cross(k_up-l_up)).normalized()
	##head
	verts_head.push_back(d_down)
	verts_head.push_back(b_down)
	verts_head.push_back(a_down)
	
	verts_head.push_back(d_down)
	verts_head.push_back(c_down)
	verts_head.push_back(b_down)
	
	verts_head.push_back(a_up)
	verts_head.push_back(b_up)
	verts_head.push_back(d_up)
	
	verts_head.push_back(b_up)
	verts_head.push_back(c_up)
	verts_head.push_back(d_up)
	
	verts_head.push_back(b_up)
	verts_head.push_back(b_down)
	verts_head.push_back(c_down)
	
	verts_head.push_back(c_up)
	verts_head.push_back(b_up)
	verts_head.push_back(c_down)
	
	verts_head.push_back(d_up)
	verts_head.push_back(c_up)
	verts_head.push_back(d_down)
	
	verts_head.push_back(d_down)
	verts_head.push_back(c_up)
	verts_head.push_back(c_down)
	
	verts_head.push_back(b_down)
	verts_head.push_back(b_up)
	verts_head.push_back(a_up)
	
	verts_head.push_back(b_down)
	verts_head.push_back(a_up)
	verts_head.push_back(a_down)
	
	verts_head.push_back(a_up)
	verts_head.push_back(d_up)
	verts_head.push_back(d_down)
	
	verts_head.push_back(a_up)
	verts_head.push_back(d_down)
	verts_head.push_back(a_down)
	
	var normals_head = PoolVector3Array()
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.DOWN)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(Vector3.UP)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_l)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_r)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_lb)
	normals_head.push_back(nor_rb)
	normals_head.push_back(nor_rb)
	normals_head.push_back(nor_rb)
	normals_head.push_back(nor_rb)
	normals_head.push_back(nor_rb)
	normals_head.push_back(nor_rb)
	
	##left_body
	verts_left_body.push_back(h_down)
	verts_left_body.push_back(f_down)
	verts_left_body.push_back(e_down)
	
	verts_left_body.push_back(h_down)
	verts_left_body.push_back(g_down)
	verts_left_body.push_back(f_down)
	
	verts_left_body.push_back(e_up)
	verts_left_body.push_back(f_up)
	verts_left_body.push_back(h_up)
	
	verts_left_body.push_back(f_up)
	verts_left_body.push_back(g_up)
	verts_left_body.push_back(h_up)
	
	verts_left_body.push_back(h_up)
	verts_left_body.push_back(g_up)
	verts_left_body.push_back(h_down)
	
	verts_left_body.push_back(h_down)
	verts_left_body.push_back(g_up)
	verts_left_body.push_back(g_down)
	
	verts_left_body.push_back(h_up)
	verts_left_body.push_back(h_down)
	verts_left_body.push_back(e_down)
	
	verts_left_body.push_back(h_up)
	verts_left_body.push_back(e_down)
	verts_left_body.push_back(e_up)
	
	verts_left_body.push_back(e_up)
	verts_left_body.push_back(e_down)
	verts_left_body.push_back(f_down)
	
	verts_left_body.push_back(e_up)
	verts_left_body.push_back(f_down)
	verts_left_body.push_back(f_up)
	
	verts_left_body.push_back(g_up)
	verts_left_body.push_back(f_up)
	verts_left_body.push_back(f_down)
	
	verts_left_body.push_back(g_up)
	verts_left_body.push_back(f_down)
	verts_left_body.push_back(g_down)
	var normals_left_body = PoolVector3Array()
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.DOWN)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(Vector3.UP)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(nor_l)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(-nor_lb)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(Vector3.RIGHT)
	normals_left_body.push_back(nor_body_l)
	normals_left_body.push_back(nor_body_l)
	normals_left_body.push_back(nor_body_l)
	normals_left_body.push_back(nor_body_l)
	normals_left_body.push_back(nor_body_l)
	normals_left_body.push_back(nor_body_l)
	
	##right_body
	verts_right_body.push_back(l_down)
	verts_right_body.push_back(j_down)
	verts_right_body.push_back(i_down)
	
	verts_right_body.push_back(l_down)
	verts_right_body.push_back(k_down)
	verts_right_body.push_back(j_down)
	
	verts_right_body.push_back(i_up)
	verts_right_body.push_back(j_up)
	verts_right_body.push_back(l_up)
	
	verts_right_body.push_back(j_up)
	verts_right_body.push_back(k_up)
	verts_right_body.push_back(l_up)
	
	verts_right_body.push_back(i_up)
	verts_right_body.push_back(i_down)
	verts_right_body.push_back(j_down)
	
	verts_right_body.push_back(i_up)
	verts_right_body.push_back(j_down)
	verts_right_body.push_back(j_up)
	
	verts_right_body.push_back(j_up)
	verts_right_body.push_back(j_down)
	verts_right_body.push_back(k_down)
	
	verts_right_body.push_back(j_up)
	verts_right_body.push_back(k_down)
	verts_right_body.push_back(k_up)
	
	verts_right_body.push_back(k_up)
	verts_right_body.push_back(k_down)
	verts_right_body.push_back(l_down)
	
	verts_right_body.push_back(k_up)
	verts_right_body.push_back(l_down)
	verts_right_body.push_back(l_up)
	
	verts_right_body.push_back(l_up)
	verts_right_body.push_back(l_down)
	verts_right_body.push_back(i_down)
	
	verts_right_body.push_back(l_up)
	verts_right_body.push_back(i_down)
	verts_right_body.push_back(i_up)
	
	var normals_right_body = PoolVector3Array()
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.DOWN)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(Vector3.UP)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(-nor_rb)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(nor_body_r)
	normals_right_body.push_back(Vector3.LEFT)
	normals_right_body.push_back(Vector3.LEFT)
	normals_right_body.push_back(Vector3.LEFT)
	normals_right_body.push_back(Vector3.LEFT)
	normals_right_body.push_back(Vector3.LEFT)
	normals_right_body.push_back(Vector3.LEFT)
	cur_y = 0
	var dot1_l_down = Vector3(-3.5,cur_y,3)
	var dot2_l_down = Vector3(-2.5,cur_y,3)
	var dot3_l_down = Vector3(-2.5,cur_y,4)
	var dot4_l_down = Vector3(-3.5,cur_y,4)
	var dot1_r_down = Vector3(2.5,cur_y,3)
	var dot2_r_down = Vector3(3.5,cur_y,3)
	var dot3_r_down = Vector3(3.5,cur_y,4)
	var dot4_r_down = Vector3(2.5,cur_y,4)
	cur_y = 1
	var dot1_l_up = Vector3(-3.5,cur_y,3)
	var dot2_l_up = Vector3(-2.5,cur_y,3)
	var dot3_l_up = Vector3(-2.5,cur_y,4)
	var dot4_l_up = Vector3(-3.5,cur_y,4)
	var dot1_r_up = Vector3(2.5,cur_y,3)
	var dot2_r_up = Vector3(3.5,cur_y,3)
	var dot3_r_up = Vector3(3.5,cur_y,4)
	var dot4_r_up = Vector3(2.5,cur_y,4)
	
	##left_dot
	verts_left_dot.push_back(dot3_l_down)
	verts_left_dot.push_back(dot2_l_down)
	verts_left_dot.push_back(dot1_l_down)
	
	verts_left_dot.push_back(dot4_l_down)
	verts_left_dot.push_back(dot3_l_down)
	verts_left_dot.push_back(dot1_l_down)
	
	verts_left_dot.push_back(dot1_l_up)
	verts_left_dot.push_back(dot2_l_up)
	verts_left_dot.push_back(dot3_l_up)
	
	verts_left_dot.push_back(dot1_l_up)
	verts_left_dot.push_back(dot3_l_up)
	verts_left_dot.push_back(dot4_l_up)
	
	verts_left_dot.push_back(dot4_l_up)
	verts_left_dot.push_back(dot3_l_up)
	verts_left_dot.push_back(dot3_l_down)
	
	verts_left_dot.push_back(dot4_l_up)
	verts_left_dot.push_back(dot3_l_down)
	verts_left_dot.push_back(dot4_l_down)
	
	verts_left_dot.push_back(dot2_l_up)
	verts_left_dot.push_back(dot1_l_up)
	verts_left_dot.push_back(dot1_l_down)
	
	verts_left_dot.push_back(dot2_l_up)
	verts_left_dot.push_back(dot1_l_down)
	verts_left_dot.push_back(dot2_l_down)
	
	verts_left_dot.push_back(dot1_l_up)
	verts_left_dot.push_back(dot4_l_up)
	verts_left_dot.push_back(dot4_l_down)
	
	verts_left_dot.push_back(dot1_l_up)
	verts_left_dot.push_back(dot4_l_down)
	verts_left_dot.push_back(dot1_l_down)
	
	verts_left_dot.push_back(dot3_l_up)
	verts_left_dot.push_back(dot2_l_up)
	verts_left_dot.push_back(dot2_l_down)
	
	verts_left_dot.push_back(dot3_l_up)
	verts_left_dot.push_back(dot2_l_down)
	verts_left_dot.push_back(dot3_l_down)
	##right_dot
	verts_right_dot.push_back(dot3_r_down)
	verts_right_dot.push_back(dot2_r_down)
	verts_right_dot.push_back(dot1_r_down)
	
	verts_right_dot.push_back(dot4_r_down)
	verts_right_dot.push_back(dot3_r_down)
	verts_right_dot.push_back(dot1_r_down)
	
	verts_right_dot.push_back(dot1_r_up)
	verts_right_dot.push_back(dot2_r_up)
	verts_right_dot.push_back(dot3_r_up)
	
	verts_right_dot.push_back(dot1_r_up)
	verts_right_dot.push_back(dot3_r_up)
	verts_right_dot.push_back(dot4_r_up)
	
	verts_right_dot.push_back(dot4_r_up)
	verts_right_dot.push_back(dot3_r_up)
	verts_right_dot.push_back(dot3_r_down)
	
	verts_right_dot.push_back(dot4_r_up)
	verts_right_dot.push_back(dot3_r_down)
	verts_right_dot.push_back(dot4_r_down)
	
	verts_right_dot.push_back(dot2_r_up)
	verts_right_dot.push_back(dot1_r_up)
	verts_right_dot.push_back(dot1_r_down)
	
	verts_right_dot.push_back(dot2_r_up)
	verts_right_dot.push_back(dot1_r_down)
	verts_right_dot.push_back(dot2_r_down)
	
	verts_right_dot.push_back(dot1_r_up)
	verts_right_dot.push_back(dot4_r_up)
	verts_right_dot.push_back(dot4_r_down)
	
	verts_right_dot.push_back(dot1_r_up)
	verts_right_dot.push_back(dot4_r_down)
	verts_right_dot.push_back(dot1_r_down)
	
	verts_right_dot.push_back(dot3_r_up)
	verts_right_dot.push_back(dot2_r_up)
	verts_right_dot.push_back(dot2_r_down)
	
	verts_right_dot.push_back(dot3_r_up)
	verts_right_dot.push_back(dot2_r_down)
	verts_right_dot.push_back(dot3_r_down)
	var normals_dot = PoolVector3Array()
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.DOWN)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.UP)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.BACK)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.FORWARD)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.LEFT)
	normals_dot.push_back(Vector3.RIGHT)
	normals_dot.push_back(Vector3.RIGHT)
	normals_dot.push_back(Vector3.RIGHT)
	normals_dot.push_back(Vector3.RIGHT)
	normals_dot.push_back(Vector3.RIGHT)
	normals_dot.push_back(Vector3.RIGHT)
	
	arr_right_dot[Mesh.ARRAY_NORMAL] = normals_dot
	arr_left_dot[Mesh.ARRAY_NORMAL] = normals_dot
	arr_head[Mesh.ARRAY_NORMAL] = normals_head
	arr_left_body[Mesh.ARRAY_NORMAL] = normals_left_body
	arr_right_body[Mesh.ARRAY_NORMAL] = normals_right_body

	arr_head[Mesh.ARRAY_VERTEX] = verts_head
	arr_left_body[Mesh.ARRAY_VERTEX] = verts_left_body
	arr_right_body[Mesh.ARRAY_VERTEX] = verts_right_body
	arr_left_dot[Mesh.ARRAY_VERTEX] = verts_left_dot
	arr_right_dot[Mesh.ARRAY_VERTEX] = verts_right_dot


	head.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr_head)
	left_body.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr_left_body)
	right_body.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr_right_body)
	left_dot.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr_left_dot)
	right_dot.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr_right_dot)

