%%%% 291.png
%%%% Hymn 180 Modern tune. Whitehall.  Martyr of God, whose strength was steeled.
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - MARTYRS"
		\hspace #0.1 }}	

	title = \markup { "180 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "WHITEHALL."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \italic "Melody by" \smallCaps "H. Lawes," \italic "1596-1662." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Macro to specify a partial measure in the middle of a piece or
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key a \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'1 gis2 fis \bar "|" a cis, d fis \bar "|" \partmeasure e1 \bar "||"  e1 fis2 gis \bar "|" \break
  a2 gis fis cis' \bar "|" \partmeasure b1 \bar "||" b1 d2 cis \bar "|" fis, gis a b \bar "|" \break
  \partmeasure cis1 \bar "||" cis1 e2 b \bar "|" d cis b b \bar "|" a1 \bar "||"
} 
   
alto = \relative c' {  
  e1 e2 d \bar "|" cis a a d \bar "|" a1 \bar "||" cis1 d2 d \bar "|" 
  e2 e d e \bar "|" e1 \bar "||" e1 fis2 e \bar "|" e d cis fis \bar "|"
  e1 \bar "||" fis1 gis2 g \bar "|" fis fis4( e) d2 e \bar "|" cis1 \bar "||"
}

tenor = \relative cis {\clef bass 
  cis'1 cis2 a \bar "|" a gis fis gis \bar "|" a1 \bar "||" a1 a2 b \bar "|"
  a2 a a a \bar "|" gis1 \bar "||" g1 fis2 a \bar "|" a e' e d \bar "|" 
  cis1 \bar "||" a1 b2 b \bar "|" a a a gis \bar "|" a1 \bar "||"
}

bass = \relative cis {\clef bass 
  a1 cis2 d \bar "|" fis e d b \bar "|" cis1 \bar "||" a1 d2 b \bar "|" 
  cis cis d a \bar "|" e'1 \bar "||" e1 b2 cis \bar "|" d e fis gis \bar "|" 
  a1 \bar "||" fis1 e2 g \bar "|" d fis b, e \bar "|" a,1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2)}} 
		
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to the Grenoble Melody at Hymn" "181." }

\markup { "              " } %%% force blank space before start of lyrics

\markup { "              " } %%% force blank space before start of lyrics


%%% Lyric titles and attributions

\markup { \hspace #9 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of one Martyr." \hspace #32 \italic "c. 10th cent.  Tr. P. D." }    
	\line { \hspace #4 "E." \italic "and" "M." } 
	\line { \hspace #33 "Martyr Dei qui unicum." }
	\line { "          " }  %%% force blank space before lyric text
}}}



%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARTYR of God, whose strength was steeled"
			                                 "  To follow close God's only Son," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Well didst thou brave thy battlefield,"
					   "    And well thy heavenly bliss was won!"
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
				  "Now join thy prayers with ours, who pray"
				  "    That God may pardon us and bless;"
				  "For prayer keeps evil's plague away,"
				  "    And draws from life its weariness."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "Long, long ago, were loosed the chains"
				  "    That held thy body once in thrall;"
				  "For us how many a bond remains!"
				  "    O Love of God release us all."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "4. "
				\column {	     
				  "All praise to God the Father be,"
				  "    All praise to thee, eternal Son;"
				  "All praise, O Holy Ghost, to thee,"
				  "    While never-ending ages run.     Amen."
     			}}

	  }
} %%% lyric markup bracket

       

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne a'1 a1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 cis1 \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree fis1 e1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d1 a1 \bar "||" }}
		        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
} %%% end Amen score block


} %%% book bracket
