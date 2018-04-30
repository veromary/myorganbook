%%%% 209.png
%%%% Hymn 127 Everton. Alleluya! Alleluya! Hearts to heaven and voices raise.
%%%% Rev 2

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
  title = "127"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "EVERTON."} \hspace #1 \roman {"(8 7. 8 7. D.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96.} }
  
  arranger = \markup { \small \smallCaps "H. Smart, 1813-79." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
                 

%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \tag #'repeatpart { \fdstartrepeat g'4 aes bes ees \bar "|" c d ees bes \bar "||" aes bes g ees \bar "|" f f f2 \fdendrepeat \break }
  \tag #'remainder { f4 f g bes \bar "|" bes a bes d \bar "||" d d c g8[ a] \bar "|" bes4 a g2 \bar "||" \break 
  bes4 bes bes ees \bar "|" aes, c c bes \bar "||" ees, f g bes \bar "|" aes f ees2 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart { \fdstartrepeat ees4 d ees g \bar "|" ees aes g ees \bar "|" ees f ees bes \bar "|" c d8[ ees] d2 \fdendrepeat }
  \tag #'remainder { d4 f ees ees \bar "|" f f f f \bar "||" g g g g4 | g fis g2 \bar "||"
  d4 d ees ees \bar "|" ees  ees   ees ees  \bar "|" ees d ees ees  \bar "|" ees d  ees2 \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat bes'4 bes bes bes \bar "|" c aes bes bes \bar "||" c f, bes bes \bar "|" bes a bes2 \fdendrepeat }
  \tag #'remainder { bes4 bes bes bes \bar "|" c c bes bes \bar "||" bes d ees c \bar "|" d c bes2 \bar "||"
  bes4 aes! g g \bar "|" aes aes aes g \bar "||" g bes bes bes \bar "|" c bes8[ aes] g2 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat ees4 f g ees \bar "|" aes f ees g \bar "||" c, d ees g \bar "|" f f, bes2 \fdendrepeat }
  \tag #'remainder { bes4 d ees g \bar "|" f f8[ ees] d4 bes \bar "||" bes' bes, c ees \bar "|" d d g2 \bar "||" 
  g4 f ees des \bar "|" c aes ees' ees \bar "||" c bes ees g, \bar "|" aes bes ees2 \bar "||" }
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

	
%%% A separate score to unfold the repeat and generate the Hymn Midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'remainder \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'remainder \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'remainder \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'remainder \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4)}} 

} %%% Score bracket

%%% Hymn Note 

\markup { \hspace #52 \center-align { \line { \italic "This hymn may also be sung to" \smallCaps "Psalm 42" "(" \hspace #-1 \italic "No." "200" \hspace #-1 ")" \italic "by substituting" }
	
	\line { \combine \note #"2" #0.5 "—" \combine \note #"2" #0.5 "—" \italic " for " \combine \note #"1" #0.5 "—" \italic " at line 5." }
}}


%%% Lyric Attribution 

\markup { \small { \hspace #64  \italic "Bishop Chr. Wordsworth, 1807-85."}}
	 

%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LLELUYA! Alleluya!"
			                                "  Hearts to heaven and voices raise;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Sing to God a hymn of gladness,"
					   "    Sing to God a hymn of praise;"
					   "He who on the Cross a victim"
					   "    For the world's salvation bled,"
					   "Jesus Christ, the King of glory,"
					   "    Now is risen from the dead."
			  		}} 
			         } %%% finish verse 1	
				 
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

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
			\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Christ is risen, Christ the first-fruits"
				   "    Of the holy harvest field,"
				   "Which will all its full abundance"
				   "    At his second coming yield;"
				   "Then the golden ears of harvest"
				   "    Will their heads before him wave,"
				   "Ripen'd by his glorious sunshine"
				   "    From the furrows of the grave."
			}} 
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Christ is risen, we are risen;"
				   "    Shed upon us heavenly grace,"
				   "Rain, and dew, and gleams of glory"
				   "    From the brightness of thy face;"
				   "That we, Lord, with hearts in heaven"
				   "    Here on earth may fruitful be,"
				   "And by angel-hands be gathered,"
				   "    And be ever safe with thee."
			}}	   
    		        \hspace #1 
			%%% strange behaviour - this blank line is narrower than the pervious one. Adjusted spacing with \lower
           		\line { \lower #0.3 { "4. "
			  \column {	     
				  "Alleluya! Alleluya!"
				  "    Glory be to God on high;"
				  "To the Father, and the Saviour,"
				  "    Who has gained the victory;"
				  "Glory to the Holy Spirit,"
				  "    Fount of love and sanctity;"
				  "Alleluya! Alleluya!"
				  "    To the Triune Majesty.     Amen."
			}}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }} 

}
	
} %%% book bracket
