class StaticController < ApplicationController

	def index
		render text: "MAIN APPLICATION PAGE"
	end

	def 404
		render text: "Nothing found, error 404 here"
	end

end
