%%%% 451.png
%%%% Hymn 301 Hyfrydol. Alleluya, sing to Jesus
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SACRAMENTS AND OTHER RITES: HOLY COMMUNION"
	\hspace #0.1 }}	
	
  title = "301"   
  
  meter = \markup { \small { \column { \line { \sans "HYFRYDOL." \hspace #1 \roman "(8 7. 8 7. D.)" } 
                                       \line { { \italic "Slow and dignified" \general-align #Y #DOWN \note #"2" #0.5 "= 76." }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Melody by" }
				 \line { \smallCaps "R. H. Prichard," "1811-87."  } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
   
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

		
%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
	
%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }
	      
%%% Mergedotted. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%%% Turns one dot off as there is only one dot for the two merged notes.

mergedotted = { \once \override Dots #'transparent = ##t
          \once \override NoteColumn #'force-hshift = #-0.01 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat   f1 g2  | f2. ( g4 -) a2 | bes1 a2 | g2 ( f2 -) g2 | c1 bes2 | a1 a2 | \break 
  g2 ( f2 -) g2 | \mergedotted f1.  \fdendrepeat } \tag #'remainder  { c'1 c2 | c2 ( bes2 -) a2 | \movenote #0.4 bes1 bes2 | bes2 ( a2 -) g2 | \break
  a1 a2 | a2 ( bes2 -) c2 | c2 ( bes2 -) a2 | \movenote #1.2 g1. \bar "||" \topstraddle c2 ( a2 -) c2 | bes2 ( g2 -) bes2 | \break
  a2 ( f2 -) a2 | g4 ( a4 bes4 a4 -) g2 | c1 c2 | d2 ( c2 -) bes2 | a1 g2 | \mergedotted f1. \bar "||" 
}} 
   
alto = \relative c' {  
  \tag #'repeatpart {  c1 e2 | \movenote #1.6 f1 f2 | g1 f2 | e2 ( d2 -) e2 | \straddle f2 ( c2 -) d4 ( e4 -) | f1 f4 ( e4 -) | 
  d2 ~ d2 e2 | f1.  \fdendrepeat } \tag #'remainder  { e1 e2 | \movenote #0.4 f1 f2 | f2 ( e2 -) d2 | e2 ( f2 -) c2 | 
  c1 f2 | f2 ( g2 -) a2 | a2 ( g2 -) f2 | f1 ( e2 -) \bar "||" f1 a2 | \movenote #0.4 g1 g2 | 
  f2 ( c2 -) f2 | g4 ( e4 f2 -) c2 | \straddle c2 ( f2 -) ees2 | d2 ( f2 -) f2 | f1 e2 | f1. \bar "||"
}}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  \movenote #-0.6 a'1 g2 | a2. ( bes4 -) c2 | d2 ( c2 -) c2 | c2 ( a2 -) c2 | c1 c2 | c1 c2 |  
  bes2 ( a2 -) c2 | a1.  \fdendrepeat } \tag #'remainder  { c1 c2 | f,2 ( g2 -) a2 | g1 g2 | g2 ( c2 -) bes2 |
  a1 c2 | d1 c2 | d1 d2 | g,1. \bar "||" c1 d2 | \movenote #0.4 d1 c2 | 
  c2 ( a2 -) b2 | c2 ( bes!2 -) bes2 | a1 c2 | bes2 ( c2 -) d2 | c1 bes2 | a1. \bar "||" 
}}

bass = \relative c {\clef bass 
   \tag #'repeatpart {  << {  \straddle f,2 ( a2 -) c2 }  \new Voice = "alt" { \voiceFour \movenote #-0.8 \smallnote f2 s1 } >> |  \movenote #1.4 f1 f2 | f2 ( e2 -) f2 | c2 ( d2 -) c2 | a'1 g2 | f1 a,2 | 
   bes2 ( d2 -) c2 | f1.  \fdendrepeat } \tag #'remainder  { a1 a2 | \movenote #0.4 d,1 d2 | \merge g1 g2 | c,2 ( d2 -) e2 |
  f1 e2 | d1 a2 | g1 bes2 | c1. \bar "||" a'1 f2 | f2 ( e4 d4 -) e2 | 
  f2 ( e2 -) d2 | e4 ( c4 d2 -) e2 | f1 a,2 | bes2 ( a2 -) bes2 | c1 c2 | <<{  f1.} \new Voice = "alt" {\voiceFour \movenote #0.2 \smallnote f,1.} >> \bar "||"
}}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% Score block	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    { \voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
		
} %%% Score bracket


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2)}} 

} %%% Score bracket


%%% Lyric titles and attributions

\markup {  \small {  \hspace #64 \italic "W. Chatterton Dix, 1837-98." }} 

%%% Lyrics

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LLELUYA, sing to Jesus,"
			                                 "    His the sceptre, his the throne;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Alleluya, his the triumph,"
					   "    His the victory alone:"
					   "Hark the songs of peaceful Sion"
					   "    Thunder like a mighty flood;"
					   "Jesus, out of every nation,"
					   "    Hath redeemed us by his Blood."
					   "                  " %%% blank space before next verse
			  		}}
		      }
			\line {"2* " \hspace #-1
				\column {	     
					"Alleluya, not as orphans"
					"    Are we left in sorrow now;"
					"Alleluya, he is near us,"
					"    Faith believes, nor questions how;"
					"Though the cloud from sight received him"
					"    When the forty days were o'er,"
					"Shall our hearts forget his promise,"
					"    ‘I am with you evermore ’?"
					 "                  " %%% blank space before next verse
			}}    
			\line {"3  "
				\column {	     
					"Alleluya, Bread of angels,"
					"    Thou on earth our Food, our Stay;"
					"Alleluya, here the sinful"
					"    Flee to thee from day to day;"
					"Intercessor, Friend of sinners,"
					"    Earth's Redeemer, plead for me,"
					"Where the songs of all the sinless"
					"    Sweep across the crystal sea."
					"                  " %%% blank space before next verse
			}} 
			\line { \hspace #-10  \italic "Unison."  " 4. "
				\column {	     
					"Alleluya, King eternal,"
					"    Thee the Lord of lords we own;"
					"Alleluya, born of Mary,"
					"    Earth thy footstool, Heaven thy throne:"
					"Thou within the veil hast entered,"
					"    Robed in flesh, our great High Priest;"
					"Thou on earth both Priest and Victim"
					"    In the Eucharistic Feast."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  



} %%% book bracket
