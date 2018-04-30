%%%% 293.png
%%%% Hymn 181 Modern tune. Deus Tuorum Militum.  O God, thy soldiers' crown and guard 
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - MARTYRS"
		\hspace #0.1 }}	

	title = \markup { "181 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "Deus Turorum Militum."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small { \italic "Grenoble Church Melody." }}
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 3/4
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
\partial 4 c4 | e2 g4 | c2 g4 | f( e) d | c2 \bar "||" c'4 | e2 c4 | a( b) c | g2 fis4 | g2 \bar "||" \break

g4 | a2 b4 | c2 g4 | f( e) d | e2 \bar "||" g4 | a( b) c | g( f) e | d2 c4 | c2 \bar "||"
} 
   
alto = \relative c' {  
s4 | s2. | <c e>2 <c e>4 | s2. | s2 \bar "||" <e g>4 | <e a>2 <e a>4 | fis2 <e g>4 | b2 d4 | d2 \bar "||"

<c e>4 <c f>2 f4 | e2 c4 | c2 b4 | b2 \bar "||" c4 | <c e> <d g> <e g> | <b d> c c | s2. | s2 \bar "||"
}

tenor = \relative cis {\clef bass 
<e g>4 | <g c>2 <g b>4 | s2. | <a c>4 <g c> b | <e, g>2 \bar "||" c'4 | <a c>2 a4 | d2 g,4 | g2 a4 | <g b>2 \bar "||"

s4 | s2 b4 | a2 g4 | a g g | g2 \bar "||" e4 | s2. | s4 a4 g4 | <g b>2 <e g>4 | <e g>2 \bar "||"
}

bass = \relative cis {\clef bass 
c4 | c2 e4 | a,2 c4 | f c g' | c,2 \bar "||" c'4 | a2 c,4 | d2 c4 | e2 d4 | g,2 \bar "||"

c4 | f2 d4 | a2 e'4 | f c g' | e2 \bar "||" c4 | a g e | g a c | g2 <c, c'>4 | <c c'>2 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4)}} 
		
} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #54 \center-align {
	\line { \italic "This hymn is sung during Christmastide to No." "18" \italic "and during Eastertide" }
	\line { \italic "to No." "123," \italic "Part" "2." }
}}	

\markup { "              " } %%% force blank space before start of lyrics

\markup { "              " } %%% force blank space before start of lyrics


%%% Lyric titles and attributions

\markup { \hspace #9 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of" \hspace #39 \italic "6th cent.  Tr. J. M. Neale." }    
	\line { \hspace #4  "one Martyr." "M." \italic "and" "E." } 
	\line { \hspace #33 "Deus tuorum militum." }
	\line { "          " }  %%% force blank space before lyric text
}}}



%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " GOD, thy soldiers' crown and guard,"
			                                 "  And their exceeding great reward;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "From all transgressions set us free,"
					   "Who sing thy Martyr's victory."
					    "           " %%% adds vertical spacing between verses
			  		}}
		      } %%end verse 1
		           \line { "2  "
			   \column {	     
				  "The pleasures of the world he spurned,"
				  "From sin's pernicious lures he turned;"
				  "He knew their joys imbued with gall,"
				  "And thus he reached thy heavenly hall."

				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "For thee through many a woe he ran,"
				  "In many a fight he played the man;"
				  "For thee his blood he dared to pour,"
				  "And thence hath joy for evermore."

				  "           " %%% adds vertical spacing between verses
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "4  "
			   \column {	     
				  "We therefore pray thee, full of love,"
				  "Regard us from thy throne above;"
				  "On this thy Martyr's triumph day,"
				  "Wash every stain of sin away."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "5. "
				\column {	     
				  "O Christ, most loving King, to thee,"
				  "With God the Father, glory be;"
				  "Like glory, as is ever meet,"
				  "To God the holy Paraclete.     Amen."
     			}}

	  }
} %%% lyric markup bracket

       

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne c2( d c b) c1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo s2 *6 \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 "A   -  -  -  -" men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree <e a>2 <f a> <e g> <d g> <e g>1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a2 d, e g c,1 \bar "||" }}
		        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  %%Amen midi       
       
} %%% end Amen score block


} %%% book bracket
