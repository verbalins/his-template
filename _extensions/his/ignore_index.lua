function Div(element)
  if element.classes:includes('ignore-div') and quarto.doc.isFormat('pdf') then
      return {}
  end
end

function Header(element)
  if element.identifier == "index" and quarto.doc.isFormat('pdf') then
      return {}
  end
end