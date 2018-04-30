%%% 320-321.png
%%% Hymn 203 What are these that glow from afar
%%% Version 1

\version "2.10"

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a note pair straddles a longer note and when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%% Same as above but moves a smaller amount	      
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.4 
              \once \override Stem #'X-offset = #-1.4 }	      
	      
%% Shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }	      

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%% Because of the irregular meter, some lyrics need to be aligned to alternate notes which are
%% in the "melodybottom" voice.  Sometimes these alternative notes are smaller in size.  Within
%% a given verse, the lyric alignment can flip several times between the top melody (in "melodytop") or 
%% the alternate(melodybottom) here the below macros to set lyric alignment to the top or the bottom melody voice.
       
top = {\set associatedVoice = melodytop}

bot = {\set associatedVoice = melodybottom}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions	

\header {
  dedication = \markup { \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
                         \hspace #0.1 }}	
  
  title = \markup { "203" }
  
  meter = \markup { \small { \column { \line { \sans "YMDAITH MWNGC." \hspace #1 \roman " (Irreg.)" } 
                            \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"4" #0.5 "= 96." } } }} }
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Christina G. Rossetti, 1830-94." }
                            \line { \italic "Welsh Traditional Melody." }
                } } }
   
  tagline =""
}


global = {
  \time 4/4 	
  \key  ees \major	
  \set Staff.midiInstrument = "church organ" 
}


melodytop = \relative c' { 
  \stemUp \autoBeamOff 
  \tag #'Tune { ees4^\markup { \hspace #-4 \italic "Voices in unison."} c8.[ d16] ees4. ees8 | bes'4 g8. aes16 \movenote #2 bes2 | \break       
  g4 c8 c8 g4 f8 ees8 | d4 f4 ees4( d4) | c4 c8. d16 \bar "" \break
  ees4. ees8 | bes'4 g8 g8 ees'4. ees8 | \stemDown d4. d8 c4. c8 | \break
  
  %%page 2
  \stemUp bes4 g4 g2 \bar "||" bes4 bes4 ees8 ees8 ees4 | d4 d8[ c8] bes2 | \break
  g4 c4 c4 bes8 bes8 | aes4 g8[ aes8] f2 | bes8.[ aes16] g8.[ aes16] bes4 bes8 bes8 | \break
  f8[ ees8] d8 ees8 f2 | ees4 c8 c8 g'4. f8 | ees4 c4 c2 \bar "||" 
  }
  \tag #'Amen { \cadenzaOn f1 e!1 \bar "||" }
}


melodybottom = \relative c' {
  \stemDown \autoBeamOff	
  \override Staff.NoteCollision #'merge-differently-dotted = ##t		
  \tag #'Tune { ees8. \smallnote ees16 s4 s4 s4 | bes'8. \smallnote bes16 \augdots g8.[ aes16]  \once \override Dots #'extra-offset = #'(-2.8 . 0.0) \movenote #-0.4  \smallnote bes4. \smallnote bes8   |
  s4 c4 s4 f,8[ ees8] | s4 s4 s4 d8 \smallnote d8 | s4 c8.[ d16] \bar "" 
  ees4 \smallnote ees8 ees8 | s4 g4 << { \voiceTwo \autoBeamOff ees'4 \smallnote ees8 ees8 } \\ { \voiceFour \movenote #-2 ees2 } >>| s1 |
  
  %%page 2
  s4 g,8 \smallnote g8 s2 \bar "||" s4 bes8 \smallnote bes8 ees4 ees8 \smallnote ees8 | d8 \smallnote d8 d8 c8 \once \override Dots #'extra-offset = #'(-2.8 . 0.0) \movenote #-3.2  \smallnote bes4. \smallnote bes8 |
  s4 c8 \smallnote c8 s4 bes4 | s4 s4 \movenote #-2 \smallnote f4 \smallnote f8 \smallnote f8 | s4 s4 s4 bes4 |
  s4 d,8[ ees8] \once \override Dots #'extra-offset = #'(-2.6 . 0.0) \movenote #-3.2  \smallnote f4. \smallnote f8 | s4 c4 g'4. f8 | s1 \bar "||" 
  }
  \tag #'Amen { \cadenzaOn s1 s1 \bar "||" } 
}	


soprano = \relative c' {
  \autoBeamOff	
  \tag #'Tune { <c ees>4 c8.[ d16] <c ees>4. <c ees>8 | <bes d bes'>4 g'8.[ aes16] <f bes>2 |
  <c ees g>4 c'4 <c, ees g>4 <b! f'>8[ <c ees>8] | <aes c d>4 <aes f' c>4 <g b! ees>4 <f b d>4 | <g c>4 c8. d16 \bar ""
  <c ees>4. <c ees>8 | <bes f' bes>4 <bes ees g>4 <ees ees'>4. <ees ees'>8  | <f bes d>4. <f bes d>8 <ees g c>4. <ees g c>8  | 
  
  %%page 2
  <d g bes>4 <c ees g>4 <bes d g>2 \bar "||" <ees g bes>4 bes'4 ees4 ees4 | <f, bes d>4 d'8[ c8] <d, g bes>2 |
  <c g'>4 <ees g c>8[ c'8] <d, c'>4 <d bes'>8[ <f bes>8]  | <c ees aes>4 <c ees g>8[ aes'8] f2 | <g bes>8.[ <f aes>16 <ees g>8. <f aes>16] <g bes>4 bes4  |
  <d, f>8[ <c ees>8] d8[ ees8] <d f>2 | <c ees>4 c8 c8 <g c g'>4. <aes c f>8 | <g c ees>4 <f c'>4 <g c>2 |  
  }
  \tag #'Amen { \cadenzaOn f'1 e1 \bar "||"  }
}

alto = \relative c' { 
  \autoBeamOff	
  \override Staff.NoteCollision #'merge-differently-dotted = ##t
  \tag #'Tune { s4 c4 s4 s4 | s4 ees4 \straddle ees4 d4 |
  s4 <c ees>4 s4 s4 | s1 | s4 g4 \bar ""
  s2 | s4 s4 bes'4 a4 | s1 | 
  
  %%page 2
  s1 \bar "||" s4 <ees g>4 <g bes>4 <g bes>4 | s4 <f aes>4 s2 |
  s4 s4 g4. f8 | s4 s4 \straddle ees4 d4 | ees4 ees4 ees4 <bes ees>4 |
  bes4 bes4 \straddle c4 b4 | s1 | s1 |  
  }
  \tag #'Amen { \cadenzaOn c1 c1 \bar "||"  }
}

tenor = \relative c { 
  \tag #'Tune { g'4 ees8.[ f16] g4. g8 | <d g>4 ees4 f2 |
  ees4 aes4 g2 | s4 s4 s4 g,4 | s4 ees'8.[ f16] \bar ""
  g4. g8 | s4 s4 g4 a4 | \smallnote bes4. \smallnote bes8 \smallnote c4. \smallnote c8 | 
  
  %%page 2
  \smallnote d4 \smallnote g,4 \smallnote g2 \bar "||" s1 | s1 |
  ees8[ d8 ees8 c8] g4 g4 | c4 aes4 f'2 | g4 bes4 ees,4 ees4 |
  d4 f4 f2 | g4 ees8[ f8] s4 s4 | s4 c4 ees2 |  
  }
  \tag #'Amen { \cadenzaOn aes1 g1 \bar "||" }
}

bass = \relative c { \clef bass 
  \tag #'Tune { c4 c4 c4. c8 | g4 c4 bes2 |
  c4 aes4 c4 d8[ ees8] | f4 d4 g4 s4 | <c, ees>4 c4  \bar ""
  c4. c8 | <d f>4 <ees g>4 c2 | bes4 d4 ees4 c4  | 
  
  %%page 2
  g4 c4 g2 \bar "||" <ees' g>4 <ees g>8[ <f aes>8] <g bes>8[ <f aes>8 <g bes>8 <aes c>8] | <bes d>4 f4 g4 f4 |
  s1 | s4 s4 bes,2 | <ees, ees'>2 ees'4 g,4  |
  bes2 \smallstraddle aes4 g4 | c4 bes8[ aes8] ees4. f8 | g4 aes4 c,2 |  
  }
  \tag #'Amen { \cadenzaOn f'1 c1 \bar "||"  }
}

wordsOne = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  "1  What" "are . . ." these that glow from a -- far,
  These that lean ov -- er the gol -- den "bar, . . ." Strong as the
  li -- on, pure as the dove, With o -- pen arms, and

  hearts of love? They the bless -- èd ones gone be  --  fore,
  They the bless -- èd for e -- ver -- more; Out of great tri -- bu -- la -- tion 
  they went Home to their home of heaven con -- tent.
}

wordsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  "2  What" "are . . ." these that fly as \bot "a   "  cloud, \top With
  flash -- ing \skips #1 heads and \skips #1 fa -- ces bowed; \bot In "their . . ."
  mouths a \top vic -- to -- rious \skips #1 psalm, \skips #1 In their hands a

  \bot robe and \top a palm? Wel -- com -- ing An -- gels these "that . . ." shine,
  Your own An -- gel and yours, and mine; Who have hedged us, both
  \bot day \top "and . . ." \skips #1 night On the left hand and on the right.
}

wordsThree = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  "3  Light" \top a -- "bove . ."  light, \bot and bliss   be -- yond bliss,  \top Whom
  words can  --  not ut  --  ter, lo, who is \bot this? As \top a \bot King with
  ma -- \skips #1 \top ny crowns he \skips #1 \once \override LyricText #'self-alignment-X = #-0.6 "stands, And" our names are grav'n up --  on
  
  his hands; As a Priest, \skips #1 with \bot God -- up -- lift -- ed eyes, \top He
  \bot off -- ers \top for us his \skips #1 Sac -- ri -- \bot fice; As \top the Lamb of \top God, for \skips #1 
  \bot sin -- ners slain, \top That we too may live, he lives a -- gain.
}

wordsFour = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.8
  "4.  God" "the . . ." Fa -- ther give \bot us grace \top To
  walk in the light  of  \skips #1 Je -- su's "face; . . ." God "  the" \skips #1
  Son give us a \skips #1 part \once \override LyricText #'self-alignment-X = #1 "In   the" hi -- ding -- place of

  Je -- su's heart; God the Spi -- rit so hold    "us . . ." \bot \once \override LyricText #'self-alignment-X = #1 "up    " \top That
  we may drink of \skips #1 Je -- su's cup; God al -- migh -- ty,
  \skips #1 God Three in One, God Al -- \skips #1 migh -- ty, God a -- lone. A -- men.
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% Score block to generate the visual layout but not the midi	
	
\score{
\new ChoirStaff	
<<   
    <<
        \context Staff = melody <<
	\context Voice = melodytop { \voiceOne \global \melodytop }
	\context Voice = melodybottom { \voiceTwo \global \melodybottom}
                                >>
				
	\new Lyrics \lyricsto "melodytop" \wordsOne
	\new Lyrics \lyricsto "melodytop" \wordsTwo
	\new Lyrics \lyricsto "melodybottom" \wordsThree
	\new Lyrics \lyricsto "melodytop" \wordsFour
				
	\new PianoStaff  
	                  <<  
	   \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\smallCaps "Organ."   } } 
	    \context Staff =  upper  
	                     << 
			     \context Voice = "sopranos" {  
			           \voiceOne \global \soprano }
	                     \context Voice = "altos"   { 
	                          \voiceTwo \global \alto }
	                      >>
	    \context Staff = lower 
	                            <<
	     \context Voice = "tenors" { 
	                           \voiceOne \global \tenor }
	     \context Voice = "basses" { 
	                           \voiceTwo \global \bass }
			            >> 
		              >>	      
    >>
>> 
\layout {       
	        indent = 2.5\cm
		\context { \Score \remove "Bar_number_engraver" }		        
		\context { \PianoStaff \remove "Span_bar_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		
		%%%Lilypond tended to put the staffs too close together. This next setting spreads it a little to match the image
		\context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'(-6 . 6) }
	}	
}


%%% A separate score block to generate the midi for the Main tune without the Amen
%%% Since the melodybottom voice is there merely to provide alternative notes for variations in the lyrics, it
%%% has been commented out so that the main melody is not muddled up. You can uncomment it if you wish.


\score{
\new ChoirStaff	
<<   
    <<
        \context Staff = melody <<
	\context Voice = melodytop { \voiceOne \global \removeWithTag #'Amen \melodytop }
%	\context Voice = melodybottom { \voiceTwo \global \removeWithTag #'Amen \melodybottom}
                                >>		
	\new PianoStaff  
	                  <<  
	   \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\smallCaps "Organ."   } } 
	    \context Staff =  upper  
	                     << 
			     \context Voice = "sopranos" {  
			           \voiceOne \global \removeWithTag #'Amen \soprano }
	                     \context Voice = "altos"   { 
	                          \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>
	    \context Staff = lower 
	                            <<
	     \context Voice = "tenors" { 
	                           \voiceOne \global \removeWithTag #'Amen \tenor }
	     \context Voice = "basses" { 
	                           \voiceTwo \global \removeWithTag #'Amen \bass }
			            >> 
		              >>	      
    >>
>> 

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  
}


%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<   
    <<
        \context Staff = melody <<
	\context Voice = melodytop { \voiceOne \global \keepWithTag #'Amen \melodytop }
	\context Voice = melodybottom { \voiceTwo \global \keepWithTag #'Amen \melodybottom}
                                >>		
	\new PianoStaff  
	                  <<  
	   \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\smallCaps "Organ."   } } 
	    \context Staff =  upper  
	                     << 
			     \context Voice = "sopranos" {  
			           \voiceOne \global \keepWithTag #'Amen \soprano }
	                     \context Voice = "altos"   { 
	                          \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>
	    \context Staff = lower 
	                            <<
	     \context Voice = "tenors" { 
	                           \voiceOne \global \keepWithTag #'Amen \tenor }
	     \context Voice = "basses" { 
	                           \voiceTwo \global \keepWithTag #'Amen \bass }
			            >> 
		              >>	      
    >>
>> 

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  
}

} %%book bracket
