%%%% 257.png
%%%% Hymn 159 Modern tune. Adesto Sancta Trinitas.  Be present, Holy Trinity.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - TRINITY SUNDAY"
	\hspace #0.1 }}	
	
	title = \markup { "159 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "ADESTO SANCTA TRINITAS."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "Chartres Church Melody." }
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 3/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override TextScript #'padding = #2	
  \partial 4 g'4 ^\markup { \italic "To be sung in unison." }  | g2 d4 | g2 g4 | a2 a4 | g2 \bar "||" g4 | c2 c4 | \break
  b2 b4 | a2 g4 | d'2 \bar "||" d4 | d2 a4 | c2 b4 | \break
  a2 g4 | d2 \bar "||" g4 | a2 b4 | g2 c4 | b2 a4 | g2 \bar "||"
} 
   
alto = \relative c' {  
  <b d>4 | <b d>2 <b d>4 | b2 <b e>4 | <d fis>2 <d fis>4 | <b d>2 \bar "||" <b d>4 | <e g>2 <e g>4 |
  <d g>2 <d g>4 | <d fis>2 g4 | <fis a>2 \bar "||" <g b>4 | <f a>2 <c f>4 | <e g>2 <d g>4 |
  <c e>2 e4 | a2 \bar "||" e4 | <d fis>2 <d fis>4 | e2 <e g>4 | <d g>2 <d fis>4 | <b d>2 \bar "||"
}

tenor = \relative c {\clef bass 
  s4 | s2 fis4 | g2 s4 | s2 s4 | s2 \bar "||" s4 | s2 s4 |
  s2 s4 | s2 b4 | d2 \bar "||" s4 | s2 s4 | s2 s4 |
  s2 b4 | fis2 \bar "||" b4 | s2 b4 | b2 s4 | s2 s4 | s2 \bar "||"
}

bass = \relative c {\clef bass 
  g4 | g2 b4 | e2 e4 | d2 d4 | g2 \bar "||" g4 | c,2 c4 |
  g'2 g4 | d2 e4 | d2 \bar "||" g4 | d2 f4 | c2 g4 |
  a2 e'4 | d2 \bar "||" e4 | d2 b4 | e2 c4 | g'2 d4 | <g, g'>2 \bar "||"
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4)}} 
		
} %%% Score bracket


%%% Hymn note

\markup { \hspace #38 \column { 
		\line {\hspace #8 \italic "See also:" } 
		"          "
		\line { \small "632  Eternal Light, Divinity." }
		\line  { \small "633  All hail, adored Trinity." }
}}


\markup { "              "} %%% force more blank space           
\markup { "              "} %%% force more blank space 

%%% Lyric titles and attributions

\markup { \column { 
	\line { \small { \hspace #8 \smallCaps  "Office Hymn." " E." \italic "and" "M." \hspace #38 \italic "c. 10th cent.  Tr. J. M. Neale." } }
        \line { \small { \hspace #40 "Adeste, sancta Trinitas." }}
}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E present, Holy Trinity,"
			                                 "  Like splendour, and one Deity:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Of things above, and things below,"
					   "Beginning, that no end shall know."
			  		}}
		      } %%% end verse 1	

		      
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
           		\line { "2  "
			   \column {	     
				   "Thee all the armies of the sky"
				   "Adore, and laud, and magnify,"
				   "And Nature, in her triple frame,"
				   "For ever sanctifies thy name."
				   "               "  %%% adds vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "And we, too, thanks and homage pay,"
				   "Thine own adoring flock to-day;"
				   "O join to that celestial song"
				   "The praises of our suppliant throng!"
				   "               "  %%% adds vertical spacing between verses
			}} 
           		\line { "4  "
			   \column {	     
				   "Light, sole and one, we thee confess,"
				   "With triple praise we rightly bless;"
				   "Alpha and Omega we own,"
				   "With every spirit round thy throne."
				   "               "  %%% adds vertical spacing between verses
			}} 
           		\line { "5. "
			   \column {	     
				   "To thee, O unbegotten One,"
				   "And thee, O sole-begotten Son,"
				   "And thee, O Holy Ghost, we raise"
				   "Our equal and eternal praise.     Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  
       

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a g fis) \bar "|" g\breve \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo <b e>2 <c e>( <b d>)( <a d>) \bar "|" <b d>\breve \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "altos" { \set ignoreMelismata = ##t \override LyricText #'font-size = #-1 A - - - men. }
	
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
       
} %%% end Amen score block


} %%% book bracket
