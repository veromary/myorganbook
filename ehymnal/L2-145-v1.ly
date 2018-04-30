%%%% 234.png
%%%% Hymn 145 In Babilone. See the Conqueror mounts in triumph
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "145"   
  
  poet = \markup { \small {  \line { \sans { "IN BABILONE."} \hspace #1 \roman {"(8 7. 8 7. D.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow, dignified} \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
  
  arranger = \markup { \small \italic "Dutch Traditional Melody." }
  
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

%%generates the breathmarks

breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'toFine { \fdstartrepeat g'2 fis4( e) d2 g | a g4( a) b2 g  \breathmark \bar "||" 
      c2 b4( a) b2 a4( g) | fis( g) a( fis) 
      \once \override Script #'extra-offset = #'(0.0 . -2.0)  g1 
      ^\markup { \hspace #3 \lower #1 \italic "Fine" }  \fermata \fdendrepeat \break }
  \tag #'toDC {  g2 a4( b) c2 b2 | a gis a a \breathmark \bar "||" 
      a b4( c) d2 g, | a g4( fis) e2( ^\markup { \italic "D. C." } d) \breathmark \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'toFine { d2 c b b  | e e4( fis) g2 d \bar "||" 
      e d d e | c4( d) c( d) d1 \fdendrepeat }
  \tag #'toDC {  b2 f' e f | e e e e \bar "||" 
      fis! d d e | d d cis( d) \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'toFine { \fdstartrepeat b'2 a4( fis) g2 g | g d' d g, \bar "||" 
      g fis g b | c4( b) a( c) b1 \fdendrepeat \break }
  \tag #'toDC {  g2 f g d' | c b c c \bar "||"
      d fis, g b | a b g( fis) \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'toFine { g2 a b e | c d g, b \bar "||" 
      a d b e | a,4( b) c( d) g,1 _\fermata \fdendrepeat \break }
  \tag #'toDC {  e'2 d c d | e e a, a \bar "||" 
      d c b e | fis, g a( d) \bar "||" }
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


%%% A separate score block to unfold repeats and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'toDC \soprano \soprano \removeWithTag #'toDC \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'toDC \alto \alto \removeWithTag #'toDC \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'toDC \tenor \tenor \removeWithTag #'toDC \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'toDC \bass \bass \removeWithTag #'toDC \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  
  		
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \hspace #70 \small \italic "Bishop Chr. Wordsworth, 1807-85."}  

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EE the Conqueror mounts in triumph,"
			                                 "  See the King in royal state" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Riding on the clouds his chariot"
					   "    To his heavenly palace gate;"
					   "Hark! the choirs of angel voices"
					   "    Joyful Alleluyas sing,"
					   "And the portals high are lifted"
					   "    To receive their heavenly King."
			  		}}
		      }
                        \hspace #1  % adds vertical spacing between verses  
           		\line { \hspace #-10 \italic "Unison.  "  "2  "
			   \column {	     
				   "Who is this that comes in glory,"
				   "    With the trump of jubilee?"
				   "Lord of battles, God of armies,"
				   "    He has gained the victory;"
				   "He who on the Cross did suffer,"
				   "    He who from the grave arose,"
				   "He has vanquished sin and Satan,"
				   "    He by death has spoiled his foes."
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
%			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "Thou hast raised our human nature"
				   "    In the clouds to God's right hand;"
				   "There we sit in heavenly places,"
				   "    There with thee in glory stand;"
				   "Jesus reigns, adored by Angels;"
				   "    Man with God is on the throne;"
				   "Mighty Lord, in thine Ascension"
				   "    We by faith behold our own."
			}}
			\hspace #1  
			\line { \hspace #-10 \italic "Unison.  " "4. "
				\column {	     
					"Glory be to God the Father;"
					"    Glory be to God the Son,"
					"Dying, risen, ascending for us,"
					"    Who the heavenly realm has won;"
					"Glory to the Holy Spirit;"
					"    To One God in persons Three;"
					"Glory both in earth and heaven,"
					"    Glory, endless glory, be.     Amen."
			}} 
			\hspace #1 % adds vertical spacing between verses 
			\hspace #1 % adds vertical spacing between verses  
			\line { \hspace #10 \italic "Part 2." }
			
			\hspace #1 % adds vertical spacing between verses
			\line {"5  "
				\column {	     
					"Holy Ghost, Illuminator,"
					"    Shed thy beams upon our eyes,"
					"Help us to look up with Stephen,"
					"    And to see beyond the skies,"
					"Where the Son of Man in glory"
					"    Standing is at God's right hand,"
					"Beckoning on his Martyr army,"
					"    Succouring his faithful band;"
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6  "
				\column {	     
					"See him, who is gone before us,"
					"    Heavenly mansions to prepare,"
					"See him, who is ever pleading"
					"    For us with prevailing prayer,"
					"See him, who with sound of trumpet"
					"    And with his angelic train,"
					"Summoning the world to judgement,"
					"    On the clouds will come again."
     			}}
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-10 \italic "Unison.  " "7. "
				\column {	     
					"Glory be to God the Father;"
					"    Glory be to God the Son,"
					"Dying, risen, ascending for us,"
					"    Who the heavenly realm has won;"
					"Glory to the Holy Spirit;"
					"    To One God in persons Three;"
					"Glory both in earth and heaven,"
					"    Glory, endless glory, be.     Amen."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  



} %%% book bracket
