%%%% 402.png
%%%% Hymn 256 Voller Wunder At thy feet, O Christ, we lay
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	                                        \hspace #0.1 }}	
	
  title = "256"   
  
  poet = \markup {  \small { \sans {"VOLLER WUNDER."}   \hspace #1 \roman {"(7 7. 7 7. 7 7.)"}} }
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 120.} }
  
  arranger =  \markup { \small { \smallCaps "J. G. Ebeling, 1620-76."}}
  
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

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat  bes'2 f4 | g2 bes4 | bes2 a4 | bes2. \bar "||" a2 bes4 | c2 f,4 | g4 ( a4 -) g4 | f2.  \fdendrepeat \break }  
  \tag #'remainder  { f2 g4 | bes2 g4 | a2 bes4 | c2. \bar "||" bes2 c4 | d2 bes4 | bes2 a4 | bes2. \bar "||" 
}} 


alto = \relative c' {  
  \tag #'repeatpart { d2 f4 | ees2 d4 | f2 f4 | f2. \bar "||" f2 f4 | f2 f4 | f2 e4 | f2. \fdendrepeat } 
  \tag #'remainder  { c2 ees4 | f2 ees4 | ees2 f4 | f2. \bar "||" d2 g4 | fis2 d4 | f!2 f4 | f2. \bar "||" 
}}


tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  bes'2 bes4 | bes2 bes4 | c2 c4 | d2. \bar "||" d2 d4 | c2 a4 | d2 g,4 | a2. \fdendrepeat  }  
  \tag #'remainder  { a2 bes4 | bes2 bes4 | c2 d4 | a2. \bar "||" bes2 g4 | a2 bes4 | c2 c4 | d2. \bar "||"  
}}


bass = \relative c {\clef bass 
   \tag #'repeatpart { bes2 d4 | ees2 g4 | f2 f4 | bes,2. \bar "||" d2 bes4 | a2 d4 | bes2 c4 | f2. \fdendrepeat  }  
   \tag #'remainder  { f2 ees4 | d2 ees4 | c2 bes4 | f'2. \bar "||" g2 ees4 | d2 g4 | f2 f4 | bes,2. \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4)}} 

} %%% Score bracket


%%% Lyric titles and attributions


\markup {  \small {  \hspace #64 \italic "W. Bright, 1824-1901." }} 
\markup { "                " }

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T thy feet, O Christ, we lay"
			                                "    Thine own gift of this new day;" } }          
	                  \line {  \hspace #3.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Doubt of what it holds in store"
					   "Makes us crave thine aid the more;"
					   "Lest it prove a time of loss,"
					   "Mark it, Saviour, with thy Cross."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
		      \line { "2  "
			   \column {	     
				   "If it flow on calm and bright,"
				   "Be thyself our chief delight;"
				   "If it bring unknown distress,"
				   "Good is all that thou canst bless;"
				   "Only, while its hours begin,"
				   "Pray we, keep them clear of sin."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			   \column {	     
				   "We in part our weakness know,"
				   "And in part discern our foe;"
				   "Well for us, before thine eyes"
				   "All our danger open lies;"
				   "Turn not from us, while we plead"
				   "Thy compassions and our need."
				   "          " %%% adds vertical spacing between verses
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

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "4  "
			   \column {	     
				   "Fain would we thy word embrace,"
				   "Live each moment on thy grace,"
				   "All our selves to thee consign,"
				   "Fold up all our wills in thine,"
				   "Think, and speak, and do, and be"
				   "Simply that which pleases thee."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "5. "
			   \column {	     
				   "Hear us, Lord, and that right soon;"
				   "Hear, and grant the choicest boon"
				   "That thy love can e'er impart,"
				   "Loyal singleness of heart;"
				   "So shall this and all our days,"
				   "Christ our God, show forth thy praise."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne bes'1 bes1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo g'1 f1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees'1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  ees1 bes1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}  %%Amen midi       
       
}  



} %%% book bracket
