%%%% 281.png
%%%% Hymn 174 Modern Tune. Annue Christe.  Lord of Cretion, bow thine ear, O Christ, to hear
%%%% Rev 2

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
  title = \markup { "174 " \large \smallCaps "(Modern Tune)" }    
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "ANNUE CHRISTE."} \hspace #1 \roman {"(12 12. 12 12.)"}}
		                        \line { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96 "(" \hspace #-1 \general-align #Y #DOWN \note #"2" #0.5 = 48 \hspace #-1 ")."  } }
  	}}	
	

%%% In the composer name, \teeny is used because Lilypond's \smallcaps does not handle accented letters	
 
  arranger = \markup { \small  { \center-align { \line {\italic "Melody from" \smallCaps "La Feill" \hspace #-1.2 \teeny "ÉE" \hspace #-1.2 "," }  
	  					 \line { "‘" \hspace #-1 \italic "Méthode du plain-chant," \hspace #-1 "’"  \italic "1782." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%% raise tie a little to clear of other notes.

tieraise = \once \override Tie #'extra-offset = #'(0.0 . 1.0) 

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override TextScript #'padding = #1	
  g'2 ^\markup { \italic "To be sung in unison." }  g4 a4 | b2 b | b4 a b c | <g b>2 a4.( g8) | g1 \bar "||" b2 b4 c4 | d2 d | \break
  g,4 e fis g | fis2 e4.( d8) | d1 \bar "||" g2 e4 fis | g2 g | a4 g a b | \break
  c2 b4.( a8) | a1 \bar "||" d2 b4 g | c2 b | g4 a b c | b2 a4.( g8) | g1 \bar "||"
} 
   
alto = \relative c' {  
  <b d>2 << { \voiceTwo b4 c } \\ { \voiceFour \movenote #1 g'2 } >> < d g>2 <d g> | < c g'>2 <d g>4 <e g> | d e fis2 | d1 \bar "||" g2 g4 g8[ a] | < fis ~ b>2 <fis a> | 
  d2 d4 d | d2 cis2 | s1 \bar "||" d2 d4 c | d2 d | e fis4 gis |
  a2 gis | e1 \bar "||" < g b>2 fis4 e | g2 fis | e4 c e <e a> | g2 < d fis> | d1 \bar "||"
}

tenor = \relative c {\clef bass 
  \tieraise g'1 ~ | \tieraise \movenote #0.4 g1 ~ \movenote #0.4 g1 | d'2 c | b1 \bar "||" d2 d4 c | b2 a | 
  g2 a4 b | a b <g cis>2 | a1 \bar "||" g2 g4 a | c2 b | b d | 
  e2. d4 | c1 \bar "||" g2 d'4 b | e2 d | b4 a gis a | d e a, c | b1 \bar "||"
}

bass = \relative c {\clef bass 
g1 ~ | g2 g'4 fis | e2 d4 c | \movenote #0.4 d1 | g1 \bar "||" g2 fis4 e | d2 c |
b2 a4 g | << { \voiceFour \movenote #0.6 a'2 s2 } \\ { \voiceTwo \movenote #1.0 a,1 } >> | < d fis>1 \bar "||" b2 b4 a | g2 g'4 fis | e4. d8 c4 b |
a c e2 | a,1 \bar "||" b2 d4 e | a a, b c8[ d] | e4 f e a, | b c d2 | g,1 \bar "||"
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


%%% Section of alternative hymns

\markup {  \column { \line { \hspace #32 \italic "See also for Procession on any Saint's Day:" }
	\line { "             " }
	\line { \hspace	#36 \small "638  Jerusalem, my happy home." }
	\line {	\hspace #36 \small "639  The Church triumphant in thy love." }
}}		




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

%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of Apostles and"  \hspace #24 \italic "Before 11th cent.  Tr. T. A. L." }    
	\line { \hspace #2 \italic "Evangelists.  " "E." \italic "and" "M." } 
}}}

%%% Lyric title 

\markup { \hspace #34 "Annue Christe saeculorum Domine." }        

%%% Lyrics

\markup { \hspace #22 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD of Creation, bow thine ear, O Christ, to hear"
			                                 "  The intercession of thy servant true and dear," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "That we unworthy, who have trespassed in thy sight,"
					   "May live before thee where he dwells in glorious light."

					   "          " %%% adds space between verses
			  		}} 
					} %%% finish verse 1
			   \line { "2  "
			   \column {	     
				   "O God our Saviour, look on thine inheritance,"
				   "Sealed by the favour shining from thy countenance;"
				   "That no false spirit bring to nought the souls of price"
				   "Bought by the merit of thy perfect Sacrifice."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				   "We bear the burden of our guilt and enmity,"
				   "Until thy pardon lift the heart from slavery:"
				   "Then through the spending of thy life-blood, King of grace,"
				   "Grant us unending triumph in thy holy place."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "4. "
			   \column {	     
				   "To thee the glorious Christ, our Saviour manifest,"
				   "All wreaths victorious, praise and worship be addrest,"
				   "Whom with the living Father humbly we adore,"
				   "And the life-giving Spirit, God for evermore.     Amen."
			}}
	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne 
	                              \override TextScript #'padding = #1
	                              g'1 ^\markup { \hspace #-4 \fontsize #2  \italic "Harmony." } g  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
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

} %%% book bracket
