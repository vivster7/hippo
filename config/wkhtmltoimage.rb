if Rails.env.production?
	exe_path = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s
end