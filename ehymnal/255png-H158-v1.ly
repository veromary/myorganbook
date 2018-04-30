%%% 255.png
%%% Hymn 158 Winchester Old. When God of old came down from heaven.
%%% Version 1
%%% same music as Hymn 30

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
		\hspace #0.1 }}	
  title = "158"
  
  poet = \markup { \small { \sans {"WINCHESTER OLD."} \hspace #1  \roman {"(C. M.)"} } }
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
  
  arranger =  \markup { \small \italic {"First appeared in Este's Psalter, 1592."}}
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks above barlines

breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2 	
  \key  f\major	
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' { 
  \partial 2*2 f1  | a2. a4 g2 f2 | bes2 bes2 a1 \breathmark \bar "||"
      \partmeasure g1 | a2 c2 c2 b2 | c1 \breathmark \bar "||" \break
  a1 | d2 c2 bes2 a2 | g2 f2 e1 \breathmark \bar "||"
      \partmeasure a1 | g2 f2 f2 e2 | f1 \bar "||"
}

alto = \relative c' { 
  c1 | f2. f4 e2 d2 | d2 f2 f1 \bar "||" 
      e1  | f2 e2 g2 g2  | e1 \bar "||"
  f1  | f2 f2 f2 f2  | e2 d2 cis1 \bar "||"  
      c!1 | e2 d2 d2 c2  | c1  \bar "||"
}

tenor = \relative c { \clef bass 
  a'1 | c2. c4 c2 a2 | bes2 d2 c1 \bar "||" 
      c1  | c2 c2 d2 d2  | c1 \bar "||" 
  c1  | bes2 a2 bes2 c2 | c2 a2 a1 \bar "||" 
      a1  | c2 a2 bes2 g2 | a1 \bar "||"
}


bass = \relative c { \clef bass 
  f1  | f2. f4 c2 d2  | bes2 bes2 f'1 \bar "||"
      c1  | f2 a2 g2 g2   | c,1 \bar "||"
  f1  | bes2 f2 d2 f2 | c2 d2 a1 \bar "||"
      f'1 |c2 d2 bes2 c2  |f1 \bar "||"

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

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    {\voiceTwo \global \alto }
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note 

\markup { \hspace #54 \center-align {
	\line {  \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another version of this tune, with the melody in the tenor, will be found" } 
        \line {  \italic "at Hymn" "30."  } 
}}

\markup { "           "}

%%% Lyric attributions and titles

\markup { \hspace #70 \small \italic "J. Keble, 1792-1866."}  


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEN God of old came down from heaven,"
			                               "  In power and wrath he came;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Before his feet the clouds were riven,"
					   "    Half darkness and half flame:"
					   "             " %%% add vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "But when he came the second time,"
				   "    He came in power and love;"
				   "Softer than gale at morning prime"
				   "    Hovered his holy Dove."
				   "             " %%% add vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "The fires that rushed on Sinai down"
				   "    In sudden torrents dread,"
				   "Now gently light, a glorious crown,"
				   "    On every sainted head."
				   "             " %%% add vertical spacing between verses
			}}

			\line { \hspace #-10.2 \italic "Unison.  " "4  "
				\column {	     
					"And as on Israel's awe-struck ear"
					"    The voice exceeding loud,"
					"The trump, that Angels quake to hear,"
					"    Thrilled from the deep dark cloud;"
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5  "
			   \column {	     
				   "So, when the Spirit of our God"
				   "    Came down his flock to find,"
				   "A voice from heaven was heard abroad,"
				   "    A rushing mighty wind."
				   "             " %%% add vertical spacing between verses
			}} 
			\line { \hspace #-10.2 \italic "Unison.  " "6  "
				\column {	     
					"It fills the Church of God; it fills"
					"    The sinful world around;"
					"Only in stubborn hearts and wills"
					"    No place for it is found."
					"             " %%% add vertical spacing between verses
			}} 
           		\line { "7. "
			   \column {	     
				   "Come Lord, come Wisdom, Love, and Power,"
				   "    Open our ears to hear;"
				   "Let us not miss the accepted hour;"
				   "    Save, Lord, by love or fear."
			"             " %%% add vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  

%%% alternative hymns also suitable

\markup {\hspace #32 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
		"145  (Pt. 2) Holy Ghost, Illuminator."
		"384  Eternal Ruler of the ceaseless round."
		"393  Glorious things of thee are spoken."
		"396  Gracious Spirit, Holy Ghost."
		"438  Love of the Father."
		"453  O Holy Spirit, Lord of grace."
		"454  O King enthroned on high."
		"458  O Lord of hosts, all heaven possessing." 
	}
}} 


} %%% book bracket
