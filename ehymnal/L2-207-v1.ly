%%%% 325.png
%%%% Hymn 207 Llangloffan We sing the glorious conquest
%%%% Rev 1

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: ST. PAUL"
	\hspace #0.1 }}	
	
	title = "207"   
  
  poet = \markup { \small {  \line { \sans { "LLANGLOFFAN."} \hspace #1 \roman {"(7 6. 7 6. D.)"}} }}
  
  %meter = \markup { \small { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42. } }
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76. } }
    
  arranger = \markup { \small \italic "Welsh Hymn Melody." }
  
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
	      
%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }	      
	      
%%% Macro to specify a partial measure in the middle of a piece or
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% pushes notecolumn slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | g g a a | bes2.( a4) g2 g | c c bes bes | a1. \bar "||" d,2 | g g a a | \break
  bes2.( c4) d2 c | bes g a fis | g1. \bar "||" d'2 | d bes a c | bes1 a2 g | \break 
  fis2 g c bes | a1. \breathmark \bar "||" d,2 | g g a a | \noBreak bes2.( c4) d2 c | bes g a fis | g1. \bar "||"  
} 
   
alto = \relative c' {
  d2 | g d ees d | bes2.( c4) d2 d | c ees d d | d1. \bar "||" \straddle d4( c) | bes2 ees ees f |
  f2( g) f ees | d bes ees d | d1. \bar "||" g2 | f f ees c | f1 f2 c |
  d d c d | d1. \bar "||" d2 | g d ees d | \push d1 g2 g | f ees ees d | d1. \bar "||"
 }

tenor = \relative c {\clef bass 
  d2 | g g g fis | g2.( a4) bes2 bes | g g g g | fis1. \bar "||" fis2 | g2 bes c c |
  d( bes) bes4( a) g2 | f g c a | bes1. \bar "||" bes4( c4) | d2 d c g4( a) | bes1 c2 g |
  a2 g fis g | g1( fis2) \bar "||" d2 | g g g fis | g2.( a4) bes2 ees | d bes c a | bes1. \bar "||"
 }

bass = \relative c {\clef bass 
  d2 | g2 bes, c d | \push g,1 g'2 f | ees c g bes | d1. \bar "||" d2 | ees ees4( d4) c2 f |	
  d2( ees) bes c | d ees c d | g1. \bar "||" g4( a) | bes2 bes, c ees | d1 f2 ees |
  d4( c) bes2 a g | d'1. \bar "||" d2 | g bes, c d | \push g,1 g'2 c, | d ees c d | g,1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
           
  	
} %%% score bracket

%%% Hymn notes markup

\markup { \hspace #16 \column { 
	       \line { \hspace #6 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Aurelia" "(" \hspace #-1 \italic "No." "489)."   }
               \line { "                 " } %%% some blank space before start of lyrics
	       \line { "                 " } %%% some blank space before start of lyrics
}}   
	       
%%% Lyric attributions and titles

\markup { \small { \hspace #20 "(" \hspace #-1 \italic "O. H.," "174-6.)"  \hspace #35 \italic "J. Ellerton, 1826-93." }}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E sing the glorious conquest"
			                               "    Before Damascus' gate," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When Saul, the Church's spoiler,"
					   "    Came breathing threats and hate;"
					   "The ravening wolf rushed forward"
					   "    Full early to the prey;"
					   "But lo! the Shepherd met him,"
					   "    And bound him fast to-day!"
			  		}}
		      } %%% end verse 1			
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

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "O Glory most excelling"
				   "    That smote across his path!"
				   "O Light that pierced and blinded"
				   "    The zealot in his wrath!"
				   "O Voice that spake within him"
				   "    The calm reproving word!"
				   "O Love that sought and held him"
				   "    The bondman of his Lord!"
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "O Wisdom, ordering all things"
				   "    In order strong and sweet,"
				   "What nobler spoil was ever"
				   "    Cast at the Victor's feet?"
				   "What wiser master-builder"
				   "    E'er wrought at thine employ,"
				   "Than he, till now so furious"
				   "    Thy building to destroy?"
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "4. "
			   \column {	     
				   "Lord, teach thy Church the lesson,"
				   "    Still in her darkest hour"
				   "Of weakness and of danger"
				   "    To trust thy hidden power."
				   "Thy grace by ways mysterious"
				   "    The wrath of man can bind,"
				   "And in thy boldest foeman"
				   "    Thy chosen Saint can find!"
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo ees1 d1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  


} %%% book bracket
