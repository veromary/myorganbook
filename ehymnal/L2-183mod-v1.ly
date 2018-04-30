%%%% 297.png
%%%% Hymn 183 Modern Tune. O Glorious King of Martyr hosts.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - MARTYRS"
	\hspace #0.1 }}	
	
  title = \markup { "183 " \large \smallCaps "(Modern Tune)" }  
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "REX GLORIOSE."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
  	}}	
	
 arranger = \markup { \small  { \center-align { \line {\italic "Proper melody from" }
	  					 \line { \italic "Andernach Gesangbuch, 1608."  }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 d1 | fis2 g a a | b cis d1 \breathmark \bar "||" \partmeasure a1 | \break
  d2. cis4 b2 a2 | b g a1 \breathmark \bar "||" \partmeasure a1 | b2 g a fis | \break
  g2 e d1 \breathmark \bar "||" \partmeasure d'1 | cis2 b a fis | g( fis) e1 | d1 ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  \merge d1 | d2 d e a | g fis4( e) fis1 \bar "||" fis1 | 
  a2 fis g d | d d4( e) cis1 \bar "||" d1 | fis2 e e d | 
  d2 b4( cis) \merge d1 \bar "||" fis1 | a2 g4( fis) e2 d | e( d) \straddle d( cis) | \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  fis1 | a2 d cis d | d a a1 \bar "||" d1 | 
  d2 b cis d | g, g e1 \bar "||" \topstraddle d'2.( cis4) | b2 b a d4( cis) |
  b2 g fis1 \bar "||" d'1 | a2 d cis b | b( a) b( a) | fis1 \bar "||"
}

bass = \relative c {\clef bass 
  d1 | d4( cis) b2 a4( a') g( fis) | e2 a d,1 \bar "||" d1 |
  fis2 d e fis | g b, a1 \bar "||" fis' | d2 e cis d |
  e2 g,4( a) b1 \bar "||" b'1 | fis2 g a b | e,( fis) g( a) | d,1 _\fermata \bar "||"
}

	

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  
	
} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #24 \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn is sung during Christmastide to No." "18." }

\markup { "            " } %%% force some blank space before start of lyrics

\markup { "            " } %%% force some blank space before start of lyrics


%%% Lyric titles and attributions

\markup { \hspace #9 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of many" \hspace #38 \italic "c. 6th cent."  }    
	\line { \hspace #4  "Martyrs. " "M." \italic "and" "E." \hspace #38 \italic "Tr. R. F. Littledale and others." } 
	\line { \hspace #33 "Rex gloriose Martyrum." }
}}}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-2.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  GLORIOUS King of Martyr hosts,"
			                                 "  Thou Crown that each Confessor boasts," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who leadest to celestial day"
					   "The Saints who cast earth's joys away:"
					   "         " %%% adds blank spacing between verses
			  		}}
		      } 
			   \line { "2  "
			   \column {
				   "Thine ear in mercy, Saviour, lend,"
				   "While unto thee our prayers ascend;"
				   "And as we count their triumphs won,"
				   "Forgive the sins that we have done."
				    "         " %%% adds blank spacing between verses
		       }}
	  } %%% end super column
}

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
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line { "3  "
				\column {
					"Martyrs in thee their triumphs gain,"
					"Confessors grace from thee obtain;"
					"We sinners humbly seek to thee,"
					"From sin's offence to set us free."
					"         " %%% adds blank spacing between verses
			}}
			\line { "4. "
				\column {
					"All laud to God the Father be,"
					"All praise, eternal Son, to thee;"
					"All glory, as is ever meet,"
					"To God the holy Paraclete.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}

}


%%% Second Hymn note markup

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to the French Melody at Hymn" "125." }


} %%% book bracket

