package com.ms.tree

class TestTreeController {
	def drop(){
		render view:'/tree/dropmenu.gsp'
	}
	def chexk(){
		render view:'/tree/chexkbox.gsp'
	}
	def handle(){
		render view:'/tree/handle.gsp'
	}
	def emb(){		
		def model = [:]
		def boatArea = BoatArea.findByAreaCde(params.id)
		model["boatArea"] = boatArea
		render view:'/tree/embed.gsp',model:model
	}
}
