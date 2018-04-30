%%%% 172.png
%%%% Hymn 103. Allein Gott in der Hoh Sei Ehr. "O sinner, raise the eye of faith"
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
	\hspace #0.1 }}	

  title = "103"

  meter = \markup { \small { \column {  \line { \sans {"ALLEIN GOTT IN DER HÖH SEI EHR."} \hspace #1 \roman {"(8 7. 8 7. 8 8 7.)" }}
                                       \line { \italic {Slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 50.}
                                  }
  }}  
  
  arranger = \markup { \small {\center-align {\line {\italic "Arranged by" \smallCaps "N. Decius, 1519-41" } 
                                              \line { "(" \hspace #-1 \italic "later form of the melody"  \hspace #-1 ")." }}
  }}

  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macors

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8
              \once \override Stem #'X-offset = #-2.8 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions
	      
%%% SATB voices

global = {
  \time 8/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 f4(g) | a2 bes c bes | a g a^\fermata \bar "||" \break
  a | a g4(a) bes(a) g2 | f(g) f^\fermata \bar "||" \break
  f4(g) | a2 bes c bes | a g a^\fermata \bar "||" a | \break
  a g4(a) bes(a) g2 | f(g) f^\fermata \bar "||" f | g a bes a | \break
  g fis g^\fermata \bar "||" g | a bes c bes | a g a^\fermata \bar "||" \break
  a^\markup {\italic "Very broad."} | a g4(a) bes(a) g2 | f(g) f^\fermata \bar "||" 
}

alto = \relative c' { 
  \partial 2 c2 | f f e f4(g) | \straddle g(f) \straddle f(e) f2 \bar "||" \break
  f | f f f d | d(e) f \bar "||" \break
  f | f f f4(c) d(e) | f2. e4 f2 \bar "||" fis | \break
  fis g4(fis) g(d) d(cis) | d(f2 e4) f2 \bar "||" f | f ees d ees | \break
  d d d \bar "||" ees | f f e! f4(g) | \straddle g(f) \straddle f(e) f2 \bar "||" \break
  fis | fis g4(fis) g(d) d(cis) | d(f2 e4) f2 \bar "||" 
}

tenor = \relative c { \clef bass 
  \partial 2 a'4(bes) | c2 bes g d' | c c c \bar "||" \break
  c | d d4(c) bes(c) bes2 | a(c4 bes) a2 \bar "||" \break
  \once \override NoteColumn #'force-hshift = #1 a | f'4(e) d2 c g | a4(bes) c2 c \bar "||" d | \break
  d d4(c) bes(d) e2 | a,(c) a \bar "||" bes | bes c f, c' | \break
  bes a bes \bar "||" bes | c bes g d' | c c c \bar "||" \break
  d | d d4(c) bes(d) e2 | a,(c) a \bar "||" 
}

bass = \relative c { \clef bass 
  \partial 2 f2 | f d c d4(e) | f2 c f_\fermata \bar "||" \break
  f | d bes4(a) g(a) bes2 | d(c) f \bar "||" \break
  f4(e) | d(c) bes2 a g | f c' f_\fermata \bar "||" d | \break
  \straddle d'4(c) bes(a) g(f!) e2 | d(c) f_\fermata \bar "||" d | ees c bes c | \break
  d d g_\fermata \bar "||" ees | ees d c d4(e) | f2 c f_\fermata \bar "||" \break
  d | \straddle d'4(c) bes(a) g(f!) e2 | d(c) f_\fermata \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small { \hspace #66 \italic "c. 17th cent.  Tr. J. M. Neale and others."} }

\markup { \small { \hspace #42 "Attolle paulum lumina."} }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  SINNER, raise the eye of faith,"
			                                "  To true repentance turning," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Consider well the curse of sin,"
					   "    Its shame and guilt discerning:"
					   "Upon the Crucified One look,"
					   "So shalt thou learn, as in a book,"
					   "    What well is worth thy learning."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
"Look on the head, with such a crown"
"    Of bitter thorns surrounded;"
"Look on the blood that trickles down"
"    The feet and hands thus wounded;"
"And see his flesh with scourges rent:"
"Mark how upon the Innocent"
"    Man's malice hath abounded."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
"But though upon him many a pain"
"    Its bitterness is spending,"
"Yet more, O how much more! his heart"
"    Man's wickedness is rending!"
"Such is the load for sinners borne,"
"As Mary's Son in woe forlorn"
"    His life for us is ending."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -62 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
"None ever knew such pangs before,"
"    None ever such affliction,"
"As when his people brought to pass"
"    The Saviour's crucifixion."
"He willed to bear for us the throes,"
"For us the unimagined woes,"
"    Of death's most fell infliction."
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
"* O sinner, stay and ponder well"
"    Sin's fearful condemnation;"
"Think on the wounds that Christ endured"
"    In working thy salvation;"
"For if thy Lord had never died,"
"Nought else could sinful man betide"
"    But utter reprobation."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
"Lord, give us sinners grace to flee"
"    The death of evil-doing,"
"To shun the gloomy gates of hell,"
"    Thine awful judgement viewing."
"So thank we thee, O Christ, to-day,"
"And so for life eternal pray,"
"    The holy road pursuing."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout
%%%%%%%%%%%%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }} 
}

} %%% book bracket