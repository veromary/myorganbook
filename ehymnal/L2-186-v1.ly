%%%% 301.png
%%%% Hymn 186. Rodmell. Come, let us join the Church above 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - MARTYRS"
	\hspace #0.1 }}	
	
  title = "186"   
  
  poet = \markup { \small {  \line { \sans { "RODMELL."} \hspace #1 \roman {"(C . M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96.} }
  
  arranger = \markup { \small \italic "English Traditional Melody." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d4 | g4. fis8 e4 a4 | g8[ fis] e[ fis] d4 \breathmark \bar "||" d | g b8[ d] c4 b | a2. \breathmark \bar "||" \break
  d,4 | g b8[ d] c4 b8[ a] | b[ a] g[ fis] e4 \breathmark \bar "||" g8[ b] | a4. g8 fis[ d] e[ fis] | g2. \bar "||"
} 
   
alto = \relative c' {  
  d4 | d d c e | d a d \bar "||" c | b d8[ g] g4 g | g2( fis4) \bar "||"
  d4 | d g g fis | g d c \bar "||" b | e e d d | d2. \bar "||"
}

tenor = \relative c {\clef bass 
  b'4 | g b c c | a fis g \bar "||" fis | g g8[ b] c4 d | d2. \bar "||"
  fis,4 | g g8[ a] c4 d | d g, g \bar "||" g | c4. b8 a[ fis] g[ a] | b2. \bar "||"
}

bass = \relative c {\clef bass 
  g4 | b g c a | d c b \bar "||" a | g g' e g | d2. \bar "||"
  c4 | b g' a d, | g b, c \bar "||" e | a, c d d | g,2. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup {  \small {   \hspace #68 \italic "A. R." } }


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, let us join the Church above"
			                                 "  The Martyr's praise to sing," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "That soldier true who gave to-day"
					   "    His life-blood for his King."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "To-day through heaven the cry rang out,"
				   "    ‘Great God, the fight is done!"
				   "Room for the Victor! lo, his crown"
				   "    Christ's valiant Saint hath won!’"

				   "          " %%% adds vertical spacing between verses
			}}
                           \line { "3  "
			   \column {	     
				   "The Martyr's triumph shall endure,"
				   "    His fame time cannot dim:"
				   "See how he calls on one and all"
				   "    To rise and follow him!"
				   "          " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "We know that in our Saviour Christ"
				   "    The blest our troubles heed;"
				   "That Saints in heaven to saints on earth"
				   "    Are very near indeed."
				   "          " %%% adds vertical spacing between verses
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

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { \hspace #-9.6 \italic "Unison. " "5  "
			   \column {	     
				   "The cloud of witnesses look down,"
				   "    They cheer us on to fight;"
				   "To God their prayers go up that he"
				   "    May lead their friends aright."
				   "          " %%% adds vertical spacing between verses
			}}  
           		\line { "6  "
			   \column {	     
				   "Brave Martyr, we will follow till"
				   "    To God we yield our breath;"
				   "And learn from thee to spurn the world"
				   "    And mock at pain and death!"
				   "          " %%% adds vertical spacing between verses
			}}
			 \line { \hspace #-9.6 \italic "Unison. " "7. "
			   \column {	     
				   "To Christ, for whom the Martyrs die,"
				   "    All laud and glory be,"
				   "With Father, and with Holy Ghost,"
				   "    To all eternity.     Amen."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi       
       
}  


} %%% book bracket

