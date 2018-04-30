%%%% 220a.png
%%%% Hymn 134 Alternative Tune St Albinus Jesus lives! thy terrors now
%%%% Rev 1.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = \markup {"134 " \large \smallCaps "(Alternative Tune)" } 
  
  poet = \markup { \small {  \line { \sans { \smallCaps "ST. ALBINUS."} \hspace #1 \roman {"(7 8. 7 8 4.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time}  \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
  
  arranger = \markup { \small \smallCaps "H. J. Gauntlett, 1805-76." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 2/2
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  e2 c |  g'2. e4 |  a2 a |  g1 \bar "||"  e'2 d |  c b |  a c |  c1 |  g \bar "||" \break
  c2 g |  a e |  g f |  e1 \bar "||"  e'2 b |  c g |  a c |  d1 |  c \bar "||"  c2 c |  f1 |  e \bar "||"
} 
   
alto = \relative c' {  
  e2 c | g'2. e4 | a2 a | \merge g1 \bar "||" g2 g | e e | c c4( d) | e1 | e \bar "||"
  e2 e | c c | c c4( b) | c1 \bar "||" g'2 g | e g | g f | f1 e \bar "||" e2 e | a1 g \bar "||"
}

tenor = \relative c {\clef bass 
  e2 c | g'2. e4 | a2 a | g1 \bar "||" c2 b | a g | a a4( b) | c1 | c1 \bar "||"
  c2 c | a a | g g | g1 \bar "||" e'2 d | c c | c c | b1 | c \bar "||" c2 c | c1 | c \bar "||"
}

bass = \relative c {\clef bass 
  e2 c | g'2. e4 | a2 a | \merge g1 \bar "||" c2 g | a e | f f | c1 | c \bar "||"
  a2 c | f a | e g | c,1 \bar "||" c'2 g | a e | f a | g1 | c, \bar "||" c'2 a | f1 | c \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2)}} 
		
} %%% Score bracket


%%% Lyric Attribution 

\markup { \small { \hspace #74  \center-align { \italic "C. F. Gellert, 1715-69."
	                                      \italic "Tr. Frances E. Cox and others."
}} }

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.   
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux and looks a little better 
%%% but has been reported to give problems when compiling
%%% on Macintosh installations, so GF Gesetz can be used instead.
%%% In the code, "ch" ligature characters have not been used in order
%%% to allow the text to degrade gracefully for users who do not have the 
%%% Fraktur font.  Instead, the regular "c" and "h" moved closer together have been used.
%%% If you use another Fraktur font, simply put the name into the font-name override below.


\markup { \small { \hspace #42 \override #'(font-name . "HumboldtFraktur") {"Jeſus lebt, mit ihm auc" \hspace #-1.4 "h" "ic" \hspace #-1.4 "h." }}}




\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ESUS lives! thy terrors now"
			                                "  Can, O Death, no more appal us;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Jesus lives! by this we know"
					   "    Thou, O grave, canst not enthral us."
					   "                                                Alleluya!"
			  		}} 
			         } %%% finish verse 1	
			\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Jesus lives! henceforth is death"
				   "    But the gate of life immortal;"
				   "This shall calm our trembling breath,"
				   "    When we pass its gloomy portal."
				   "                                                Alleluya!"
			}} 	
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Jesus lives! for us he died;"
				   "    Then, alone to Jesus living,"
				   "Pure in heart may we abide,"
				   "    Glory to our Saviour giving,"
				   "                                                Alleluya!"
			}}
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
           		\line { "4  "
			   \column {	     
				   "Jesus lives! our hearts know well"
				   "    Nought from us his love shall sever;"
				   "Life, nor death, nor powers of hell"
				   "    Tear us from his keeping ever."
				   "                                                Alleluya!"
			}}
    		        \hspace #1 
           		\line {"5. "
			  \column {	     
				  "Jesus lives! to him the throne"
				  "    Over all the world is given;"
				  "May we go where he is gone,"
				  "    Rest and reign with him in heaven."
				  "                                                Alleluya!"
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne c'1 c \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo f1 e \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }} 

}
	
} %%% book bracket

