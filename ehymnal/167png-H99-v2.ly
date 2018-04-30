%%%% 167.png
%%%% Hymn 99. Caswall. Glory be to Jesus
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
	\hspace #0.1 }}	
	
  title = "99"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "CASWALL (WEM IN LEIDENSTAGEN)."} \hspace #1 \roman {"(6 5. 6 5.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  
  arranger = \markup { \small \smallCaps "F. Filitz, 1804-76." }
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves as found in the last measure (soprano and alto) of this piece. 
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-0.8 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.3 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #-0.8 \musicglyph #"noteheads.s0" \hspace #-1.3 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.05		  

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.2
              \once \override Stem #'X-offset = #-3.2 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  a'2 a g g | f1 e | f2 f g g | a\breve \bar "||" \break
  c2 c bes bes | a1 g | a2 a g g | \leftbreve f\breve \bar "||"
} 
   
alto = \relative c' {  
  c2 f f e | \straddle e( d) cis1 | d2 f f e | f\breve \bar "||"
  e2 f d g | \straddle g( f) e1 | f2 f f e | \merge \rightbreve f\breve \bar "||"
}

tenor = \relative c {\clef bass  
  f2 a c c | a1 a | a2 a c c | c\breve \bar "||"
  c2 a bes c | c1 c1 | c2 c d c4( bes) | a\breve \bar "||"
}

bass = \relative c {\clef bass  
  f2 f c c | d1 a | d2 d c c | f\breve \bar "||"
  a2 f g e | f1 c | f2 a, bes c | f\breve \bar "||"
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
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Lyric Attribution 

\markup { \small { \hspace #74 \italic "18th cent.  Tr. E. Caswall." } }

\markup { \small { \hspace #44 "Viva! Viva! Gesù." }}

%%% Main lyric block

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "G" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LORY be to Jesus,"
			                                 "  Who, in bitter pains," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Poured for me the life-blood"
					   "    From his sacred veins."
			  		}} 
			         } %%% finish verse 1	
					  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Grace and life eternal"
				   "    In that Blood I find;"
				   "Blest be his compassion,"
				   "    Infinitely kind."
			}}   
			 
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Blest through endless ages"
				   "    Be the precious stream,"
				   "Which from endless torment"
				   "    Doth the world redeem."
			}}  
			\hspace #1 
           		\line { "4  "
			   \column {	     
				   "Abel's blood for vengeance"
				   "    Pleaded to the skies;"
				   "But the Blood of Jesus"
				   "    For our pardon cries."
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

\markup { \hspace #36   %%add space as necc. to center the column
          \column { 
    		        \hspace #1 
           		\line { "5  "
			   \column {	     
				   "Oft as it is sprinkled"
				   "    On our guilty hearts,"
				   "Satan in confusion"
				   "    Terror-struck departs."
			}} 
			\hspace #1 
           		\line { "6  "
			   \column {	     
				   "Oft as earth exulting"
				   "    Wafts its praise on high,"
				   "Hell with terror trembles"
				   "    Heaven is filled with joy."
			}}
		        \hspace #1 
           		\line { \hspace #-10.2  \italic "Unison."  "  7. "			  \column {	     
				  "Lift ye then your voices;"
				  "    Swell the mighty flood;"
				  "Louder still and louder"
				  "    Praise the precious Blood."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }} 

}


} %%% book bracket