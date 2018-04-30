%%%077.png
%%%28 Adeste Fideles (Irreg.) "O come, all ye faithful"
%%%Version 5 

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = \markup { \line { \center-align {"28"}}}
  poet = \markup { \column { \line { \sans \small {"ADESTE FIDELES."} \hspace #1 \roman \small {"(Irreg.)"}} }}
  meter = \markup { \small { \italic {"Very slow"} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 72. } }
  arranger = \markup { \italic \small {"Composer unknown.  Probably 18th cent."}  }
  tagline ="" 
}  %% close header


global = {
  \time 4/4 
  \key g \major 
  \set Staff.midiInstrument = "church organ" 
}  %% close global


%%%%%%%%%%%%%%%%%%%%%%%%%Macros 

%%generates a parenthesis large enough to enclose two noteheads. Use extra-offset to position it.
parens = \markup { \fontsize #2 \musicglyph #"accidentals.leftparen" \hspace #0.8 \fontsize #2 \musicglyph #"accidentals.rightparen"}

%%generates the breathmarks above barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

PhrasingSlurDashed = {
  \override PhrasingSlur #'dash-period = #0.75
  \override PhrasingSlur #'dash-fraction = #0.4
}

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

%%%%%%%%%%%%%%%%%%%%%%%%%end of Macro definitions

soprano = \relative c' {
  \once \override TextScript #'extra-offset = #'( -0.4 . -6.0 )	
  \partial 4 g'4^\parens \nbbar g2 \slurDashed d4( g) \nbbar a2( d,) \nbbar b'4( a) b( c) \nbbar b2( a4) 
      \once \override TextScript #'extra-offset = #'( -0.4 . -6.2 )
      g4^\parens \nbbar g2 fis4 e \bar "|" \break
  \slurSolid fis( g) a b \nbbar fis2( e4.) d8 \nbbar d2. g4\rest \nbbar d'2 \slurDashed c4( b) \nbbar c2( b) \bar "|" \break
  a4( b) g( a) \nbbar fis2 d4 \breathmark \bar "||" \noBreak 
      \once \override Score.SeparationItem #'padding = #2 %% a bit more space for the apeggiobracket
      \arpeggioBracket g4 \arpeggio \nbbar g fis g a \nbbar g2 d4 b' \nbbar b a b c \bar "|" \break
  b2 a4 b \nbbar c b a g \nbbar fis2 \slurSolid g4( c) \nbbar b2( a4.) g8 \nbbar g1 \bar "||" 
}

alto = \relative c' {
  \partial 4 d4 \nbbar d2 \tieDashed d4 ~ d \nbbar \slurDashed e2( d) \nbbar d4 ~ d d( e) \nbbar d2 ~ d4 b4 \nbbar \slurSolid b( cis) d cis \bar "|" \break
  d2 d4 d \nbbar d2( cis!4.) d8 \nbbar d2. s4 \nbbar d2 \slurDashed e8( fis g4) \nbbar \PhrasingSlurDashed \slurSolid g\(( fis) g2\) \bar "|" \break
  d4 ~ d e ~ e \nbbar d2 d4 \bar "||" \noBreak s4 \nbbar 
      <<  { \voiceTwo } 
    \new Voice = "optional" {\once \override NoteColumn #'force-hshift = #0.1 \voiceTwo \set fontSize = #-3   \tieSolid d1 ~ \nbbar d2.}  >>
  d4 \nbbar d d d d \bar "|" \break
  d2 d4 g \nbbar fis g d d8[ cis!8] \nbbar d2 d4( e) \nbbar \tieSolid d2 ~ d4. b8 \nbbar b1 \bar "||" 
}

tenor = \relative c { \clef bass
  \partial 4 b'4 \nbbar b2 \tieDashed b4 ~ b \nbbar \slurDashed c2( a) \nbbar g4( a) g ~ g \nbbar g2( fis4) g4 \nbbar g2 a4 a \bar "|" \break
  \slurSolid a( g) fis d \nbbar a'2( g4.) fis8 \nbbar fis2. d4\rest \nbbar b'2 \slurDashed c4( d) \nbbar c2( d) \bar "|" \break
  d4( g,) b( c) \nbbar a2 fis4 \bar "||" \noBreak 
      <<  { \voiceThree } 
    \new Voice = "optional" {\once \override NoteColumn #'force-hshift = #0.1 \voiceThree \set fontSize = #-3 \arpeggioBracket b \arpeggio \nbbar b a b c \nbbar b2. }  >>
  g4 \nbbar g fis g a \bar "|" \break
  g2 fis4 d' \nbbar d d a a \nbbar a2 g \nbbar \slurSolid g( fis4.) g8 \nbbar g1 \bar "||" 
}

bass = \relative c { \clef bass
  \once \override TextScript #'extra-offset = #'( -0.4 . 5.6 )	
  \partial 4 g'4_\parens \nbbar g2 \tieDashed g4 ~ g \nbbar \slurDashed g2( fis) \nbbar g4( fis) g( c,) \nbbar d2 ~ d4 
      \once \override TextScript #'extra-offset = #'( -0.4 . 5.6 )
      e4_\parens \nbbar e2 d4 a \bar "|" \break
  \slurSolid d( b) fis g \nbbar \tieSolid a2 ~ a4. d8 \nbbar d2. s4 \nbbar b'2 \slurDashed a4( g) \nbbar a2( g) \bar "|" \break
  fis4( g) e( c) \nbbar d2 d4 \bar "||" \noBreak 
      <<  { \voiceTwo } 
    \new Voice = "optional" {\once \override NoteColumn #'force-hshift = #0.1 \voiceTwo \set fontSize = #-3 g, \nbbar \tieUp g1 ~ _\markup {\hspace #-3.0 \normalsize \italic "Without pedals."}  \nbbar g1 \nbbar \set fontSize = #-1 s4. c2\rest s8 \bar "|" \break
    b2\rest b4\rest _\markup { \hspace #5.0 \normalsize \italic "Pedals."}}  >>
  g'4 \nbbar a g fis e \nbbar \slurSolid d( c) b( c) \nbbar \tieDown d2 ~ d4. g,8 \nbbar g1 \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.1
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
		\context { \Staff \consists "Mark_engraver"  }
		\context { \Staff \override Rest #'style = #'classical }
		%%%these next 3 are needed to generate the long square bracket 3rd system 3rd measure
		\context { \ChoirStaff \consists "Span_arpeggio_engraver"}
		\context { \ChoirStaff connectArpeggios = ##t }
		\context { \ChoirStaff \override Arpeggio #'stencil = #ly:arpeggio::brew-chord-bracket }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 72 4)
            }
       }
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	  \line { \small { \hspace #57 \italic {"18th cent.  Tr. F. Oakeley"} "‡," \italic {"1802-80."}} }
	  \line { \small { \hspace #55 "[" \italic {"For the Complete Version, see No. 614."}"]" }}
	    \line { %% a master line of 3 columns
              \column { %% column 1
		\hspace #0.2
          \column {
		\line { \hspace #10 \raise #1.5 \small {"Adeste, fideles."}  }
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 " COME, all ye faithful," "Joyful and triumphant,"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
		          \line {\hspace #-5.0 "O come ye, O come ye to Bethlehem;" }
				"Come and behold him," 
				"Born the King of Angels:"
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { 
		       \column {	 \line { \hspace #0.2 }
			  \line { \hspace #5.0 \italic     "O come, let us adore him," }
			  \line { \hspace #5.0 \italic     "O come, let us adore him," }
			  \line { \hspace #-1.8 \italic     "O come, let us adore him, Christ the Lord." }
		   }} %% finish refrain
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -32 . -1) #0 }       %%Column 2. This is the line dividing the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3	
		\hspace #0.2	
		\line { "2    "
		    \column {	     
				"God of God," 
				"Light of Light," 
			\line { \hspace #-5.0 "Lo! he abhors not the Virgin's womb;" }
				"Very God,"
				"Begotten not created:"
	   }} %% end stanza 2
	   	\hspace #0.2 % adds vertical spacing between verses
		\line { "3    "
		    \column {    
				"Sing, choirs of Angels," 
				"Sing in exultation," 
			\line { \hspace #-5.0 "Sing, all ye citizens of heaven above," }
				"Glory to God" 
				"In the highest:"
 	   }}  %% end stanza 3

	  } %% end column 3
	  } %% master line bracket
	  
	  \hspace #0.2
	  \line { \hspace #20 \italic "Unison.  " "4.   "
             \column {    
		     "Yea, Lord, we greet thee," 
		     "Born this happy morning," 
		   \line { \hspace #-5.0  "Jesu, to thee be glory given;" }
		     "Word of the Father," 
		     "Now in flesh appearing:"
 	   }} %% end last stanza
          } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                    << 
	\context Voice = "sopranos" { \relative c' { \global
	                                             \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \global
	                                              \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                       <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	                                          \voiceThree e1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	                                          \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 4) }}  %%Amen midi 

} 	
} %% book bracket
