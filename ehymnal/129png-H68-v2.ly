%%% 129png
%%% Hymn 68 Modern Tune Erhalt' Uns, Herr. The glory of these forty days
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title =  \markup { "68 " \large \smallCaps "(Modern Tune)" }

  meter = \markup { \small {\column {  \line { \sans {"ERHALT' UNS, HERR."} \hspace #1 \roman {"(L. M.)"}}
                                       \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 46.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \smallCaps "M. Luther, 1483-1546."}
			    \line { \italic "Adapted by" \smallCaps "J. S. Bach." }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01


%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/2
  \key f \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 f4( g4) | aes2 g4( f4) e2 f4( g4) | aes2 g f ^\fermata \bar "||" aes | \break
  bes2 bes c aes | bes bes c ^\fermata \bar "||" c | des c4( des4) ees4( des4) c2 | \break
  bes4( aes4) bes2 aes ^\fermata \bar "||" c | aes bes aes g | f e f1 ^\fermata \bar "||"
}

alto = \relative c' { 
  c2 | f4( ees4) des2 c c4( e!4) | f2 e c \bar "||" f |
  ees!4( f4) g2 aes c, | f4( aes4) g4( f4) e2 \bar "||" f | f4( g4) aes2 bes aes |
  g4( aes4) \straddle aes4( g4) ees2 \bar "||" g | f f4( e) f2 e | \straddle f4( des4) c2 c1 \bar "||" 
}

tenor = \relative c { \clef bass
  aes'4( bes4) | c2 bes4( aes4) g2 aes4( bes4) | c4( des) g,4( c4) aes2 \bar "||" c |
  bes2 ees ees f | f bes, g \bar "||" aes | bes ees ees ees |
  des4( c4) des4( bes4) c2 \bar "||" c | c bes c c4( bes4) | aes2 g4( aes8[ bes8]) aes1 \bar "||"   
}

bass = \relative c { \clef bass
  f,2 | f' bes, c4( bes4) aes4( g4) | f4( bes4) c2 f, _\fermata \bar "||" f' |
  g ees aes4( g4) f4( ees4) | des4( c4) des2 c _\fermata \bar "||" f | bes, aes g aes |
  ees' ees aes _\fermata \bar "||" e | f4( f,4) g2 aes4( bes4) c2 | des4( bes4) c2 f,1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Rouen Melody at Hymn 65." }

\markup { \small { \hspace #5 \smallCaps "Office Hymn." "  M." \italic "  Lent." "iii." \italic "till Passion Sunday."  \hspace #30  \center-align { \italic "Ascr. to St. Gregory the Great," 
                                                                                                                                                       \italic "6th cent.  Tr. M. F. B." } } }
		                                                                                                     
\markup { \hspace #44 \small "Clarum decus jejunii."} 

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE glory of these forty days"
			                                "  We celebrate with songs of praise;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "For Christ, by whom all things were made,"
					   "Himself has fasted and has prayed."
			  		}} 
			         } %%% finish verse 1	

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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Alone and fasting Moses saw"
				   "The loving God who gave the Law;"
				   "And to Elijah, fasting, came"
				   "The steeds and chariots of flame."
			}}
		        \hspace #1 
           		\line { "3  "
			  \column {	     
				  "So Daniel trained his mystic sight,"
				  "Delivered from the lions' might;"
				  "And John, the Bridegroom's friend, became"
				  "The herald of Messiah's name."
			}}
			\hspace #1 
           		\line {"4  "
			  \column {	     
				  "Then grant us, Lord, like them to be"
				  "Full oft in fast and prayer with thee;"
				  "Our spirits strengthen with thy grace,"
				  "And give us joy to see thy face."
			}}
    		        \hspace #1 
           		\line {"5. "
			  \column {	     
				  "Father and Son and Spirit blest,"
				  "To thee be every prayer addrest,"
				  "Who art in threefold Name adored,"
				  "From age to age, the only Lord.     Amen."
			}}
	  }
}% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo des1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }} 

}


} %%% book bracket