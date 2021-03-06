require 'open-uri'

class DocumentsController < ApplicationController
	def download
		document = Document.find_by_id_and_document_fingerprint params[:id], params[:fingerprint]

		if document
			if current_user
				if document.is_creator?(current_user.id) || document.is_follower?(current_user.id) || current_user.track_referrals == 'all' && !document.is_private?
					source = document.from_osiris? ? document.osiris_url : document.path
					data = open(source)
					send_data data.read, :type => document.document_content_type, :filename => document.document_file_name
				else
					flash[:error] = "You are not allowed to view the file you requested"
					redirect_to referrals_path
				end
			elsif StaffMember.is_staff_member?(params[:staff_member])
				send_file document.document.path, :type => document.document_content_type
			else
				flash[:error] = "Login to view the file you requested"
				redirect_to new_user_session_path
			end
		else
			flash[:error] = "There was a problem with the document you requested. The document either does not exist or you don't have the permision to view it."
			redirect_to referrals_path
		end
	end
end
