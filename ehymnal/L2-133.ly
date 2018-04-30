%%% 218png
%%% Hymn 133 Easter Hymn. Jesus Christ is risen to-day, Alleluya!
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
  title = "133"
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"EASTER HYMN."}   \hspace #1 \roman {"(7 4. 7 4. D.)"}}
		                        \line { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 58.} }
  	}}	
	
 arranger = \markup { \small  { \center-align { 
	 					 \line {  \italic "Altered from melody in" }
	  					 \line { \italic "Lyra Davidica, 1708." }
  	}}}
	
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8
              \once \override Stem #'X-offset = #-2.8 }


%%% pushes notes slightly to the right

push = \once \override NoteColumn #'force-hshift = #'0.4

%%% shove, same as push but uses X-offset, since force-hshift does not work when there are two notes stacked on the same staff and both need
%%% to be moved to the right

shove = \once \override NoteHead #'X-offset = #'0.8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

global = {
  \time 2/2
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  c2 e | g c, | f a | a( g) \bar "||" e4\( f g c, | f2 \) g4( f) | e2( d) | c1 \bar "||" \break
  f2 g | a g | f e | e( d) \bar "||" e4\( f g c, | f2 \) e4( f) | e2( d) | c1 \bar "||" \break
  b'2 c | d g, | c d | e1 \bar "||" b4\( c d g, | c2\) b4( c) | b2( a) | g1 \bar "||" \break
  g4( a) b( g) | c2 e, | f a | a( g) \bar "||" c4\( b c g | a b\) c( d) | c2( b) | c1 \bar "||"
}

alto = \relative c' {  
  c2 c | d c | c f | f( e) \bar "||" \push c1\( ~ | c4 b\) c2 | c( b) | \merge c1 \bar "||"
  c2 c | c c | c4( b) c2 | c2( b) \bar "||" \push c1\( ~ | c4 b4\) c2 | c2( b) | \merge c1 \bar "||"
  g'2. fis4 | g2 g | g f | e1 \bar "||" \push g1\( ~ | g4 fis\) g2 | g( fis) | \merge g1 \bar "||"
  b,4( c) d( b) | c2 c | c f | f( e) \bar "||" e4\( f g e | f2\) e4( f) | e2( g4 f) | e1 \bar "||" 
}

tenor = \relative cis { \clef bass
  e2 g | g e | c' c | c1 \bar "||" \push g ~ | g2 g4 ( f) | g2.( f4) | e1 \bar "||"
  f2 e | f g | a4( f) g2 | g1 \bar "||" \push g1 ~ | g2 g4( f) | g2.( f4) | e1 \bar "||" 
  d'2 c | b b | c2. b4 | c1 \bar "||" \push d1 ~ | d2 d4( c) | d2.( c4) | b1 \bar "||"
  g2 g  | g c | c c | \push c1 \bar "||" c4\( g c2 ~ | c4 g \) c2 | c( d) | c1 \bar "||" 
}

bass = \relative cis { \clef bass \override Stem #'length = #5 
  c2 c | b c | a' f | c1 \bar "||" c4\( d e2 | d\) c4( a) | \push g1 | c1 \bar "||"
  a2 c | f e | d e4( f) | g1 \bar "||" c,4\( d e2 | d\) c4( a) | \push g1 | c1 \bar "||"
  g2 a | b g'4( f) | e2 d | c1 \bar "||" g'4\( a b2 | a\) g4( e) | \push d1 | g,1 \bar "||"
  g'2 f! | e \straddle c'4( b) | a2 f | \shove c1 \bar "||" c4\( d e c | f g\) a( f) | \push g1 | c,1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2)}} 

} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "A higher setting of this tune will be found in the Appendix." }


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


%%% Lyric attribution and titles

\markup { \hspace #68 \small { \center-align { \line { \italic "Lyra Davidica (1708), and the Supplement (1816)." }  
                                               \line { \italic "Based partly on" "Surrexit Christus hodie." }
					       \line { \italic "c. 14th cent." }
}}}


%%% Main lyrics markup block
  
\markup { \hspace #28 %%add space as necc. to center the column
	      \column { %%% super column for entire block of lyrics 
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "ESUS Christ is risen to-day,    Alleluya!"
                                                         "  Our triumphant holy day,    Alleluya!" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "Who did once, upon the Cross,    Alleluya!"
					   "Suffer to redeem our loss.    Alleluya!"
                                        }}
		      		} %% finish verse 1 
		 \hspace #1 
		 \line { "2  "
			\column {         
				"Hymns of praise then let us sing,    Alleluya!"
				"Unto Christ, our heavenly King,    Alleluya!"
				"Who endured the Cross and grave,    Alleluya!"
				"Sinners to redeem and save.    Alleluya!"
                        }}  
                \hspace #1 % adds vertical spacing between verses  
                \line {"3. "
			\column {        
				"But the pains that he endured    Alleluya!"
				"Our salvation have procured;    Alleluya!"
				"Now above the sky he's King,    Alleluya!"
				"Where the angels ever sing.    Alleluya!"
                }}
          }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }} 

}


} %%% book bracket
