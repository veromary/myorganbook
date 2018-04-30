%%%152png
%%%Hymn 87 Aberystwyth Saviour, when in dust to thee
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		                         \hspace #0.1 }}	
  title = "87" 
  arranger = \markup { \small { \smallCaps "Joseph Parry, 1841-1903."} }
  poet = \markup { \small { \sans  "ABERYSTWYTH." \hspace #1 \roman { "(7 7. 7 7. D.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 58.} }
  tagline =""
}

%%% SATB Voices

global = {
  \time 4/2 
  \key e \minor
  \set Staff.midiInstrument = "church organ" 
}

soprano = \relative c' { 
  e2 e4( fis4) g4( a4) b2 | g2 fis2 e1  \bar "||" g2 fis2 e2 dis!2 | e4( fis4) g2 fis1 \bar "||" \break
  e2 e4( fis4) g4( a4) b2 | g2 fis2 e1  \bar "||" fis2 g4( a4) b2 a2 | g2 fis2 e1 \bar "||" \break
  e2 d2 e2 fis2 | g2 b4( a4) g1 \bar "||" g2 fis2 g2 a2 | b2 d4( cis4) b1 \bar "||" \break
  e2 e2 d2 b2 | g2 a2 b1 \bar "||" e,2 e4( fis4) g4( a4) b2 | g2 fis2 e1 \bar "||"
}

alto = \relative c' {
  b2 e4( dis4) e4( fis4) g2 | e2 dis2 b1 \bar "||" e2 dis2 e2 b2 | b2 e2 dis1 \bar "||"
  b2 b4( dis4) e4( fis4) g2 | e2 dis2 b1 \bar "||" dis2 e4( fis4) g2 fis2 | e2 dis2 b1 \bar "||"
  c2 b2 c2 c2 | d2 fis2 d1 \bar "||" e2 dis2 e2 fis4( d4) | d2 fis4( e4) d1 \bar "||"
  e2 g4( fis4) g2 d2 | e2 e2 fis1 \bar "||" e2 e4( dis4) e4( fis4) g2 | e2 dis2 b1 \bar "||"
}

tenor = \relative c { \clef bass
  g'2 b2 b2 b2 | b2 b4( a4) g1 \bar "||" b2 b2 b2 b2 | b2 b2 b1 \bar "||"
  g4( a4) b2 b2 b2 | b2 fis4( a4) g1 \bar "||" b2 b4( d!4) d2 c2 | b2 b4( a4) g1 \bar "||"
  g2 g2 g2 a2 | b2 d4( c4 ) b1 \bar "||" b2 b2 b2 d4( fis,4) | g4(b2) ais4 b1 \bar "||"
  g2 c2 d2 g,2 | b2 e2 dis1 \bar "||" b4( c4) b4( a4) b2 b2 | b2 fis8[( g8] a4) g1 \bar "||"
}

bass = \relative c {\clef bass
  e2 g,4( b4) e2 g,4( a4) | b2 b2 e1 \bar "||" e2 fis2 g2 a2 | g4( fis4) e2 b1 \bar "||"
  e4( fis4) g4( fis4) e2 g,4( a4) | b2 b2 e1 \bar "||" b2 e4( d!4) g2 a2 | b2 b,2 e1 \bar "||"
  c2 g2 c4( b4) a2 | g2 d'2 g,1 \bar "||" e'2 b2 e2 d2 | g2 fis2 b,1 \bar "||"
  c2 c'2 b2 g2 | e2 c2 b1 \bar "||" g'4( a4) g4( fis4) e2 g,4( a4) | b2 b2 e1 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%%annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% score block	
	
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
%%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

%%% midi block
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 58 2)
            }
       }
	
} %%% score bracket

%%% Text markup - permission line

\markup { \hspace #32 \small \smaller {  "[" \italic "By permission of Messrs. Hughes & Son, Wrexham." "]" } }

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

%%% Page 2
%%% Beginning of lyrics block

\markup {
	\column {
		\line { \hspace #72 \small \italic "Sir R. Grant, 1785-1838."  }   
}}

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8   %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AVIOUR, when in dust to thee"
					  "  Low we bow the adoring knee;"
			                }}          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When repentant, to the skies"
					   "Scarce we lift our weeping eyes:"
					   "O, by all thy pains and woe,"
					   "Suffered once for man below,"
					   "Bending from thy throne on high,"
					   "Hear our solemn Litany."
			  		}}
			           } %% finish verse 1	
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "2  "
		    \column {	     
			    "By thy helpless infant years,"
			    "By thy life of want and tears,"
			    "By thy days of sore distress"
			    "In the savage wilderness,"
			    "By the dread mysterious hour"
			    "Of the insulting tempter's power:"
			    "Turn, O turn a favouring eye,"
			    "Hear our solemn Litany."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -46 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
		  \line { "3  "
		    \column {	     
			    "By the sacred griefs that wept"
			    "O'er the grave where Lazarus slept;"
			    "By the boding tears that flowed"
			    "Over Salem's loved abode;"
			    "By the anguished sigh that told"
			    "Treachery lurked within thy fold:"
			    "From thy seat above the sky"
			    "Hear our solemn Litany."
			}}
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "4  "
		    \column {	     
			    "By thine hour of dire despair,"
			    "By thine agony of prayer,"
			    "By the Cross, the nail, the thorn,"
			    "Piercing spear and torturing scorn;"
			    "By the gloom that veiled the skies"
			    "O'er the dreadful Sacrifice:"
			    "Listen to our humble cry,"
			    "Hear our solemn Litany."
			}}
	    } %%% end column 3
     } %%% end master-line
                     %%% Centered last verse  
    		\hspace #1 
           	 \line { \hspace #24 "5. "
		   \column {	     
			   "By thy deep expiring groan,"
			   "By the sad sepulchral stone,"
			   "By the vault whose dark abode"
			   "Held in vain the rising God;"
			   "O! from earth to heaven restored,"
			   "Mighty reascended Lord,"
			   "Listen, listen to the cry"
			   "Of our solemn Litany."
			}}
     
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
			        >> 
  >>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi         
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}       
       
}  

} %%book bracket