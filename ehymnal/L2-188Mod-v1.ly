%%%% 305.png
%%%% Hymn 188 Modern tune. Iste Confessor.  He, whose confession God of old accepted
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - CONFESSORS"
		\hspace #0.1 }}	

  title = \markup { "188 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "ISTE CONFESSOR."} \hspace #1 \roman {"(11 11. 11 5.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96.} }
  
  arranger = \markup { \small { \italic "Angers Church Melody." }}
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 2/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override TextScript #'padding = #1	
  d2^\markup {\hspace #-1 \italic "To be sung in unison." } g4 fis | e2 d | g4. fis8 g4 a | b2 b \bar "||" d d4 b | \break
  c2 b | g4. a8 b4 c | d2 d \bar "||" d, e4 fis | g2 g | \break
  b4. c8 d4 c | b2 a \bar "||" b c4 b | a2  g2 \bar "||"
} 
   
alto = \relative c' {  
  <g b>2 <b d>4 <b d> | c2 a | d4. d8 b4 d | <d g>2 <d g> \bar "||" <d fis> <d fis>4 <d g> | 
  <e g>2 <d g> | <b e>4. <d fis>8 <d g>4 <e g> | <fis a>2 <fis a> \bar "||" b,2 <g b>4 <a d> | <b d>2 <b d> |
  <e g>4. <e g>8 <d g>4 <d g> | <d g>2 <d fis> \bar "||" <d g> <c e>4 <d g> | e <d fis> <b d>2 \bar "||"
}

tenor = \relative cis {\clef bass 
  g2 g4 b | g'2 fis | g4. a8 g4 s4 | s2 s2 \bar "||" b,2 b4 g | 
  s1 | s1 | s1 \bar "||" s1 | s1 |
  s4. c8 b4 c4 | g b d2 \bar "||" g, a4 b | c d g,2 \bar "||"
}

bass = \relative cis {\clef bass 
  s1 | c2 d | b4. d8 e4 d | g2 g \bar "||" s1 |
  c,2 g | e'4. d8 g4 e | d2 d \bar "||" g2 e4 d | g2 g | 
  e4. s8 s4 s4 | s1 \bar "||" s1 | s1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4)}} 
		
} %%% Score bracket


%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn. " \italic "Common of a Confessor." \hspace #29 \italic "8th cent.  Tr. L. H." } 
          	                         \line { \hspace #2 "E." \italic "and" "M."  }    
					 \line { \hspace #34 "Iste Confessor." }
}}}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E, whose confession God of old accepted,"
			                                 "  Whom through the ages all now hold in honour," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Gaining his guerdon this day came to enter"
					   "                                Heaven's high portal."
					   "                " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
			   \line { "2  "
			   \column {	     
				   "God-fearing, watchful, pure of mind and body,"
				   "Holy and humble, thus did all men find him;"
				   "While, through his members, to the life immortal"
				   "                                Mortal life called him."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			 \column {	     
				   "Thus to the weary, from the life enshrinèd,"
				   "Potent in virtue, flowed humane compassion;"
				   "Sick and sore laden, howsoever burdened,"
				   "                                There they found healing."
				   "                " %%% adds vertical spacing between verses
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

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  

	   
			\line { "4  "
			\column {	     
				"So now in chorus, giving God the glory,"
				"Raise we our anthem gladly to his honour,"
				"That in fair kinship we may all be sharers"
				"                                Here and hereafter."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "5. "
			   \column {	     
				   "Honour and glory, power and salvation,"
				   "Be in the highest unto him who reigneth"
				   "Changeless in heaven over earthly changes,"
				   "                                Triune, eternal.     Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a g fis) \bar "|" g\breve  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo <b e>2 <c e> <b d> <a d> \bar "|" <b d>\breve \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 "A     -      -      -  " men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree s2 *4 \bar "|" s\breve \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi       
       
} %%% end Amen score block


} %%% book bracket
