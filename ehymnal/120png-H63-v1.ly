%%%120png
%%%Hymn 63 Tantum Ergo. Alleluya, song of sweetness
%%%Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE WEEK BEFORE SEPTUAGESIMA"
		                         \hspace #0.1 }}	
  title = "63"
  
  meter = \markup { \small {\column {  \line { \sans {"TANTUM ERGO."} \hspace #1 \roman {"(8 7. 8 7. 8 7.)"}}
                                       \line { \italic {Moderately slow, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Melody from" \smallCaps "S. Webbe's" }
			    \line { \italic "'Motetts or Antiphons,' 1792."}
	                } }			    
                      }
  tagline =""
}


global = {
  \time 4/2 
  \key a \major 
  \set Staff.midiInstrument = "church organ" 
}

soprano = \relative c' { 
  a'2 b2 cis2 d2 | e2 d2 cis2 b2 \bar "||" a2 a2 a2 d2 | cis2 b2 a1 \bar "||" \break
  fis2 fis2 e2 e2 | a2 a2 a2 gis2 \bar "||" b2 e2 dis4( cis4) b4( a4) | gis2 fis2 e1 \bar "||" \break
  gis2 gis2 a2 e2 | fis2 gis2 a2 b2 \bar "||" cis4( b4) a4( gis4) fis2 d'2 | cis2 b2 a1 \bar "||"
}

alto = \relative c' {
  e2 e2 e2 a2 | gis2 fis4( e4) e2 e2 \bar "||" cis2 e2 fis2 fis2 | e2. d4 cis1 \bar "||"
  d2 d2 cis2 cis2 | cis2 e2 e2 e2 \bar "||" e2 e2 e2 fis2 | e2 dis2 \once \override NoteColumn #'force-hshift = #-0.01 e1 \bar "||"
  e2 e2 e2 cis2 | fis2 eis2 fis2 gis2 \bar "||"| a2 e2 d2 fis2 | e2. d4 cis1 \bar "||" 
}

tenor = \relative c { \clef bass
  cis'2 b2 a2 a2 | b2 a4( b4) a2 gis2 \bar "||" a2 a2 a2 a2 | a2 gis2 a1 \bar "||"
  a2 a2 a4( b4) cis4( d4) | e2 cis2 cis2 b2 \bar "||" gis2 b2 a2 cis2 | b2. a4 gis1 \bar "||"
  b2 b2 a2 a2 | a2 cis2 cis2 e2 \bar "||" e2 a,2 a2 a2 | a2 gis2 a1 \bar "||" 
}

bass = \relative c {\clef bass
  a'2 gis2 a2 fis2 | e2 fis4( gis4) a2 e2 \bar "||" fis2 cis2 d2 b2 | e2 e2 a,1 \bar "||"
  d2 d2 a'2 a2 | a,4( b4) cis4( d4) e2 e2 \bar "||" e2 gis2 a2 fis2 | b,2 b2 e1 \bar "||"
  e2. d4 cis2 a2 | d2 cis2 fis2 e2 \bar "||" a2 cis,2 d2 b2 | cis4( d4) e2 a,1 \bar "||" 
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
       tempoWholesPerMinute = #(ly:make-moment 66 2)
            }
       }
	
} %%% score bracket


%%% Beginning of lyrics block

\markup { \hspace #21 \smallCaps "Note" \hspace #-1.2 ".—" \italic "A lower setting of this tune will be found at Hymn 33." }

\markup {
	\column {
		\line { \small { \hspace #60 \italic "Before 11th cent.  Tr. J. M. Neale."  } }  
	        \line { \small { \hspace #42 "Alleluya, dulce carmen."} }
} }


\markup { \hspace #32 %% add space here as necc. to center the entire block of lyrics
          \column { %% whole block of lyrics goes into one super column with sub-columns as necessary
	              \column { %% column for verse 1, a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LLELUYA, song of sweetness,"
			                                 "  Voice of joy, eternal lay;"
			                }}          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Alleluya is the anthem"
					   "    Of the choirs in heavenly day,"
					   "Which the Angels sing, abiding"
					   "    In the house of God alway."
			  		}}
			           } %% finish verse 1	
		} %% end of super column  
} %% end of markup	  
			
%%% second page
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

%%% Continuation of lyrics

\markup { \hspace #32  %% add space here as necc. to center the entire block of lyrics
          \column {  %% whole block of lyrics goes into one super column with sub-columns as necessary
		  \line { "2  "
		    \column {	     
			    "Alleluya, thou resoundest,"
			    "    Salem, mother, ever blest;"
			    "Alleluyas without ending,"
			    "    Fit yon place of gladsome rest;"
			    "Exiles we, by Babel's waters,"
			    "    Sit in bondage and distrest."
			}}
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "3  "
		    \column {	     
			    "Alleluya we deserve not"
			    "    Here to chant for evermore:"
			    "Alleluya our transgressions"
			    "    Make us for awhile give o'er;"
			    "For the holy time is coming,"
			    "    Bidding us our sins deplore."
			}}
		 \hspace #1  % adds vertical spacing between verses  		    
           	 \line { "4. "
		   \column {	     
			   "Trinity of endless glory,"
			   "    Hear thy people as they cry;"
			   "Grant us all to keep thy Easter"
			   "    In our home beyond the sky;"
			   "There to thee our Alleluya"
			   "    Singing everlastingly.     Amen."
			}}
	  } %% end of super column
} %% lyric markup bracket


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne a'1 a1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 cis1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree fis1 e1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d1 a1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}       
       
}  

} %%book bracket