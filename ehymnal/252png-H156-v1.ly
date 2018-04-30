%%%% 252.png
%%%% Hymn 156. Veni Creator (Attwood) Creator Spirit, by whose aid 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
	title = "156"   
  
  poet = \markup { \small {  \line { \sans { "VENI CREATOR (ATTWOOD)."} \hspace #1 \roman {"(8 8. 8 8. 8 8.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 69. } }
  
  arranger = \markup { \small \smallCaps "T. Attwood, 1765-1838." }
  
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
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #1.2

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% generates the percent sign used to indicate a repeat e.g. of lyrics

percentRepeat = ^\markup { 
                          \fontsize #0 { \rotate #'-31 ":" }  
                          {\fontsize #-3 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"} 
                          {\fontsize #-3 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"}  
                           \fontsize #0  {\translate #(cons -1 -0.1 ) \rotate #'-30 ":" } 
                        }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 a'2 | a2( d) cis4( b) | a1 fis2 | d1 e2 | fis1 \bar "||" fis2 | e( a) b | \break
  cis2 e1 | a,4( b cis2) cis4( b) | a1 \bar "||" a2 | a( fis) g2 | \break
  e1 e2 | a2( fis) b | e,1. \bar "||" e2 g fis | e( g) fis | \break
  e2 e1 | e1. \bar "||" a2 a a | a( d) fis, | e( b') a | \break
  g2( fis) \breathmark \bar "||" fis | g( a) b | a( cis,) d | g1 e2 | \break
  e( fis) \breathmark \bar "||"
      \once \override TextScript #'extra-offset = #'( -1.0 . -0.4 )
      a \percentRepeat  | d( cis) b | a( cis,) d | g1 e2 | d1. \bar "||"
} 
   
alto = \relative c' {  
  d2 | \push d1 d2 | d1 cis2 | \merge d1 cis2 | d1 \bar "||" d2 | cis2( e) e | \break
  e2 e1 | cis4( dis e2) d! | cis1 \bar "||" cis2 | \push d1 d2 | \break
  \straddle d2( cis) cis | \push d1 d2 | cis1. \bar "||" b2 e dis | e( b) a | \break
  gis d'1 | cis1. \bar "||" e2 fis e | e( d) d | d( cis) cis | \break
  \push d1 \bar "||" d2 | d( c) b | cis!( a) a | e'1 cis2 | \break
  cis2( d) \bar "||" e2 | \push fis1 d2 | \push cis1 b2 | e1 cis2 | \merge d1. \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 | fis1 g2 | fis1 a2 | \merge b1 a2 | a1 \bar "||" a2 | \push a1 gis2 | \break
  a2 a1 | \push a1 gis2 | a1 \bar "||" a2 | fis( a) g! | \break
  a1 a2 | a2( b) b | a1. \bar "||" g2 b a | g( e) dis | \break
  e2 gis1 | a1. \bar "||" g!2 g g | fis1 fis2 | g1 e2 | \break
  d1 \bar "||" a'2 | \push d1 d2 | \push a1 a2 | b1 a2 | \break
  \push a1 \bar "||" a2 | fis4( b a2) g | e( g) fis | b1 g2 | fis1. \bar "||"
}

bass = \relative c {\clef bass 
  d2 | d1 d2 | d1 fis2 | b1 a2 | d,1 \bar "||" d2 | a( cis) e | \break
  a2 cis,1 | fis2( e) e | a,1 \bar "||" a2 | fis'2( d) b | \break
  a1 g'2 | fis( b) g | \merge a1. \bar "||" e2 b b | c! ( g) b | \break
  e1 e2 | a,1.  a2 a a | a1 a2 | a1 a2 | \break
  b1 \bar "||" c!2 | b2( a) g | g( g') fis | e1 a,2 | \break
  \pushb d1 \bar "||" cis2 | b( fis) g | a( ais) b | g1 a2 | d1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note 

\markup { \hspace #54 \center-align {
	\line {  \smallCaps "Note" \hspace #-1.2 ".—" \italic "This tune can also be used for" \smallCaps "Come, Holy Ghost" "(" \hspace #-1 \italic "Hymn" "153)." \italic "  In this case" } 
        \line {  \italic "each verse will be six lines, instead of four."  }
	\line { \italic "This hymn may also be sung to" \smallCaps "Falkland" "(" \hspace #-1 \italic "No." "219)." }
}}


%%% Lyric attributions and titles

\markup { \hspace #60 \column { 
	        "                      " 
		\line { \hspace #9 \small \italic "J. Dryden, 1631-1701."}
		\line { \small { \italic "Based on" "Veni, Creator Spiritus."} }
}}	


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "REATOR Spirit, by whose aid"
			                               "  The world's foundations first were laid," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Come, visit every pious mind;"
					   "Come, pour thy joys on human kind;"
					   "From sin and sorrow set us free,"
					   "And make thy temples worthy thee."
			  		}}
		      } %%% end verse 1	
		        \hspace #1  % adds vertical spacing between verses
           		\line { "2  "
			   \column {	     
				   "O Source of uncreated light,"
				   "The Father's promised Paraclete,"
				   "Thrice holy Fount, thrice holy Fire,"
				   "Our hearts with heavenly love inspire;"
				   "Come, and thy sacred unction bring"
				   "To sanctify us while we sing."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "Plenteous of grace, descend from high"
				   "Rich in thy sevenfold energy;"
				   "Make us eternal truths receive,"
				   "And practise all that we believe;"
				   "Give us thyself, that we may see"
				   "The Father and the Son by thee."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4. "
			   \column {	     
				   "Immortal honour, endless fame,"
				   "Attend the almighty Father's name;"
				   "The Saviour Son be glorified,"
				   "Who for lost man's redemption died;"
				   "And equal adoration be,"
				   "Eternal Paraclete, to thee.     Amen."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  


} %%% book bracket
