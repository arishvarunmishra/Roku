' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
    'initializing the currentFocus id
    m.currentFocusID =""
    'here set the ids of element and respective direction focusable element id 
    '==>>> format=>>> elementId:up-down-left-right
    m.focusIDArray = {"button1":"N-button2-N-button3",
                      "button2":"button1-N-N-button4",
                      "button3":"N-button4-button1-N",
                      "button4":"button3-N-button2-N"}
                      
    m.button1 = m.top.findNode("button1")
    m.button1.SetFocus(true)
    setFocusId(m.button1)
    
End sub

function button1Click()
    print "button1Click"
end function

function button2Click()
    print "button2Click"
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if(press)
        handleFocus(key)
    end if
        return true 
end function



function handleFocus(keyEvent)
      focusID = getFocusId()
      id =focusID.Split("-") 
      if(keyEvent = "up") then
         changeFocus(id[0])
      else if(keyEvent = "down") then
          changeFocus(id[1])
      else if(keyEvent = "left") then
           changeFocus(id[2])
      else if(keyEvent = "right") then      
           changeFocus(id[3])
      end if
end function


function changeFocus(focusNodeId)
    if(focusNodeId <> invalid and focusNodeId <> "N" )
        focusEle = m.top.findNode(focusNodeId)
        focusEle.SetFocus(true)
        setFocusId(focusEle)
     end if 
end function

function setFocusId(focusNode)
    m.currentFocusID = focusNode.id
end function

function getFocusId()
     return m.focusIDArray[m.currentFocusID]
end function
