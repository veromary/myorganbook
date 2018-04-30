%%%% 207.png
%%%% Hymn 125 Modern Tune. The Lamb's high banquet we await
%%%% Rev 1.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"

        \hspace #0.1 }} 

  title = \markup { "125 " \large \smallCaps "(Modern Tune)" }

  poet = \markup { \small {  \line { \sans { \smallCaps "REX GLORIOSE."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time}  \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "French Church Melody." }
  

  tagline =""

}


%%% SATB voices

global = {
  \time 3/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d4 | a'2 g4 | f( e) d | a'2 b4 | c2 \bar "||" a4 | d2 c4 | bes4( a) g | a( g4.) f8 | f2 \bar "||" \break
  a4 | c2 c4 | d2 a4 | g( f) g | a2 \bar "||" f4 | bes4( a) g | a( g) f | e2 d4 | d2 \bar "||"
}

alto = \relative c' { 
d4 | d2 <bes d>4 | d2 a4 | f'2 d4 | e2 \bar "||" f4 | f2 f4 | <bes, d>2 <c e>4 | <c ~ e ~ >2 <c e>8[ <a c>8] | <a c>2 \bar "||"
d4 | e2 f4 | f2. | d2. | c2 \bar "||" d4 | d2 e4 | c2 c4 | c2 a4 | a2 \bar "||"
}

tenor = \relative c { \clef bass
a'4 | f2 g4 | a2 f4 | c'2 g4 | g2 \bar "||" f4 | a2.  | g2. | e2 ~ e8[ f] | s2 \bar "||"
f4 | g2 a4 | bes2 a4 | d,2. | e2 \bar "||" d4 | g2 g4 | f2 f4 | g2 f4 | f2 \bar "||"
}

bass = \relative c { \clef bass
<d f>4 | d2 g,4 | d'2 d4 | f2 g4 | c,2 \bar "||" f4 | d2 f4 | g,2 c4 | a( c4.) f8 | f2 \bar "||"
d4 | c2 f4 | bes,2 d4 | bes2 bes4 | a2 \bar "||" d4 | g,2 c4 | f,2 a4 | c2 d4 | d2 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4)}} 	
	
} %%% end score bracket


%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune to this hymn will be found in the Appendix." }

%%% Lyric titles and attributions

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn."  \italic " Low Sunday" \hspace #46 \italic "7th cent.  Tr. J. M. Neale." } }  
	    \line { \small { \hspace #11 \italic "till Ascension," "E."       }                                    } }
} 

\markup { \hspace #42 \small "Ad cenam Agni providi." }

	 

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Lamb's high banquet we await"
			                                 "  In snow-white robes of royal state;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And now, the Red Sea's channel past,"
					   "To Christ, our Prince, we sing at last."
			  		}}
		      } %%% end verse 1	
		      \hspace #1  % adds vertical spacing between verses  
		      \line { "2  "
			      \column {	     
				      "Upon the altar of the Cross"
				      "His Body hath redeemed our loss;"
				      "And tasting of his roseate Blood"
				      "Our life is hid with him in God."
     			}}
			\hspace #1  % adds vertical spacing between verses  
			\line { "3  "
				\column {	     
					"That Paschal eve God's arm was bared;"
					"The devastating Angel spared:"
					"By strength of hand our hosts went free"
					"From Pharaoh's ruthless tyranny."
     			}}
				 
    }	%%% end super column  
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


%%% second page
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 	     
			\hspace #1  % adds vertical spacing between verses  
			\line { "4  "
				\column {	     
					"Now Christ our Paschal Lamb is slain,"
					"The Lamb of God that knows no stain;"
					"The true Oblation offered here,"
					"Our own unleavened Bread sincere."
     			}} 
			\hspace #1 
           		\line { "5  "
				\column {	     
					"O thou from whom hell's monarch flies,"
					"O great, O very Sacrifice,"
					"Thy captive people are set free,"
					"And endless life restored in thee."
			}}
		        \hspace #1 
           		\line {"6  "
				\column {	     
					"For Christ, arising from the dead,"
					"From conquered hell victorious sped;"
					"He thrusts the tyrant down to chains,"
					"And Paradise for man regains."
			}}
			\hspace #1 
           		\line {"7  "
				\column {	     
					"Maker of all, to thee we pray,"
					"Fulfil in us thy joy to-day;"
					"When death assails, grant, Lord, that we"
					"May share thy Paschal victory."
			}}
			\hspace #1 
           		\line {"8. "
				\column {	     
					"To thee who, dead, again dost live,"
					"All glory, Lord, thy people give;"
					"All glory, as is ever meet,"
					"To Father and to Paraclete.     Amen."
			}}
	  }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d2( e d c) d1  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo a2( c bes a) a1 \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1   "A   -    -   -" men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree f2( a f f) f1  \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d2( a bes f') d1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }} 
}

} %%% book bracket
