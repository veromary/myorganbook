%%%072-073.png
%%%Hymn 25 Cranham "In the bleak mid-winter"
%%%Version 2 Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "25"
  poet = \markup { \small {  \line { \sans {"CRANHAM."} \hspace #1 \roman {"(Irreg.)"}} }}
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.} }
  arranger =  \markup { \small \smallCaps "G. Holst."}
  tagline =""
}

%% Macro for generating two augmentation dots for a notehead. When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%%This macro generates the two dots by replacing the normal dot glyph with a glyph comprising a column of 2 dots one above the other.

augdots = { 
  \once \override Voice.Dots #'stencil = #ly:text-interface::print 
  \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                 \line { \translate #(cons -0.2 0) 
                                                 \override #'(baseline-skip . 1 )  \column { 
                                                                                        \musicglyph #"dots.dot" 
                                                                                        \musicglyph #"dots.dot" } } }
 }

%%end of macro definitions


global =  {
  \time 4/4 
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  a'4. bes8 c4 a4 | g2 f4 bes4\rest | g4. a8 g4 d4 | g2. bes4\rest \bar "||" \break
  a4. bes8 c4 a4  | g2 f4 bes4\rest | g4 a4 g4. f8 | f2. bes4\rest \bar "||" \break
  bes4. a8 bes4 c4 | d4 d4 a4 bes4\rest | c4( a4) g4( f4)  | e2. bes'4\rest \bar "||" \break
  a4. bes8 c4 a4   | g2 f4    bes4\rest | g4( a4) g4.( f8) | f1 \bar "||"
}

alto = \relative c' {
 f4. f8 f4 c4 | d2 d4 s4 | d4. d8 d4 c4 | bes2. s4 \bar "||"
 c4. f8 f4 c4 | d2 d4 s4 | f4 f4 e4. f8 | f2. s4 \bar "||"
 f4. f8 f4 ees4 | d4 d4 f4 s4 | f4( e4) d2  | c2. s4 \bar "||"
 c4. f8 f4 c4   | d2 d4 s4    | f2 e4.( f8) | \once \override NoteColumn #'force-hshift = #0.02 f1 \bar "||"
}

tenor = \relative c { \clef bass
  c'4. c8 c4 f,4 | a2 a4 s4 | g4. d8 d4 f4   | f2( e4) s4 \bar "||"
  f4. c'8 c4 f,4 | a2 a4 s4 | d4 d4 bes4. a8 | a2. s4 \bar "||"
  bes4. c8 bes4 a4 | bes4 bes4 a4 s4 | f4( c'4) bes4( a4) | g2. s4 \bar "||"
  f4. c'8 c4 f,4   | a2 a4 s4        | d2 bes4.( a8)      | a1 \bar "||"
}

bass = \relative c { \clef bass
 f4. g8 a4 f4 | d2 d4 d4\rest | bes4. c8 bes4 a4 | g2( c4) d4\rest \bar "||"
 f4. g8 a4 f4  | d2 d4 d4\rest | bes4 bes4 c4. f8 | f2. d4\rest \bar "||" 
 d4. f8 d4 c4  | bes4 bes4 d4 d4\rest  | a2 bes2       | c2. d4\rest \bar "||"
 \augdots f4. g8 a4 f4 | d2 d4 d4\rest | bes2 c4.( f8) | f1 \bar "||"
}


caption = ^\markup { \column { \hspace #0.1 
                            \line { \hspace #0.1 \raise #1 \fontsize #2 "Verses 2 and 3 run:" } } }

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  top-margin = 1\mm
  bottom-margin = 1\mm
  print-page-number = ##f
  between-system-padding = 2\mm
  between-system-space = #0.1
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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		\context { \Staff \override Rest #'style = #'classical }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            }
       }
	
} %%score bracket

\markup { \hspace #56 \small { \center-align { \line { "[" \italic "The metre of this hymn is peculiar.  The music as printed is that of the first verse, and" }
\line { \italic "it can easily be adapted to the others." "]" } }} }        

%% Verse 2 and 3 first part Score block

\score{
  \new ChoirStaff
    <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                     << 
	\context Voice = "sopranos"  { \relative c' { \global \voiceOne \partial 4 a'4 | a4. bes8 c4 a4 | \once \override NoteColumn #'force-hshift = #'3 
		                                     g2\caption f4 bes4\rest    | g4. a8 g4 d4 | g2. c4\rest }}
	\context Voice = "altos"    { \relative c' { \global  \voiceTwo \partial 4 s4  | s1             | 
	                                                                         g'4 g4 f4 s4 | s1  | \augdots g2. g4 }}
	                      >>
			      \new Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 
			                                         Our God, heaven can -- not hold him, "Nor   .    ." _ earth sus -- tain; }
		              \new Lyrics \lyricsto "sopranos" { \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0) 
			                                         \override LyricText #'font-size = #-1 
			                                         E -- nough for him, \set associatedVoice = "altos" whom 
			                                         Che -- ru -- \set associatedVoice = "sopranos" bim 
			                                         Wor -- ship night and \set associatedVoice = "altos" day, A }
   >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	ragged-right = ##f
	indent = 0\cm
	\context { \Staff \remove Time_signature_engraver }
	\context { \Staff \override Rest #'style = #'classical }
       }      
}  

%% Verse 2 and 3 second part Score block
\score{
  \new ChoirStaff
    <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                     << 
			     \context Voice = "sopranos"  { \relative c' { \global \voiceOne a'4. bes8 c4 a4 | 
			                                  g4. g8 \once \override NoteColumn #'force-hshift = #'3  f2  |
			                                  g4 a4 g4. f8 | 
			                                  f2. c'4\rest \bar "||" bes4. a8 bes4 c4 }}
		
			     \context Voice = "altos"    { \relative c' { \global \autoBeamOff \voiceTwo \hideNotes a'4. bes8 c4 a4 | 
			                                 \unHideNotes \once \override NoteColumn #'force-hshift = #'3  g2 f4 f4  |
			                                  \hideNotes g4 a4 g4. f8 | 
			                                  \unHideNotes f2. f4  \bar "||" \hideNotes bes4. a8 bes4 f8 f8 }}
	                      >>
			      \new Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 
			                                         Heaven and earth shall flee a -- way When he comes to reign: In the bleak mid- }
		              \new Lyrics \lyricsto "altos" { \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0) 
			                                         \override LyricText #'font-size = #-1 
			                                        breast -- _ ful of
								milk, And  a 
			                                        man -- ger -- ful of hay; 
								E -- nough for 
								him whom \override LyricText #'font-shape = #'italic "   &c." 
			                                       }								 
   >>			 
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	ragged-right = ##f
	indent = 0\cm
	\context { \Staff \remove Time_signature_engraver }
	\context { \Staff \override Rest #'style = #'classical }
       }      
}  


%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}


\markup { \hspace #0   %%add space as necc. to center the column
          \fill-line { 
	       \column { 
	  	     \line { \small \italic {\hspace #20 "Christina G. Rossetti, 1830-94."}}
	             \hspace #1  % adds vertical spacing between verses. More such lines more space.     
		     \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "I" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "N the bleak mid-winter"  "   Frosty wind made moan," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Earth stood hard as iron,"
					   "    Water like a stone;"
					   "Snow had fallen, snow on snow,"
					   "    Snow on snow,"
					   "In the bleak mid-winter,"
					   "    Long ago."
			  		}}
			       
			           } %% finish stanza 1
		\hspace #1 
           	\line { "2  "
			\column {	     
				"Our God, heaven cannot hold him"
				"    Nor earth sustain;"
				"Heaven and earth shall flee away"
				"    When he comes to reign:"
				"In the bleak mid-winter"
				"    A stable-place sufficed"
				"The Lord God Almighty"
				"    Jesus Christ."
			}}
		\hspace #1 
           	\line { "3  "
			\column {	     
				"Enough for him, whom Cherubim"
				"    Worship night and day,"
				"A breastful of milk,"
				"    And a mangerful of hay;"
				"Enough for him, whom Angels"
				"    Fall down before,"
				"The ox and ass and camel"
				"    Which adore."
			}}
	        \hspace #1 
           	\line { "4  "
			\column {	     
				"Angels and Archangels"
				"    May have gathered there,"
				"Cherubim and Seraphim"
				"    Thronged the air—"
				"But only his mother"
				"    In her maiden bliss"
				"Worshipped the Belovèd"
				"    With a kiss."
		}}
		\hspace #1 
           	\line { "5. "
			\column {	     
				"What can I give him"
				"    Poor as I am?"
				"If I were a shepherd"
				"    I would bring a lamb;"
				"If I were a wise man"
				"    I would do my part;"
				"Yet what I can I give him—"
				"    Give my heart."
		}}
	       }
	  } 
}  % stanza markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                    << 
	\context Voice = "sopranos" { \relative c' { \global
	                                             \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \global
	                                              \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                       <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	                                          \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	                                          \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
}  

} %%book bracket