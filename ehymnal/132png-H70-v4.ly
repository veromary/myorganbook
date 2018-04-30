%%%132.png
%%%Hymn 70 HERZLIEBSTER JESU.  (11 11. 11 5.)
%%%Rev 4.
%%%First Tune

%%% Transciption Notes: Typo error in key signature of Amen block lower staff, corrected

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
	                 \hspace #0.1 }}	

  title = "70"

  poet = \markup { \small {  \line { \sans {"HERZLIEBSTER JESU."} \hspace #1 \roman {"(11 11. 11 5.)"}} }}

  meter = \markup { \small { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 46.} }
  composer = \markup { \small { \italic "Melody by" "J. C" \hspace #-1.2 \teeny "RÜGER," "1598-1662."} }
  arranger = \markup { \small { \italic "Adapted by" \smallCaps "J. S. Bach."} }
  tagline = ""
}

%%%%%macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Used to pull a note left. Used when a slurred note pair straddles a longer note 
%% in situations when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%%%%%end of macro

global = {
  \time 8/4
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' { 
  \partial 2 g'2 | g g fis d | g a bes bes | c2(bes2) a2^\fermata  \breathmark
      \bar "||" \once \override Score.SeparationItem #'padding = #2 a \break
  bes c d4(c) bes2 | ees ees d4(c) d2 | c1 bes2\fermata \breathmark \bar "||" bes | a g f d4(ees) \break
  f2 f g f | ees1 d2\fermata \breathmark \bar "||" d'^\markup {\italic "A little slower." } | c bes a1 | g1. \bar "||"}

alto = \relative c' { 
  \partial 2 d2 | ees bes4(c) d2 a | d d d d | d1 d2\bar "||" fis2 \break
  g a bes f | ees f f bes4(a) | g2 (f4 ees) d2 \bar "||" d | e cis d a \break
  d4(ees) \straddle f(d) ees2 d | \once \override Score.SeparationItem #'padding = #4 \straddle d2(c4 bes) a2 
      \bar "||" bes | ees d d2.(c4) | bes1. \bar "||"}

tenor = \relative c { \clef bass 
  \partial 2 bes'2 | c g a fis | g fis g4(a) bes2 | a2(g) fis! \bar "||" d' \break
  d ees f4(ees) d(c) | bes2 c bes bes | bes(a) f \bar "||" g | a a a f \break
  bes bes bes bes4(a) | g1 fis2 \bar "||" g | g4(fis) g2 g(fis) | g1. \bar "||"}

bass = \relative c {\clef bass 
  \partial 2 g'2 | c,4(d) ees2 d c | bes d g, g' | fis(g) d_\fermata \bar "||" d \break
  g c bes aes | g a! \straddle bes4( a ) g(f) | ees2(f) bes,_\fermata \bar "||" g' | cis, a d2. c4 \break
  bes(c) d(bes) ees2 bes | c1 d2_\fermata \bar "||" g,2 | a2 bes4(c) d1 | g,1. \bar "||"}

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
		\context Voice = altos    {\voiceTwo \global \alto }
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

	}
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }}  



} %%score bracket

\markup{ \hspace #32
         \override #'(line-width . 85)
         \justify{    "      [" \italic { May be sung in unison throughout.} "]"  } }

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.   
%%% I have used HumboldtFraktur.ttf which is free and easily
%%% downloadable from the Internet (google for the name). 
%%% In the original image, "s" and "t" in "Herzliebster" were joined in a Fraktur style ligature
%%% comprising a long-s (the one that looks like a "f") and a t.
%%% HumboldtFraktur does have a st ligature, mapped to the pound sign. 
%%% However, to allow the text to degrade gracefully for users who do not have the 
%%% Fraktur font, I did not use the ligatured characters.  Instead, the regular 
%%% unicode character for the long-s (unicode 017F) was used, together with a Fraktur "t", moved
%%% a little closer together, to look like a ligature.
%%% If you do not have a Fraktur font, you should see "Herzliebſter". 
%%% If you use another Fraktur font, simply put the name into the font-name override below.

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
		      \hspace #1
		      \line { {\hspace #36  \small \italic "J. Heermann, 1585-1647.  Tr. Y. H."}}  
		      \hspace #1
		      \line {  \small { \hspace #20 \override #'(font-name . "HumboldtFraktur") {"Herzliebſ" \hspace #-1.35 "ter Jeſu."}}}
		      \hspace #1
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "H, holy Jesu, how hast thou offended," "  That man to judge thee hath in hate pretended?" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By foes derided, by thine own rejected,"
					   "                                            O most afflicted."
			  		}}
			       
			           } %% finish stanza 1	
				   	  \hspace #1
		  \line { "2  "
		    \column {	     
			    "Who was the guilty? Who brought this upon thee?"
			    "Alas, my treason, Jesu, hath undone thee."
			    "'Twas I, Lord Jesu, I it was denied thee:"
			    "                                            I crucified thee."
			}}	   
				   
	}  
}	 
	 
	 
%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

%%% page 2

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
           	  \line { "3  "
		   \column {	     
			   "Lo, the good Shepherd for the sheep is offered;"
			   "The slave hath sinnèd, and the Son hath suffered;"
			   "For man's atonement, while he nothing heedeth,"
			   "                                            God intercedeth."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "For me, kind Jesu, was thy incarnation,"
			    "Thy mortal sorrow, and thy life's oblation;"
			    "Thy death of anguish and thy bitter passion,"
			    "                                            For my salvation."
			}}  
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5. "
		    \column {	     
			    "Therefore, kind Jesu, since I cannot pay thee,"
			    "I do adore thee, and will ever pray thee,"
			    "Think on thy pity and thy love unswerving,"
			    "                                            Not my deserving."
			}}  
	  }
}% lyric markup bracket
  
%% Amen score block

\score{
  \new ChoirStaff
   <<
      \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>

	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }

	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                             <<
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
                             >> 
>>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
      ragged-right = ##t
      indent = 15\cm
      \context { \Staff \remove Time_signature_engraver }
       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }}  %%Amen midi 
}

} %% book bracket