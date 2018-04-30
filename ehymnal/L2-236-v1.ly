%%%% 369.png
%%%% Hymn 236. Carlisle. Tis good, Lord, to be here!
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE TRANSFIGURATION"
	\hspace #0.1 }}	
	
  title = "236"   
  
  poet = \markup { \small {  \line { \sans { "CARLISLE."} \hspace #1 \roman {"(S. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow, dignified} \general-align #Y #DOWN \note #"2" #0.5 = 60.} }
  
  arranger = \markup { \small \smallCaps "C. Lockhart, 1745-1815." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | bes' ees, g4( f) ees( d) | ees1. \bar "||" ees2 | aes2 bes4( c) bes2 ees,4( aes) | g2( f1) \bar "||" \break
  f2 | g f4( ees) aes2 g4( f) | bes2 aes4( g) c2 ^\fermata \bar "||" d | ees ees,4( aes) g2 f | ees1. \bar "||"
} 
   
alto = \relative c' {  
  bes2 | bes c c bes | bes1. \bar "||" bes2 | ees ees ees c4( f) | ees2( d1) \bar "||"
  d2 | ees d4( ees) f2 ees4( d) | ees2 ees ees \bar "||" f | ees ees4( f) ees2 d | \merge ees1. \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | f g aes g4( f) | g1. \bar "||" g2 | aes g4( aes) bes2 c | bes1. \bar "||"
  bes2 | bes bes c bes | bes ees4( des) c2 \bar "||" aes | bes c bes2. aes4 | g1. \bar "||"
}

bass = \relative c {\clef bass 
      \override Staff.NoteCollision
      #'merge-differently-dotted = ##t
  ees2 | d c aes bes | ees1. \bar "||" ees4( d) | c2 bes4( aes) g2 aes | bes1. \bar "||"
  bes2 | ees \straddle aes4( g) f2 \straddle bes4( aes) | g2 c4( bes) aes2 _\fermata \bar "||" f | g aes4( f) bes2 bes, | ees1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line { \italic "Suitable also for general use." \hspace #42 \italic "J. Armitage Robinson." } 
	\line { "            " }
}}}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last (seventh) verse.

\markup { \hspace #12  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #5.0 \column { \lower #2.4 \fontsize #8 "'T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "is good, Lord, to be here!"
			                                 "  Thy glory fills the night;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thy face and garments, like the sun,"
					   "    Shine with unborrowed light."
					   "                  " %%% blank space before next verse
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				  "    'Tis good, Lord, to be here."
				  "    Thy beauty to behold,"
				  "Where Moses and Elijah stand,"
				  "    Thy messengers of old."
				  "                  " %%% blank space before next verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "    Fulfiller of the past!"
				   "    Promise of things to be!"
				   "We hail thy Body glorified,"
				   "    And our redemption see."		
                                   "                  " %%% blank space before next verse
			}} 
			\line {"4  "
			    \column {
				    "    Before we taste of death,"
				    "    We see thy kingdom come;"
				    "We fain would hold the vision bright,"
				    "    And make this hill our home."
				    "                  " %%% blank space before next verse
			}}
	    } %%% end column 3
     } %%% end master-line
     			\line { \hspace #24 "5. "
			     \column {	     
				     "    'Tis good, Lord, to be here!"
				     "    Yet we may not remain;"
				     "But since thou bidst us leave the mount"
				     "    Come with us to the plain."				                                   
     			}}
   } %%% super column bracket
} %%% lyrics markup bracket
  
       
%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}  %%Amen midi       
       
}  


} %%% book bracket

