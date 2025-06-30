::  kibbitz frontend
::
/-  *kibbitz
/+  rudder
::
^-  (page:rudder [kibbitz @t (list @t) (map)] [~ @t])
|_  [bowl:gall order:rudder =kibbitz @t avoid=(list @t) (map)]
++  argue
  |=  [head=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder [~ @t])
  ?~  body  ~
  =/  args=(map @t @t)
    (frisk:rudder q.u.body)
  ?~  what=(~(get by args) 'kibbit')
    ~
  ?:  (lte (met 3 u.what) 1)
    'like a fart in the wind'
  ?:  (gth (met 3 u.what) 1.024)
    'your tirade falls on deaf ears'
  [~ u.what]
::
++  final
  |=  [done=? =brief:rudder]
  ?:  =('an anomaly warps and twists your voice...' brief)
    =+  r=(~(got by (frisk:rudder q:(need body.request))) 'kibbit')
    (build ['kibbit' r]~ `[done ?>(?=(@t brief) brief)])
  ((alert:rudder (cat 3 '/' dap) build) done brief)
::
++  build
  |=  $:  arg=(list [k=@t v=@t])
          msg=(unit [o=? =@t])
      ==
  ^-  reply:rudder
  =/  title=tape
    "kibbitz"
  |^  [%page page]
  ::
  ++  style
    '''
    * { margin: 0.1em; padding: 0; color: #333; font-family: 'Orbitron', sans-serif; box-sizing: border-box; }
    .status, .warn { margin: 0.1em; clear: both; }

    body {
      height: 100vh;
      min-height: 100%;
      width: 100vw;
      text-align: center;
      overflow-x: hidden;
      background-color: #f0f0f0;
      display: flex;
      flex-direction: column;
      margin: 0;
    }

    h1 {
      font-weight: lighter;
      margin-top: 0.1em;
      font-size: 1.0em;
    }

    .container {
      width: 95vw;
      margin: 0 auto;
      padding: 0.1em 0.1em 2.5em 0.1em;
      flex: 1;
      min-height: 100%;
      display: flex;
      flex-direction: column;
    }

    #listing {
      display: flex;
      flex-direction: column;
      padding: 0.1em;
      text-align: left;
      flex: 1;
      min-height: 100%;
      overflow-y: auto;
      scroll-behavior: auto;
      overflow-anchor: none;
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
    #listing::-webkit-scrollbar {
      display: none;
    }
    .kibbit {
      display: grid;
      grid-template-columns: 110px 1fr;
      margin-bottom: 0.17em;
      text-shadow: 1px 1px 3px rgb(0 0 0 / 15%);
      letter-spacing: 0.1px;
    }
    .user-info {
      display: flex;
      flex-direction: column;
      align-items: flex-end;
    }
    .username {
      font-weight: bold;
      font-size: 0.8em;
      overflow: hidden;
      text-overflow: ellipsis;
      text-align: right;
    }
    .timestamp {
      font-size: 0.5em;
      color: #555;
      text-align: right;
      margin-top: 0.05em;
    }
    .message {
      padding-left: 0.5em;
    }

    form {
      position: fixed;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80vw;
      max-width: 500px;
      z-index: 1;
    }

    input {
      background-color: #fff;
      padding: 0.25em;
      width: 100%;
      border-radius: 0.5em;
      border: 0.1em dashed #ccc;
      font-size: 1.0em;
      color: #333;
    }
    .help-icon {
      position: fixed;
      top: 0.5em;
      right: 0.5em;
      cursor: pointer;
      font-size: 1.2em;
      z-index: 3;
    }
    .tooltip {
      display: none;
      position: absolute;
      top: 2em;
      right: 0;
      width: 500px;
      background-color: #ccc;
      color: #333;
      padding: 0.5em;
      border: 0.1em solid #999;
      border-radius: 0.3em;
      font-size: 0.6em;
      text-align: left;
      z-index: 3;
    }
    .help-icon:hover .tooltip {
      display: block;
    }
    .tooltip p {
      margin: 0.2em 0;
    }
    @media (prefers-color-scheme: dark) {
    * { color: #ddd; }
    body {
      background-color: #1a1a1a;
    }
    .kibbit {
      text-shadow: 1px 1px 3px rgb(255 255 255 / 15%);
    }
    .timestamp {
      color: #aaa;
    }
    input {
      background-color: #333;
      color: #ddd;
      border: 0.1em dashed #555;
    }
    .tooltip {
      background-color: #444;
      color: #ddd;
      border: 0.1em solid #666;
    }
    }
    '''
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"{title}"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;style:"{(trip style)}"
      ==
      ;body
        ;div.help-icon
          ;span:"?"
          ;div.tooltip
            ;p:"kibbitz depends on %pals.  download it from ~paldev."  
            ;p:"kibbitz is a reskin of %rumors by ~paldev with an added field for @p."
            ;p:"messages are not signed.  a displayed username is no guarantee of message origination."
            ;p:"don't expect this app to be upgraded or necessarily to work."
            ;p:"the page refreshes automatically on message send, but does not refresh on message receipt."
            ;p:"like i said it's a hacky reskin of %rumors what do you want."
          ==
        ==

        ;+  ?:  pals-installed  :/""
            dependency-warning

        ;div.container
          ;+  listing
          ;+  input
          ;script:"document.getElementById('listing').scrollTop = document.getElementById('listing').scrollHeight; document.getElementById('kibbit-input').focus();"
        ==
      ==
    ==
  ::
  ++  pals-installed  ~+
    .^(? %gu /(scot %p our)/pals/(scot %da now)/$)
  ::
  ++  mutuals  ~+
    .^((set ship) %gx /(scot %p our)/pals/(scot %da now)/mutuals/noun)
  ::
  ++  dependency-warning
    ^-  manx
    ;p.warn
      ; this app requires %pals for peer discovery.
      ;a(href "/apps/grid/perma/~paldev/pals/"):"install it from ~paldev/pals."
    ==
  ::
  ++  status
    ^-  manx
    ?~  msg  :/""
    ;p.status:"{(trip t.u.msg)}"
  ::
  ++  input
    ^-  manx
    =/  value=tape
      ?.  ?=([[%kibbit @] *] arg)  ""
      (trip v.i.arg)
    ;form(method "post")
      ;input
        =id            "kibbit-input"
        =type          "text"
        =name          "kibbit"
        =required      ""
        =placeholder   "say"
        =autocomplete  "off"
        =value         value;
    ==
  ::
  ++  listing
    ^-  manx
    ;div#listing
      ;*  ?~  kibbitz  ;+  ;i:"it's strangely quiet..."
          =/  n=@ud  0
          %-  flop
          |-  ^-  marl
          ?:  (gte n 250)  ~
          ?:  (lth when.i.kibbitz (sub now ~d14))  ~
          ?:  %+  lien  avoid
              |=(=@t ?=(^ (find (trip t) (cass (trip what.i.kibbitz)))))
            ?~  t.kibbitz  ~
            $(kibbitz t.kibbitz)
          =*  w  when.i.kibbitz
          =.  w  (sub w (mod w ~s1))
          :-  ;div.kibbit(title (scow %da w))
                ;div.user-info
                  ;span.username:"{(scow %p who.i.kibbitz)}"
                  ;span.timestamp:"{(timestamp w)}"
                ==
                ;span.message:"{(trip what.i.kibbitz)}"
          ==
          ?~  t.kibbitz  ~
          $(kibbitz t.kibbitz, n +(n))
    ==
  ::
  ++  timestamp  
    |=  w=@da  
    =+  (yell (sub now w)) 
    ;:  weld
      ?:  =(h 0)
        ~
      (weld (scow %ud (add (mul 24 d) h)) "h ")
      (scow %ud m)  "m"
    ==
  ++  prompt
    =-  (snag (~(rad og eny) (lent -)) -)
    ^-  (list tape)
    :~  "say"
    ==
  --
--