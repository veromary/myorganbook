%%%% 058.png
%%% Hymn 19 ES IST EIN' ROS' ENTSPRUNGEN
%%% Version 3

\version "2.10"

\header {
 dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
 title = "19"
 meter = \markup { \small { \column { \line { \sans "ES IST EIN' ROS' ENTSPRUNGEN." \hspace #1 \roman "(7 6. 7 6. 6 7 6.)" } 
                                 \line { { \italic "In moderate time" \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 "= 100." } } }} }
 arranger = \markup { \small { \center-align { 
		 \line { \italic "Ancient German Melody, Harmony" }
				 \line { \italic "chiefly from" \smallCaps "M. Praetorius, 1571-1621." } }} }
 tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%macros

%%prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup { \line { \raise #1.4 \override #'(baseline-skip . 1.0) \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							 \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
 \bar "||"} 

%%prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	 \once \override Staff.BarLine #'text = \markup { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	  \raise #1.4 \column { \with-color #black { 
							 \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	 } }	
 \bar "|:"}
	
%% music function to allow lyrics to skip over any number of note-syllables. 
%% The standard \skip command has its duration ignored when using \lyricsto or \addlyrics. 
%% Each instance of \skip will only skip one note-syllable. 
%% To avoid entering too many \skip commands, use this workaround function. 
%% To skip 8 note-syllables, for example, issue the command \skips #8
skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})

%% Macro for generating two augmentation dots for a notehead. When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph with a glyph comprising a column of 2 dots one above the other.
%% Place \augdots just before the shared note in the lower of the two voices. 

augdots = { 
  \once \override Voice.Dots #'stencil = #ly:text-interface::print 
  \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                 \line { \translate #(cons -0.2 0) 
                                                 \override #'(baseline-skip . 1 )  \column { 
                                                                                        \musicglyph #"dots.dot" 
                                                                                        \musicglyph #"dots.dot" } } }
 }

   
noacci = \once \override Accidental #'transparent = ##t    
     
%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions

global = {
  \time 4/4 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \fdstartrepeat c'2 \bar "|" c4 c4 d4 c4 \bar "|" 
      c2 a2 bes2 \bar "|" a4 g2 \bar "dashed" f2 e4 \bar "|" f2. \fdendrepeat \break 
  a4 \bar "|" g4 e4 f4 d4 \bar "|" c2. \bar "||" 
      c'4 \bar "|" c4 c4 d4 c4 \bar "|" \break
  c2 a2 bes2 \bar "|" a4 g2 \bar "dashed" f2 e4 \bar "|" f2. \bar "||" 
      \new Voice = amen {f1 f1 } \oneVoice \bar "||"  
}

alto = \relative c' {
  \fdstartrepeat a'2 \bar "|" a4 f4 f4 f4 \bar "|" 
      e2 d2 d2 \bar "|" c2 d4 \bar "dashed" a4 c2 \bar "|" c2. \fdendrepeat \break 
  f4 \bar "|" d4 c4 c4 b4 \bar "|" \augdots c2. \bar "||" 
      e4 \bar "|" g4 f4 f4 f4 \bar "|" \break
  e2 d2 d2 \bar "|" f4 d4 ( e4 -) \bar "dashed" \once \override NoteColumn #'force-hshift = #-1.6 f4 c2 \bar "|" c2. \bar "||" 
      d1 c1 \bar "||" 
}

tenor = \relative c {
  \fdstartrepeat c'2 \bar "|" c4 a4 bes4 a4 \bar "|" 
      g2 f2 f2 \bar "|" a4 ( c4 -) bes4 \bar "dashed" a2 g4 \bar "|" a2. \fdendrepeat \break
  c4 \bar "|" bes4 a4 a4 g4 \bar "|" e2. \bar "||" 
      g4 \bar "|" g4 a4 bes4 a4 \bar "|" \break 
  g2 fis2 g2 \bar "|" c4 bes4 a4 ~ \bar "dashed" a4 g2 \bar "|" a2. \bar "||" 
      bes1 a1 \bar "||" 
}

bass = \relative c { \clef bass
  \fdstartrepeat f2 \bar "|" f4 f4 bes4 f4 \bar "|" 
      c2 d2 bes2 \bar "|" f'4 e4 d4 ~ \bar "dashed" d4 c2 \bar "|" f2. \fdendrepeat \break
  f4 \bar "|" g4 a4 f4 g4 \bar "|" c,2. \bar "||" 
      c4 \bar "|" e4 f4 bes,4 f'4 \bar "|" \break
  c2 d2 g,2 \bar "|" a4 bes4 c4 ~ \bar "dashed" c4 c2 \bar "|" << { \noacci \once \override Stem #'length = #5 f2.} 
      \new Voice = optional {\voiceFour 
      \set fontSize = #-3
      \once \override NoteColumn #'force-hshift = #0.4
      f,2.} >> \bar "||" 
      bes1 f1 \bar "||" 
}

wordsA = \lyricmode { 
	 \override LyricText #'extra-offset = #'(0 . -1)    %% bring words closer to staff
         \override LyricHyphen #'extra-offset = #'(0 . -1)
         \override LyricText #'font-size = #-1 
         \skips #7 a full and "ho" -- "ly" cure. \skips #13 and peace on earth to men. }

wordsB = \lyricmode { 
	  \override LyricText #'extra-offset = #'(0 . 1) 
          \override LyricHyphen #'extra-offset = #'(0 . 1)
          \override LyricText #'font-size = #-1 
         \skips#7 a full and "ho" -- "ly" cure. \skips #13 and peace on earth to men. }

wordsAmen = \lyricmode { \override LyricText #'font-size = #-1 A -- men. }

#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
  between-system-padding = 2\mm
  between-system-space = #2
% before-title-space = 0\mm
% after-title-space = 3\mm
% top-margin = 2\mm
% bottom-margin = 3\mm
 print-page-number = ##f

 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos {\voiceTwo \global \alto }
	 >>
        
	 \new Lyrics \lyricsto amen \wordsAmen
	
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			 >> 
	\new Lyrics  \with {alignAboveContext=upper} \lyricsto sopranos \wordsA	 
	\new Lyrics  \with {alignBelowContext=lower} \lyricsto basses \wordsB
 >>
\layout {
		indent=0
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
} %%score bracket


\markup{ \hspace #6
  \override #'(line-width . 94 )
  \justify{   "[" \italic { The barring of this tune is necessarily irregular. "  But" its performance will be found to be easy
"              if" it is remembered that the time-value of a crotchet is the same throughout.}  "]"   } }


\markup {   \hspace #10  %% use \hspace or \halign to centre the 3-column group  
	\column {
	  \hspace #1	 
	  \line { \small \italic{ \hspace #0 "Suitable till Candlemas." \hspace #25  "St. Germanus, 634-734.   Tr. J. M. Neale" \upright "†." } }
	  \hspace #1
	  \line {\hspace #26 \small {"Μέγα καὶ παράδοξον θαῦμα." "  [Mega kai paradoxon thauma.]" } }
	   	             \hspace #1  % adds vertical spacing between verses. More such lines more space.     
	  \line {\hspace #20	     
		\column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "GREAT and mighty wonder," "   A full and holy cure!"  } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Virgin bears the Infant"
					   "    With virgin-honour pure."
					     \italic {
					       "   "	    
					       "          Repeat the hymn again!"
					       "                'To God on high be glory,"
					       "          And peace on earth to men!'" } 
			  		} }
			       
			           } %% finish stanza 1   
	}  }	  
}
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##t piece = ##f opus = ##f tagline = ##f }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}
	
%%second page	

\markup { \hspace #31   %%add space as necc. to center the column   
           \column {
            \line { "2  "
             \column { 
		     "The Word becomes incarnate"
		     "    And yet remains on high!"
		     "And Cherubim sing anthems"
		     "    To shepherds from the sky."
	   }}
	   
	  \hspace #0.1 % adds vertical spacing between verses      
	    \line { "3  "
             \column { 
		     "While thus they sing your Monarch,"
		     "    Those bright angelic bands,"
		     "Rejoice, ye vales and mountains,"
		     "    Ye oceans clap your hands."
	   }}
	   
	   \hspace #0.1 % adds vertical spacing between verses      
	    \line { "4  "
             \column { 
		     "Since all he comes to ransom,"
		     "    By all be he adored,"
		     "The Infant born in Bethl'em,"
		     "    The Saviour and the Lord."
	   }}
	   
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "5. "
             \column {	     
		     "And idol forms shall perish,"
		     "    And error shall decay,"
		     "And Christ shall wield his sceptre,"
		     "    Our Lord and God for ay."
	   }} 
	  }	  
}


%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi of the main tune
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  
    \unfoldRepeats { \repeat volta 2 {  c'2 \bar "|" c4 c4 d4 c4 \bar "|" 
    c2 a2 bes2 \bar "|" a4 g2 \bar "dashed" f2 e4 \bar "|" f2. } } \break 
  a4 \bar "|" g4 e4 f4 d4 \bar "|" c2. \bar "||" 
      c'4 \bar "|" c4 c4 d4 c4 \bar "|" \break
  c2 a2 bes2 \bar "|" a4 g2 \bar "dashed" f2 e4 \bar "|" f2. \bar "||" 
    
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { a'2 \bar "|" a4 f4 f4 f4 \bar "|" 
      e2 d2 d2 \bar "|" c2 d4 \bar "dashed" a4 c2 \bar "|" c2. } } \break 
  f4 \bar "|" d4 c4 c4 b4 \bar "|" c2. \bar "||" 
      e4 \bar "|" g4 f4 f4 f4 \bar "|" \break
  e2 d2 d2 \bar "|" f4 d4 ( e4 -) \bar "dashed" f4 c2 \bar "|" c2. \bar "||" 
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {  \repeat volta 2 { c'2 \bar "|" c4 a4 bes4 a4 \bar "|" 
      g2 f2 f2 \bar "|" a4 ( c4 -) bes4 \bar "dashed" a2 g4 \bar "|" a2. } } \break
  c4 \bar "|" bes4 a4 a4 g4 \bar "|" e2. \bar "||" 
      g4 \bar "|" g4 a4 bes4 a4 \bar "|" \break 
  g2 fis2 g2 \bar "|" c4 bes4 a4 ~ \bar "dashed" a4 g2 \bar "|" a2. \bar "||" 
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {  \repeat volta 2 { f2 \bar "|" f4 f4 bes4 f4 \bar "|" 
      c2 d2 bes2 \bar "|" f'4 e4 d4 ~ \bar "dashed" d4 c2 \bar "|" f2. } } \break
  f4 \bar "|" g4 a4 f4 g4 \bar "|" c,2. \bar "||" 
      c4 \bar "|" e4 f4 bes,4 f'4 \bar "|" \break
  c2 d2 g,2 \bar "|" a4 bes4 c4 ~ \bar "dashed" c4 c2 \bar "|" << f2. f,2. >> \bar "||" 
}
}


>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            }
       }
} %% midi score bracket

%% Amen midi block. Generates the Amen as a separate midi
\score{
  \new ChoirStaff
   <<
        \context Staff = upper 
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global f1 f1 }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global d1 c1 }}
	                      >>
	\context Staff = lower 
	                      <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1  \bar "||" }}
			        >> 
  >>			      

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}  %%Amen midi       
       
}  

} %% book bracket