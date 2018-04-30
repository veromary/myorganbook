%%% 355.png
%%% Hymn 227. Forsaken once, and thrice denied.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. PETER" \hspace #0.1 }}
	title = "227"
	poet = \markup { \small { \sans "ERSKINE." \hspace #1 \roman  "(8 8. 8 6.)" } }
	meter =  \markup { \small { \italic "In Moderate time." \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
	arranger = \markup { \small \smallCaps "W. H. Gladstone, 1840-91." }
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin
%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%macros end

global = {
\time 4/2
\key ees \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \partial 2 bes'2 \bar "|" aes g f aes \bar "|" g f ees \breathmark \bar "||" ees2 \bar "|" f aes g c \bar "|"  bes a g  \breathmark \bar "||" \break
  bes2  \bar "|" bes bes ees bes \bar "|" c bes ees, \breathmark \bar "||" aes \bar "|" g f ees d \bar "|" ees1. \bar "||" 
}
 
alto = \relative c' {  
  \partial 2 ees2 \bar "|" ees ees ees ees \bar "|" ees d ees \bar "||" bes2 \bar "|" bes d ees ees \bar "|"  d d bes  \bar "||" \break
  d2  \bar "|" ees f g ees \bar "|" ees d ees \bar "||" f \bar "|" ees c bes bes \bar "|" bes1. \bar "||" 
}

tenor = \relative c { \clef bass 
  \partial 2 g'2 \bar "|" aes bes c c \bar "|" bes bes g \bar "||" g \bar "|" f f ees g \bar "|"  g fis g \bar "||" \break
  aes2  \bar "|" g f ees ees \bar "|" aes aes g \bar "||" bes \bar "|" bes aes g f \bar "|" g1. \bar "||" 
}

bass = \relative c { 
  #(set-accidental-style 'forget) \clef bass 
  \partial 2 ees2 \bar "|" c bes aes aes \bar "|" bes bes ees \bar "||" ees \bar "|" d bes ees c \bar "|"   d d g  \bar "||" \break
  f2  \bar "|" ees d c g \bar "|" aes bes c \bar "||" d \bar "|" ees aes, bes bes \bar "|" << ees1.  \new Voice = "organ" { \voiceFour \stemDown \override NoteColumn #'force-hshift = #0.2 \set fontSize = #-4 \override Stem #' length =#4 { \dotsUp ees,1. } } >> \bar "||" 
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

\score{
\new ChoirStaff
<<
	\context Staff = upper <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \voiceTwo \global \alto }
							>>
		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
%%midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}}%% midi score bracket

}%%score


%%% Lyric attributions and titles

\markup { \small { \hspace #76 \italic "Mrs. C. F. Alexander, 1823-95." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORSAKEN once, and thrice denied,"
			                                "  The risen Lord gave pardon free," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Stood once again at Peter's side,"
					   "        And asked him, ‘Lov'st thou me? ’"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2  "
			   \column {
				   "How many times with faithless word"
				   "Have we denied his holy name."
				   "How oft forsaken our dear Lord,"
				   "        And shrunk when trial came!"
				   "      " %%% adds vertical spacing between verses
		       }}
		       	\line {  "3  "
			   \column {
				   "Saint Peter, when the cock crew clear,"
				   "Went out, and wept his broken faith;"
				   "Strong as a rock through strife and fear,"
				   "        He served his Lord till death."
				   "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "How oft his cowardice of heart"
				   "We have without his love sincere,"
				   "The sin without the sorrow's smart,"
				   "        The shame without the tear!"
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			   \column {	     
				   "O oft forsaken, oft denied,"
				   "Forgive our shame, wash out our sin;"
				   "Look on us from thy Father's side"
				   "        And let that sweet look win."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"6. "
			    \column {	     
				    "Hear when we call thee from the deep,"
				    "Still walk beside us on the shore,"
				    "Give hands to work, and eyes to weep,"
				    "        And hearts to love thee more."
			}}	
	    } %%% end column 3
	} %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket



%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne ees1 ees \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo c1 bes \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne aes'1 g \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo aes1 ees' \bar "||" }}
		>>
>>

\header { breakbefore = ##f piece = " " opus = " " }
\layout {
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove "Time_signature_engraver" }
	}%%layout

%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} %%Amen midi
}%%amen score

} %%% book bracket
