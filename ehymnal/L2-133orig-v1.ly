%%%% 219.png
%%%% Hymn 133 Original Version Jesus Christ is risen to-day
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = \markup { "133 " \large \smallCaps "(Original Version)"}   
  
  poet = \markup { \small {  \line { \sans {  "EASTER HYMN."} \hspace #1 \roman {"(7 4. 7 4. D.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 58.} }
  
  arranger = \markup { \small \italic "Lyra Davidica, 1708." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.8

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #1.6 

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  c2 e g c, | f a g1 \bar "||" e4\( f g c, e2.\) f4 | d1 c1 \bar "||" \break
  f2 g a g | f4( g) e4( f) d1 \bar "||" e4\( f g c, e2. \) f4 | d1 c1 \break
  b'2 c d4( c) b( a) | b( c) d2 e1 \bar "||" b4\( c d g, b2.\) c4 | a1 g1 \bar "||" \break
  g4( a) b2 c2. e,4 | f4( g) a( f) g1 \bar "||" e4\( f g c, e2.\) f4 | d1 c1 \bar "||"
} 
   
alto = \relative c' {  
  c2 c c c | c c c1 \bar "||" c4\( d e2 c2\) c2 | \straddle c2( b) \merge c1 \bar "||" 
  c2 d4( e) f2 g | b,2 c \straddle c( b) \bar "||" c4\( d e2 c2\) c2 | \straddle c2( b) \merge c1 \bar "||"
  g'2 a a d, | g g g1 | g4\( a b2 g2\) g2 | \straddle g( fis) \merge g1 \bar "||"
  g2 g g e | c c c1 \bar "||" c4\( d e2 c2\) c2 | \straddle c2( b) \merge c1 \bar "||"
}

tenor = \relative c {\clef bass 
  e2 g g g | a a c1 \bar "||" g1\( a2\) a2 | \topstraddle d,2( g4 f) e1 \bar "||"
  a2 b c c | f, g g1 \bar "||" g1\( a2\) a2 | \topstraddle d,( g) e1 \bar "||"
  d'2 e d d | d b c1 \bar "||" d1\( e2\) e2 | \topstraddle a,( d) b1 \bar "||"
  b4( c) d2 c2. c4 | f,2 f e1 \bar "||" \push g1\( a2\) a2 | \topstraddle d,( g4 f) e1 \bar "||"
}

bass = \relative c {\clef bass 
  c2 c e e | a f e1 \bar "||" c1\( a2\) f | g1 c1 \bar "||"
  a'2 g f e | d c g1 \bar "||" c1\( a2\) f | g1 c1 \bar "||"
  g'2 g fis fis | g4( a) g( f!) e1 \bar "||" g1\( e2\)  c | d1 g, \bar "||"
  \push g'2 f e c | a f c'1 \bar "||"  \pushb c1\( a2\) f | g1 c1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2)}} 
		
} %%% Score bracket

%%% Hymn note markup

\markup { \hspace #52 \center-align {
	\line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "Either of these two versions may be used, not, of course, together.  The second" }
	\line { "(" \hspace #-1 \italic "original" \hspace #-1 ")" \italic "version may also be sung to the words of Hymn" "143." }
}}
	

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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g1 \bar "||" }}
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
