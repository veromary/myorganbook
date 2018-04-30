%%% 377png
%%% Hymn 240 Alfreton He sat to watch o'er customs paid
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "ST. MATTHEW"
		\hspace #0.1 }}	
  title = "240"
  poet = \markup {  \small { \sans {"ALFRETON."}   \hspace #1 \roman {"(L. M.)"}} }
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  arranger =  \markup { \small { "‘" \hspace #-1 \italic "Supplement to the" \smallCaps "New Version," \hspace #-1.2 "’"  "1708." }}
  tagline =""
}

%%% SATB Voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 g'1 | b2 c a b | g a fis^\fermata \bar "||" a | b cis d a | b a4( g4) fis2^\fermata \bar "||" \break
  a2 | d b c b | a g fis^\fermata \bar "||" a | b c d g, | g2. fis4 g1^\fermata \bar "||"
}

alto = \relative c' { 
  d1 | g2 g d fis | e cis d \bar "||" fis g e d d | d cis d \bar "||"
  d | d e e g4( fis) | e2 e d \bar "||" d | g fis4( e4) d2 e | d d d1 \bar "||" 
}

tenor = \relative c { \clef bass
  b'1 | d2 c d d | b a a \bar "||" d | d a a fis | e a a \bar "||"
  fis | fis gis a d | c c a \bar "||" d | d c g c4( b4) | a2 a b1 \bar "||"
}

bass = \relative c { \clef bass
  g1 | g'2 e fis d | e a, d _\fermata \bar "||" d g g fis d | g, a d _\fermata \bar "||"
  d | b e a, b | c a d _\fermata \bar "||" fis, g a b c | d d g,1 _\fermata \bar "||" 
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
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket


%%% Lyric attributions and titles

\markup { \small { \hspace #6 "(" \hspace #-1 \italic "O. H.," "174-6.)"  \hspace #62 \italic "W. Bright, 1824-1901." }}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E sat to watch o'er customs paid,"
			  				"  A man of scorned and hardening trade;"} }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Alike the symbol and the tool"
					   "Of foreign masters' hated rule."
					   "      " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "But grace within his breast had stirred;"
				   "There needed but the timely word;"
				   "It came, true Lord of souls, from thee,"
				   "That royal summons, ‘Follow me.’"
				   "      " %%% adds vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   " Enough, when thou wert passing by,"
				   "To hear thy voice, to meet thine eye:"
				   "He rose, responsive to the call,"
				   "And left his task, his gains, his all."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "O wise exchange! with these to part,"
				   "And lay up treasure in thy heart;"
				   "With twofold crown of light to shine"
				   "Amid thy servants' foremost line."
				   "      " %%% adds vertical spacing between verses
			}}
			\line {"5  "
			    \column {	     
				    "Come, Saviour, as in days of old;"
				    "Pass where the world has strongest hold,"
				    "And faithless care and selfish greed"
				    "Are thorns that choke the holy seed."
				    "      " %%% adds vertical spacing between verses
			}}
			\line { "6. "
			     \column {	     
				     "Who keep thy gifts, O bid them claim"
				     "The steward's, not the owner's name;"
				     "Who yield all up for thy dear sake,"
				     "Let them of Matthew's wealth partake."
     			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
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

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} 

}


} %%% book bracket


%%%Verse 2 3rd line after "souls": image showed a period there. Replaced with comma.