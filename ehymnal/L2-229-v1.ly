%%% 358a.png
%%% Hymn 229
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE VISITATION"
		\hspace #0.1 }}	

  title = "229"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }


%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }
	   		
%%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t


%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 
  a'8 a a \[ g \flexa f \] g a a d, \bar "|" f g e f d c d \bar "|" \break
  f d e f g a \[ \virga g \inclinatum f \inclinatum e \] d \bar "|" e f e d e d c \bar "|" \break
  a \[ c \pes d \] d \[ d \flexa c \] f g g f \bar "|" a g \[ f \flexa e \] \[ f \pes g \inclinatum f \inclinatum e \] d c d \bar "||"
}} 
  
%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

amenglobal = {
  \key bes \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  d'8 d d c[ bes] c d d g, \bar "|" bes c a bes g f g \bar "|" \break
  bes g a bes c d c[ bes a] g \bar "|" a bes a g a g f \bar "|" \break
  d f[ g] g g[ f] bes c c bes \bar "|" d c bes[ a] bes[ c bes a] g f g \bar "||" 
}


alto = \relative c' {
	\autoBeamOff
  f8 g f ees[ d] \ln f4 f8 ees! \bar "|" f ees! c d bes d ~ d \bar "|"
  f c \brevenote f\breve *1/4 ~ \ln f4. d8 \bar "|" \ln f4. d8 f \noacci e c \bar "|"
  bes c[ d] ees! ees[ f] d g f d \bar "|" f f \ln d4 ~ d8[ ees!] f~[ f] ees! d d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  bes'8 bes a \ln g4 a8 a bes bes \bar "|" bes g f ~ f g bes bes \bar "|"
  bes c c bes f bes a[ d c] bes \bar "|" \ln d4 c8 d c c a \bar "|"
  f f[ bes] bes \ln bes4 ~ bes8 g a bes \bar "|" bes a d[ c] bes[ a] \ln bes4 ~ bes8 bes bes \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  bes'8 g d ees[ g] f d bes ees! \bar "|" d c f bes, ees! bes' g \bar "|"
  d \noacci e f d a bes \ln f'4. g8 \bar "|" d bes f' bes, a c f \bar "|"
  bes, a[ g] ees' ees[ d] g ees! f bes, \bar "|" bes' f \ln g4 ~ g8[ c,]( \ln d4) ees!8 bes g \bar "||"
}


#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\score {	
  <<
  \new VaticanaStaff {\plainsong }
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
		 >>  
  >>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
  	   % *** Remove custos
	   \remove Custos_engraver
	   % needed for certain tweaks
	   \consists "Mark_engraver"
           }
     }
} %%% score bracket 

%%% A separate score block to generate the midi minus the plainsong voice
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."   " M." \hspace #54 \italic "15th cent.  Tr. L. H." }   		 
	\line { \hspace #32 "Mundi salus affutura." }
%          \line { "                    "}
}}}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "P" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORTAL of the world's salvation,"
			                                 "  Lo, a virgin pure and mild," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Humble-hearted, high in station,"
					   "    Form of beauty undefiled,"
					   "Crown of earth's anticipation,"
					   "    Comes the Mother-maid with child."
					   "                " %%% adds vertical spacing between verses
			}}
 			         } %%% finish verse 1
			\line { "2*" \hspace #-0.4
			   \column {	     
				   "Here, the serpent's power subduing,"
				   "    See the Bush unburned by fire,"
				   "Gideon's Fleece of heaven's imbuing,"
				   "    Aaron's Rod of bright attire,"
				   "Fair, and pure, and peace-ensuing,"
				   "    Spouse of Solomon's desire."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3*" \hspace #-0.4
			\column {	     
				"Jesse's Branch received its Flower,"
				"    Mother of Emmanuel,"
				"Portal sealed and mystic Bower"
				"    Promised by Ezekiel,"
				"Rock of Daniel's dream, whose power"
				"    Smote, and lo, the image fell!"
				"                " %%% adds vertical spacing between verses
			}}

		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -54 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3	
			\line { "4  "
			\column {	     
				"See in flesh so great a wonder"
				"    By the power of God ordained,—"
				"Him, whose feet all worlds lay under,"
				"    In a Virgin's womb contained;—"
				"So on earth, her bonds to sunder,"
				"    Righteousness from heaven hath rained."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "5  "
			\column {	     
				"Virgin sweet, with love o'erflowing,"
				"    To the hills in haste she fares;"
				"On a kindred heart bestowing"
				"    Blessing from the joy she bears;"
				"Waiting while with mystic showing"
				"    Time the sacred birth prepares."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "6  "
			\column {	     
				"What fair joy o'ershone that dwelling,"
				"    Called so great a guest to greet;"
				"What her joy whose love compelling"
				"    Found a rest for Mary's feet,"
				"When, the bliss of time foretelling,"
				"    Lo, the Voice and Word did meet!"
				"                " %%% adds vertical spacing between verses
			}}
	    } %%% end column 3
     } %%% end master-line
     
               		\line { \hspace #26 "7. "
			   \column {	     
				 "God most high, the heaven's Foundation,"
				 "    Ruler of eternity;"
				 "Jesu, who for man's salvation"
				 "    Came in flesh to make us free;"
				 "Spirit, moving all creation,"
				 "    Evermore be praise to thee!      Amen" 
			}}
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ d8 e8 d8 \] d4
  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \amenglobal
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \amenglobal
	                                              \voiceTwo  d8[ f ees] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \amenglobal
	                                          \voiceThree  bes'8[ d bes] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \amenglobal
						  \voiceFour g'8[ d8 ees] \ln g4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A  -- _ _ men. }
  >>
>>

\header { breakbefore = ##f piece = " " opus = " " }

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }
     \context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'( -5 . 4) }
     \context { \Score \remove "Bar_number_engraver"
		timing = ##f 
              }
     \context { \Staff \override NoteHead #'duration-log = #1 }
     \context { \Staff \override Stem #'flag-style = #'no-flag }
     \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	} 
} 

}

%%% Separate score block for Amen midi minus plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \amenglobal
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \amenglobal
	                                              \voiceTwo  d8[ f ees] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \amenglobal
	                                          \voiceThree  bes'8[ d bes] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \amenglobal
						  \voiceFour g'8[ d8 ees] \ln g4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket
