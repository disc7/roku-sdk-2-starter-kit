sub init()

  m.streamInfoTimer = m.top.findNode("streamInfoTimer")
  m.streamInfoTimer.control = "start"
  m.streamInfoTimer.observeField("fire", "onStreamInfoTimerFired")
  m.streamInfoLabel = m.top.findNode("streamInfoLabel")

  videocontent = createObject("RoSGNode", "ContentNode")
  videocontent.title = "Live DRM playout spike"
  videocontent.streamformat = "mp4"
  videocontent.live = "true"
  ' videocontent.adaptiveMinStartBitrate = "288000"
  ' videocontent.adaptiveMaxStartBitrate = "448000"
  ' videocontent.url = "https://s3-eu-west-1.amazonaws.com/uk.livesport/rugby.mp4"

  videocontent.url = "http://teststreams.livesport-massive.com/out/u/Smooth-Live.ism/Manifest"
  videocontent.streamformat = "ism"

  ' videocontent.url = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
  ' videocontent.url = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
  ' videocontent.streamformat = "dash"

  ' VOD WORKING:::'
  ' videocontent.url = "https://dc1livedazn-a.akamaihd.net/out/u/encr_6487554896_6fa35384272e416d851c50b0e4ddf363.ism/Manifest"
  ' videocontent.encodingKey = "https://playready.entitlement.theplatform.eu/playready/rightsmanager.asmx?schema=1.0&auth=OUeb5OuK5LEAOSNuKpV8URC48BDMUAC0&releasePid=JkwEd_MXJ0yW&account=http%3a%2f%2faccess.auth.theplatform.com%2fdata%2fAccount%2f2689352799"
   ' LIVE WORKING::::'
  ' videocontent.url = "https://dc1-live2mss-perform.secure.footprint.net/out/u/encr_6749186859_1e318fe609544e67aebd2875c5281b5a.ism/Manifest"
  ' videocontent.encodingKey = "https://playready.entitlement.theplatform.eu/playready/rightsmanager.asmx?schema=1.0&auth=6Hs9nE8OSx6CTYNguqVasTAu4NCeUDBe&releasePid=a8seSSw9_j3_&account=http%3a%2f%2faccess.auth.theplatform.com%2fdata%2fAccount%2f2689352799"
  ' videocontent.streamBitrates = [0] // Must be used in conjunction with StreamUrls and StreamQualities.
  ' videocontent.streamformat = "ism"
  ' videocontent.encodingType = "PlayReadyLicenseAcquisitionUrl"

  m.video = m.top.findNode("Video")
  m.video.content = videocontent
  m.video.setFocus(true)
  m.video.control = "play"
  m.video.observeField("state", "onVideoPlayerStateChange")

  m.top.backgroundURI = ""
  m.top.backgroundColor = "0x080808FF"

  rowlist = m.top.findNode("railGroup")
  rowlist.content = CreateObject("roSGNode", "RailGroupContent")

  m.top.setFocus(true)
  ' m.video.setFocus(true)
end sub

sub onVideoPlayerStateChange()
    ' m.video.mute = true
    print "==== onVideoPlayerStateChange: " + m.video.state

    ' if (m.video.streamInfo <> Invalid and m.video.streamInfo.measuredBItrate <> Invalid)
    '   print "==== measuredBItrate: "
    '   print m.video.streamInfo.measuredBItrate
    ' end if

    ' if (m.video.streamInfo <> Invalid and m.video.streamInfo.streamBitrate <> Invalid)
    '   print "==== streamBitrate: " + str(m.video.streamInfo.streamBitrate)
    ' end if

    if m.video.state = "error"
      if (m.video.errorCode <> Invalid)
        print "==== errorCode: " + str(m.video.errorCode)
      end if
      if (m.video.errorMsg <> Invalid)
        print "==== errorMsg: " + m.video.errorMsg
      end if
        m.video.visible = false
    else if m.video.state = "playing"
        print "==== timeToStartStreaming: " + str(m.video.timeToStartStreaming)
        print "==== streamBitrate: " + str(m.video.streamInfo.streamBitrate)
        ' m.streamInfoLabel.text = "Current streamBitrate: " + str(m.video.streamInfo.streamBitrate)
        m.video.visible = true
    else if m.video.state = "finished"
        m.video.visible = false
    end if
end sub

sub onStreamInfoTimerFired()
  print "==== streamBitrate: " + str(m.video.streamInfo.streamBitrate)
  ' m.streamInfoLabel.text = "Current streamBitrate: " + str(m.video.streamInfo.streamBitrate)
end sub
