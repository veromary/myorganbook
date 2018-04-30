%%%095.png
%%%Hymn 42 Was Lebet O Worship the Lord in the beauty of holiness
%%%Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE EPIPHANY"
		\hspace #0.1 }}	
  title = "42"
  meter = \markup {  \small { \column {  \line { \sans {"WAS LEBET, WAS SCHWEBET."} \hspace #1 \roman {"(13 10. 13 10.)"}}
                                        \line { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "From the 'Rheinhardt" } 
  			    \line { \italic  "MS.,' Üttingen, 1754."}}}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }

%% Used to pull a note left. Used when a slurred note pair straddles a longer note when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }	      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions
	      
soprano = \relative c' {
  \partial 2 \smallnote a'2 | d,2 d2 e2 | fis2 fis2 a2 | g2. fis4 e2 | fis2. fis4 fis2 \breathmark \bar "||" e2 d2 e2 | \break
  fis2 gis2 a2 | a2 b2 gis2 | a1^\fermata \bar "||" \smallnote cis2 | d2 d2 c2 | b2 b2 a2 | \break
  g2 a2 fis2 | e2. e4 e2 \breathmark \bar "||" a2 a2 fis2 | b2 cis2 d2 | d2 e2 cis2 | d1 \bar "||"
}
  
alto = \relative c' {
  \partial 2 \smallnote e2 | a,2 b2 cis2 | d2 d2 e2 | d2. d4 cis2 | d2. d4 d2 \bar "||" b4( cis4) d2 cis2 |
  d2 b2 a2 | fis'2 fis2 e2 | e1 \bar "||" \smallnote e2 | d2 fis4( g4) a2 | a2 g2 fis2 |
  e2 e2 d2 | cis2. cis4 cis2 \bar "||" d2 e2 d2 | d2 g2 fis2 | g2 g2 e2 | fis1 \bar "||"
}

tenor = \relative c { \clef bass
  \partial 2 \smallnote a'2 | fis2 g2 g2 | a2 a2 a2 | b2. a4 a2 | a2. a4 a2 \bar "||" g2 a2 g2 |
  a2 d2 cis2 | d2 d2 b2 | cis1 \bar "||" \smallnote a2 | a2 a2 d2 | d2 d2 d2 |
  b2 a2 a2 | a2. a4 a2 | a2 a2 a2 | g2 e'2 d2 | b2 b2 a2 | a1 \bar "||"
}

bass = \relative c { \clef bass
  \partial 2 \smallnote cis2 | d2 \straddle g4( fis4) e2 | d2 d2 cis2 | b2. d4 a2 | d2. d4 d2 \bar "||" g2 fis2 e2 |
  d2 e2 fis2 | d2 b2 e2 | a1_\fermata \bar "||" \smallnote a2 | fis2 d4( e4) fis2 | g2 g2 d2 |
  e2 cis2 d2 | a2. a'4 g2 \bar "||" fis2 cis2 d2 | g2 a2 b2 | g2 e2 a2 | d,1 \bar "||"
}

global = {
  \time 3/2 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
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
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 2)
            }
       }
	
} %%score bracket

\markup { \hspace #26 \italic "Notes in small type are for the first and last verses only." }

\markup {  \small { \hspace #16 \italic { "Suitable till Septuagesima."} \hspace #25 \italic {"J. S. B. Monsell, 1811-75."}  }  }
	      
\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " WORSHIP the Lord in the beauty of holiness!"  "    Bow down before him, his glory proclaim;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "With gold of obedience, and incense of lowliness,"
					   "    Kneel and adore him, the Lord is his name!"
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Low at his feet lay thy burden of carefulness,"
				   "    High on his heart he will bear it for thee,"
				   "Comfort thy sorrows, and answer thy prayerfulness,"
				   "    Guiding thy steps as may best for thee be."
			}}		
		}  
}	  
	
%%second page
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

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
           	  \hspace #1  %% extra blank line -- helps those who print on Letter size paper.
		  \line { "3  "
		    \column {	     
			    "Fear not to enter his courts in the slenderness"
			    "    Of the poor wealth thou wouldst reckon as thine:"
			    "Truth in its beauty, and love in its tenderness,"
			    "    These are the offerings to lay on his shrine."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "These, though we bring them in trembling and fearfulness,"
			    "    He will accept for the name that is dear;"
			    "Mornings of joy give for evenings of tearfulness,"
			    "    Trust for our trembling and hope for our fear."
			}}  
		\hspace #1 % adds vertical spacing between verses
           	\line { "5. "
		   \column {	     
			   "O worship the Lord in the beauty of holiness!"
			   "    Bow down before him, his glory proclaim;"
			   "With gold of obedience, and incense of lowliness,"
			   "    Kneel and adore him, the Lord is his name!"
     			}}
	  }
}% lyric markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%book bracket