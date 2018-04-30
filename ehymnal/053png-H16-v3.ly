%%%053.png
%%%Hymn 16 NEWBURY "The Maker of the sun and moon"
%%%version 3

\version "2.10"

\header {
dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS EVE" \hspace #0.1 }}
title = "16"
poet = \markup { \sans \small {"NEWBURY."} \hspace #1 \roman \small {"(C. M.)"} }
meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 92.} }
arranger =  \markup { \italic \small {English Traditional Melody.}}
tagline =""
}

global = {
\key e \major
\time 4/4
\set Staff.midiInstrument = "church organ"
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

%%generates the breathmarks above barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%end of macro definition




singleBar = { \bar "|" }
doubleBar = { \bar "||" }

soprano = \relative c' { 
\cadenzaOn \partial 4 e8[ gis8] \singleBar b4 b4 a4 cis4 \singleBar b4 gis8[ fis8] e4 gis4 \singleBar fis4 fis8[ gis8] a4 gis8[ fis8] \singleBar gis2. \doubleBar \break
\partial 4 e8[ gis8] \bar "|" b4 b8[ cis8] a4 fis8[ gis8] \bar "|" a8[ gis8] a8[ cis8] b4 \breathmark e,8[ gis8] \bar "|" b4 

cis8[ b8] gis4 fis4 \bar "|" e2. \bar "||"  \break \cadenzaOff
}
alto = \relative c' { 
\partial 4 e4 \bar "|" e4 e4 e4 e4 \bar "|" e4 dis4 cis4 e4 \bar "|" e4 e4 e4 dis4 \bar "|" e2. \bar "||" \break
\partial 4 e4 \bar "|" e4 e4 e4 e4 \bar "|" e4 dis4 e4 e4 \bar "|" e4 e4 e4 dis4 \bar "|" \augdots e2. \bar "||"  \break
}
tenor = \relative c { 
\partial 4 e4 \bar "|" gis4 gis4 a4 a4 \bar "|" b4 b8[ a8] gis4 gis4 \bar "|" cis4 cis4 cis4 b4 \bar "|" b2. \bar "||" \break
\partial 4 gis4 \bar "|" gis4 b4 cis4 cis8[ b8] \bar "|" a4 a4 gis4 gis4 \bar "|" e4 e4 b'4 b8[ a8] \bar "|" gis2. \bar "||" \break 
}
bass = \relative c { 
\partial 4 e4 \bar "|" e4 e4 cis4 a4 \bar "|" gis4 b4 cis4 cis4 \bar "|" a4 a'8[ gis8] fis4 b,4 \bar "|" e2. \bar "||" \break
\partial 4 e4 \bar "|" e4 gis4 fis4 a8[ gis8] \bar "|" fis4 fis4 gis4 cis,4 \bar "|" gis4 a8[ gis8] b4 b4 \bar "|"e2. \bar "||" \break
}

#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
 between-system-padding = 2\mm
 before-title-space = 0\mm
 after-title-space = 1.5\mm
 top-margin = 3\mm
 bottom-margin = 5\mm
 print-page-number = ##f
 between-system-space = #0
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\score {
<< 
\new ChoirStaff <<
\new Staff = women <<
\new Voice =
"sopranos" { \voiceOne << \global \soprano >> }
\new Voice =
"altos" { \voiceTwo << \global \alto >> }
                   >>
\new Staff = men <<
\clef bass
\new Voice =
"tenors" { \voiceOne <<\global \tenor >> }
\new Voice =
"basses" { \voiceTwo <<\global \bass >> }
                 >>
               >>
>>

\layout { indent=0
\context { \Score
           \remove "Bar_number_engraver" }
\context { \Staff
           \override TimeSignature #'transparent = ##t }
\context { \Score \remove "Mark_engraver" }
\context { \Staff \consists "Mark_engraver" }
}

\midi { \context { \Score 
                   tempoWholesPerMinute = #(ly:make-moment 92 4)
                 }
      }
}

\markup {   \hspace #10  %% use \hspace or \halign to centre the 3-column group
  \line { %% Master Line - of 3 page columns 
    \column { %%start page column 1
			    
    \line { \italic \small "Suitable till Candlemas." }
			    
    \column { %% stanza 1 is a column of 2 lines. Redundant if only 1 stanza
      \line { \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
              \hspace #-1    %% adjust this if other letters are too far from Drop Cap
              \column  { \raise #0.0 "HE Maker of the sun and moon," "The Maker of our earth," } }          
			       
      \line {  \hspace #-0.6  %%adjust hspace until this line left edge is flush with Drop Cap
               \lower  #1.56  %%adjust this until the line spacing looks right
	       \column {   
		  "Lo! late in time, a fairer boon,"
		  "    Himself is brought to birth!" }	}
			       
             } %% finish stanza 1 column
	} %%finish page column 1
		           
      \hspace #2 %%adds horizontal space columns 1 and 2   
			   
      \column { \filled-box #'(0.0 . 0.1) #'( -12.2 . -1.8) #0 }    %%Column 2. This is the line
			   
      \hspace #2 %%adds horizontal space between columns 2 and 3
			   
      \column { %%start column 3
      
      \line { \hspace #23 \italic \small "Laurence Housman." } 
	
       \line {  "2  "
               \column { "How blest was all creation then,"
                         "    When God so gave increase;"
                         "And Christ, to heal the hearts of men,"
                         "    Brought righteousness and peace!" }
				 }
	} %% end column 3 
    } % end master line			
} %% end markup			

 
\markup {
          \halign #-2.3
          \column {
          \hspace #0.5
          \line { "3  " \column { "No star in all the heights of heaven"
                                 "    But burned to see him go;"
                                 "Yet unto earth alone was given"
                                 "    His human form to know." }
                               }
         \hspace #0.5
         \line { "4  " \column { "His human form, by man denied,"
                                "    Took death for human sin:"
	                        "His endless love, through faith descried,"
                                "    Still lives the world to win." }
                              }
         \hspace #0.5
         \line { "5. " \column { "O perfect Love, outpassing sight,"
                                "    O Light beyond our ken,"
                                "Come down through all the world to-night,"
                                "    And heal the hearts of men!" }
               }
             }
        }

%% Amen score block
\score{
		
	
 \new ChoirStaff
 <<
 \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                      << 
 \context Voice = "sopranos" { \relative c' {        
	                           \overrideProperty #"Score.NonMusicalPaperColumn"
                                                #'line-break-system-details #'((Y-offset . 135)
                                                        (alignment-offsets . (0 -5.8 -9.6)))
                                                    \global \time 2/1 \voiceOne  e1 e1 \bar "||" }}
	\context Voice = "altos" { \relative c' {   \global \time 2/1 \voiceTwo cis1 b1 \bar "||" }}
	 		>>
			 
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                 <<
	\context Voice = "tenors" { \relative c {  \global \clef bass \time 2/1 \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c {  \global \clef bass \time 2/1 \voiceFour a1 e'1 \bar "||" }}
			 >> 
 >>			 
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
         indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

 }
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }
      }
}
