%%%195.png
%%%Hymn 122 (Modern Tune) Brockham Ye Choirs of New Jerusalem
%%%Version 2

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - EASTERTIDE" } 
					       \hspace #1
						} }	
  
  title = \markup {"122 " \large \smallCaps "(Modern Tune)" } 
  
  poet = \markup { \small {  \line { \sans {"BROCKHAM."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately fast} \general-align #Y #DOWN \note #"4" #0.5 = 104.} }
  
  arranger = \markup { \small \smallCaps "J. Clark, 1670-1707." }			       
		
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}
	      
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 4 d4 | g a b fis | g a fis \breathmark \bar "||" a | c4. c8 b4 g | b cis d^\fermata \bar "||" \break
  d | b g e b' | c a fis \breathmark \bar "||" d g4. a8 b4 d | b a8[ g] g4^\fermata \bar "||"
}

alto = \relative c' {
  d4 | d fis g fis | e e d \bar "||" fis | e4. d8 d4 d | g g fis \bar "||"
  a4 | g d e d | c e d \bar "||" d | d4. fis8 g4 d | g fis8[ g] d4 \bar "||"
}

tenor = \relative c { \clef bass
  d'4 | d d d c | b c a \bar "||" d | c4. a8 b4 b | b a a \bar "||"
  d | d g, g gis | a a a \bar "||" d,4 | d'4. c8 b4 g | d' c b \bar "||"
}

bass = \relative c { \clef bass
  d4 | b d g d | e c d \bar "||" d | a'4. fis8 g4 g8[ fis] | e4 a d, _\fermata \bar "||"
  fis | g b, c b | a c d \bar "||" d8[ c] | b4. a8 g4 b | d d g, _\fermata \bar "||" 
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
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }
       }	
} %%score bracket


%%% Hymn Note markup

\markup { \hspace #14 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Grenoble Melody at Hymn" "141." }

%%% Lyric titles and attributions

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Saturday evenings:" \hspace #30 \italic "St. Fulbert of Chartres, c. 1000." } }  
	    \line { \small { \hspace #8 \italic "i.e. 1st" "E." \italic "of Sundays after Easter."     \hspace #36 \italic "Tr. J. M. Neale." } } 
	    \line { \hspace #42 \small "Chorus novae Jerusalem." }
	}
}

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "Y" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E choirs of new Jerusalem,"
			                                 "  To sweet new strains attune your theme;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The while we keep, from care released,"
					   "With sober joy our Paschal feast:"
			  		}}
		      } %% end verse 1
		                              \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "When Christ, unconquer'd Lion, first"
				   "The dragon's chains by rising burst:"
				   "And while with living voice he cries,"
				   "The dead of other ages rise."
			}}
		  \hspace #1  % adds vertical spacing between verses 
		  \line { "3  "
		    \column {	     
			    "Engorged in former years, their prey"
			    "Must death and hell restore to-day:"
			    "And many a captive soul, set free,"
			    "With Jesus leaves captivity."
			}}
	  }  %%% end super column
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
%%% Continuation of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Right gloriously he triumphs now,"
			    "Worthy to whom should all things bow;"
			    "And joining heaven and earth again,"
			    "Links in one commonweal the twain."
			}} 
		\hspace #1 % adds vertical spacing between verses	
		%%% strange Lilypond behaviour as here and only here, the blank line is narrower than elsewhere. So \lower is used below to increase space.
           	\line { \lower #0.3 { "5  "
		    \column {	     
			    "And we, as these his deeds we sing,"
			    "His suppliant soldiers, pray our King,"
			    "That in his palace, bright and vast,"
			    "We may keep watch and ward at last."
		}}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "6. "
		   \column {	     
			   "Long as unending ages run,"
			   "To God the Father, laud be done:"
			   "To God the Son, our equal praise,"
			   "And God the Holy Ghost, we raise.     Amen."
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

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }}   
       
}  

} %%book bracket

