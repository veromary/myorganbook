%%%% 302.png
%%%% Hymn 187.  Weimar.  Let our choir new anthems raise.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - MARTYRS"
	\hspace #0.1 }}	
	
	title = "187"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "WEIMAR."} \hspace #1 \roman {"(7 6. 7 6. D.)"}}
		                        \line { \italic {Very slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 48.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody by M. Vulpius, 1560-1616." }
	  					 \line { \italic "Adapted by" \smallCaps "J. S. Bach."  }
  	}}}
	 
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Macros

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% same as above, but pulls note leftwards a smaller amount

smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.0
              \once \override Stem #'X-offset = #-2.0 }
	      
	      
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #1.6

%%% push a note slightly to the right	      
	      
pushb = \once \override NoteColumn #'force-hshift = #0.6


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Macro Definitions


%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 g f g | a bes c1 ^\fermata | d2 c bes a4( g) | \break
  g1 f ^\fermata \bar "||" a2 c bes a | g f e1 ^\fermata | \break
  f2 g a4( bes) c2 | bes1 a1 ^\fermata \bar "||" a4( g) a( bes) c2 bes | \break
  a2 g bes1 ^\fermata | g2 g a4( b) c2 | c2( b) c1 ^\fermata \bar "||" c2 a d2. c4 | \break
  bes2 a g1 ^\fermata | a2 c bes a | \push g1  f1 ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  f2 e f e | f f ees1 | d2 e! f4( g) f2 |
  \straddle f2( e) c1 \bar "||" f2 g f f | e d cis1 |
  d2 g f a | \straddle a( g4 f) e1 \bar "||" f2 d c f4( g) |
  f2 e f1 | d2 c f g | \pushb d1 e1 \bar "||" c2 c d4( e!) f2 | 
  f4( e) f2 e1 | f2 g f f | f( e) \merge f1 \bar "||"
}

tenor = \relative c {\clef bass 
  c'2 c c c | c f, f1 | bes2 a a4( g) a( bes) | 
  \topstraddle c2( bes) a1 \bar "||" c2 c d c | bes a a1 | 
  a2 c c d | \topstraddle d4( f e d) cis1 \bar "||" a2 f' e d |
  c2 c c1 | b2 c c4( d) e2 | a,( g) g1 \bar "||" g2 f f4( g!4) a2 |
  bes2 c c1 | c2 c d d | d( c4 bes!) a1 \bar "||"
}

bass = \relative c {\clef bass 
  f2 c a c | f d a1 _\fermata | bes2 c d4( e) f2 |
  c1 f1 _\fermata \bar "||" f2 e d4( e) f2 | cis2 d a1 _\fermata |
  d2 e f fis | g1 a _\fermata \bar "||" d,4( e) f( g) a2 d,4( e) | 
  f2 c f1 _\fermata | f2 e d c | f( g) c,1 _\fermata \bar "||" ees2 f bes, a | 
  g f c'1 _\fermata | f2 e d c | b( c) f1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 48 2) }}      
  
	
} %%% Score bracket


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


%%% Lyric titles and attributions

\markup {  \column {
	\line { \small { \hspace #68 \italic "St. Joseph the hymnographer, d. 883" } }
        \line { \small { \hspace #74 \italic "Tr. J. M. Neale." } }
	\line { \small { \hspace #42 "Τῶν ἱερῶν ἀθλοφόρων."  "[Tôn hierôn athlophorôn.]" } } 
}}	

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ET our choir new anthems raise,"
			                                 "  Wake the morn with gladness;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "God himself to joy and praise"
					  "    Turns the Martyrs' sadness:"
					  "This the day that won their crown,"
					  "    Opened heaven's bright portal,"
					  "As they laid the mortal down"
					  "    And put on the immortal."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				  "Never flinched they from the flame,"
				  "    From the torture never;"
				  "Vain the foeman's sharpest aim,"
				  "    Satan's best endeavour:"
				  "For by faith they saw the land"
				  "    Decked in all its glory,"
				  "Where triumphant now they stand"
				  "    With the victor's story."
				   "          " %%% adds vertical spacing between verses
			}}
                           \line { \hspace #-9.7 \italic "Unison. " "3. "
			   \column {	     
				   "Up and follow, Christian men!"
				   "    Press through toil and sorrow;"
				   "Spurn the night of fear, and then,"
				   "    O, the glorious morrow!"
				   "Who will venture on the strife?"
				   "    Who will first begin it?"
				   "Who will grasp the land of life?"
				   "    Warriors, up and win it!"
			}} 
	  } %%% end supercolumn
} %%% end markup	  
       

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 48 2) }}  %%Amen midi       
       
}  


} %%% book bracket

