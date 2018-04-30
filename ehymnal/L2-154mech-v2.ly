%%%% 247.png
%%%% Hymn 154 Mechlin version Veni Creator. Come O Creator spirit, come.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
  title = \markup { "154 " \large { \smallCaps "(Mechlin Version)" } }  
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"VENI CREATOR."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {In free rhythm} \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody from" "‘" \hspace #-1.2 \italic "Vesperale Romanum" \hspace #-1.2 "’"}
	  					 \line { "(" \hspace #-1 \italic "Mechlin" \hspace #-1 ") Mode viii." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% a dashed bar which forbids line breaks 

nbdbar = { \bar "dashed" \noBreak }

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.4

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #0.8

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override TextScript #'padding = #1	
  \partial 2 f2 ^\markup { \italic "To be sung in unison."} 
      \nbdbar g2( f) ees \nbdbar f( g) f \nbdbar bes( c2.) c4 \nbdbar bes1. \bar "||" bes2 f g \bar "dashed" \break
  bes2( c) bes \nbdbar c( d2.) d4 \nbdbar c1 \breathmark \bar "||" bes2 \nbdbar c2( d) bes \nbdbar a( g) f \bar "dashed" \break
  c'2( g2.) a4 \nbdbar bes1. \bar "||" a2 bes g \nbdbar f( ees) g \nbdbar bes( a2.) g4 \nbdbar f1 \bar "||"
} 
   
alto = \relative c' {  
  c2 \nbdbar ees c bes \nbdbar c ees d \nbdbar d f2. f4 \nbdbar d1. \bar "||" d2 f ees \bar "dashed" \break
  d ees d \nbdbar f f2. f4 \nbdbar f1 \bar "||" d2 \nbdbar \push f1 d2 \nbdbar f ees c \bar "dashed" \break
  \push ees1 ~ ees4 f4 \nbdbar d1. \bar "||" f2 f ees \nbdbar c ees ees \nbdbar \push f1 ~ f4 ees4 \nbdbar c1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 \nbdbar bes a bes \nbdbar a bes bes \nbdbar bes a2. a4 \nbdbar bes1. \bar "||" bes2 bes bes \bar "dashed" \break
  bes g g \nbdbar a a2. a4 \nbdbar a1 \bar "||" bes2 \nbdbar a bes bes \nbdbar d bes a \bar "dashed" \break
  \push c1 ~ c4 c \nbdbar bes1. \bar "||" c2 bes bes \nbdbar a bes bes \nbdbar \push bes1 ~ bes4 bes4 \nbdbar a1 \bar "||"
}

bass = \relative c {\clef bass 
  f2 \nbdbar ees f g \nbdbar f ees bes \nbdbar g' f2. f4 \nbdbar bes,1. \bar "||" bes2 d ees \bar "dashed" \break
  g c, g' \nbdbar f d2. d4 \nbdbar f1 \bar "||" g2 \nbdbar f bes, g' \nbdbar d ees f \bar "dashed" \break
  \pushb c1 ~ c4 f4 \nbdbar bes,1. \bar "||" f'2 d ees \nbdbar f g ees \nbdbar \pushb d1 ~ d4 ees4 \nbdbar f1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { \small { \hspace #30 \italic "Terce." \hspace #20 \italic "Before 10th cent.  Tr. and rev. Y. H." }} 
  
\markup { \hspace #40 \small "Veni, Creator Spiritus." }


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, O Creator Spirit, come,"
			                                 "  And make within our hearts thy home;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To us thy grace celestial give,"
					   "Who of thy breathing move and live."
			  		}}
		      } %%% end verse 1	
		      	\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "O Comforter, that name is thine,"
				   "Of God most high the gift divine;"
				   "The well of life, the fire of love,"
				   "Our souls' anointing from above."
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "Thou dost appear in sevenfold dower"
				   "The sign of God's almighty power;"
				   "The Father's promise, making rich"
				   "With saving truth our earthly speech."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4  "
			   \column {	     
				   "Our senses with thy light inflame,"
				   "Our hearts to heavenly love reclaim;"
				   "Our bodies' poor infirmity"
				   "With strength perpetual fortify."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5  "
			   \column {	     
				   "Our mortal foe afar repel,"
				   "Grant us henceforth in peace to dwell;"
				   "And so to us, with thee for guide,"
				   "No ill shall come, no harm betide."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "6. "
			   \column {	     
				   "May we by thee the Father learn,"
				   "And know the Son, and thee discern,"
				   "Who art of both; and thus adore"
				   "In perfect faith for evermore.     Amen."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f2( g f) f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c2 ees c c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A - - men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'2 bes a a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f2 ees f f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket
