%%%% 243.png
%%%% Hymn 151. Aeterna Christi Munera (Rouen) Rejoice! the year upon its way.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
  title = \markup { "151 " \large \smallCaps "(Modern Tune)" }   
  
  poet = \markup { \small {  \line { \sans { "AETERNA CHRISTI MUNERA (ROUEN)."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "Rouen Church Melody." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%% shortens stems     
     
shortenStem = \once \override Stem #'length = #3

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d'4 ^\markup { \italic "To be sung in unison."} 
      | c( b) a | b( g) a | b( a4.) g8 | g2 \bar "||" b4 | d2 d4 | b2 g4 | c( b) a | a2 \bar "||" \break
  a4 | b2 g4 | e2 a4 | g( fis) e  | d2 \bar "||" d'4 | a4( b) g | c( b) a | b( a4.) g8 | g2 \bar "||"
} 
   
alto = \relative c' {  
  \partial 4 <g' b>4 | <e a> <d g> <d fis> | <d fis> <b e> <d fis> | <d g> <d fis>4. <b d>8 | <b d>2 \bar "||" 
      <d g>4 | <g b>2 <g b>4 | <d fis>2 <b e>4 | << { \shortenStem g'2 } 
      \new Voice = "altoB" { \voiceFour \movenote #0.0001 e4 d4 } >> <c e>4 | <d fis>2 \bar "||" \break
  <d fis>4 | <d fis>2 <b e>4 | <c e>2 <c e>4 | <b d>2 <g c>4 | s2 \bar "||" 
      <fis' b>4 | << { \shortenStem fis4 g <c, e> | <e a>  g fis } 
      \new Voice = "altoC" {\voiceFour \movenote #0.0001 d2 s4 | s4 \movenote #0.0001 d2 } >> <d fis>4 <d fis>4. <b d>8 | <b d>2 \bar "||"
}

tenor = \relative c {\clef bass 
  g4 | a b d | b s4 s4 | g4 s4 s4 | s2 \bar "||" s4 | g2 g4 | b2 s4 | c4 g a | s2 \bar "||" 
  d4 | b2 g'4 | g2 a,4 | b2 c4 | a'2 \bar "||" b,4 | d g, c | a b d | b s4 s4 | s2 \bar "||"
}

bass = \relative c {\clef bass 
  s4 | s2. | s4 e4 d4 | s4 d4. g8 | g2 \bar "||" g4 | s2. | s2 e4 | s2. | d2 \bar "||"
  s4 | s2 e4 | c2 s4 | s2. | <d fis>2 \bar "||" s4 | s2. | s2. | s4 d4. <g g,>8 | <g g,>2 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}      
  	
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Beata nobis (" \hspace #-1 \italic "No." "185)." }


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \smallCaps  "Office Hymn." \italic "Daily till Trinity Sunday." "E." \hspace #30 \italic "c. 4th cent.  Tr. R. E. R." } }

\markup { \hspace #44 \small "Beata nobis gaudia." }


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "R" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EJOICE! the year upon its way"
			                                 "  Has brought again that blessèd day," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When on the chosen of the Lord"
					   "The Holy Spirit was outpoured."
			  		}}
		      }
		       \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "On each the fire, descending, stood"
				   "In quivering tongues' similitude—"
				   "Tongues, that their words might ready prove,"
				   "And fire, to make them flame with love."
			}}
			\hspace #1  % adds vertical spacing between verses 
			\line { "3  "
				\column {	     
					"To all in every tongue they spoke;"
					"Amazement in the crowd awoke,"
					"Who mocked, as overcome with wine,"
					"Those who were filled with power divine."
			}}
	  } %%% end super column
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

%%% Second page
%%% Continuation of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses  
			\line {"4  "
				\column {	     
					"These things were done in type that day,"
					"When Eastertide had passed away,"
					"The number told which once set free"
					"The captive at the jubilee."
			}} 
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
				\column {	     
					"And now, O holy God, this day"
					"Regard us as we humbly pray,"
					"And send us, from thy heavenly seat,"
					"The blessings of the Paraclete."
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6. "
				\column {	     
					"To God the Father, God the Son,"
					"And God the Spirit, praise be done;"
					"May Christ the Lord upon us pour"
					"The Spirit's gift for evermore.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a g fis) \bar "|" g\breve \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo <b e>2 <c e> <b d> <a d> \bar "|" <b d>\breve  \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A - - - men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  e2 a, b d \bar "|" g,\breve \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  %%Amen midi       
       
}  

} %%% book bracket
