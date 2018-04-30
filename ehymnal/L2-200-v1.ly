%%%% 316b.png
%%%% Hymn 200. Psalm 42. Joy and triumph everlasting.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
  title = "200"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"PSALM 42."} \hspace #1 \roman {"(8 7. 8 7. 7 7. 8 8.)"}}
		                        \line { \italic {In moderate time, majestically} \general-align #Y #DOWN \note #"4" #0.5 = 120.} 
  }}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Composed or adapted by" \smallCaps "L. Bourgeois"}
	  					 \line { \italic "for Genevan Psalter, 1551." }
  	}}}
	 
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% music function to allow lyrics to skip a given number of notes

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { g'2 a4 b2 a4 | g4 fis4 e2 d2 | g2 a4 b2 c4 | \cadenzaOn b2 a2 g1 \bar "||" \break
  \cadenzaOff g2 a4 b2 a4 | g4 fis4 e2 d2 | g2 a4 b2 c4 | \cadenzaOn b2 a2 g1 ^\fermata \bar "||" \break 
  \cadenzaOff b2 b4 d2 c4 | b4 a4 b1 ^\markup { \fontsize #+5 "*" } | d2 d4 e2 d4 | c4 b4 a1 \breathmark \bar "||" \break
  b2 d4 c2 b4 | g4 a4 b2 g2 | b2 b4 c2 b4 | a4 g4 fis2 g2 ^\fermata \bar "||" }
      \tag #'Amen { \cadenzaOn g1 g1 \bar "||" }
}   

alto = \relative c' {  
  \tag #'Tune { g'2 fis4 g2 d4 | e4 d4 \straddle d4 ( c4 ) b2 | e2 d4 g2 e4 | g2 fis2 \merge g1 \bar "||" 
  e2 d4 d2 d4 | b4 d4 \straddle d4 ( cis4 ) d2 | e2 fis4 g2 g4 | g2. fis4 \merge g1 \bar "||" 
  g2 g4 g2 e4 | g4 fis4 g1 | f2 f4 e2 fis!4 | g4 g4 \straddle g2 ( fis2 ) \bar "||" 
  g2 fis4 e2 d4 | g4 e4 fis2 g2 | gis2 gis4 a2 g!4 | e4 e4 a,2 b2 \bar "||" }
      \tag #'Amen { e1 d1 \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'Tune { b'2 d4 d2 d4 | b4 b4 g2 g2 | b2 d4 d2 c4 | d2. c4 b1 \bar "||" 
  b2 a4 g2 fis4 | g4 a4 b4 ( a4 ) fis2 | g2 c4 b2 e4 | e2. d4 b1 \bar "||" 
  d2 d4 b2 a4 | d4 d4 d1 | a2 b4 c2 b4 | g4 d'4 d1 \bar "||" 
  d2 d4 g,4 ( a4 )  b4 | b4 e4 e4 ( dis4 ) e2 | e2 e4 e2 d4 | c4 b4 d2 d2 \bar "||" }
      \tag #'Amen { c1 b1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'Tune { g'2 d4 g2 fis4 | e4 b4 c2 g2 | e'2 fis4 g2 a,4 | b4 ( c4 ) d2 g,1 \bar "||" 
  e'2 fis4 g2 d4 | e4 fis4 g4 ( a4 ) d,2 | c2 a4 g2 c4 | e4 ( d4 ) c4 ( d4 ) g,1 _\fermata \bar "||" 
  g'2 g4 g,2 a4 | b4 d4 g,1 | d'2 d4 c2 d4 | e4 g4 d1 \bar "||" 
  g2 b,4 e4 ( fis4 ) g4 | e4 c4 b2 e2 | e2 e4 a,2 b4 | c4 e4 d2 g,2 _\fermata \bar "||" }
      \tag #'Amen { c1 g1 \bar "||" }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #60 A -- men.
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
 
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \inlinelyrics }
 			      
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
	
} %%% Score bracket


%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}      
  	
	
} %%% end score bracket

%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}      
  	
	
} %%% Score bracket

%%% Hymn Note 

\markup { \hspace #52 \center-align { \line { \lower #1.2 \fontsize #+5 "*" \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "When this tune is sung to Hymn" "127" \smallCaps "(Alleluya! Alleluya!)" }
	
	\line { \combine \note #"2" #0.5 "—" \combine \note #"2" #0.5 "—" \italic " for " \combine \note #"1" #0.5 "—" \italic " here." }
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


%%% Second Page
%%% Lyric titles and attributions

\markup { \hspace #4 \small {  \column {
	 \line { \italic "Sequence.    Suitable also for other festivals."  \hspace #26 \italic "Adam of St. Victor, c. 1150.  Tr. Y. H." }    
	 \line { \hspace #34 "Supernae matris gaudia." }
}}}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #-9.6 \italic "Unison. " \hspace #2.6 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OY and triumph everlasting"
			                                "  Hath the heavenly Church on high;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "For that pure immortal gladness"
					   "    All our feast days mourn and sigh."
					   "Yet in death's dark desert wild"
					   "Doth the mother aid her child,"
					   "Guards celestial thence attend us,"
					   "Stand in combat to defend us."
					   "         " %%% adds blank spacing between verses
			  		}}
		                  }	
			   \line { "2  "
			   \column {	     
				   "Here the world's perpetual warfare"
				   "    Holds from heaven the soul apart;"
				   "Legioned foes in shadowy terror"
				   "    Vex the Sabbath of the heart."
				   "O how happy that estate"
				   "Where delight doth not abate;"
				   "For that home the spirit yearneth,"
				   "Where none languisheth nor mourneth."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { \hspace #-9.6 \italic "Unison. " "3  "
			   \column {	     
				   "There the body hath no torment,"
				   "    There the mind is free from care,"
				   "There is every voice rejoicing,"
				   "    Every heart is loving there."
				   "Angels in that city dwell;"
				   "Them their King delighteth well:"
				   "Still they joy and weary never,"
				   "More and more desiring ever."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "4* "
			   \column {	     
				   "There the seers and fathers holy,"
				   "    There the prophets glorified,"
				   "All their doubts and darkness ended,"
				   "    In the Light of light abide."
				   "There the Saints, whose memories old"
				   "We in faithful hymns uphold,"
				   "Have forgot their bitter story"
				   "In the joy of Jesu's glory."
				   "           " %%% adds vertical spacing between verses
			}}
			\line { \hspace #-9.6 \italic "Unison. " "5.*"
				\column {	     
				   "There from lowliness exalted"
				   "    Dwelleth Mary, Queen of grace,"
				   "Ever with her presence pleading"
				   "    'Gainst the sin of Adam's race."
				   "To that glory of the blest,"
				   "By their prayers and faith confest,"
				   "Us, us too, when death hath freed us,"
				   "Christ of his good mercy lead us."
     			}}

	  }
} %%% lyric markup bracket

} %%% book bracket
