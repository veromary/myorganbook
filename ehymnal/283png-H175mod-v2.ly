%%%% 283.png
%%%% Hymn 175 Modern Tune. Aeterna Christi Munera.  The eternal gifts of Christ the King
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
  title = \markup { "175 " \large \smallCaps "(Modern Tune)" }    
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "AETERNA CHRISTI MUNERA."} \hspace #1 \roman {"(L . M.)"}}
		                        \line { \italic {In free rhythm} \general-align #Y #DOWN \note #"4" #0.5 = 90. } }
  	}}	
	

%%% In the composer name, \teeny is used because Lilypond's \smallcaps does not handle accented letters	
 
  arranger = \markup { \small  { \center-align { \line {\italic "Melody from" \smallCaps "Guidetti," }  
	  					 \line { "‘" \hspace #-1 \italic "Directorium Chori," \hspace #-1 "’"  \italic "1582." }
  	}}}
	 
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% raise tie a little to clear of other notes.

tieraise = \once \override Tie #'extra-offset = #'(0.0 . 1.0) 

tieraiseb = \once \override Tie #'extra-offset = #'(0.0 . 0.6) 


%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.4

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #0.8 

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override TextScript #'padding = #1	
   f4 ^\markup { \hspace #-3 \italic "To be sung in unison." }  f g \bar "dashed" a2. f4 \bar "dashed" 
      \once\override Slur  #'control-points = #'((2 . 3.0 ) (6 . 4.5 ) ( 26 . 4.5 ) (28 . 3.0 ))   
      g( a bes a g4.) f8 \bar "dashed" f2. \bar "||" \break
      
  f4 a bes \bar "dashed" c d( c) a bes \bar "dashed" c2. \bar "||" c4 c c \bar "dashed" d c bes a \bar "dashed" \break
  
  \once\override Slur  #'control-points = #'((0 . 3.0 ) (4 . 4.5 ) ( 22 . 4.5 ) (24 . 3.0 ))   
      \topstraddle g( a bes a g2  \once \override Script #'extra-offset = #'( 2.0 . 0.0 ) f) ^\fermata \bar "||" f4 f g \bar "dashed" a2. f4 \bar "dashed" 
      \once\override Slur  #'control-points = #'((2 . 3.0 ) (6 . 4.5 ) ( 14 . 4.5 ) (18 . 3.0 )) 
      g( a bes a g4.) f8 \bar "dashed" f2. \bar "dashed"

} 
   
alto = \relative c' {  
  c4 d e \bar "dashed" <c f>2. d4 \bar "dashed" \push <bes ~  d ~>1 <bes d>4. <a d>8 \bar "dashed" <a d>2. \bar "||"
  
  <d f>2 f4 \bar "dashed" e \push <d f>1 \bar "dashed" <e g>2. \bar "||" <f a>4 <f a> <e g> \bar "dashed" <f bes> <e g> 
      \once\override Tie  #'control-points = #'((1.8 . -1.7 ) ( 3 . -2.4 ) ( 4 . -2.4 ) ( 5.2 . -1.7 )) 
     <d f ~> <c f> \bar "dashed"
  
  <bes ~ d ~>1  
      \once\override Tie  #'control-points = #'((1.9 . -2.8 ) ( 3 . -3.5 ) ( 5 . -3.5 ) ( 6.2 . -2.8 )) 
     <bes d ~>2 <a d> \bar "||" d4 c d8[ e] \bar "dashed" f2. d4 \bar "dashed" \push d1 <c e>4. <a c>8 \bar "dashed" <a c>2. \bar "||"
}

tenor = \relative c {\clef bass 
  a'4 <f a> <g c> \bar "dashed" f2. a4 \bar "dashed" \pushb \tieraise g1 ~ g4. f8 \bar "dashed" f2. \bar "||"
  
  a2 bes4 \bar "dashed" <g c>4 \pushb f1 \bar "dashed" g2. \bar "||" c4 c2 \bar "dashed" bes4 g bes a \bar "dashed" 
  
  \tieraise g1 ~ g2 f2 \bar "||" f bes4 \bar "||" a2. a4 \bar "||" \push bes1 g4. f8 \bar "dashed" f2. \bar "||"
}

bass = \relative c {\clef bass 
  f4 d c \bar "dashed" f,2. d'4 \bar "dashed" s1 g4. d8 \bar "dashed" d2. \bar "||"
  
  d2. \bar "dashed" c4 bes2 d2 \bar "dashed" c2. \bar "||" f4 f4 c4 \bar "dashed" bes4 c d f \bar "dashed"
  
  g,1 ~ g2 d' _\fermata \bar "||" bes4 a g \bar "dashed" f2. d'4 \bar "dashed" \pushb g,1 c4. < f, c'>8 \bar "dashed" < f c' >2. \bar "||"
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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) }}      
  
	
} %%% Score bracket


%%% Hymn Note 

\markup { \hspace #52 \center-align { 
	\line { \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to the Chartres Melody at Hymn" "159" \italic "or to" }
	\line { \smallCaps "Deo Gracias" "(" \hspace #-1 \italic "No." "249)." }
}}

\markup { "                 " } %%% force blank space

%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of Apostles and"  \hspace #28 \italic "Before 11th cent.  Tr. J. M. Neale." }    
	\line { \hspace #4 \italic "Evangelists.  " "(" \hspace #-1 \italic "York" \hspace #-1 ")" "M." } 
	\line { \hspace #32 "Aeterna Christi munera." }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE eternal gifts of Christ the King,"
			                                 "  The Apostles' glorious deeds, we sing;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And while due hymns of praise we pay,"
					   "Our thankful hearts cast grief away."
			  		}}
		      } %%end verse 1
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				  "The Church in these her princes boasts,"
				  "These victor chiefs of warrior hosts;"
				  "The soldiers of the heavenly hall,"
				  "The lights that rose on earth for all."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "'Twas thus the yearning faith of Saints,"
				  "The unconquered hope that never faints,"
				  "The love of Christ that knows not shame,"
				  "The prince of this world overcame."
				  "           " %%% adds vertical spacing between verses
			}} 
			  \line { "4  "
			   \column {	     
				  "In these the Father's glory shone;"
				  "In these the will of God the Son;"
				  "In these exults the Holy Ghost;"
				  "Through these rejoice the heavenly host."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "5. "
				\column {	     
				  "Redeemer, hear us of thy love,"
				  "That, with this glorious band above,"
				  "Hereafter, of thine endless grace,"
				  "Thy servants also may have place.     Amen."
     			}}

	  }
} %%% lyric markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f2( g f e f) f1 \bar "||" }}
	                              
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1. c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "sopranos" {\set ignoreMelismata = ##t \override LyricText #'font-size = #-1  A - - - - men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'2 bes a g a a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d2 g, a c f, f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 14\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

       
%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) }}

}

} %%% book bracket
