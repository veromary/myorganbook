%%%347.png
%%%Hymn 220 Brockham The Saint who first found grace to pen
%%%Version 1

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "SAINTS' DAYS: ST. MARK" } 
					       \hspace #1
						} }	
  
  title = \markup {"220" } 
  
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


%%% Lyric attributions and titles

\markup { \small { \hspace #2 "(" \hspace #-1 \italic "O. H.," "123," \italic "Pt." "2; 124," \italic "Pt." "2.)"  \hspace #56 \italic "Laurence Housman." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
			\column { %%verse 1 is a column of 2 lines  
			\line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Saint who first found grace to pen"
			                                 "The Life which was the Life of men," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And shed abroad the Gospel's ray,"
					   "His fame we celebrate to-day."
					   "             " %%% add vertical spacing between verses
			  		}}
			         } %%% finish verse 1
		      	\line { "2  "
				\column {	     
				   "Lo, drawn by Pentecostal fire,"
				   "His heart conceived its great desire,"
				   "When pure of mind, inspired, he heard"
				   "And with his hand set forth the Word."
				   "             " %%% add vertical spacing between verses
			}}
			\line { "3  "
				\column {	     
				"Then, clearly writ, the Godhead shone"
				"Serene and fair to look upon;"
				"And through that record still comes power"
				"To lighten souls in death's dark hour."
				"             " %%% add vertical spacing between verses
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3			     
			\line { "4  "
				\column {	     
				"O holy mind, for wisdom fit"
				"Wherein that Life of lives stood writ,"
				"May we through minds of like accord"
				"Show forth the pattern of our Lord."
				"             " %%% add vertical spacing between verses	
			}}
			\line { "5  "
				\column {	     
				"And so may all whose minds are dark"
				"Be led to truth by good Saint Mark,"
				"And after this our earthly strife"
				"Stand written in the Book of Life."
				"             " %%% add vertical spacing between verses	
			}}
			\line { "6.  "
				\column {	     
				"Praise God who made the world so fair,"
				"And sent his Son our Saviour there,"
				"And by his Holy Spirit wist"
				"To teach the first Evangelist.      Amen."
				"             " %%% add vertical spacing between verses	
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket


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

