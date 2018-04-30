%%%% 176.png
%%%% Hymn 106. Horsley. "There is a green hill far away"
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
	\hspace #0.1 }}	
	
  title = "106"
  
  poet = \markup { \small {  \line { \sans {"HORSLEY."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 88.} }
  
  arranger = \markup { \small \smallCaps "W. Horsley, 1774-1858." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 ees4 | f g aes g | bes aes8 g f4 \breathmark  \bar "||" bes | g ees' d c | bes2. \breathmark \bar "||" \break
  f8 g | aes4 aes aes g | c c b^\fermata \bar "||" b! | c aes g f | ees2. \bar "||" 
}
  
alto = \relative c' {
  \partial 4 ees4 | d ees ees ees | ees ees d \bar "||" bes | ees ees f f | d2. \bar "||" \break
  d4 | ees ees f g | g f g \bar "||" g | ees f ees d | \augdots ees2. \bar "||" 
}

tenor = \relative c {\clef bass 
  \partial 4 g'4 | bes bes aes bes | bes c f, \bar "||" f | bes c bes a | bes2. \bar "||" \break
  bes4 | aes c bes bes | c c d \bar "||" d | c c bes4. aes8 | g2. \bar "||" 
}

bass = \relative c {\clef bass 
  \partial 4 ees4 | bes ees c ees | g, aes bes \bar "||" d | ees c f f | bes,2. \bar "||" \break
  bes4 | c c d ees | aes aes g_\fermata \bar "||" g | aes aes, bes bes | ees2. \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 88 4)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small { \hspace #74 \italic "Mrs. C. F. Alexander, 1823-95." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #6 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HERE is a green hill far away,"
			                                "  Without a city wall," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Where the dear Lord was crucified"
					   "    Who died to save us all."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "We may not know, we cannot tell,"
				   "    What pains he had to bear,"
				   "But we believe it was for us"
				   "    He hung and suffered there."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "He died that we might be forgiven,"
				  "    He died to make us good;"
				  "That we might go at last to heaven,"
				  "    Saved by His precious Blood."
			}}
		        \hspace #1 
           		\line {"4  "
			  \column {	     
				  "There was no other good enough"
				  "    To pay the price of sin;"
				  "He only could unlock the gate"
				  "    Of heaven, and let us in."
			}}
	    } %%% end column 3
     } %%% end master-line
		%%% centred last verse
		        \hspace #1 
           		\line { \hspace #26  "5. "
			  \column {	     
				  "O, dearly, dearly has he loved,"
				  "    And we must love him too,"
				  "And trust in his redeeming Blood,"
				  "    And try his works to do."
     			}}
     
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 88 4) }} 

}

} %%% book bracket