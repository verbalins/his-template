function Div(element)
  if element.classes:includes('ignore-div') and quarto.doc.isFormat('pdf') then
      return {}
  end
end
