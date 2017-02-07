sub init()

  videocontent = createObject("RoSGNode", "ContentNode")
  videocontent.title = "Bg Video"
  videocontent.streamformat = "mp4"
  videocontent.url = "http://roku.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/f8de8daf2ba34aeb90edc55b2d380c3f/b228eeaba0f248c48e01e158f99cd96e/rr_123_segment_1_072715.mp4"
  m.video = m.top.findNode("Video")
  m.video.content = videocontent
  m.video.setFocus(true)
  m.video.control = "play"
  m.video.observeField("state", "OnVideoPlayerStateChange")

  m.top.backgroundURI = ""
  m.top.backgroundColor = "0x080808FF"

  rowlist = m.top.findNode("railGroup")
  rowlist.content = CreateObject("roSGNode", "RailGroupContent")

  m.top.setFocus(true)
end sub

sub OnVideoPlayerStateChange()
    m.video.mute = true
    print "==== OnVideoPlayerStateChange: " + m.video.state
    if m.video.state = "error"
        m.video.visible = false
    else if m.video.state = "playing"
        m.video.visible = true
    else if m.video.state = "finished"
        m.video.visible = false
    end if
End Sub
