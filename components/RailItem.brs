    sub init()
      m.itemposter = m.top.findNode("itemPoster")
      ' m.itemmask = m.top.findNode("itemMask")
      m.itemlabel = m.top.findNode("itemLabel")
      m.itemFocusFeedbackBorder = m.top.findNode("itemFocusFeedbackBorder")
    end sub

    sub showcontent()
      itemcontent = m.top.itemContent
      m.itemposter.uri = itemcontent.HDPosterUrl
      m.itemlabel.text = itemcontent.title
    end sub

    sub showfocus()
      ' m.itemlabel.opacity = m.top.focusPercent
      m.itemFocusFeedbackBorder.opacity = m.top.focusPercent
      ' scale = 1 + (m.top.focusPercent * 0.08)
      ' m.itemposter.scale = [scale, scale]
    end sub

    sub showrowfocus()
      ' m.itemlabel.opacity = m.top.rowFocusPercent
    end sub
