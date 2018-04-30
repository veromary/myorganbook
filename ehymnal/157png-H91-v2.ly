%%%% 157.png
%%%% Hymn 91 Dalkeith. Weary of earth and laden with my sin.
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
	\hspace #0.1 }}	
	
  title = "91"
  
  poet = \markup { \small {  \line { \sans {"DALKEITH."} \hspace #1 \roman {"(10. 10. 10. 10.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.} }
  
  arranger = \markup { \small \smallCaps "T. Hewlett, 1845-74." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 a'1 | fis2 e d d | e fis a2. g4 | fis1 \breathmark \bar "||" fis1 | \break
  fis2 fis d' d | cis a fis2. fis4 | eis1 \breathmark \bar "||" fis1 | a2 a a g | \break
  g fis e b' | a1 \breathmark \bar "||" d1 | d2. d4 d2 b | a gis a e | d1 \bar "||"
} 
   
alto = \relative c' {
  \partial 1 d1 | cis2 cis d d | d d d cis | d1 \bar "||" d1 |
  e2 d fis fis | eis cis cis bis | cis1 \bar "||" cis1 | fis2 fis fis e |
  e d e e | \merge a1 \bar "||" a1 | fis2 fis g d | d d d cis | \merge d1 \bar "||" 
}

tenor = \relative c {\clef bass 
  \partial 1 fis1 | a2 g fis a | b a b a | a1 \bar "||" a1 |
  ais2 b b a | gis a a fis | gis1 \bar "||" a1 | cis2 c b b |
  cis d d cis | d1 \bar "||" d1 | c2 c b g | fis eis fis g | fis1 \bar "||"
}

bass = \relative c {\clef bass 
  \partial 1 d1 | a2 a b fis' | g fis e a, | d1 \bar "||" d1 |
  cis2 b b b | cis fis d d | cis1 \bar "||" fis1 | fis2 e dis e |
  a, a' gis g | fis1 \bar "||" fis1 | d2 d g g, | a b a a | d1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \hspace #40 \small \smaller {  "[" \italic "By permission of Novello & Co. Ltd." "]" } }

\markup { \small { \hspace #74 \italic "S. J. Stone, 1839-1900." } }

		                                                                                                     
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EARY of earth and laden with my sin,"
			                                 "  I look at heaven and long to enter in;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "But there no evil thing may find a home,"
					   "And yet I hear a voice that bids me ‘Come.’"
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "So vile I am, how dare I hope to stand"
				   "In the pure glory of that holy land?"
				   "Before the whiteness of that throne appear?"
				   "Yet there are hands stretched out to draw me near."
			}}		
    }	%%% end super column  
}	


%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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


%%% second page
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "3  "
			  \column {	     
				  "The while I fain would tread the heavenly way,"
				  "Evil is ever with me day by day;"
				  "Yet on mine ears the gracious tidings fall,"
				  "‘Repent, confess, thou shalt be loosed from all.’"
			}}
			\hspace #1 
           		\line { "4  "
			  \column {	     
				  "It is the voice of Jesus that I hear,"
				  "His are the hands stretched out to draw me near,"
				  "And his the Blood that can for all atone,"
				  "And set me faultless there before the throne."
			}}
			\hspace #1 
			\hspace #1
			\line { \hspace #20 \italic "Part 2." }
			\hspace #1 
           		\line { "5  "
			  \column {	     
				  "O great Absolver, grant my soul may wear"
				  "The lowliest garb of penitence and prayer."
				  "That in the Father's courts my glorious dress"
				  "May be the garment of thy righteousness."
			}}
			\hspace #1 
           		\line { "6  "
			  \column {	     
				  "Yea, thou wilt answer for me, righteous Lord;"
				  "Thine all the merits, mine the great reward;"
				  "Thine the sharp thorns, and mine the golden crown;"
				  "Mine the life won, and thine the life laid down."
			}}			
    		        \hspace #1 
           		\line {"7. "
			  \column {	     
				  "Naught can I bring, dear Lord, for all I owe,"
				  "Yet let my full heart what it can bestow;"
				  "Like Mary's gift, let my devotion prove,"
				  "Forgiven greatly, how I greatly love."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }} 

}

} %%% book bracket