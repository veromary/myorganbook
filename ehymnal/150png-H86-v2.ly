%%%% 150.png
%%%% Hymn 86 Innsbruck O thou who dost accord us
%%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"

        \hspace #0.1 }} 

  title = "86"

  meter = \markup { \small {\column {  \line { \sans {"INNSBRUCK. "} \hspace #1 \roman {"(7 7 6. 7 7 8.)" }}
                                       \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Traditional German Melody." }
                            \line { \italic "Adapted and harmonized by" \smallCaps "J. S. Bach." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%%% Same as above but move a smaller amount	      
	      
smallstraddle =  { \once \override Score.SeparationItem #'padding = #1
              \once \override NoteHead #'X-offset = #-1.4
              \once \override Stem #'X-offset = #-1.4 }	      
	      
	      
%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }
  
%%% macro to insert a singlebar while forbidding linebreak

nbbar = { \bar "|" \noBreak }

%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 b'2 \nbbar g a b4( c) d2 \nbbar \once \override NoteColumn #'force-hshift = #1.6 c1 b2^\fermata \bar "||" \noBreak b4( c) \nbbar d2 d a b \bar "|" \break
  \push g1 fis2 ^\fermata \bar "||" \noBreak d \nbbar g a b b \nbbar a1. ^\fermata \bar "||" b2 \bar "|" \break
  g2 a b4( c4) d2 \nbbar \push c1 b2 ^\fermata \bar "||" \noBreak b4( c4) \nbbar d2 d a b \bar "|" \break
  g1 fis2 ^\fermata \bar "||" \noBreak d \nbbar g a b c \nbbar b a g ^\fermata \bar "||" 
}

alto = \relative c' { 
  g'2 \nbbar e fis g4( a4) b2 \nbbar b2( a) g \bar "||" g \nbbar g4( fis4) g4( e4) fis4( e4) d2 \bar "|"
  d2( cis2) d \bar "||" a2 \nbbar d c b4( c4) d2 \nbbar d1. \bar "||" fis2 \bar "|"
  e2 d  \once \override NoteColumn #'force-hshift = #1.0 d e \nbbar e4( d e fis) gis2 \bar "||" g2 \nbbar a g4( fis4) e2 fis \bar "|"
  \straddle fis2( e) dis \bar "||" d \nbbar d4( e) d( c) \smallstraddle b( d) e( fis) \nbbar g2 fis d \bar "||"
}

tenor = \relative c { \clef bass
   d'2 \nbbar c c d4( c) b( a) \nbbar g2( d') d \bar "||" e \nbbar d d d fis, \bar "|"
   g4( fis g2) a2 \bar "||" fis4( e) \nbbar d2 e4( fis) g2 g \nbbar fis1. \bar "||" b2 \bar "|"
   b4( c) b( a) g( a) b2 \nbbar a4( b c d) e2 \bar "||" e \nbbar d4( c) b2 cis fis, \bar "|"
   b1 b2 \bar "||" b \nbbar b4( c) b( a) g2 g \nbbar e' a,4( b8[ c]) b2 \bar "||" 	
}

bass = \relative c { \clef bass
  g'2 \nbbar \straddle c4( b) a2 g2. fis4 \nbbar e2( fis) g_\fermata \bar "||" e \nbbar b4( a) b( c) d( c) b2 \bar "|"
  \push e1 d2 _\fermata \bar "||" c \nbbar b a g4( a) b( c) \nbbar d1. _\fermata \bar "||" dis2 \bar "|"
  e2 fis g gis \nbbar a( a,) e' _\fermata \bar "||" e \nbbar fis g g4( fis) \straddle e( dis) \bar "|"
  \smallstraddle e4( fis g a) b2 _\fermata \bar "||" b, \nbbar e fis \straddle g4( fis) e( d) \nbbar c2 d g, _\fermata \bar "||"
}

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book {

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2)}} 
		
} %%% end score bracket

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

%%% Lyric attribution

\markup { \hspace #78 \small { \center-align { \line { \italic "J. W. Hewett and others.  Based on" }  
                                               \line { "Summi largitor praemii," \italic "c. 6th cent." }
}}}

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
	     \column {  %% a super column for entire block of lyrics 
                        \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "  THOU who dost accord us"
                                                         "  The highest prize and guerdon," } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "        Thou hope of all our race,"
					   "Jesu, do thou afford us"
					   "    The gift we ask of pardon"
					   "        For all who humbly seek thy face."
                                        }}
                                   } %% finish verse 1    
                \hspace #1 
                \line { "2  "
                           \column {         
				   "With whispered accusation"
				   "    Our conscience tells of sinning"
				   "        In thought, and word, and deed;"
				   "Thine is our restoration,"
				   "    The work of grace beginning"
				   "        For souls from every burthen freed."
                        }}
                  \hspace #1 
                  \line { "3  "
                    \column {        
			    "For who, if thou reject us,"
			    "    Shall raise the fainting spirit?"
			    "        'Tis thine alone to spare:"
			    "If thou to life elect us,"
			    "    With cleansèd hearts to near it,"
			    "        Shall be our task, our lowly prayer."
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line {"4. "
                    \column {        
			    "O Trinity most glorious,"
			    "    Thy pardon free bestowing,"
			    "        Defend us evermore;"
			    "That in thy courts victorious,"
			    "    Thy love more truly knowing,"
			    "        We may with all thy Saints adore."
                }}
          }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
                                >> 
  >>                          

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

   \context { 
        \Score timing = ##f }
        ragged-right = ##t
        indent = 15\cm
   \context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%%%%%%%%%%%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }} 
}

} %%% book bracket
