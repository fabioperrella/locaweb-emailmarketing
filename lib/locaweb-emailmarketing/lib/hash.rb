class Hash
  def assert_required_keys(params)
    params[:required] ||= []
    params[:optional] ||= []
    assert_valid_keys params[:required] + params[:optional]
    pending_keys = params[:required] - keys
    raise(ArgumentError, "Required key(s) not present: #{pending_keys.join(", ")}") unless pending_keys.empty?
  end
end