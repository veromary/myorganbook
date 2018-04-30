%%%% 233.png
%%%% Hymn 144. Metzler's Redhead No. 66. O Christ, our hope, our heart's desire.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "144"   
  
  poet = \markup { \small {  \line { \sans { "METZLER'S REDHEAD NO. 66."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time}  \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small \smallCaps "R. Redhead, 1820-1901." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 fis2 | e d d' a | b b a \breathmark \bar "||" a | b cis d cis | b1. \bar "||" \break
  b2 | b a b a4( g) | fis2 e a \breathmark \bar "||" d, | g fis e e | 
      \once \override Dots #'transparent = ##t
      d1. \bar "||"
} 
   
alto = \relative c' {  
  d2 | cis d d d | d e fis \bar "||" fis | d g fis2. e4 |  d1. \break
  d2 | d d d e | d cis d \bar "||" b | b4( cis) d2 d cis | \merge d1. \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 | a fis a d | b cis d \bar "||" d | d cis4( b) b2 ais | b1. \bar "||" \break
  g2 | g fis g b | a2 a a \bar "||" b | g a a2. g4 | fis1. \bar "||"
}

bass = \relative c {\clef bass 
  \override Staff.NoteCollision #'merge-differently-dotted = ##t
  d2 | a b fis fis' | g g d \bar "||" d | g e fis fis, | b1. \bar "||" \break
  g'2 | g d g e | a2. g4 fis2 \bar "||" g | e d a a | d1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}       
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \column { 
	\line { \small { \hspace #7 \italic "Compline." \hspace #60 \italic "c. 8th cent.  Tr. J. Chandler" "†."}}
        \line { \small { \hspace #44 "Jesu nostra redemptio." }}
}}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " CHRIST, our hope, our hearts' desire,"
			                                 "  Redemption's only spring;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Creator of the world art thou,"
					   "    Its Saviour and its King."
			  		}} 
			         } %%% finish verse 1
		        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "How vast the mercy and the love"
				   "    Which laid our sins on thee,"
				   "And led thee to a cruel death"
				   "    To set thy people free."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "But now the bonds of death are burst,"
				   "    The ransom has been paid;"
				   "And thou art on thy Father's throne"
				   "    In glorious robes arrayed."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "O may thy mighty love prevail"
				   "    Our sinful souls to spare;"
				   "O may we come before thy throne,"
				   "    And find acceptance there!"
			}}
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
			    \column {	     
				   "O Christ, be thou our present joy,"
				   "    Our future great reward;"
				   "Our only glory may it be"
				   "    To glory in the Lord."
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6. "
			     \column {	     
				   "All praise to thee, ascended Lord;"
				   "    All glory ever be"
				   "To Father, Son, and Holy Ghost,"
				   "    Through all eternity.     Amen."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  


} %%% book bracket
