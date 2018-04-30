%%%% 279.png
%%%% Hymn 173.  All things are thine; no gift have we.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - DEDICATION OR RESTORATION OF A CHURCH"
	\hspace #0.1 }}	
	
	title = "173"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "HERR JESU CHRIST."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {Very slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 46.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody from" "‘" \hspace #-1 \italic "Pensum Sacrum" \hspace #-1 "’"}
	  					 \line { "(" \hspace #-1 \italic "Görlitz, 1648" \hspace #-1 ")."  \italic "  Adapted by" \smallCaps "J. S. Bach."  }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
\partial 2 f2 | a c a g | a b c ^\fermata \bar "||" d | c4( bes) a2 g f4( g) | a2 g f ^\fermata \bar "||" \break
g2 | a a g c | c b c ^\fermata \bar "||" a | bes a g f | f e f ^\fermata \bar "||"
} 
   
alto = \relative c' {  
c2 | f g \straddle g4( f) \straddle f( e) | f2 f e \bar "||" g | g2. f4 e2 f | f e f \bar "||"
e2 | f f f e | d4( f) g( f) e2 \bar "||" c | d c4( d) e2. d4 | c2 c c \bar "||"
}

tenor = \relative c {\clef bass 
a'2 | c c c c | c f, g \bar "||" bes | c c c c4( d) | c2. bes4 a2 \bar "||"
c2 | c c c g | a g g \bar "||" f | f4( g) a2 c4( bes) a2 | a g a \bar "||"
}

bass = \relative c {\clef bass 
f,2 | f' e f c | f4( e) d2 c _\fermata \bar "||" g'4( f) | e2 f c4( bes) a4( bes) | c2 c f _\fermata \bar "||"
c2 | f a, c4( d) e( c)  | f( d) g2 c, _\fermata \bar "||" \straddle f4( e) | d( e) f2 c d | a4( bes) c2 f, _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }}      
  
	
} %%% Score bracket



	

%%% Lyric attributions and titles

\markup { "                 "  }  %%% force some blank space between score and lyrics

\markup { \small { \hspace #74 \italic "J. G. Whittier, 1807-92." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-2.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " LL things are thine; no gift have we,"
			                                 "    Lord of all gifts, to offer thee:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And hence with grateful hearts to-day"
					   "Thine own before thy feet we lay."
					   "         " %%% adds blank spacing between verses
			  		}}
		      } 
		       \line { \lower #0.4 { "2  "
			   \column {
				   "Thy will was in the builders' thought;"
				   "Thy hand unseen amidst us wrought;"
				   "Through mortal motive, scheme and plan,"
				   "Thy wise eternal purpose ran."
				    "         " %%% adds blank spacing between verses
		       }}}
			\line { "3  "
				\column {
					"In weakness and in want we call"
					"On thee for whom the heavens are small;"
					"Thy glory is thy children's good,"
					"Thy joy thy tender Fatherhood."
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-9.8 \italic "Unison. " "4. "
				\column {
					"O Father, deign these walls to bless;"
					"Fill with thy love their emptiness;"
					"And let their door a gateway be"
					"To lead us from ourselves to thee."
     			}}
	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f  \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 48 2) }}

}

%%% alternative hymns also suitable

\markup {\column {
	\line { \hspace #15 \italic "For a Dedication Festival," "or" \italic "for a Special Service of Dedication, the following"}
	\line { \hspace #45 \italic "are also suitable:" } 
	\line { "       " } %%% blank line
        \line { \hspace #36 \small { \column {  
		"450  O God, our help in ages past."
		"472  Pray that Jerusalem may have."
		"489  The Church's one foundation."
		"508  We love the place, O God."
		"533  Now thank we all our God."
		"534  Praise the Lord of heaven; praise him in the height."
		"535  Praise the Lord! ye heavens, adore him."
		"536  Praise to the Lord, the Almighty."
		"537  Rejoice to-day with one accord."
		"544  O Faith of England, taught of old."	
	}}}
}} 


} %%% book bracket
