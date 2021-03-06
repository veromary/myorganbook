%%%% 231.png
%%%% Hymn 141 Modern tune. Deus Tuorum Militum
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = \markup { "141 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "DEUS TUORUM MILITUM."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "Grenoble Church Melody." }
  
  tagline = ""
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

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override TextScript #'padding = #2	
  \partial 4 c4^\markup { \italic "To be sung in unison." } | e2 g4 | c2 g4 | f4( e4) d4 | c2 \bar "||" c'4 | e2 c4 | a4( b) c | g2 fis4 | g2 \bar "||" \break
  g4 | a2 b4 | c2 g4 | f4( e) d | e2 \bar "||" g4 | a4( b) c | g( f) e | d2 c4 | c2 \bar "||"
} 
   
alto = \relative c' {  
  s4 | s2. | <c e>2 <c e>4 | s2. | s2 \bar "||" <e g>4 | <e a>2 <e a>4 | fis2 <e g>4 | b2 d4 | d2 \bar "||"
  <c e>4 | <c f>2 f4 | e2 c4 | c2 b4 | b2 \bar "||" c4 | <c e>4 \tieUp <d g ~>4 <e g>4 | <b d>4 c c | s2 c4 | c2 \bar "||"
}

tenor = \relative c {\clef bass 
  <e g>4 | <g c>2 <g b>4 | s2. | <a c>4 g4 b4 | <e, g>2 \bar "||" c'4 | c2 a4 | d2 g,4 | g2 a4 | <g b>2 \bar "||"
  s4 | s2 b4 | a2 g4 | a g g | g2 \bar "||" e4 | s2. | s4 a4 g | <g b>2 <e g>4 | <e g>2 \bar "||"
}

bass = \relative c {\clef bass 
  c4 | c2 e4 | a,2 c4 | f4 c4 g'4 | c,2 \bar "||" c'4 | a2 c,4 | d2 c4 | e2 d4 | g,2 \bar "||"
  c4 | f2 d4 | a2 e'4 | f c g' | e2 \bar "||" c4 | a g e | g a c | g2 <c, c'>4 | <c c'>2 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4)}} 
		
} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #36 \column {
	  \line { \hspace #12 \italic "See also:" }
	  "              "
          \small "628  Hail thee, Festival Day." 
          \small "629  O King most high of earth and sky." 
}}

\markup {"               " }  %%% force  blank line
\markup {"               " }  %%% force  blank line

%%% Lyric titles and attributions

\markup {
	\hspace #12 \column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Till Whitsun" \hspace #24 \italic "c. 5th cent.  Tr. J. M. Neale." } }  
	    \line { \small { \hspace #8 \italic "Even," "E." }} 
            \line { \small { \hspace #32 "Aeterne Rex altissime." }}
}}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "E" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "TERNAL Monarch, King most high,"
			                                 "  Whose Blood hath brought redemption nigh," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By whom the death of Death was wrought,"
					   "And conquering Grace's battle fought:"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }
           		\line { "2  "
			   \column {	     
				   "Ascending to the throne of might,"
				   "And seated at the Father's right,"
				   "All power in heaven is Jesu's own,"
				   "That here his manhood had not known."
				   "      " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column
	          \column { 
			\hspace #1  
				\line { "3  "
				\column {	     
				"That so, in nature's triple frame,"
				"Each heavenly and each earthly name,"
				"And things in hell's abyss abhorred,"
				"May bend the knee and own him Lord."
				"      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {	     
				"Yea, Angels tremble when they see"
				"How changed is our humanity;"
				"That flesh hath purged what flesh had stained,"
				"And God, the Flesh of God, hath reigned."
				"      " %%% adds vertical spacing between verses

			}} 
			\line {"5  "
				\column {	     
				"Be thou our joy and strong defence,"
				"Who art our future recompense:"
				"So shall the light that springs from thee"
				"Be ours through all eternity."
				"      " %%% adds vertical spacing between verses

			}}
			\line { "6. "
				\column {	     
				"O risen Christ, ascended Lord,"
				"All praise to thee let earth accord,"
				"Who art, while endless ages run,"
				"With Father and with Spirit One.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne c2( d c b) c1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo s2 s2 s2 s2 s1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "sopranos" {\override LyricText #'font-size = #-1  "A    -   -   -   -" men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree <e a>2 <f a> <e g> <d g> <e g>1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a2 d, e g c,1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }} 

} %%% end Amen score block


} %%% book bracket
