%%%% 259.png
%%%% Hymn 160 Modern Tune. Christe Du Beistand. Father most holy, merciful and tender
%%%% Rev 2

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - TRINITY SUNDAY"
	\hspace #0.1 }}	
	
  title = \markup { "160 " \large \smallCaps "(Modern Tune)" }   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "CHRISTE DU BEISTAND."} \hspace #1 \roman {"(11 11. 11 5.)"}}
		                        \line { \italic {Very slow} \general-align #Y #DOWN \note #"2" #0.5 = 42.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\small { \smallCaps "M. A. von L" \hspace #-1.2 \teeny "ÖWENSTERN,"}}
	  					 \line { "1594-1648." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks

breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {	
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
      \override TupletNumber #'extra-offset = #'(0.0 . -0.4 )
      \override TextScript #'padding = #1
      \override TimeSignature #'transparent = ##t
      \time 4/2
      \override Score.RehearsalMark #'Y-offset = #'0.0 
      \override Score.RehearsalMark #'X-offset = #'6.4
      \mark \markup { \fontsize #-2 \musicglyph #"timesig.C44" } 
      \once \override Score.SeparationItem #'padding = #4
  d2 
     ^\markup { \hspace #-8 "[" \hspace #-1 \italic  "May be sung in unison throughout." \hspace #-1 "]" }
      d4 e f2 e    | \times 2/3 { a2( b4) } \times 2/3 { c2( d4) } b2 a \breathmark \bar "||" \break
  c b4 a g2 g  | \times 2/3 { a2( g4) } \times 2/3 { f2( f4) } f( e) f2 ^\fermata \bar "||" \break
  e2 

      e4 f g2 e | \times 2/3 { a2( c4) } \times 2/3 {b!2( a4) } a( gis) a2 \breathmark \bar "||" \break
  fis2 
        ^\markup { \hspace #-2 \italic "Slightly slower."}
  g4 g g( fis!) g2 | e d4 d d( cis) d2 ^\fermata \bar "||"
} 
   
alto = \relative c' {  	
      \override TupletNumber #'transparent = ##t
  a2 a4 a d2 cis  | \times 2/3 {e2 e4} \times 2/3 {e2 f4} e2 cis \bar "||"
  f2 d4 f e2 e    | \times 2/3 {f2 e4} \times 2/3 {d2 d4} c2 c \bar "||"
  cis2 cis4 d d2 c! | \times 2/3 {e2 e4} \times 2/3 {e2 e4} e2 cis2 \bar "||"
  d d4 e d2 d | c a4 b! a2 a \bar "||"
}

tenor = \relative c {\clef bass
      \override TupletNumber #'transparent = ##t
      \override TimeSignature #'transparent = ##t
      \time 4/2
      \override Score.RehearsalMark #'Y-offset = #'0.0 
      \override Score.RehearsalMark #'X-offset = #'6.4
      \mark \markup { \fontsize #-2 \musicglyph #"timesig.C44" } 
  f2 f4 e a2 a  | \times 2/3 {c! b!4} \times 2/3 {a2 a4} a4( gis!) a2 \bar "||"
  a2 b!4 c c2 c | \times 2/3 {c c4}   \times 2/3 {a2 bes!4} g2 a \bar "||"
  a2 a4 a b!2 c | \times 2/3 {c a4}   \times 2/3 {b!2 c4} b2 a \bar "||"
  a2 b!4 c a2 b! | g fis4 g e2 fis! \bar "||"
}

bass = \relative c {\clef bass 
      \override TupletNumber #'extra-offset = #'(0.0 . 0.2 )	
  d2 d4 cis d2 a | \times 2/3 {a'2( gis4)} \times 2/3 {a2( d,4)  } e2 a, \bar "||"
  f g4 a c2 c    | \times 2/3 { f2( c4)  } \times 2/3 {d2( bes!4)} c2 f, _\fermata \bar "||"
  a a4 d g,2 c   | \times 2/3 { a2( a'4) } \times 2/3 {gis2( a4) } e2 a, \bar "||"
  d g4 c, d2 g, | c d4 g,4 a2 d _\fermata \bar "||"
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #27 Light ne -- ver wan -- ing, Light ne -- ver wan -- ing; 
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
			      
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \inlinelyrics }
 		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
%		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		\context { \Staff  \override TupletBracket #'transparent = ##t }
		\context { \Score \override TimeSignature #'transparent = ##t }
                		

	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Rouen Melody at Hymn" "636." }


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

\markup { \column { 
	\line { \small { \hspace #16 \smallCaps  "Office Hymn." "M." \hspace #36 \italic "c. 10th cent.  Tr. P. D." } }
        \line { \small { \hspace #44 \small "O Pater sancte." } }
}}


%%% Lyrics

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ATHER most holy, merciful and tender;"
			                                 "Jesus our Saviour, with the Father reigning;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Spirit of mercy, Advocate, Defender,"
					   "        Light never waning;"
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	 
		        \hspace #1  % adds vertical spacing between verses
           		\line { \hspace #18 \italic "Part 2." }
			\hspace #1  % adds vertical spacing between verses
           		\line { "2  "
			   \column {	     
				   "Trinity sacred, Unity unshaken;"
				   "    Deity perfect, giving and forgiving,"
				   "Light of the Angels, Life of the forsaken,"
				   "        Hope of all living;"
				   "          " %%% adds vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "Maker of all things, all thy creatures praise thee;"
				   "    Lo, all things serve thee through thy whole creation:"
				   "Hear us, Almighty, hear us as we raise thee"
				   "        Heart's adoration."
				   "          " %%% adds vertical spacing between verses
			}}
		        \line { \hspace #-10.2 \italic "Unison.  " "4. "
			    \column {	     
				   "To the almighty triune God be glory:"
				   "    Highest and greatest, help thou our endeavour;"
				   "We too would praise thee, giving honour worthy,"
				   "        Now and for ever.     Amen."
     			}}
	  } %%% end supercolumn
} %%% end markup	  
       

%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }}  %%Amen midi       
       
}  


} %%% book bracket
