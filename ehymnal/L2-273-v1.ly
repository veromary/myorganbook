%%%% 421.png
%%%% Hymn 273. Ellers. Saviour, again to thy dear name we raise
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "273"   
  
  poet = \markup { \small {  \line { \sans { "ELLERS."} \hspace #1 \roman {"(10 10. 10 10.)"}} }}
  
  meter = \markup { \small { \italic {Moderatly slow} \general-align #Y #DOWN \note #"4" #0.5 = 92 "("\general-align #Y #DOWN \note #"2" #0.5 = 46")." }}
  
  arranger = \markup { \small { \smallCaps "E. J. Hopkins," "1818-1901." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  ees2 ees4 f4 | ees2 aes2 | aes4 g4 aes4 bes4 | c1 \bar "||" aes2 aes4 bes4 | \break
  aes2 c2 | c4 bes4 c4 d4 | ees1 \bar "||" ees2 aes,4 aes4 | des2 des2 | \break
  des4 bes4 c4 des4 | c1 \bar "||" aes2 bes4 aes4 | aes2 f2 | ees4 ees4 f4 ees4 | ees1 \bar "||" 
}
   
alto = \relative c' {  
  c2 c4 c4 | ees2 ees2 | des4 des4 des4 des4 | c1 \bar "||" ees2 ees4 ees4 | 
  f2 aes2 | aes4 aes4 aes4 aes4 | g1 \bar "||" ees2 ees4 ees4 | f2 f2 | 
  ees4 ees4 ees4 ees4 | ees1 \bar "||" c2 c4 c4 | bes2 bes2 | bes4 bes4 des4 des4 | c1 \bar "||"
}

tenor = \relative c {\clef bass 
  aes'2 aes4 aes4 | aes2 aes2 | ees4 ees4 f4 g4 | aes1 \bar "||" c2 c4 c4 | 
  c2 c2 | d4 d4 c4 bes4 | bes1 \bar "||" aes2 c4 c4 | des2 bes2 | 
  bes4 bes4 g4 g4 | aes1 \bar "||" aes2 aes4 aes4 | f2 aes2 | g4 g4 g4 g4 | aes1 \bar "||"
}

bass = \relative c {\clef bass 
  aes2 aes4 aes4 | c2 c2 bes4 bes4 bes4 bes4 | aes1 \bar "||" aes'2 aes4 aes4 | 
  f2 f2 | bes,4 bes4 bes4 bes4 | ees1 \bar "||" c2 c'4 c4 | bes2 aes2 |
  g4 g4 ees4 ees4 | aes,1 \bar "||" f'2 f4 f4 | des2 des2 | ees4 ees4 ees4 ees4 | aes,1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }

\markup { "                " }

\markup {  \small {  \hspace #66 \italic "J. Ellerton, 1826-93." }} 


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AVIOUR, again to thy dear name we raise"
			                                "With one accord our parting hymn of praise." } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Guard thou the lips from sin, the hearts from shame,"
					   "That in this house have called upon thy name."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Grant us thy peace, Lord, through the coming night;"
				   "Turn thou for us its darkness into light;"
				   "From harm and danger keep thy children free,"
				   "For dark and light are both alike to thee."
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

\markup { \hspace #26   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "3  "
			   \column {	     
				   "Grant us thy peace throughout our earthly life;"
				   "Peace to thy Church from error and from strife;"
				   "Peace to our land, the fruit of truth and love;"
				   "Peace in each heart, thy Spirit from above:"
				   "          " %%% adds vertical spacing between verses
			}}	   
			\line { "4. "
			   \column {	     
				   "Thy peace in life, the balm of every pain;"
				   "Thy peace in death, the hope to rise again;"
				   "Then, when thy voice shall bid our conflict cease,"
				   "Call us, O Lord, to thine eternal peace."
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn f1 ees1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo des1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 aes1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  des1 aes1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }}  %%Amen midi       
       
}  


} %%% book bracket

