module ApplicationHelper

def link_to_add_fields(name, f, association)
  new_object = f.object.send(association).klass.new
  id = new_object.object_id
  fields = f.fields_for(association, new_object, child_index: id) do |builder|
    render(association.to_s.singularize + "_fields", f: builder)
  end
  link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
end

	def check_name(member)
			name = User.where(id:member.user_id).first
			return name
	end

	def check_name_assignto(member)
			name = User.where(id:@ticket.assigned_to).first
			return name
	end

	def check_name_assignedto(ticket)
			name = User.where(id: ticket.ticket_members)
			return name
	end

	def check_name_members(member)
			name = User.where(id:@project.members).first
			return name
	end

	def check_name_createdby(ticket)
			name = User.where(id:ticket.createdby).first
			return name
	end

	def check_name_createdby2(ticket2)
			name = User.where(id:@ticket.createdby).first
			return name
	end

	def check_name_projcreatedby(project)
			name = User.where(id:@project.createdby).first
			return name
	end

	def check_name_pcreatedby(project)
			name = User.where(id:project.createdby).first
			return name
	end

	def check_name_tcomment(comments)
			name = User.where(id:comments.user_id).first
			return name
	end
end
