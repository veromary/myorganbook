%%%% 300.png
%%%% Hymn 185 Beata Nobis Gaudia
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - MARTYRS"
	\hspace #0.1 }}	
	
  title = "185"
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "BEATA NOBIS GAUDIA."} \hspace #1 \roman {"(L . M.)"}}
		                        \line { \italic {In free rhythmn} \general-align #Y #DOWN \note #"4" #0.5 = 96. } }
  	}}	

  arranger = \markup { \small  { \center-align { \line {\italic "Melody from" }  
	  					 \line { "‘" \hspace #-1 \italic "Psalterium Chorale," \hspace #-1 "’"  \italic "Constance, 1510." }
  	}}}
	 
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
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

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #1.2

%%% push but a smaller amount

pushb = \once \override NoteColumn #'force-hshift = #0.4

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override TextScript #'padding = #1	
  bes'4 ^\markup { \hspace #-3 \italic "To be sung in Unison." }  g ees \bar "dashed" 
      \topstraddle f( g aes g) f( ees) c d \bar "dashed" ees2 \breathmark \bar "||" ees4 g aes \bar "dashed" \break
  bes4 c( bes aes) bes c \bar "dashed" d( c bes) ^\fermata \bar "||" 
      bes c( d ees) bes \bar "dashed" g ees aes( g) f \bar "dashed" \break
  g( f ees) ^\fermata \bar "||" f c ees \bar "dashed" 
      ees ees( d) \topstraddle f( g aes g) f( ees) \bar "dashed" ees2. \bar "||"
} 
   
alto = \relative c' {  
  ees4 d ees \bar "dashed" 
      <aes, c>1 <g c>2 aes4 bes \bar "dashed" g2 \bar "||" ees'2. ~ \bar "dashed" 
  \once \override Score.SeparationItem #'padding = #4 ees4 g( f2 ) d4 f \bar "dashed" d2. \bar "||" 
      f4 f2( ees4) f \bar "dashed" ees ees c2 d4 \bar "dashed"
  bes2 g4 \bar "||" c2. \bar "dashed" 
      bes2. c1 d2 \bar "dashed" \augdots ees2. \bar "||"
}

tenor = \relative c {\clef bass 
  s4 s4 s4 \bar "dashed" 
      s1 s2 f2 \bar "dashed" ees2 \bar "||" g4 bes aes \bar "dashed"
  g4 c2. s4 s4 \bar "dashed" s2. \bar "||" 
      s4 s2 s4 s4 \bar "dashed" bes4 c f,2 d4 \bar "dashed"
  s2 s4 \bar "||" aes'2 g4 ~ \bar "dashed" 
      g4 f2 aes1 <f bes>2 \bar "dashed" <g bes>2. \bar "||"
}

bass = \relative c {\clef bass 
  <ees g>4 <bes bes'> <c g'> \bar "dashed" 
      f1 c2 f,4 bes \bar "dashed" ees,2 \bar "||" \push ees'2. ~ \bar "dashed"
  ees4 ees( f2) <g bes>4 <f a> \bar "dashed" <bes, f'>2. \bar "||" 
      <bes' d>4 \set doubleSlurs = ##t <aes! c >2( <g bes>4) <d bes'> \bar "dashed" ees c aes2 bes4 \bar "dashed" 
  <g d'>2 <c ees>4 _\fermata \bar "||" aes2. \bar "dashed" 
      bes2. f'1 bes,2 \bar "dashed" ees2. \bar "||"
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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  
	
} %%% Score bracket


%%% Hymn Note 

\markup { \hspace #21 \italic "This hymn may also be sung to the Angers Melody at Hymn" "176." }

\markup { "               " } %%% force some blank space before the start of lyrics

\markup { "               " } %%% force some blank space before the start of lyrics


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {  \hspace #56 \italic "Prudentius, b. 348.  Tr. T. R." }    
	\line { \hspace #34 "Beate Martyr, prospera." }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LEST Martyr, let thy triumph-day"
			                                 "  God's favouring grace to us convey;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The day on which thy life-blood flowed"
					   "And he thy crown in meed bestowed."
			  		}}
		      } %%end verse 1
	  } %%% end super column
}



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
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				  "Thy soul to heavenly mansions sped"
				  "While this world's gloomy shadows fled;"
				  "The judge and torturer o'erthrown,"
				  "Christ claimed the victor for his own."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "Now consort of the Angels bright"
				  "Thou shinest clothed in robes of white;"
				  "Robes thou hast washed in streams of blood,"
				  "A dauntless Martyr for thy God."
				  "           " %%% adds vertical spacing between verses
			}} 
			  \line { "4  "
			   \column {	     
				  "Be thou on this thy holy-day"
				  "Our strong upholder; while we pray"
				  "That from our guilt we may be freed,"
				  "Stand thou before the throne and plead."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "5. "
				\column {	     
				  "All laud to God the Father be,"
				  "All praise, eternal Son, to thee;"
				  "All glory, as is ever meet,"
				  "To God the holy Paraclete.     Amen."
     			}}

	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees2( f ees d ees) ees1 \bar "||" }}                              
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo \pushb c1 \pushb bes1. bes1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "A     -     -     -"  men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'2 aes g f g g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c2 f, g bes ees, ees1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 14\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

       
%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}

}

} %%% book bracket
