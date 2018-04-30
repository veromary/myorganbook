%%%% 220.png
%%%% Hymn 134 Christ ist erstanden  Jesus lives! thy terrors now
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
  title = "134"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "CHRIST IST ERSTANDEN."} \hspace #1 \roman {"(7 8. 7 8 4.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow, very dignified} \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
  
  arranger = \markup { \small \italic "German melody, about 12th cent." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% no break bar to prevent uncommanded linebreaks

nbbar = { | \noBreak }	
	
%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0
              \once \override Stem #'X-offset = #-1.0 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0 
              \once \override Stem #'X-offset = #0.3 }	      
	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  a'2^\markup { \hspace #-3 \italic "To be sung in unison." } a g a \nbbar c1 d1 \nbbar a\breve \bar "||" 
      a2 g a f \nbbar e1 f1 \nbbar d1 d1 ^\fermata \bar "||" g2 g d c | \break
  f1 g \nbbar a\breve \bar "||" a2 g a f \nbbar e1 f1 \nbbar d1 e1 \bar "||" b'\rest c,2 d \nbbar e1 d ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  f2 f c f \nbbar <e g>1 <d bes'>1 \nbbar <c e>\breve \bar "||" 
      f2 c <c f> c \nbbar <g c>1 <a c>1 \nbbar <f a>1 <f a>1 \bar "||" <bes d>2 <bes d> <bes d> g |
  c1 \straddle d2( e) \nbbar <c f>\breve \bar "||" <c f>2 <c e> <c f> c \nbbar c1 c \nbbar \straddle bes2( a) g1 \bar "||" s1 g2 bes \nbbar c1 a \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 a g a \nbbar c1 f,1 \nbbar <e a>\breve  \bar "||"
      <d f a>2 <e g> f f \nbbar g1 f \nbbar d d \bar "||" g2 g f e |
  f1 bes \nbbar <f a>\breve \bar "||" a2 g a f \nbbar g1 f \nbbar f e \bar "||" d1\rest e2 f \nbbar \topstraddle a( g) \topstraddle g ^\fermata f ^\fermata \bar "||"
}

bass = \relative c {\clef bass 
  <d f>2 <d f> e <d f> \nbbar c1 <bes d>1 \nbbar a\breve \bar "||" 
      d,2 e f a \nbbar c1 a \nbbar d, d_\fermata \bar "||" g2 g bes c |
  a1 g \nbbar f\breve \bar "||" f'2 c f a, \nbbar c1 a \nbbar bes c \bar "||" s1 c2 bes \nbbar a1 <d, d'> _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}} 
		
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #52 \center-align { 
	\line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "The above tune is appropriate to this hymn, being anciently connected" }
        \line { \italic "with Eastertide.  An alternative tune is given below." } } }

\markup { "             " } %%% force a blank line to space out	
	
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


%%% Main lyric block

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
           		\line { "3  "
			   \column {	     
				   "Jesus lives! for us he died;"
				   "    Then, alone to Jesus living,"
				   "Pure in heart may we abide,"
				   "    Glory to our Saviour giving,"
				   "                                                Alleluya!"
			}}
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo bes1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }} 

}
	
} %%% book bracket
