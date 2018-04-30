%%%% 298.png
%%%% Hymn 184. Alla Trinita Beata.  Blessed Feasts of blessed Martyrs.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - MARTYRS"
	\hspace #0.1 }}	
	
  title = "184"   
    
  poet = \markup { \small {  \line { \sans { "ALLA TRINITA BEATA." } \hspace #1 \roman {"(8 7. 8 7. D.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 66 "(" \hspace #-1 \general-align #Y #DOWN \note #"4" #0.5 = 112 \hspace #-1 ")." } }
  
  arranger = \markup { \small \italic "Mediaeval Italian Melody." }
  	
	
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

% *** prints four dots in a column, This will be used by other macros to create repeat signs.                   
 
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}           
            
%%% positions 4 dots at beginning of a line of score mimicking a begin repeat sign
%%% uses fdots macro, above
%%% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%% glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%% Place \beginfdots before the first note of line you want it to begin.
 
beginfdots = {    
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.4
                   \once \override Staff.RehearsalMark #'X-offset = #'9.0
                   \mark \fdots
                   \once \override Score.SeparationItem #'padding = #1
}           
  
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
				\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
						\column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
							\hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
				} }
				\bar "||"
}

%% Shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }	      

%%%% Make Triplet bracket transparent

hidetup = { \override TupletBracket #'transparent = ##t }

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.8

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #1.6 

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% force a bit of space

space = \once \override Score.SeparationItem #'padding = #4	      

	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 2/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \hidetup
  \override TextScript #'padding = #2
  \tag #'main { ees2 ^\markup { \hspace #-3 \italic "To be sung in unison." } ees4( f) | g2 f4( ees) | aes2 g4( f) | g2 g2 | f2 g4( aes) | \break
  g2 \times 2/3 { g4( f ees) } | f4( aes) g( f) | ees1 \bar "||" bes'2 bes4( c) | aes2 aes | bes4( aes) g( f) | \break
  g2 g2 | f4( ees) aes( f) | ees2 aes4( g) | f4( ees) aes( f) | ees1 \bar "||" \break }
  \tag #'repeat { \beginfdots bes'2 bes4( c) | aes2 bes4( c) | << { des( c) } \\ { \voiceThree \push \smallnote aes2 } >> \times 2/3 { bes4( aes g) } | aes2 bes | \break
  ees,2 f4( g) | aes2 g4( ees) | f4( aes) g( f) | ees1 \fdendrepeat }
} 
   
alto = \relative c' {  
  \override Staff.NoteCollision #'merge-differently-dotted = ##t	
  \tag #'main { ees2. d4 | ees2 d4( c) | ees2. d4 | \push ees1 | d2. c4 | 
  d2 c2 ~ | c4( f) ees( d) | \merge ees1 \bar "||" \push ees1 | \push c1 | ees2 d4( f) | 
  \push ees1 | bes4 c2( c8)[ d] | ees2. d4 | c2. d4 | bes1 \bar "||" }
  \tag #'repeat { \beginfdots ees2 ees | c f | f4( ees) des2 | c2 ees2 | 
  ees2 c4( ees) | f2 ees | c4( f) ees( d) | \merge ees1 \fdendrepeat }
}

tenor = \relative c {\clef bass 
  \hidetup	
  \tag #'main { g'2 bes | bes2. g4 | c2 bes | \push bes1 | bes2 g4( ees) |
  d2 ees | c' bes | g1 \bar "||" \push g | \push aes | ees4.( f8) g4( c) |
  \push c1 | f,4( g) aes2 | bes c4( bes) | g2 f | g1 \bar "||" }
  \tag #'repeat { \beginfdots g2 g | aes des | aes 
      \once \override TupletNumber #'extra-offset = #'(0.0 . -0.4)
      \times 2/3 { f2( g4) } | f2 g |
  g2 aes4( bes) | \push c1 ~ | c2 bes | g1 \fdendrepeat }
}

bass = \relative c {\clef bass 
  \tag #'main { ees2 g,4( bes) | ees2 bes4( c) | aes2 ees'4( bes) | ees2 ees, | bes'2. aes4 |
  bes2 c | aes4( f) g( bes) | ees1 \bar "||" ees2. c4 | \pushb f1 | c2 bes4( aes) | 
  \pushb c1 | d4( c) f,2 | g aes4( bes) | c2 f,4( bes) | ees1 \bar "||" }
  \tag #'repeat { \beginfdots ees2 ees4( c) | f2 bes, | f4( aes) bes2 | f' ees | 
  c2 aes4( g) | f2 c' | aes4( f) g8([ aes] bes4) | ees,1 \fdendrepeat }
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
	
} %%% Score bracket


%%% A separate score block to unfold the repeats and generate the midi 

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano \keepWithTag #'repeat \soprano }
	\context Voice = altos    { \voiceTwo \global \alto    \keepWithTag #'repeat \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor  \keepWithTag #'repeat \tenor }
	\context Voice = basses { \voiceTwo \global \bass   \keepWithTag #'repeat \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  
	
} %%% Score bracket



%%% Lyric titles and attributions

\markup { \hspace #10 \small {  \column { \line {\italic "Sequence." \hspace #49 \italic "Before 12th cent.  Tr. J. M. Neale." }    
	\line { \hspace #33 "O beata beatorum." }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LESSÈD Feasts of blessèd Martyrs,"
			                                 "  Saintly days of saintly men," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "With affection's recollections"
					   "    Greet we your return again."
					  "           " %%% adds vertical spacing between verses 
			  		}}
		      } %%end verse 1
		                 		\line { "2  "
			   \column {	     
				  "Mighty deeds they wrought, and wonders,"
				  "    While a frame of flesh they bore;"
				  "We with meetest praise and sweetest"
				  "    Honour them for evermore."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "Faith unblenching, hope unquenching,"
				  "    Well-loved Lord, and single heart,—"
				  "Thus they glorious and victorious"
				  "    Bore the Martyr's happy part."
				  "           " %%% adds vertical spacing between verses
			}} 
			  \line { "4  "
			   \column {	     
				  "Blood in slaughter poured like water,"
				  "    Torments long and heavy chain,"
				  "Flame, and axe, and laceration,"
				  "    They endured, and conquered pain."
				  "           " %%% adds vertical spacing between verses
			  }}	  
			   \line { "5  "
			   \column {	     
				  "While they passed through divers tortures,"
				  "    Till they sank by death opprest,"
				  "Earth's rejected were elected"
				  "    To have portion with the blest."
				  "           " %%% adds vertical spacing between verses
			   }}	  
			   \line { "6  "
			   \column {	     
				  "By contempt of worldly pleasures,"
				  "    And by mighty battles done,"
				  "Have they merited with Angels"
				  "    To be knit for ay in one."
				  "           " %%% adds vertical spacing between verses
			   }}	  
			  \line { "7  "
			   \column {	     
				  "Wherefore made co-heirs of glory,"
				  "    Ye that sit with Christ on high,"
				  "Join to ours your supplications,"
				  "    As for grace and peace we cry;"
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "8. "
				\column {	     
				  "That, this weary life completed,"
				  "    And its many labours past,"
				  "We may merit to be seated"
				  "    In our Father's home at last."
     			}}

	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global 
		                                     \override TextScript #'padding = #1 
		 	                             \voiceOne ees1 ^\markup { \hspace #-5 \small \italic "Harmony." } ees  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 g'' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}

}


} %%% book bracket
