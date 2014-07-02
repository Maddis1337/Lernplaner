callback = (event) ->
  console.log event
  opt = {
    type: "basic",
    title: "Seite geladen!",
    message: event.url,
    iconUrl: "images/calendar-icon_128.png"
  }
  chrome.notifications.create 'superId'+Math.random(), opt, () ->
    console.log 'notification callback!'


chrome.tabs.onUpdated.addListener ((event,changeInfo, tab) ->
  blocked = ['kaleydra.de','facebook.com','www.facebook.com']


  if changeInfo.status == 'complete'
    url = new URL(tab.url)

    if url.hostname in blocked
      opt = {
        type: "basic",
        title: "Wolltest du nicht lernen?",
        message: 'Nicht ablenken lassen!',
        iconUrl: "images/calendar-icon_128.png"
      }
      badtab = []
      battab.push tab.id
      chrome.notifications.create 'superId'+Math.random(), opt, () ->
        console.log 'notification callback!'
 )

chrome.tabs.onRemoved.addListener((tab, changeInfo) ->

)


