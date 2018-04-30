%%%% 268a.png
%%%% Hymn 166 St. David. Christ is gone up; yet ere he passed
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - EMBER DAYS"
	\hspace #0.1 }}	
	
	title = "166"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "ST. DAVID."} \hspace #1 \roman {"(C. M.)"}}
		                        \line { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Present form of melody in"}
	  					 \line { \italic "Ravenscroft's Psalter, 1621." }
  	}}}
	 
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
	      
%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%% force a bit of space

space = \once \override Score.SeparationItem #'padding = #2	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { \partial 1 d1 | a'2 d fis, a | g fis e1 \bar "||" \partmeasure d1 | a'2 d, g b | a1 \breathmark \bar "||" \break
  a1 | b2 fis a d, | g fis e1 \bar "||" \partmeasure a1 | d,2 fis g e |  d1 \bar "||" }
      \tag #'Amen { \cadenzaOn d1 d \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'Tune { \merge d1 | e2 d d d | b4( cis) d2 cis1 \bar "||" b1 | e2 d d d | d1 \bar "||"
  d1 | d2 d d d | b4( cis) d2 cis1 \bar "||" e1 | d2 d d cis | \merge d1 \bar "||" }
      \tag #'Amen { b1 a \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'Tune { fis1 | a2 b d d | g, a a1 \bar "||" fis1 | a2 fis g g | fis1 \bar "||"
  fis1 | g2 a a fis | g a a1 \bar "||" a1 | fis2 b b a | fis1 \bar "||" }
      \tag #'Amen { g1 fis \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'Tune { d1 | cis2 b b' fis | e d a1 \bar "||" b1 | cis2 d b g | d'1 \bar "||" 
  d1 | g,2 d' fis, b | e d a1 \bar "||" cis1 | d2 b g a | d1 \bar "||" }
      \tag #'Amen { g,1 d' \bar "||" }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #28 A -- men.
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
 
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \inlinelyrics }
 			      
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
	
} %%% Score bracket


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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% end score bracket

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket



%%% Lyric attributions and titles

\markup { \small { \hspace #84 \italic "J. M. Neale, 1818-66." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRIST is gone up; yet ere he passed"
			                                 "  From earth, in heaven to reign," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "He formed one holy Church to last"
					   "    Till he should come again."
					   "              " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "His twelve Apostles first he made"
				   "    His ministers of grace;"
				   "And they their hands on others laid,"
				   "    To fill in turn their place."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "So age by age, and year by year,"
				   "    His grace was handed on;"
				   "And still the holy Church is here,"
				   "    Although her Lord is gone."
				   "              " %%% adds vertical spacing between verses

			}}
			\line { "4. "
			     \column {	     
				     "Let those find pardon, Lord, from thee,"
				     "    Whose love to her is cold:"
				     "And bring them in, and let there be"
				     "    One Shepherd and one Fold."
     			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

} %%% book bracket
