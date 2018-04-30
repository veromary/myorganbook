%%% 171.png
%%% Hymn 102 PASSION CHORALE.  "Oh Sacred Head Sore Wounded"
%%% Version 2

\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE" \hspace #0.1 } }
   title = \markup { "102" \hspace #0.5 \small { \smallCaps "(Alternative Version)" } }
   meter = \markup { \small { \column { \line { \sans {"PASSION CHORALE."} \hspace #1 \roman {"(7 6. 7 6. D.)"} }
                                        \line { \raise #2 { \italic {Very slow and solemn} \general-align #Y #DOWN \note #"2" #0.6 = 42.} }
                   }        }         } 

   arranger = \markup { \small { \column { \line { \hspace #11 \italic "Harmonized by " \smallCaps "J. S. Bach." }
                                           \line { \raise #1.8 { \italic "In the ‘Passion according to St. Matthew.’"} }
                      }        }         }
   tagline =""
}

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Macros                                                                  %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


global = {
   \key c \major
   \time 8/4
   % \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}

partmeasure =  \set Score.measurePosition = #(ly:make-moment 5 2)


fdstartrepeat =  {

% *** repeat sign comprising 4 dots
% *** Use at the start of a piece where \bar ":" does not work	

   \once \override Staff.BarLine #'stencil = #ly:text-interface::print 
   \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) \raise #1.4 
      \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} } } }	\bar "|:"
}


fdendrepeat = {

% *** repeat sign comprising 4 dots and two thin bars

   \once \override Staff.BarLine #'stencil = #ly:text-interface::print 
   \once \override Staff.BarLine #'text = \markup { \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
      \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
      \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0 \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0 } } \bar "||"
} 


breathmark = { 
   \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
   \override Score.RehearsalMark #'Y-offset = #'-1.5
   \override Score.RehearsalMark #'X-offset = #'-0.5
   \mark \markup {\fontsize #4 ","}
}

shortenStem = \once \override Stem #'length = #4.5


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Music                                                                   %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


soprano = \relative c' { 

   \partial 2 \fdstartrepeat e2 \bar "|" a2 g2 f2 e2 \bar "|" \once \override NoteColumn #'force-hshift = #1.7 d1 e2^\fermata \breathmark \bar "||" 
      b'2 \bar "|" c2 b4( c8[ d8]) c2 b4( a4) \bar "|" a1.^\fermata \fdendrepeat \break

   c2 \bar "|" b4( a4) g2 a2 b2 \bar "|" \once \override NoteColumn #'force-hshift = #0.4 c1 c2^\fermata \breathmark \bar "||" g2 \bar "|" 
      a2 g2 a4( g4) \once \override NoteColumn #'force-hshift = #1.7 f2 \bar "|" \once \override NoteColumn #'force-hshift = #1.7 e1.^\fermata \bar "||" \break

   c'!2 \bar "|" b4( c4) d2 c2 \once \override NoteColumn #'force-hshift = #1.7 b2 \bar "|" 
      \once \override NoteColumn #'force-hshift = #1.7 a1 b2^\fermata \breathmark \bar "||" e,2 \bar "|" f2 e2 d2 g4( f4) \bar "|" 
      \once \override NoteColumn #'force-hshift = #1.7 e1.^\fermata \bar "||" 
}


alto = \relative c' { 

   \partial 2 \fdstartrepeat c2 \bar "|" c4( d4) e2 a,4( b4) c2 \bar "|" c2( b2) c2 \bar "||" e2 \bar "|" e2 f2 e2 d4( c4) \bar "|" c1. \fdendrepeat \break

   e2 \bar "|" fis2 e2 f2 f2 \bar "|" g2( f2) e2 \bar "||" e2 \bar "|" e4( d4) cis4( d4) e2 e4( d4) \bar "|" d2( cis1) \bar "||" \break

   a'2 \bar "|" g2 g2 g4( a4) b4( g4) \bar "|" g2( fis2) g2 \bar "||" c,2 \bar "|" d2 c2 d2 e4( d4) \bar "|" d2( c2 b2) \bar "||" 
}


tenor = \relative c { \clef bass

   \partial 2 \fdstartrepeat \once \override NoteColumn #'force-hshift = #1.7 a'2 \bar "|" a4( b4) c2 d2 g,2 \bar "|" a2( g2) g2 \bar "||" 
      b2 \bar "|" a2 a2 a2 gis2 \bar "|" e1. \fdendrepeat \break

   a4( g4) \bar "|" \once \override Accidental #'extra-offset = #'(-1.3 . 0) fis2 b2 c2 d2 \bar "|" c4( bes2 aes4) g2 \bar "||" 
      c4( bes!4) \bar "|" a!2 bes2 a2 a2 \bar "|" a1. \bar "||" \break

   d2 \bar "|" d2 d4( e8[ f8]) e2 d2 \bar "|" e2( d2) d2 \bar "||" g,2 \bar "|" g2 g2 g4( a4) bes2 \bar "|" b!2( a2 gis2) \bar "||" 
}


bass = \relative c { \clef bass

   \partial 2  \fdstartrepeat a'4( g4) \bar "|" f2 e2 d2 c2 \bar "|" fis,2( g2) c2_\fermata \bar "||" gis2 \bar "|" a2 d2 e2 e2 \bar "|" 
      \once \override Script #'padding = #0.5 a,1._\fermata \fdendrepeat \break

   a'2 \bar "|" \once \override Accidental #'extra-offset = #'(1.3 . 0) dis,2 e2 ees2 d2 \bar "|" e!2( f2) c2_\fermata \bar "||" 
      c2 \bar "|" f2 e4( d4) cis2 d2 \bar "|" \once \override Script #'padding = #0.5 a1._\fermata \bar "||" \break

   fis'2 \bar "|" g4( a4) b2 e,4( fis4) g2 \bar "|" cis,2( d2) g,2_\fermata \bar "||" \override Accidental #'transparent = ##t c2 \bar "|" b2 c2 bes4( a4) g2 \bar "|" 
      gis2( a2 \once \override Script #'padding = #2 e'2)_\fermata \bar "||" }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Score                                                                   %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


#(ly:set-option 'point-and-click #f)

\book {

\paper {
   #(set-paper-size "a4")
   between-system-padding = #0.0
   print-page-number = ##f
   % *** forces Lilypond to space out systems to fill the entire page
   ragged-bottom=##t
   ragged-last-bottom=##t
}

\score { <<

\new ChoirStaff <<
   \new Staff = "upper" << \context Voice = sopranos { \voiceOne \global \soprano }
                           \context Voice = altos    { \voiceTwo \global \alto } >> 
   \new Staff = "lower" << \context Voice = tenors   { \voiceOne \global \tenor }
                           \context Voice = bass     { \voiceTwo \global \bass } >>
                >>  
>>

\layout {
   ragged-right = ##f
   % *** makes sure last system spreads right across the page
   ragged-last = ##f
\context { \Score 
   \remove "Bar_number_engraver"
   % *** uncomment this to remove system start bar 
   % \override SystemStartBar #'stencil = ##f 
   \override NonMusicalPaperColumn #'page-break-permission = ##f }
\context { \Staff 
   \override TimeSignature #'transparent = ##t }
} 

} % *** end score 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Markup                                                                  %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\markup { \small { \hspace #1 \column { 

\line { \hspace #1.2 {[ } \italic { This version may be used, } \italic { in connexion with the other, } \italic { for verse 4, } \italic { and must be sung by} }
  
\line { \italic {the} \smallCaps { Choir alone.} \null \null \italic {This version should only be attempted by good choirs.} "]" }

\hspace #0.5

} % end column
} % end small
} % end markup


%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux 
%%% but has been reported to give problems when compiling on Macintosh installations, 
%%% thus GF Gesetz has been used below.
%%% If you use another Fraktur font, simply put the name into the font-name override below.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Lyrics                                                                  %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
   % *** change number as necessary to centre lyrics block
   \hspace #34 

\column { 
   % *** whole lyrics block is formatted into a single column

% *** heading section
   \line { \small { \hspace #46 \center-align { \line { \italic "P. Gerhardt,  1607-76, based on" "Salve caput cruentatum" }  
                                                \line { "(" \italic "ascribed to St. Bernard" ")." \italic "  Tr.  Y. H."} 
         }        }                            }

   \line {  \small { \lower #2 \hspace #2 \override #'(font-name . "GF Gesetz") {"O Haupt voll Blut und Wunden."}
         }         }
     
% *** lyrics section 1: double column of verses
   % *** Create a line made up of two columns of verse separated by a vertical line
   \line {
      % *** first column of verse  
      % *** return to LH margin
         \hspace #-30
      \column {  
         \line { \hspace #2.2 
                    % *** Drop Cap goes here
                 \column { \lower #2.4 \fontsize #8 "O" }
                    % *** adjust if rest of line is too far from Drop Cap - left is negative
                  \hspace #-1.3    
	          \column { \raise #0.0 " SACRED head, sore wounded,"  
                                        "  Defiled and put to scorn;"  } }          

                  \line { % *** adjust hspace until this line left edge is flush with Drop Cap
                          \hspace #2.7  
                          % *** adjust this until the line spacing looks right
                          \lower  #1.56  
		          \column { "O kingly head, surrounded"
                                    "    With mocking crown of thorn:"
                                    "What sorrow mars thy grandeur?"
                                    "    Can death thy bloom deflower?"
                                    "O countenance whose splendour"
                                    "    The hosts of heaven adore." } }
   } % *** end first column of verse

      % *** create some space between first column of verse and the vertical line
      \hspace #5

      % *** vertical line	
      \column { \filled-box #'(0.0 . 0.1) #'(-22 . 0 ) #0 }

      % *** second column of verse
         \hspace #4
      \column { 
         \line { "2  " \column { "Thy beauty, long-desirèd,"
				 "    Hath vanished from our sight;"
				 "Thy power is all expirèd,"
				 "    And quenched the light of light."
				 "Ah me! for whom thou diest,"
				 "    Hide not so far thy grace:"
				 "Show me, O Love most highest,"
				 "    The brightness of thy face." } }
      \hspace #1
      } % end second column of verse
   } % end master line

} % end column that is entire lyrics section

} % end markup

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Page Break                                                              %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  

% *** fake score block to occupy space and force a pagebreak.

\score { 

   { s4 }

\header { breakbefore = ##t }

\layout{
   \context { \Staff
      \remove Time_signature_engraver
      \remove Key_engraver
      \remove Clef_engraver
      \remove Staff_symbol_engraver } }  
}
	

        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Page Two                                                                %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\markup { \hspace #32   %%add space as necc. to center the column


          \column { 
                               \hspace #1 % adds vertical spacing between verses 

\line { "3 *" \column { "I pray thee, Jesus, own me,"
			"    Me, Shepherd good, for thine;"
			"Who to thy fold hast won me,"
			"    And fed with truth divine."
    	                "Me guilty, me refuse not,"
			      "    Incline thy face to me,"
			      "This comfort that I lose not,"
			      "    On earth to comfort thee." } } 
  \hspace #1 % adds vertical spacing between verses  
                \line {"4  "
                    \column {        
			    "In thy most bitter passion"
			    "    My heart to share doth cry,"
			    "With thee for my salvation"
			    "    Upon the Cross to die."
			    "Ah, keep my heart thus movèd"
			    "    To stand thy Cross beneath,"
			    "To mourn thee, well-belovèd,"
			    "    Yet thank thee for thy death."
                        }} 
                \hspace #1 % adds vertical spacing between verses  
                \line {"5.*"
                    \column {        
			    "My days are few, O fail not,"
			    "    With thine immortal power,"
			    "To hold me that I quail not"
			    "    In death's most fearful hour:"
			    "That I may fight befriended,"
			    "    And see in my last strife"
			    "To me thine arms extended"
			    "    Upon the Cross of life."
                }}
          }
} %%% lyric markup bracket



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Repeats and Midi                                                        %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% *** This next section of code is for unfolding the repeats and generating the midi
 
% *** Not needed for visual layout
                
 
\score { 

\new ChoirStaff <<
 
\new Staff = "soprano" { \relative c' { \global
 
\unfoldRepeats { 
   \repeat volta 2 {
   \partial 2 e2 \bar "|" a2 g2 f2 e2 \bar "|" d1 e2 \bar "||" b'2 \bar "|" c2 b4( c8[ d8]) c2 b4( a4) \bar "|" a1. }

   c2 \bar "|" b4( a4) g2 a2 b2 \bar "|" c1 c2 \bar "||" g2 \bar "|" a2 g2 a4( g4) f2 \bar "|" e1. \bar "||"

   c'2 \bar "|" b4( c4) d2 c2 b2 \bar "|" a1 b2 \bar "||" e,2 \bar "|" f2 e2 d2 g4( f4) \bar "|" e1. \bar "||"    
} % unfold 
} % relative
} % staff   


\new Staff = "alto" { \relative c' { \global 

\unfoldRepeats { 
   \repeat volta 2 { 
   \partial 2 c2 \bar "|" c4( d4) e2 a,4( b4) c2 \bar "|" c2( b2) c2 \bar "||" e2 \bar "|" e2 f2 e2 d4( c4) \bar "|" c1. }

   e2 \bar "|" fis2 e2 f2 f2 \bar "|" g2( f2) e2 \bar "||" e2 \bar "|" e4( d4) cis4( d4) e2 e4( d4) \bar "|" d2( cis1) \bar "||" 

   a'2 \bar "|" g2 g2 g4( a4) b4( g4) \bar "|" g2( fis2) g2 \bar "||" c,2 \bar "|" d2 c2 d2 e4( d4) \bar "|" d2( c2 b2) \bar "||" 
}
}
}
 
\new Staff = "tenor" { \relative c { \clef bass \global

\unfoldRepeats { 
   \repeat volta 2 { 
   \partial 2  a'2 \bar "|" a4( b4) c2 d2 g,2 \bar "|" a2( g2) g2 \bar "||" b2 \bar "|" a2 a2 a2 gis2 \bar "|" e1. }

   a4( g4) \bar "|" fis2 b2 c2 d2 \bar "|" c4( bes2 aes4) g2 \bar "||" c4( bes!4) \bar "|" a!2 bes2 a2 a2 \bar "|" a1. \bar "||" 

   d2 \bar "|" d2 d4( e8[ f8]) e2 d2 \bar "|" e2( d2) d2 \bar "||" g,2 \bar "|" g2 g2 g4( a4) bes2 \bar "|" b!2( a2 gis2) \bar "||" 
}
}
}

 
\new Staff = "bass" { \relative c { \clef bass \global

\unfoldRepeats { 
   \repeat volta 2 {          
   \partial 2  a'4( g4) \bar "|" f2 e2 d2 c2 \bar "|" fis,2( g2) c2 \bar "||" gis2 \bar "|" a2 d2 e2 e2 \bar "|" a,1. }

   a'2 \bar "|" dis,2 e2 ees2 d2 \bar "|" e!2( f2) c2 \bar "||" c2 \bar "|" f2 e4( d4) cis2 d2 \bar "|" a1. \bar "||" 

   fis'2 \bar "|" g4( a4) b2 e,4( fis4) g2 \bar "|" cis,2( d2) g,2 \bar "||" c2 \bar "|" b2 c2 bes4( a4) g2 \bar "|" gis2( a2 e'2) \bar "||" 
}
}
}

 
>> % choir staff
 
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) } }

} % end repeat and midi block score
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     Amen                                                                    %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	
\score { <<

\new ChoirStaff <<
   \new Staff = upper << 
      \new Voice = "sopranos"  { \relative c' { \global \voiceOne f1 e1 \bar "||" } }
      \new Voice = "altos"     { \relative c' { \global \voiceTwo c1 c1 \bar "||" } } >>

      \new Lyrics \lyricsto sopranos { \override LyricText #'font-size = #-1 { A -- men. } } 

      \new Staff = lower <<
         \new Voice = "tenors" { \relative c { \global \voiceThree \clef bass a'1 g1 \bar "||" } }
         \new Voice = "basses" { \relative c { \global \voiceFour \clef bass f1 c1 \bar "||" } } >> 

>> % choirstaff bracket

>> % score bracket

% *** creates space between end of lyrics and amen score
\header { breakbefore = ##f piece = " " opus = " " }

\layout {
   indent = 15\cm
   raggedright = ##t
   ragged-bottom = ##t
   packed = ##f

\context { \Score 
   % *** controls the amount of space between notes on the staff
   \override SeparationItem #'padding = #3 
}
     
\context { \Staff 
   \remove "Time_signature_engraver"
   \override VerticalAxisGroup #'minimum-Y-extent = #'( -2 . 2) 
   fontSize = #-2 
   \override StaffSymbol #'staff-space = #(magstep -2)
}

} % *** end amen layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) } } 

} % *** end amen score


} % *** end book