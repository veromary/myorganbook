%%%% 232.png
%%%% Hymn 143 Llanfair. Hail the day that sees him rise Alleluya! 
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "143"   
  
  poet = \markup { \small {  \line { \sans { "LLANFAIR."} \hspace #1 \roman {"(7 4. 7 4. D.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time, dignified} \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
  
  arranger = \markup { \small \italic "Welsh Hymn Melody." }
  
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

%%% shortens stems     
     
shortenStem = \once \override Stem #'length = #4.5
	
%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.6
              \once \override Stem #'X-offset = #-3.6 }
	            
%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat g'2 g b b | d c4(b) a1 | d2.( c4 b2) c4( b) | \movenote #1.6 a1 \movenote #-0.4 g1 \fdendrepeat \break }
  \tag #'remainder { b2 b d d | e4( d) c( b) a1 | b2.( a4 b2) cis | d1 d1 \bar "||" \break
  g,2 g b b |  d c4( b) a1 | 
      \voiceThree  \movenote #-0.2 d2.( ^\markup { \italic "Voices in unison." }  \movenote #-0.6 c4 \movenote #-0.6 b2)  \movenote #-0.2 c4( b)  |  
      \movenote #1.6 a1 \voiceOne  \movenote #-0.4 g1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart { d2 d g g | g a4( g) fis1 | d2( e4 fis4 g2) g | g2( fis) \movenote #0.2 g1 \fdendrepeat }
  \tag #'remainder { g2 g f f | e e fis1 | g2.( a4 g2) g2 | fis1 fis \bar "||" 
      \override Staff.NoteCollision #'merge-differently-dotted = ##t
  g2 d d g | g a4( g) fis1 | 
      << { \voiceOne \shortenStem d2 e4 fis g2 \movenote #0.2 g } \\ { \voiceTwo d2. d4 d2 c4 d4 } >>  |  
      <e g>2 <d fis>2 << { \voiceTwo  \movenote #0.2 g1 } \\ { \voiceFour d1} >> \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat b'2 b g g | d' e a,1 | b2.( c4 d2) c4( d) | e2( d) b1  \fdendrepeat }
  \tag #'remainder { g2 g a b | c c d1 | \movenote #0.4 d1. g,2 | a1 d1 \bar "||"
  d2 d4( c) b2 g2 | d' e a,1 | g2. a4 b2 g2 | \movenote #1.6 a1 b1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'repeatpart { g'2 g e e | b c d1 | b'2.(a4 g2) e4( d) | c2( d) g1 \fdendrepeat }
  \tag #'remainder { e2 e d d | c a d1 | g2.( fis4 g2) e2 | d1 \straddle d'2( c!) \bar "||"
  b2 b4( a) g2 e | b c << { d1 } \new Voice = "org" { \voiceFour \smallnote d2 _\markup {\normalsize \italic "Org." } \smallnote c2 } >> | 
      b2. a4 g2 a4 b4 | <c g'>2 <d fis>2 <g, g'>1 \bar "||" }
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
		
} %%% Score bracket


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'remainder \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'remainder \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'remainder \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'remainder \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2)}} 

} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #54 \center-align {  
	\line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the" \smallCaps "Original" \italic "version of the" \smallCaps "Easter Hymn" }
        \line { "(" \hspace #-1 \italic "see No." "133)." }
	"               "
}}

%%% Lyric attributions

\markup { \hspace #60 \small { \italic "C. Wesley, 1707-88, and T. Cotterill" "† (" \hspace #-1 \italic "1820" \hspace #-1 ")."    }  }

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL the day that sees him rise    Alleluya!"
			                                 "  Glorious to his native skies;    Alleluya!" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Christ, awhile to mortals given,    Alleluya!"
					   "Enters now the highest heaven!    Alleluya!"
			  		}}
		      }
                        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "There the glorious triumph waits;    Alleluya!"
				   "Lift your heads, eternal gates!    Alleluya!"
				   "Christ hath vanquished death and sin;    Alleluya!"
				   "Take the King of glory in.    Alleluya!"
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
	          \column { 
			\hspace #1  
			\line {"3* "
				\column {	     
					"See! the heaven its Lord receives,    Alleluya!"
					"Yet he loves the earth he leaves:    Alleluya!"
					"Though returning to his throne,    Alleluya!"
					"Still he calls mankind his own.    Alleluya!"
			}}   
			\hspace #1  
			\line {"4* "
				\column {	     
					"See! he lifts his hands above;    Alleluya!"
					"See! he shows the prints of love:    Alleluya!"
					"Hark! his gracious lips bestow    Alleluya!"
					"Blessings on his Church below.    Alleluya!"
			}} 
			\hspace #1 % adds vertical spacing between verses  
			\line {"5* "
				\column {	     
					"Still for us he intercedes;    Alleluya!"
					"His prevailing death he pleads;    Alleluya!"
					"Near himself prepares our place,    Alleluya!"
					"Harbinger of human race.    Alleluya!"
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-10 \italic "Unison.  " "6  "
				\column {	     
					"Lord, though parted from our sight,    Alleluya!"
					"Far above yon azure height,    Alleluya!"
					"Grant our hearts may thither rise,    Alleluya!"
					"Seeking thee beyond the skies.    Alleluya!"
     			}}
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-10 \italic "Unison.  " "7. "
				\column {	     
					"There we shall with thee remain,    Alleluya!"
					"Partners of thine endless reign;    Alleluya!"
					"There thy face unclouded see,    Alleluya!"
					"Find our heaven of heavens in thee.    Alleluya!"
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  



} %%% book bracket
