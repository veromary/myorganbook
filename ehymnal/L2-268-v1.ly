%%%% 416.png
%%%% Hymn 268 AR HYD Y NOB. God, that madest earth and heaven
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	                                        \hspace #0.1 }}	
	
  title = "268"   
  
  poet = \markup {  \small { \sans {"AR HYD Y NOB."}   \hspace #1 \roman {"(8 4. 8 4. 8 8. 8 4.)"}} }
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger =  \markup { \small { \italic "Welsh Traditional Melody." }}
  
  tagline = ""
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

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat   g'2. fis4 e2 g2 | a2. g4 fis2 d2 | e1 fis2. fis4 | g\breve  \fdendrepeat \break }  
  \tag #'remainder  {  c2  b2 c2 d2 | e2 d2 c2 b2 | c2 b2 a2 g2 | b2. a4 g2 fis2 \bar "||"  \break
  g2. fis4 e2 g2 | a2. g4 fis2 d2 | e1 fis2. fis4 | g\breve \bar "||" 
}} 
   

alto = \relative c' {  
  \tag #'repeatpart {   b2 d2 e2 d2 | e2 e2 d2 d2 | g,1 d'2 c2 | b\breve  \fdendrepeat } 
  \tag #'remainder  { c2 d2 c2 g'2 | g2 f2 e2 d2 | e2 g2 e2 e2 | e2. e4 d2 d2 \bar "||" 
  d2. d4 c2 d2 | e2 e2 d2 d2 | g,1 d'2 c2 | b\breve \bar "||"
}}


tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  g'2 g2 g2 g2 | c2. b4 a2 d2 | \topstraddle  d2 ( c2 ) b2 a2 | g\breve  \fdendrepeat  }  
  \tag #'remainder  { g2 g2 g2 g2 | c2 a2 g2 b2 | a2 d2 c2 b2 | c2. c4 a2 a2 \bar "||" 
  g2. g4 g2 g2 | c2. b4 a2 d2 | \topstraddle d2 ( c2 ) b2 a2 | g\breve \bar "||" 
}}


bass = \relative c {\clef bass 
   \tag #'repeatpart {  g2 b2 c2 b2 | a2 c2 d2 b2 | c1 d2. d4 | g,\breve \fdendrepeat  }  
   \tag #'remainder  { e'2 g2 e2 b2  | c2 d2 e2 g2 | a,2 b2 c2 e2 | a,2. c4 d2 d2 \bar "||" 
   b2. b4 c2 b2 | a2 c2 d2 b2 | c1 d2. d4 | g,\breve \bar "||"
}}


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


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune for this hymn will be found in the Appendix." }


%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #50 "1." \italic "Bishop Heber" "(" \hspace #-1 \italic "1827" \hspace #-1 ").   2." \italic "Archbishop Whately" "(" \hspace #-1 \italic "1853" \hspace #-1 ")." }} 

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.0 \column { \lower #2.4 \fontsize #8 "G" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OD, that madest earth and heaven,"
			                                "    Darkness and light;" } }          
	                  \line {  \hspace #3.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who the day for toil hast given,"
					   "        For rest the night;"
					   "May thine Angel-guards defend us,"
					   "Slumber sweet thy mercy send us,"
					   "Holy dreams and hopes attend us,"
					   "        This livelong night."
					   "          " %%% adds vertical spacing between verses
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
			\line { "2.  "
			   \column {	     
				   "Guard us waking, guard us sleeping;"
				   "        And, when we die,"
				   "May we in thy mighty keeping"
				   "        All peaceful lie:"
				   "When the last dread call shall wake us,"
				   "Do not thou our God forsake us,"
				   "But to reign in glory take us"
				   "        With thee on high."
				   "          " %%% adds vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  



} %%% book bracket
