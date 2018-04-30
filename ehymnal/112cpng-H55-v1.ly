%%%112c.png
%%%Hymn 55 Wareham. Lo! golden light rekindles day
%%%Version 1

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT" } 
					       \hspace #1
						} }	
  title = \markup { "55 " \large \smallCaps "(Modern Tune)" }
			       
  arranger = \markup { \small { \smallCaps "W. Knapp, 1698(?)-1768."} }
  poet = \markup { \small { \sans  "WAREHAM." \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {Very slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%% Used to pull a note left. Used when a slurred note pair straddles a longer note when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%% Shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }	      
	      
%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #0.5 }

%% Macro to pull notes leftwards, needed to create the partly merged whole notes	
pull = { \once \override NoteColumn #'force-hshift = #-0.01 }	      

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

soprano = \relative c' {
  \partial 2 a'2 | a2( gis2) fis2 | e1 a2 | b2( a2) gis2 | a1 \bar "||" 
      b2 | cis2( b2) a2 | gis2( a2) b2 | a2( gis2) fis2 | e1  \breathmark \bar "||" \break
      
  e2 | fis2( e2) fis4( gis4) | a1 gis2 | a1 b2 | cis1 \bar "||" 
      b4( cis4) | d2( cis2) b2 | a2( gis2) a2 | b2( a2) gis2 | a1 \bar "||" 
}

alto = \relative c' {
  cis2 | \push cis1 d2 | \pull e1 cis2 | fis2( e2) e2 | e1 \bar "||" 
      e2 | \push e1 e4( dis4 ) | \push e1 e2 | \push e1 dis2 | \pull e1 \bar "||" 
      
  e2 | d2( e2) d2 | e1 e2 | cis1 fis2 | eis1 \bar "||" 
     fis4( e!4) | d2 ( e2) fis2 | fis2( eis2) fis2 | fis2( e2) e2 | e1 \bar "||" 
}

tenor = \relative c { \clef bass
  a'2 | e1 gis2 | a1 a2 | d2( cis2) b2 | cis1 \bar "||" 
      gis2 | a2( b2) cis4( a4) | b2( cis2) b2 | cis2( b2) b4( a4) | gis1 \bar "||" 
      
  a2 | \push a1 d2 | \push cis1 b2 | a2( gis2) fis2 | gis1 \bar "||" 
      fis4( ais4) | b2( ais2) b2 | \push cis1 cis2 | d2( cis2) b2 | cis1 \bar "||" 
}

bass = \relative c { \clef bass
  a2 | a1 b2 | cis1 fis2 | d2( e2) 
      << { e,2 } 
        %% small alternative note 
        \new Voice = alt { \voiceFour 
        \once \override NoteColumn #'force-hshift = #0.1
        \smallnote e'2} >> 
      | a,1 \bar "||" 
      e'2 | a2( gis2) fis2 | e2( cis2) gis2 | a2( b2) b2 | e1 \bar "||"
      
  cis2 | d2( cis2) b2 | a2( cis2) e2 | fis2( e2) d2 | cis1 \bar "||" 
      d4( cis4) | b2( cis2) d2 | fis2( cis2) fis2 | d2( e2) e2 | a,1 \bar "||" 
}

global = {
  \time 3/2
  \key a \major 
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

%%% Score block	
	
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup {
	\column {
	    \line { \small { \hspace #2 \smallCaps "Office Hymn." \hspace #56 \italic {"Prudentius, b. 348.   Tr. R. M. P."} } }  
	    \line { \small { \hspace #5 \italic "Thursday Morning." \hspace #18 "Lux ecce surgit aurea."} }
} }
 
%%% Lyrics, in 2 columns with separator line, centered last verse

\markup { \hspace #2   %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "O! golden light rekindles day:"
			                                 "  Let paling darkness steal away," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Which all too long o'erwhelmed our gaze"
					   "And led our steps by winding ways."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "We pray thee, rising Light serene,"
				   "E'en as thyself our hearts make clean;"
				   "Let no deceit our lips defile,"
				   "Nor let our souls be vexed by guile."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "O keep us, as the hours proceed,"
				  "From lying word and evil deed;"
				  "Our roving eyes from sin set free,"
				  "Our body from impurity."
			}}
		        \hspace #1 
           		\line {"4  "
			  \column {	     
				  "For thou dost from above survey"
				  "The converse of each fleeting day;"
				  "Thou dost foresee from morning light"
				  "Our every deed, until the night."
			}}
	    } %%% end column 3
     } %%% end master-line
                %%% Centered last verse  
    		\hspace #1 
           		\line { \hspace #32 "5. "
			  \column {	     
				  "All laud to God the Father be,"
				  "All praise, eternal Son, to thee;"
				  "All glory, as is ever meet,"
				  "To God the holy Paraclete.     Amen."
     			}}
}
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne a'1 a1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo fis1 e1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree d'1 cis1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}   
       
}  

} %%book bracket