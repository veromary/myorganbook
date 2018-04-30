%%% 349.png
%%% Hymn 222. The Son of Consolation!.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. BARNABAS" \hspace #0.1 } }
	title = "222"
	poet = \markup { \small { \sans "AURELIA" \hspace #1 \roman  "(7 6. 7 6. D.)" } }
	meter =  \markup { \small { \italic "In moderate time"  \general-align #Y #DOWN \note #"2" #0.5 = 70.} }
	arranger = \markup { \small \smallCaps "S. S. Wesley," "1810-76." }
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%% Macro to pull notes leftwards, used to create those merged semibreves

merge = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks

breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%partial measure for Amen block
par = \set Score.measurePosition = #(ly:make-moment 1 2)

%% music function to allow lyrics to skip

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { \partial 2 fis2 \bar "|" fis fis g fis \bar "|" fis1 e2 \breathmark \bar "||" d \bar "|" d b' a g \bar "|" fis1. \bar "||" g2 \bar "|" a d d cis \bar "|" cis1 b2 \breathmark \bar "||" \break
    a2 \bar "|" g a fis d \bar "|" e1. \bar "||" e2 \bar "|" fis g a b \bar "|" b1 a2 \breathmark \bar "||" d \bar "|" d2. cis4 b2 fis \bar "|" g1. \bar "||" \break
    e2 \bar "|" fis fis g fis \bar "|" fis1 e2 \breathmark \bar "||" d \bar "|" d e d cis \bar "|" \par d1. \bar "||" 
  }
  %%Amen
  \tag #'Amen { d1 d \bar "||" }
}
 
alto = \relative c' { 
  \tag #'Tune { \partial 2 d2 \bar "|" d d d d \bar "|" d1 cis2 \bar "||" d \bar "|" b d d cis \bar "|" d1. \bar "||" cis2 \bar "|" d d d e \bar "|" e1 d2 \bar "||" \break
    fis2 \bar "|" fis e d d \bar "|" cis1. \bar "||" cis2 \bar "|" d cis d d \bar "|" d1 d2 \bar "||" fis \bar "|" fis2. fis4 fis2 fis \bar "|" e1. \bar "||" \break
    e2 \bar "|" d d d d \bar "|" b1 b2 \bar "||" b \bar "|" b b a a \bar "|" \par a1. \bar "||" 
  }
  %%Amen
  \tag #'Amen { b1 a \bar "||" }
}

tenor = \relative c { 
  \tag #'Tune { \clef bass \partial 2 a'2 \bar "|" a a b a \bar "|" a1 a2 \bar "||"  a \bar "|" e e fis a \bar "|" a1. \bar "||" a2 \bar "|" a a ais ais \bar "|" ais1 b2 \bar "||" \break
    cis2 \bar "|" d e a, gis \bar "|" a1. \bar "||" a2 \bar "|" a a a g \bar "|" g1 a2 \bar "||" b \bar "|" b2. ais4 b2 b \bar "|" b1. \bar "||" \break
    a2 \bar "|" a a b a \bar "|" a1 g2 \bar "||" g \bar "|" g g e g \bar "|" \par fis1. \bar "||" 
  }
  %%Amen
  \tag #'Amen { g1 fis \bar "||" }
}

bass = \relative c { 
  \tag #'Tune { \clef bass \partial 2 d2 \bar "|" d d d d \bar "|" a1 g2 \bar "||" fis \bar "|" g g a a \bar "|" d1. \bar "||" e2 \bar "|" fis fis fis fis, \bar "|" g1 g2 \bar "||" \break
    a2 \bar "|" b cis d b \bar "|" a1. \bar "||" a2 \bar "|" d e fis g \bar "|" \merge g1 fis2 \bar "||" b, \bar "|" fis'2. e4 d2 dis \bar "|" e1. \bar "||" \break
    cis2 \bar "|" d d d d \bar "|" g,1 g2 \bar "||" << { \override Stem #' length = #4.5 {g'2 \bar "|" e2  e2} }  \new Voice = "pedals" { \voiceFour \stemDown \override NoteColumn #'force-hshift = #0.1 \set fontSize = #-3 \override Stem #' length = #4 {g,2 \bar "|" e2 e2 } } >> a a \bar "|" \par d1. \bar "||" 
  }
  %%Amen
  \tag #'Amen { g,1 d' \bar "||" }
}

wordsAmen = \lyricmode { \skips #52 \override LyricText #' font-size = #-1  A -- men. }

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

        \new Lyrics \lyricsto altos \wordsAmen

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
	
} %%score. This was for layout. We will generat midi separately

%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 70 2) }}      
  	
} %%% end midi score bracket


%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 70 2) }}      
  	
	
} %%% end Amen midi score bracket


%%% Hymn note

\markup { \hspace #54 \center-align {
	\line {\smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1  \italic "A higher setting of this tune will be found at Hymn" "489."  }
       \line {"                "}  %%% force blank space before start of lyrics if needed
	\line {"                "}  %%% and more blank space if needed
	\line {"                "}  %%% and more blank space if needed.
}}



%%% Lyric attributions and titles

\markup { \column {
	\line { \small { \hspace #14 \italic "(O. H., 174-6, if after Ascensiontide)." \hspace #36 \italic "Mrs. Coote." }}  
	\line {"                "}  %%% and more blank space if needed
}}	


\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Son of Consolation!"
			                               "    Of Levi's priestly line,"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "Filled with the Holy Spirit"
					  "    And fervent faith divine,"
					  "With lowly self-oblation,"
					  "    For Christ an offering meet,"
					  "He laid his earthly riches"
					  "    At the Apostles' feet."
			  		}}
		      } %%% end verse 1	

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

\markup { \hspace #36   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "The Son of Consolation!"
				   "    O name of soothing balm!"
				   "It fell on sick and weary"
				   "    Like breath of heaven's own calm!"
				   "And the blest Son of Comfort"
				   "    With fearless loving hand"
				   "The Gentiles' great Apostle"
				   "    Led to the faithful band."
				   "             " %%% add vertical spacing between verses
			}}
           		 \line { \hspace #-9.7 \italic "Unison. " "3  "
			   \column {	     
				   "The Son of Consolation!"
				   "    Drawn near unto his Lord,"
				   "He won the Martyr's glory,"
				   "    And passed to his reward;"
				   "With him is faith now ended,"
				   "    For ever lost in sight,"
				   "But love, made perfect, fills him"
				   "    With praise, and joy, and light."
				   "             " %%% add vertical spacing between verses
			}} 
           		\line { "4  "
			   \column {	     
				   "The Son of Consolation!"
				   "    Lord, hear our humble prayer,"
				   "That each of us thy children"
				   "    This blessèd name may bear;"
				   "That we, sweet comfort shedding"
				   "    O'er homes of pain and woe,"
				   "'Midst sickness and in prisons,"
				   "    May seek thee here below."
				   "             " %%% add vertical spacing between verses
			}}
           		\line { "5. "
			   \column {	     
				   "The Sons of Consolation!"
				   "    O what their bliss will be"
				   "When Christ the King shall tell them,"
				   "    ‘Ye did it unto me!’"
				   "The merciful and loving"
				   "    The Lord of life shall own,"
				   "And as his priceless jewels"
				   "    Shall set them round his throne."
				   "             " %%% add vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket


} %% book bracket

