%%%% 179.png
%%%% Hymn 109. Cheshire. "O thou who through this holy week"
%%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - HOLY WEEK"
	                 \line { \small \italic "Passiontide Office Hymns till Maundy Thursday.    No Office Hymns from Maundy" }
                         \line { \small \italic "Thursday till Low Sunday." }
	\hspace #0.1 }}	

  title = "109"

  poet = \markup { \small {  \line { \sans {"CHESHIRE. "} \hspace #1 \roman {"(C. M.)"}} }}

  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.} }
  
  arranger = \markup { \small {\line {\italic "Este's Psalter, 1592."}}}

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves as found in the last measure (soprano and alto) of this piece. 
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-0.8 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.3 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #-0.8 \musicglyph #"noteheads.s0" \hspace #-1.3 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged semibreves and breves

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% moves notehead and stem of a note rightwards. Needed when force-hshift does not work.

moveright = { \once \override NoteHead #'X-offset = #2.0
          \once \override Stem #'X-offset = #2.0 
}

%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 1 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 1 2)

%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2 
  \key e \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  e1 e2 fis | g g fis2. fis4 | e1. \bar "||" e2 | \once \override NoteColumn #'force-hshift = #1.4 g2. g4 a2 d | b1. \bar "||" \break
  \partmeasure b2 b2. b4  | a2 fis g a | b1. \breathmark \bar "||" b2 | a g a fis | \leftbreve e\breve \bar "||" 
}

alto = \relative c' { 
  b1 b2 b | b e e dis | \merge e1. \bar "||" c2 |  \moveright b b d d | d1. \bar "||" \break
  g2 g2. g4 | fis2 d g e | dis1. \bar "||" d2 | fis e e dis | \merge \rightbreve e\breve \bar "||" 
}

tenor = \relative c { \clef bass 
  g'1 g2 fis | e b' b2. a4 | g1. \bar "||" e2 |  e4(fis) g2 g fis | g1. \bar "||" \break
  d'2 d2. d4 | d2 d b a | fis1. \bar "||" d'2 | d b c b4(a) | g\breve \bar "||" 
}

bass = \relative c { \clef bass 
  e1 e2 dis | e g, b b | e1. \bar "||" a,2 | e'2. e4 d2 d | g,1. \bar "||" \break
  g2 g'2. g4 | d2 d e c | b1. \bar "||" g2 | d' e a, b | << { \voiceTwo e\breve }  
       \new Voice = "pedals" {  \voiceFour \set fontSize = #-3 
       \once \override NoteColumn #'force-hshift = #0.15
       e,\breve } >> \bar "||" 
}

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
 % annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
 % between-system-padding = #0.5
 %      between-system-space = #2
 %      next-padding = #1
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small { \hspace #64 \italic "J. M. Neale, 1818-66;" " (" \hspace #-1 \italic "4." \hspace #-1 ")" \italic " W. Denton." } }
\markup { " "}

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4 %%add space as necc. to center the entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  THOU who through this holy week"
			                                 "    Didst suffer for us all," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The sick to cure, the lost to seek,"
					   "    To raise up them that fall:"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "We cannot understand the woe"
				   "    Thy love was pleased to bear;"
				   "O Lamb of God, we only know"
				   "    That all our hopes are there."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "Thy feet the path of suffering trod;"
				  "    Thy hand the victory won:"
				  "What shall we render to our God"
				  "    For all that he hath done?"
			}}
			\hspace #1 
           		\line {"4. "
			  \column {	     
				  "O grant us, Lord, with thee to die,"
				  "    With thee to rise anew;"
				  "Grant us the things of earth to fly,"
				  "    The things of heaven pursue."
			}}
	    } %%% end column 3
     } %%% end master-line
} %%% lyrics markup bracket

%%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }}

}

%%% Suitable hymns for Palm Sunday and Maundy Thursday
%%% Text in 3 columns,  column 1 (Palm Sunday Hymns), column 2 (a dividing line), column 3 (Maundy Thursday Hymns)

\markup { \hspace #12 %%add space as necc. to center the entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
			\line { \hspace #8 "PALM SUNDAY"}
			\line { \hspace #14 \small \italic "See" }
			\small "619  Come, faithful people, come away."
	                \small "620  Ride on! ride on in majesty!"
			\small "621  Glory and praise and dominion."
			\small "622  All glory, laud, and honour."
			\small "623  Now, my soul, thy voice upraising."
                       
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -18 . -5) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		

			\line { \hspace #4 "MAUNDY THURSDAY"}
			\line { \hspace #4 \small \italic "The following are suitable:" }
			\small "300  According to thy gracious word."
	                \small "317  Laud, O Sion, thy salvation."
			\small "326  Of the glorious Body telling."
			\small "330  The Word of God proceeding forth."
	    } %%% end column 3
     } %%% end master-line
} %%% lyrics markup bracket

} %%% book bracket