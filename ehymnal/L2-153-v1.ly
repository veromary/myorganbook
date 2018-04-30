%%%% 245.png
%%%% Hymn 153. Veni Creator. Come Holy VGhost, our souls inspire.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
	title = "153"   
  
  poet = \markup { \small {  \line { \sans { "VENI CREATOR."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 58.  } }
  
  arranger = \markup { \small { \italic "Attributed to" \smallCaps "T. Tallis," \italic "c. 1515-85."  }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

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

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.4

%%% force a bit of space

space = \once \override Score.SeparationItem #'padding = #2	      

%% Used to pull an upstem note left. 

pull = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key c \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \override TextScript #'padding = #1.5	
  \tag #'main { c'1 c2. b4 | c1. g2 | g2. f4 g1 \bar "||" b2\rest g4( a) bes( c) d2 | c4( bes) aes!4( g) f2. ees4 | ees1 \bar "||" \break
  ees2 ees4 ees | f2 f g a | bes \breathmark \bar "||" bes c bes | aes4( g) f( ees) d2. c4 | \leftbreve c\breve \bar "||" \break }
  
  \tag #'lastTwo { c2 ^\markup { \hspace #-6 \italic "Last two lines (to be sung in unison)." }
      d ees f | g2. a4 b4 g2. \bar "||" \space a2 a b c | \pull c2. b4 \pull c c2. \bar "||" f,1 e1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'main { ees1 c2 f | ees1. d2 | c2. c4 d1 \bar "||" s2 ees2 ees d | ees4( f) ees2 ees2 d2 | \merge ees1 \bar "||"
  ees2 ees4 ees | bes2 bes ees ees | d \bar "||" ees ees d | ees c c2 ( b4) c4 | \merge \rightbreve c \breve \bar "||" \break }
  
  \tag #'lastTwo { \push g1 c2 bes2 | \push ees1 \push d \bar "||" \push f1 d2 f | d1 e \bar "||" c1 c \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'main { g'1 g2 f | g1. g2 | c2. c4 b1 \bar "||" d,2\rest g2 g4( a) bes2 | aes!4( f) bes2 bes2. bes4 | g1 \bar "||" \break
  g2 g4 g | f2 f ees ees | f \bar "||" bes aes f | ees aes d,2. e4 | \space e\breve \bar "||" \break }
  
  \tag #'lastTwo { ees!2 d g f | bes c b1 \bar "||" c2 c g f | g1 g \bar "||" \space aes g \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'main { c1 ees2 d | c1. bes2 | aes2. aes4 g1 \bar "||" s2 c2 c2 bes2 | c4( d) ees2 bes2. bes4 | ees1 \bar "||" \break
  ees2 ees4 ees | d2 d c c | bes \bar "||" g aes bes | c f, g2. c4 | c\breve \bar "||" \break }
  
  \tag #'lastTwo { c2 b c d | ees c g1 \bar "||" f2 f g aes! | g1 c \bar "||" f c \bar "||" }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #32 Praise to thy e -- ter -- nal me -- rit, Fa -- ther, Son, and Ho -- ly Spi -- rit.  A -- men.
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


%%% A separate score block to generate the midi for the first 4 lines of the hymn (1st 2 systems)

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'lastTwo \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'lastTwo \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'lastTwo \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'lastTwo \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}      
  	
	
} %%% end score bracket

%%% A separate score block to generate the midi for the last 2 lines of the hymn (to be sung in unison) includes the Amen. 

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'lastTwo \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'lastTwo \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'lastTwo \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'lastTwo \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note 

\markup { \hspace #54 \center-align {
	\line {  \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Mechlin Melody at Hymn" "154" \italic "or to"  } 
        \line {  \italic "Attwood's Melody at Hymn" "156."  } 
}}


%%% Lyric attributions and titles

\markup { \hspace #76 \center-align {
        \line { \small \italic "Bishop J. Cosin, 1594-1672.  Based on" }  
	\line { \small "Veni, Creator Spiritus." }
}}	


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, Holy Ghost, our souls inspire,"
			                               "  And lighten with celestial fire;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
"Thou the anointing Spirit art,"
"Who dost thy sevenfold gifts impart:"
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Thy blessèd unction from above"
				   "Is comfort, life, and fire of love;"
				   "Enable with perpetual light"
				   "The dullness of our blinded sight:"
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "Anoint and cheer our soilèd face"
				   "With the abundance of thy grace:"
				   "Keep far our foes, give peace at home;"
				   "Where thou art guide no ill can come."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4. "
			   \column {	     
				   "Teach us to know the Father, Son,"
				   "And thee, of Both, to be but One;"
				   "That through the ages all along"
				   "This may be our endless song,"
				   "    Praise to thy eternal merit."
				   "    Father, Son, and Holy Spirit.     Amen."
			}}
	  }
} %%% lyric markup bracket


} %%% book bracket
