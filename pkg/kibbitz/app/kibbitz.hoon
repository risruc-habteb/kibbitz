::  kibbitz: chat with friends of friends
::
::    fiction and falsehood, or a glimpse of the truth?
::    say it loudly enough for the whole network to hear!
::
::    to scry all known kibbitz out of this agent:
::    .^((list [when=@da what=@t]) %gx /=kibbitz=/kibbitz/noun)
::
::    to be notified of new kibbitz as they come in, %watch on /kibbitz.
::    %facts will have the %kibbit mark, unpack to [when=@da what=@t].
::
/-  *kibbitz
/+  gossip, rudder, default-agent,
    markov, pals
::
/~  pages  (page:rudder [kibbitz @t (list @t) (map)] [~ @t])  /app/kibbitz/webui
::
/$  grab-kibbit  %noun  %kibbit
::
|%
+$  state-0
  $:  %0
      fresh=kibbitz  ::TODO  prune
      ditto=@t
      avoid=(list @t)
      tokes=nums:markov
  ==
::
+$  eyre-id  @ta
+$  card     card:agent:gall
--
::
=|  state-0
=*  state  -
::
%-  %+  agent:gossip
      [2 %anybody %anybody &]
    %+  ~(put by *(map mark $-(* vase)))
      %kibbit
    |=(n=* !>((grab-kibbit n)))
^-  agent:gall
::
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card _this)
  :_  this
  [%pass /eyre/connect %arvo %e %connect [~ /[dap.bowl]] dap.bowl]~
::
++  on-save  !>(state)
::
++  on-load
  |=  ole=vase
  ^-  (quip card _this)
  =/  old=state-0  !<(state-0 ole)
  :_  this(state old)
  ?~  fresh.old  ~
  (update-widget bowl what.i.fresh.old)
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(src our):bowl
  ?+  mark  (on-poke:def mark vase)
    ::  %noun: misc bespoke self-management
    ::
      %noun
    ?+  q.vase  !!
      [%avoid ~]  [~ this(avoid ~)]
      [%avoid @]  [~ this(avoid [(crip (cass (trip +.q.vase))) avoid])]
    ==
  ::
    ::  %handle-http-request: incoming from eyre
    ::
      %handle-http-request
    =;  out=(quip card _+.state)
      [-.out this(+.state +.out)]
    %.  [bowl !<(order:rudder vase) +.state]
    %-  (steer:rudder _+.state ,[~ @t])
    :^    pages
        (point:rudder /[dap.bowl] & ~(key by pages))
      (fours:rudder +.state)
    |=  [~ new=@t]
    ^-  $@(brief:rudder [brief:rudder (list card) _+.state])
    ?:  =(ditto new)
      ['your voice echoes...' ~ +.state]
    =/  chance=@ud  (~(rad og eny.bowl) 6)
    ?:  ?&  (gth now.bowl ~2025.4.1)
            (lth now.bowl ~2025.4.2..06.00.00)
            (lth chance 3)
            !=('FOOL! ' (end 3^6 new))
        ==
      =;  wat=@t
        =/  =kibbit  [now.bowl our.bowl wat]
        :+  'an anomaly warps and twists your voice...'
          [(invent:gossip %kibbit !>(kibbit)) (update-widget bowl new)]
        [[kibbit fresh] ditto avoid tokes]
      =+  t=(trip new)
      ?+  chance  !!
          %0
        =+  n=(cuss t)
        ?.  =(n t)  (crip n)
        (crip (cass t))
      ::
          %1
        =+  p=~(tap in (~(put in ~(leeches pals bowl)) ~zod))
        =+  w=(snag (~(rad og eny.bowl) (lent p)) p)
        =+  r=(~(rad og +(eny.bowl)) 3)
        %-  crip
        ?+  r  !!
          %0  "{(scow %p w)} here, {t}"
          %1  "{t} - with love, from {(scow %p w)}"
          %2  "{t} - {(scow %p w)}"
        ==
      ::
          %2
        =+  f=(find " " t)
        =+  g=generate:markov
        =?  g  ?=(^ f)
          =+  n=(crip (cass (scag u.f t)))
          ?.  (~(has by tokes) n)  g
          g(p n)
        (g eny.bowl tokes)
      ==
    =/  =kibbit  [now.bowl our.bowl new]
    :+  'saying...'
      [(invent:gossip %kibbit !>(kibbit)) (update-widget bowl new)]
    [[kibbit fresh] new avoid tokes]
  ==
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?:  ?=([%http-response *] path)         [~ this]
  ?:  &(=(/kibbitz path) =(our src):bowl)  [~ this]
  ?.  =(/~/gossip/source path)
    (on-watch:def path)
  :_  this
  %-  flop
  =|  n=@ud
  |-
  ?~  fresh  ~
  ?:  (gth n 5)  ~
  :-  [%give %fact ~ %kibbit !>(i.fresh)]
  $(fresh t.fresh, n +(n))
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ~|  wire
  ?:  ?=([%profile %widget @ ~] wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  p.sign  [~ this]
    %.  [~ this]
    (slog (cat 3 'kibbitz: failed to update widget %' i.t.t.wire) u.p.sign)
  ::
  ?.  ?&  =(/~/gossip/gossip wire)
          ?=(%fact -.sign)
          =(%kibbit p.cage.sign)
      ==
    ~&  [dap.bowl %strange-sign wire sign]
    (on-agent:def wire sign)
  =+  !<(=kibbit q.cage.sign)
  ::  ignore kibbitz from the far future
  ::
  ?:  (gth when.kibbit (add now.bowl ~h1))
    [~ this]
  ::  1.024 bytes should be enough for anyone
  ::
  ?:  (gth (met 3 what.kibbit) 1.024)
    [~ this]
  ::  ignore kibbitz that contain content from the avoid-list
  ::
  ?:  ?:  =(~ avoid)  |
      %+  lien  avoid
      |=  =@t
      ?=(^ (find (trip t) (cass (trip what.kibbit))))
    [~ this]
  :-  [[%give %fact [/kibbitz]~ %kibbit !>(kibbit)] (update-widget bowl what.kibbit)]
  =-  this(fresh -)
  |-  ^+  fresh
  ?~  fresh  [kibbit ~]
  ?:  (gte when.kibbit when.i.fresh)
    [kibbit fresh]
  [i.fresh $(fresh t.fresh)]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?.  ?=([%x %kibbitz ~] path)  [~ ~]
  ``noun+!>(fresh)
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  sign-arvo  (on-arvo:def wire sign-arvo)
      [%eyre %bound *]
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    [~ this]
  ==
::
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
::
|%
++  update-widget
  |=  [=bowl:gall kibbit=@t]
  ^-  (list card)
  ?.  .^(? %gu /(scot %p our.bowl)/profile/(scot %da now.bowl)/$)
    ~
  =;  widget=[%0 desc=@t %marl marl]
    =/  =cage  noun+!>([%command %update-widget %kibbitz %latest widget])
    [%pass /profile/widget/latest %agent [our.bowl %profile] %poke cage]~
  :^  %0  'Most recently overheard kibbit'  %marl
  :~  =;  keyframes=cord
        ;style:"{(trip keyframes)}"
      '''
      #kibbitz--latest {
        border-radius: 40px;
        overflow: hidden;
        background: none; padding: 0;
      }
      @-webkit-keyframes kibbitzbg {
        0%{background-position:51% 0%}
        50%{background-position:50% 100%}
        100%{background-position:51% 0%}
      }
      @-moz-keyframes kibbitzbg {
        0%{background-position:51% 0%}
        50%{background-position:50% 100%}
        100%{background-position:51% 0%}
      }
      @keyframes kibbitzbg {
        0%{background-position:51% 0%}
        50%{background-position:50% 100%}
        100%{background-position:51% 0%}
      }
      '''
    ::
      ;div
        =style  """
                position: absolute;
                top: 0.5em;
                width: 100%;
                text-align: center;
                color: white;
                opacity: 0.5;
                font-size: 0.8em;
                """
        ; kibbit has it that...
      ==
    ::
      ;div
        =style  """
                padding: 30px 30px 15px;

                color: #fff0ff;
                font-family: sans-serif;
                text-shadow: 1px 1px 3px rgb(0 0 0 / 15%);
                letter-spacing: 0.1px;
                text-align: center;

                background-image: linear-gradient(345deg, #df7bdf, #847bde, #e5a0a0, #8199dc);
                background-size: 800% 800%;
                background-attachment: fixed;

                -webkit-animation: kibbitzbg 60s ease infinite;
                -moz-animation: kibbitzbg 60s ease infinite;
                animation: kibbitzbg 60s ease infinite;
                """
        ;span:"{(trip kibbit)}"
      ==
  ==
--
