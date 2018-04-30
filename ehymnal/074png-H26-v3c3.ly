%%%074-75.png
%%%Hymn 26 Noel "It came upon the midnight clear"
%%%Version 3 Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "26"
  meter = \markup { \small { \column {  \line { { \sans {"NOEL."} \hspace #1 \roman {"(D. C. M.)"}} }
                               \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 92.} }} }  
  arranger = \markup { \small { \center-align {
		            \line{ \italic {"Traditional Air, adapted by" } }
			    \line { \smallCaps { "A. Sullivan, 1842-1900."}}}}}
  tagline =""
}

augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
 }


global =  {
  \time 4/4 
  \key f \major
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
  \partial 4 f8[ g8] | a4 g4 f4 g8[ a8] | bes4 a4 g4 c4 | c4 a4 bes8[ c8] d4 | c2. \bar "||" \break
  a8[ c8] | c4 c4 a4 f4 | bes4 a4 g4 f8[ g8] | a8[ bes8] c4 a4 g4 | f2. \bar "||" \break
  f4 | e4 d4 e4 g4 | f4. e8 d4 a'4 | g4 f4 e4 d4 | c2. \bar "||" \break
  c4 | c'4 bes4 a4 g8[ a8] | bes4 a4 g4 f8[ g8] | a8[ bes8] c4 a4 g4 | f2. \bar "||"
}

alto = \relative c' {
 f4 | f4 e4 f4 d8[ f8] | e4 f4 e4 e4 | f4 f4 f4 f4 | f2. \bar "||" \break
 f4 | e4 e4 f4 f4 | f4 f4 e4 f4 | f4 c4 f4 e4 | f2. \bar "||" \break
 d4 | cis4 d4 d4 cis!4 | d4. cis8 d4 f4 | e4 d4 c4 b4 | \augdots c2. \bar "||" \break
 c4 | a'4 g4 fis4 e8[ fis8] | g8[ e8] f!4 e4 f4 | f8 g8 a4 f4 e4 | f2. \bar "||"
}

tenor = \relative c { \clef bass
 a'8[ bes8] | c4 c4 a4 d8[ c8] | bes4 c4 c4 c4 | c4 c4 bes4 bes4 | a2. \bar "||" \break
 c4 | c4 g4 f4 a4 | d4 c4 c4 a4 | f4 f4 c'4 bes4 | a2. \bar "||" \break
 f4 | g4 a4 bes4 a4 | a4. g8 f4 b4 | c4 a4 g4 f4 | e2. \bar "||" \break
 c4 | c'4 c4 c4 bes8[ a8] | g4 c4 c4 a4 | c4. c8 c4 bes4 | a2. \bar "||" 
}

bass = \relative c { \clef bass
 f4 | f4 c4 f4 bes8[ a8] | g4 f4 c4 bes'4 | a4 f4 d4 bes4 | f'2. \bar "||" \break
 f4 | c4 c4 d4 d4 | bes4 f'4 c4 f4 | d4 a8 bes8 c4 c4 | f,2. \bar "||" \break
 d'4 | e4 f4 g4 a4 | d,4. d8 d4 d4 | e4 f4 g4 g,4 | c2. \bar "||" \break
 c4 | a4 bes8 c8 d4 d4 | g,4 a8 bes8 c4 d4 | a4 g8 f8 c'4 c4 | f,2. \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 2\mm
  bottom-margin = 6\mm
  print-page-number = ##f
  between-system-padding = 1\mm
 % between-system-space = #0.1
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

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
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 92 4)
            }
       }
	
} %%score bracket

\markup { \hspace #37 \smaller {  "[" \italic "By permission of Novello & Co. Ltd." "]" } }

\markup { \hspace #1 }

\markup { \hspace #16 \small \italic {"Suitable till Candlemas." \hspace #26   "E. H. Sears, 1810-76." } }

\markup { \hspace #-1   %%add space as necc. to center the column
          \fill-line { 
	        
		     \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "I" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T came upon the midnight clear," "  That glorious song of old," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "From Angels bending near the earth"
					   "    To touch their harps of gold:"
					   "'Peace on the earth, good-will to men,"
					   "    From heaven's all-gracious King!'"
					   "The world in solemn stillness lay"
					   "    To hear the Angels sing."
			  		}}
			       
			           } %% finish stanza 1		   
	       		   
	}
}

%%second page
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##t piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}
	
\markup { \hspace #0   %%add space as necc. to center the column  
	 \fill-line { 

          \column {

           \line { "2  "
             \column { 
"Still through the cloven skies they come,"
"    With peaceful wings unfurled;"
"And still their heavenly music floats"
"    O'er all the weary world;"
"Above its sad and lowly plains"
"    They bend on hovering wing;"
"And ever o'er its Babel sounds"
"    The blessèd Angels sing."	     
	   }}
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "3  "
             \column {	     
"Yet with the woes of sin and strife"
"    The world has suffered long;"
"Beneath the Angel-strain have rolled"
"    Two thousand years of wrong;"
"And man, at war with man, hears not"
"    The love-song which they bring:"
"O hush the noise, ye men of strife,"
"    And hear the Angels sing!"
	   }} 
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "4* "
             \column {	     
"And ye, beneath life's crushing load,"
"    Whose forms are bending low,"
"Who toil along the climbing way"
"    With painful steps and slow,"
"Look now! for glad and golden hours"
"    Come swiftly on the wing;"
"O rest beside the weary road,"
"    And hear the Angels sing!"
	   }} 	   
	   	  \hspace #0.1 % adds vertical spacing between verses   
	            \line { "5. "
             \column {	     
"For lo! the days are hastening on,"
"    By prophet-bards foretold,"
"When, with the ever-circling years,"
"    Comes round the age of gold;"
"When peace shall over all the earth"
"    Its ancient splendours fling,"
"And the whole world send back the song"
"    Which now the Angels sing."
	   }} 	   
	  }
    }	  
}


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                     << 
	\context Voice = "sopranos" { \relative c' { \set Staff.midiInstrument = "church organ" 
	                                             \clef treble \time 4/2 \key f \major \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \set Staff.midiInstrument = "church organ"
	                                              \clef treble \key f \major \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                        <<
	\context Voice = "tenors" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \key f \major \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \key f \major \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>	
  
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }}  %%Amen midi       
       
}  

} %%book bracket