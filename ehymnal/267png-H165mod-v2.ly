%%%% 267.png
%%%% Hymn 165 Modern Tune. Christe Sanctorum. Father, we praise thee, now the night is over. 
%%%% Rev 2

\version "2.10"

%%% Note the way the accent smallcap letters are rendered.  This is because \smallcaps does not work with accented letters. 
%%% Instead, accented letters are regular uppercase but in a smaller fontsize.

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - TRINITY TO ADVENT"
	\hspace #0.1 }}	
	
  title = \markup { "165 " \large \smallCaps "(Modern Tune)" }   
  
  meter = \markup { \small { \column { \line { \sans "CHRISTE SANCTORUM." \hspace #1 \roman " (11 11. 11 5.)" } 
                            \line { { \italic "In moderate time"  \general-align #Y #DOWN \note #"4" #0.5 "= 96." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic "Melody from" }
		 \line { \smallCaps "La F" \hspace #-1.2 \teeny "EILLÉE" \hspace #-1.2 ", ‘"  \hspace #-1.2 \italic "Méthode" }
		 \line { \italic "du plain-chant" \hspace #-1.2 ",’" \italic "1782." }
  }}}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  bes'2^\markup { \hspace #-8 \italic "To be sung in unison."} g4 aes | g( f) ees2 | g4. aes8 bes4 bes | c2 bes \bar "||" bes c4 d \bar "||" \break
  ees2 bes | ees4. d8 <c a>4 <bes d> | c2 bes \bar "||" ees bes4 c | bes4( aes) g2 | \break
  aes4. g8 aes4 bes | aes( g) f2 \bar "||" bes ees,4 aes | g2( f) | ees1 \bar "||"
} 
   
alto = \relative c' {  
  <ees g>2 ees | ees4 d ees2 | ees f4 <ees g>  | <ees aes>2 <ees g> \bar "||" 
      <d f> << { \voiceTwo ees4 f } \\ { \voiceFour \movenote #0.0001 aes2 } >> \bar "||" 
  <g bes>2 g | <g c>4. <f bes>8 << { \voiceTwo f2 ~ | f2 } \\ { \voiceFour s2 | bes4 a } >> <d, f>2 \bar "||" 
      <g c> << { \voiceTwo g4 aes } \\ { \voiceFour \movenote #0.0001 ees2 } >> | <d f>4 <ees bes> ees2 | 
  <aes, f'>4. <c ees>8 <c f>4 d | ees2 d \bar "||" <d g> c4 <c f> | ees2 d | bes1 \bar "||"
}

tenor = \relative c {\clef bass 
  <g' bes>2 bes4 c | bes2 <g bes> | bes4. c8 d4 <bes g> | c2 <g bes> \bar "||" <f bes> c'4 d | 
  <g, bes ees>2 <bes d> | c4. f,8 a4 <f bes ~ >4 | bes a f2 \bar "||" g g4 c | s2 bes2 | 
  s4. c,8 s4 bes'4 | c bes bes2 \bar "||" bes g4 s4 | bes2. aes4 | g1 \bar "||"
}

bass = \relative c {\clef bass 
  ees2 ees4 aes, | ees' bes ees2 | ees4. c8 bes4 ees | aes2 ees \bar "||" bes aes'4 f | 
  ees2 g | c,4. d8 f4 bes, | f'2 bes, \bar "||" c ees4 aes | bes, c ees2 |
  f4. s8 f4 g | aes ees bes2 \bar "||" g c4 f, | g aes bes2 | ees1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { 
	                             \line {\smallCaps  "Office Hymn." \italic "Sundays and" \hspace #30 \italic "Ascr. to St. Gregory the Great." } 
          	                     \line { \hspace #6 \italic "week-days." " M." \hspace #42 \italic "6th cent.  Tr. P. D." } 
				     \line { \hspace #32 "Nocte surgentes." }					 
}}}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ATHER, we praise thee, now the night is over."
			                                 "  Active and watchful, stand we all before thee;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Singing we offer prayer and meditation:"
					   "                                Thus we adore thee."
			  		}} 
			         } %%% finish verse 1
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

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Monarch of all things fit us for thy mansions;"
				   "Banish our weakness, health and wholeness sending;"
				   "Bring us to heaven, where thy Saints united"
				   "                                Joy without ending."
				   "               " %%% add vertical spacing between verses
			}}
           		\line { "3. "
			   \column {	     
				   "All-holy Father, Son and equal Spirit,"
				   "Trinity blessèd, send us thy salvation;"
				   "Thine is the glory, gleaming and resounding"
				   "                                Through all creation.     Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
      
%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees2( f ees d) ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes bes \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "sopranos" { 
	                                       \set ignoreMelismata = ##t
	                                       \override LyricText #'font-size = #-1  A - - - men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'2 aes g f g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c2 f, g bes ees,1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi       
       
}  

%%% Evening Office Hymn Markup

\markup { \hspace #54 \center-align { \italic "The evening Office Hymn for Sunday, and for every day except Saturday is:"
                           \small "51  O blest Creator of the light." }}


} %%% book bracket
