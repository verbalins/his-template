-- format-date.lua
function Meta(meta)
  if meta.date then
	local format = "(%d+)-(%d+)-(%d+)"
	local y, m, d = pandoc.utils.stringify(meta.date):match(format)

	meta.date = pandoc.Str(y)
	return meta
  end
end