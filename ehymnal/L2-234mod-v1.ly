%%%% 367.png
%%%% Hymn 234 Modern tune. Whitehall.  O light of light, by love inclined
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "THE TRANSFIGURATION"
		\hspace #0.1 }}	

	title = \markup { "234 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "WHITEHALL."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \italic "Melody by" \smallCaps "H. Lawes," "1596-1662." }}
  
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
  a'1 gis2 fis \bar "|" a cis, d fis \bar "|" \partmeasure e1 \bar "||" e1 fis2 gis \bar "|" \break
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


%%% Lyric titles and attributions

\markup { \hspace #16 \column { 
	\line { \small {  \smallCaps  "Office Hymn."  " M." \hspace #38 \italic "10th cent.  Tr. L. H."} }
        \line { \small {  \hspace #26  "O nata Lux de lumine." } }
}}	


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  LIGHT of light, by love inclined,"
			                                 "  Jesu, Redeemer of mankind." } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "With loving-kindness deign to hear"
					   "From suppliant voices praise and prayer."
					   "           " %%% adds vertical spacing between verses
			  		}}
		      } %%end verse 1
		           \line { "2  "
			   \column {	     
				   "Thou who to raise our souls from hell"
				   "Didst deign in fleshly form to dwell,"
				   "Vouchsafe us, when our race is run,"
				   "In thy fair Body to be one."
				  "           " %%% adds vertical spacing between verses
			}}
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "3  "
			   \column {	     
				   "More bright than day thy face did show."
				   "Thy raiment whiter than the snow,"
				   "When on the mount to mortals blest"
				   "Man's Maker thou wast manifest."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "Two prophets, that had faith to see,"
				   "With thine elect found company,"
				   "Where unto each, divinely shown,"
				   "The Godhead veiled in form was known."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "5  "
			   \column {	     
				   "The heavens above his glory named,"
				   "The Father's voice the Son proclaimed;"
				   "To whom, the King of glory now,"
				   "All faithful hearts adoring bow."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "6  "
			   \column {	     
				   "May all who seek thy praise aright"
				   "Through purer lives show forth thy light;"
				   "So to the brightness of the skies"
				   "By holy deeds our hearts shall rise."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "7. "
				\column {	     
				  "Eternal God, to thee we raise,"
				  "The King of kings, our hymn of praise,"
				  "Who Three in One and One in Three"
				  "Doth live and reign eternally.      Amen."
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
