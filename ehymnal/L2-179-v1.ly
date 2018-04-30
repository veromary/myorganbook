%%%% 288.png
%%%% Hymn 179.  Ach Gott von Himmelreiche.  Come sing, ye choirs exultant.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
	title = "179"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "ACH GOTT VON HIMMELREICHE."} \hspace #1 \roman {"(7 6. 7 6. D.)"}}
		                        \line { \italic {Brightly} \general-align #Y #DOWN \note #"4" #0.5 = 168.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody by" }
	  					 \line { \smallCaps "M. Praetorius, 1571-1621."  }
  	}}}
	 
  tagline = ""
}


%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d4 \bar "|" g2 g4 a2 c4 \bar "|" b4.( a8 b4) a2 a4 \bar "|" g2 g4 c2 b4 \bar "|" a2.( a2) \bar "||" \break
  a4 \bar "|" g2 fis4 g2 a4 \bar "|" fis4.( e8 fis4) d2 b'4 \bar "|" b2 d4 c2 c4 \bar "|" b2.( b2) \bar "||" \break
  b4 \bar "|" b2 d4 a2 b4 \bar "|" c4.( d8 c4) b2 b4 \bar "|" b2 d4 c2 b4 \bar "|" a2.( a2) \bar "||" \break
  b4 \bar "|" a2 g4 a2 fis4 \bar "|" g4.( fis8 g4) a2 b4 \bar "|" d2 b4 c a2 \bar "|" g2.( g2) \bar "||" \break
} 
   
alto = \relative c' {  
  d4 \bar "|" d2 e4 fis2 g4 \bar "|" g2. fis2 fis4 \bar "|" g2 e4 e2 d4 \bar "|" fis2.( fis2) \bar "||"
  e4 \bar "|" c2 c4 d2 e4 \bar "|" d2. d2 d4 \bar "|" g2 a4 g2 fis4 \bar "|" g2.( g2) \bar "||"
  g4 \bar "|" g2 g4 fis2 g4 \bar "|" e2. dis2 dis4 \bar "|" e2 f4 e2 e4 \bar "|" c2.( c2) \bar "||"
  d4 \bar "|" e2 e4 fis2 d4 \bar "|" d2( cis4) d2 d4 \bar "|" d2 d4 g4 fis2 \bar "|" g2.( g2) \bar "||"
}

tenor = \relative c {\clef bass 
  a'4 \bar "|" b2 b4 d2 e4 \bar "|" d2. d2 d4 \bar "|" d2 c4 g4.( a8) b4 \bar "|" d2.( d2) \bar "||"
  c4 \bar "|" g2 a4 g2 c4 \bar "|" a4.( g8 a4) fis2 g4 \bar "|" d'2 d4 g,2 a4 \bar "|" b2.( b2) \bar "||"
  d4 \bar "|" d2 d4 d2 d4 \bar "|" a2( g4) fis2 fis4 \bar "|" g2 a4 a2 gis4 \bar "|" a2.( a2) \bar "||"
  fis4 \bar "|" a2 b4 d2 a4 \bar "|" g2. fis2 g4 \bar "|" a2 b4 e4 d( c) \bar "|" b2.( b2) \bar "||"
}

bass = \relative c {\clef bass 
  fis4 \bar "|" g2 e4 d2 c4 \bar "|" g2( b4) d2 c4 \bar "|" b2 c4 e4.( fis8) g4 \bar "|" d2.( d2) \bar "||"
  a4 \bar "|" c2 a4 b2 c4 \bar "|" d2. d2 g4 \bar "|" g2 fis4 e2 d4 \bar "|" g2.( g2) \bar "||"
  g4 \bar "|" g2 b,4 d2 b4 \bar "|" a2. b2 b4 \bar "|" e2 d4 a4.( c8) e4 \bar "|" a,2.( a2) \bar "||"
  d4 \bar "|" c2 e4 d2 c4 \bar "|" b2( e4) d2 g4 \bar "|" fis2 g4 c,4 d2 \bar "|" g,2.( g2) \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 168 4) }}      
  
	
} %%% Score bracket


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

\markup { \hspace #8 \small {  \column {
	 \line { \italic "Sequence.    Evangelists."  \hspace #44 \italic "Adam of St. Victor, c. 1170." }    
	 \line { \hspace #70 \italic "Tr. Jackson Mason." } 
	\line { \hspace #34 "Plausu chorus laetabundo." }
}}}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME sing, ye choirs exultant,"
			                                 "  Those messengers of God," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Through whom the living Gospels"
					   "    Came sounding all abroad!"
					   "Whose voice proclaimed salvation"
					   "    That poured upon the night,"
					   "And drove away the shadows,"
					   "    And flushed the world with light."
					   "         " %%% adds blank spacing between verses
			  		}}
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "He chose them, our Good Shepherd,"
				   "    And, tending evermore"
				   "His flock through earth's four quarters,"
				   "    In wisdom made them four;"
				   "True Lawgiver, he bade them"
				   "    Their healing message spread,"
				   "One charter for all nations,"
				   "    One glorious title-deed."
				    "         " %%% adds blank spacing between verses
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -47 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3* "
			   \column {	     
					"In one harmonious witness"
					"    The chosen Four combine,"
					"While each his own commission"
					"    Fulfils in every line;"
					"As, in the Prophet's vision,"
					"    From out the amber flame"
					"In form of visage diverse"
					"    Four living creatures came."
					"         " %%% adds blank spacing between verses
			}}
			\line {"4* "
			    \column {	     
					"Lo, these the wingèd chariots"
					"    That bring Emmanuel nigh;"
					"The golden staves uplifting"
					"    The ark of God on high;"
					"And these the fourfold river"
					"    Of Paradise above,"
					"Whence flow for all the nations"
					"    New mysteries of love."
					"         " %%% adds blank spacing between verses
			}}
	    } %%% end column 3
     } %%% end master-line, start centred last verse
			\line { \hspace #20 \italic "Unison. " "5. "	     
				\column {
					"Foursquare on this foundation"
					"    The Church of Christ remains,"
					"A house to stand unshaken"
					"    By floods or winds or rains."
					"O glorious happy portion"
					"    In this safe home to be,"
					"By God, true Man, united"
					"    With God eternally!"
     			}}
   } %%% super column bracket
} %%% lyrics markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 168 4) }}

}


} %%% book bracket
