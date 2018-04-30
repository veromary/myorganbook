%%%% 223.png
%%%% Hymn 137 Ellacombe The Day of Resurrection!
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = "137"  
  
  poet = \markup { \small {  \line { \sans { \smallCaps "ELLACOMBE."} \hspace #1 \roman {"(7 6. 7 6. D.)"}} }}
  
  meter = \markup { \small { \italic {Brightly} \general-align #Y #DOWN \note #"4" #0.5 = 116.} }
  
  arranger = \markup { \small \italic "Mainz Gesangbuch, 1833." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
\partial 4 f4 | bes a8[g] f4 bes | d,( ees) f \breathmark \bar "||" f4 | g8[a] bes4 c c | d2. \bar "||" f,4 | bes a8[g] f4 bes \bar "||" \break
d,4( ees) f  \breathmark \bar "||" f | g8[a] bes4 bes a | bes2. \bar "||" bes8[c] d4 c d ees | c( a8[bes] ) c4 \breathmark \bar "||" bes8[c] \bar "||" \break
d4 c d ees | c2. \bar "||" f,4 | bes a8[g] f4 bes | d,( ees) f \breathmark \bar "||" f | g8[a] bes4 bes a | bes2.^\fermata \bar "||"
} 
   
alto = \relative c' {  
f4 | bes a8[g] f4 f  | bes,2 c4 \bar "||" d4 | ees f g f | f2. \bar "||" f4 | bes4 a8[g] f4 f | \break
bes,2 c4 \bar "||" d | ees d8[ees] f4 f | f2. \bar "||" d8[ees] | f4 f f g | f2 f4 \bar "||" bes8[f] | \break
f4 f f g | f2. \bar "||" f4 | bes a8[g] f4 f | bes,2 c4 \bar "||" d | ees d8[ees] f4 f | f2. \bar "||" \break
}

tenor = \relative c {\clef bass 
f4 | bes a8[g] f4 bes | bes2 a4 \bar "||" bes | bes bes bes a | bes2. \bar "||" f4 | bes4 a8[g] f4 bes | \break
bes2 a4 \bar "||" bes | bes bes c c | d2. \bar "||" bes4 | bes c bes bes | a( f8[g] ) a4 \bar "||" d8[c] | \break
bes4 c bes bes | a2. \bar "||" f4 | bes a8[g] f4 bes | bes2 a4 \bar "||" bes | bes bes c c | d2. \bar "||" \break
}

bass = \relative c {\clef bass 
f4 | bes a8[g] f4 d | g2 f4 \bar "||" bes, |  ees d ees f | bes,2. \bar "||" f'4 bes a8[g] f4 d | \break
g2 f4 \bar "||" bes, | ees g f f | bes,2. \bar "||" bes4 | bes'4 a bes ees, | f2 f4 \bar "||" g8[a] | \break
bes4 a bes ees, | f2. \bar "||" f4 | bes a8[g] f4 d | g2 f4 \bar "||" bes, | ees g f f | bes,2._\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 116 4)}} 
		
} %%% Score bracket



%%%Hymn Note Markup

\markup { \hspace #18 \italic "This hymn may also be sung to" \smallCaps "Ach Gott von Himmelreiche (" \hspace #-1 \italic "No." "179)." } 

%%% Lyrics titles

\markup { \small { \hspace #72 \center-align { 
		                 \line {\italic "St. John Damascene, c. 750." } 
				\line {\italic "Tr. J. M. Neale" "‡." }}}}
                                            

\markup { \small { \hspace #44 "Ἀναστάσεως ἡμέρα."  "[Anastaseôs hêmera.]" } }


%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Day of Resurrection!"
			                                "  Earth, tell it out abroad;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Passover of gladness,"
					   "    The Passover of God!"
					   "From death to life eternal,"
					   "    From earth unto the sky,"
					   "Our Christ hath brought us over"
					   "    With hymns of victory."
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

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
			\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Our hearts be pure from evil,"
				   "    That we may see aright"
				   "The Lord in rays eternal"
				   "    Of resurrection-light;"
				   "And, listening to his accents,"
				   "    May hear so calm and plain"
				   "His own ‘All hail,’ and, hearing,"
				   "    May raise the victor strain."
			}}
    		        \hspace #1 
           		\line {"3. "
			  \column {	     
				  "Now let the heavens be joyful,"
				  "    And earth her song begin,"
				  "The round world keep high triumph,"
				  "    And all that is therein;"
				  "Let all things seen and unseen"
				  "    Their notes of gladness blend,"
				  "For Christ the Lord hath risen,"
				  "    Our Joy that hath no end."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne bes'1 bes \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees1 d \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 f  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  ees1 bes \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 116 4) }} 

}
	
} %%% book bracket
