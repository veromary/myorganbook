%%%% 183.png (begins on 182.png)
%%%% Hymn 113 Song 4. Lord, when thy kingdom comes, remember me
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "113"
  
  poet = \markup { \small {  \line { \sans {"SONG 4."} \hspace #1 \roman {"(10. 10. 10. 10.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  
  arranger = \markup { \small \smallCaps "O. Gibbons, 1583-1625." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% push a note slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key c \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 g'2 | c b c d | ees bes c aes | g1. \bar "||" g2 | bes a g2. f4 | \break
  ees2 c f ees | d1. \bar "||" d'2 | b g c b | c g c ees | \break
  ees1. \bar "||" g,2 | a b c d | b ees d d | c1. \bar "||"
} 
   
alto = \relative c' {
  ees2 | ees d ees f | g ees g f4( ees4) | d1. \bar "||" d2 g f ees d |
  c c c c | b1. \bar "||" g'2 | g g g f | ees ees ees f |
  g1. \bar "||" g2 | g f ees aes! | g4(f) ees(f) g(f) d2 | ees1. \bar "||"
}

tenor = \relative c {\clef bass 
  c'2 | g g g bes | bes ees4(d) c2 c | b1. \bar "||" bes2 | d d4(c) bes2 bes |
  g2 ees aes g | g1. \bar "||" b2 | d b c d | g, c c4( bes) aes2 |
  bes1. \bar "||" c2 | c g c f | d c c b | c1.  \bar "||"
}

bass = \relative c {\clef bass 
  c2 | c g c bes | ees g ees f | g1. \bar "||" g,2 | g'  d ees bes | 
  c c f c | g1. \bar "||" g2 | g'2. f4 ees2 d | c \straddle c'4( bes4) aes4( g) f2 |
  ees1. \bar "||" ees2 | f g aes! f | g c,  g' g, | c1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Hymn Note and Lyric Attribution and title markup

\markup { \hspace #24 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "All Souls" "(" \hspace #-1 \italic "No. 429" \hspace #-1 ")." }  

\markup { \small { \hspace #74 \italic "Archbishop Maclagan." } }

\markup { \hspace #26 \small "‘Verily I say unto thee, To-day shalt thou be with me in Paradise.’" } 
%%% Main lyric block

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
				 \line { \hspace #2.2 \column { \line { \fontsize #0 "‘" \hspace #-1.0 \lower #2.4 \fontsize #8 "L" }}   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, when thy kingdom comes, remember me;’"
			                                 "  Thus spake the dying lips to dying ears;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O faith, which in that darkest hour could see"
					   "    The promised glory of the far-off years!"
			  		}} 
			         } %%% finish verse 1	
			\hspace #1 
           		\line { "2  "
			   \column {	     
				  "No kingly sign declares that glory now,"
				  "    No ray of hope lights up that awful hour;"
				  "A thorny crown surrounds the bleeding brow,"
				  "    The hands are stretched in weakness, not in power."
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

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
		  	\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Hark! through the gloom the dying Saviour saith,"
				   "    ‘Thou too shalt rest in Paradise to-day;’"
				   "O words of love to answer words of faith!"
				   "    O words of hope for those that live to pray!"
			}}      
			\hspace #1 
           		\line { "4  "
			  \column {	     
				  "Lord, when with dying lips my prayer is said,"
				  "    Grant that in faith thy kingdom I may see;"
				  "And, thinking on thy Cross and bleeding head,"
				  "    May breathe my parting words, ‘Remember me.’"
			}}
			\hspace #1 
           		\line { "5  "
			  \column {	     
				  "Remember me, but not my shame or sin;"
				  "    Thy cleansing Blood hath washed them all away;"
				  "Thy precious death for me did pardon win;"
				  "    Thy Blood redeemed me in that awful day."
			}}
    		        \hspace #1 
           		\line {"6. "
			  \column {	     
				  "Remember me; and, ere I pass away,"
				  "    Speak thou the assuring word that sets us free,"
				  "And make thy promise to my heart, ‘To-day"
				  "    Thou too shalt rest in Paradise with me.’"
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }} 

}
	
	
} %%% book bracket