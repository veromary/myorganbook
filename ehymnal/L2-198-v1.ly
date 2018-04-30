%%%% 314b.png
%%%% Hymn 198 Deerhurst. Hark! the sound of holy voices.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINTS' DAY"
	\hspace #0.1 }}	
	
  title = "198"   
  
  poet = \markup { \small {  \line { \sans { "DEERHURST."} \hspace #1 \roman {"(87. 87. D.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
  
  arranger = \markup { \small \smallCaps "J. Langran." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 c2 a2 f2 | e2 f2 g2 a2 | bes2 a2 g2 c2 | e2 d2 c1 \bar "||" \break
  a2 c2 a2 f2 | e2 f2 g2 a2 | bes2 a2 d2 c2 | a2 g2 f1 \bar "||" 
  a2 c2 f2 d2 | c2 f,2 bes2 a2 | g2 a2 c2 bes2 | f2 g2 a1 \bar "||" 
  a2 c2 f2 d2 | c2 f,2 bes2 a2 | g2 a2 c2 bes2 | d,2 e2 f1 \bar "||" 
} 
   
alto = \relative c' {  
  f2 g2 f2 c2 | c2 c2 c2 c2 | f2 f4 ( e4 -) d2 g2 | g2 f2  e1 \bar "||" 
  f2 g2 f2 c2 | c2 c2 c2 c2 | f2 f2 f2 f2 | f2 e2 \merge f1 \bar "||" 
  f2 e2 f2 f2 | f2 f2 e2 f2 | g2 fis2 g2 g2 | f2 d2 e1 \bar "||" 
  f2 g2 f2 f2 | f2 f2 e2 f2  | g2 fis2 g2 d2 | d2 c2 c1 \bar "||" 
}

tenor = \relative c {\clef bass 
  c'2 c2 c2 c2 | bes2 a2 g2 f2 | d'2 c2 b2 c2 | c2 b2 c1 \bar "||" 
  c2 c2 c2 c2 | bes2 a2 g2 f2 | f2 a2 bes2 c2 | c2 bes2 a1 \bar "||" 
  c2 c2 c2 bes2 | c2 c2 c2 c2 | d2 d2 d2 d2 | d2 d2 cis1 \bar "||" 
  d2 c!4 ( bes4 ) a2 bes2 | c2 c2 c2 c2 | d2 d2 d2 g,2 | g2 bes2 a1 \bar "||" 
}

bass = \relative c {\clef bass 
  f2 e2 f2 a2 | g2 f2 e2 f2 | f2 f2 f2 e2 | g2 g2 c,1 \bar "||" 
  f2 e2 f2 a2 | g2 f2 e2 f2 | d2 c2 bes2 a2 | c2 c2 f1 \bar "||" 
  f2 g2 a2 bes2 | a2 a2 g2 f2 | bes2 a2 g2 g2 | bes2 bes2 a1 \bar "||" 
  d,2 e2 f2 bes2 | a2 a2 g2 f2 | bes2 a2 g2 g,4 ( a4 ) | bes2 c2 f,1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}      
  	
	
} %%% Score bracket

%%% Hymn Notes 

\markup { \hspace #38 \small \smaller {  "[" \italic "By permission of Novello & Co. Ltd." "]" } }

\markup { \hspace #52 \center-align { 
	\line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "This tune is necessarily rather high for congregational use; the hymn may be" }
	\line { \italic "equally well sung to" \smallCaps "In Babilone" "(" \hspace #-1 \italic "No." "145)." }
}}


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

%%% Second page
%%% Lyrics

%%% Lyric titles and attributions

\markup { \small { \hspace #65 \italic "Bishop Chr. Wordsworth, 1807-85." } }

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last (fifth) verse.

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARK! the sound of holy voices,"
			                                 "  Chanting at the crystal sea," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Alleluya, Alleluya,"
					   "    Alleluya, Lord, to thee:"
					   "Multitude, which none can number,"
					   "    Like the stars in glory stands,"
					   "Clothed in white apparel, holding"
					   "    Palms of victory in their hands."
					   "                  " %%% blank space before next verse
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "Patriarch, and holy Prophet,"
				   "    Who prepared the way of Christ,"
				   "King, Apostle, Saint, Confessor,"
				   "    Martyr, and Evangelist,"
				   "Saintly Maiden, godly Matron,"
				   "    Widows who have watched to prayer,"
				   "Joined in holy concert, singing"
				   "    To the Lord of all, are there."
				   "                  " %%% blank space before next verse
			}}
			 \line { "3  "
			   \column {	     
				   "Marching with thy Cross their banner,"
				   "    They have triumphed following"
				   "Thee, the Captain of salvation,"
				   "    Thee their Saviour and their King;"
				   "Gladly, Lord, with thee they suffered;"
				   "    Gladly, Lord, with thee they died,"
				   "And by death to life immortal"
				   "    They were born, and glorified."
				   "                  " %%% blank space before next verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -72 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "Marching with thy Cross their banner,"
				   "    They have triumphed following"
				   "Thee, the Captain of salvation,"
				   "    Thee their Saviour and their King;"
				   "Gladly, Lord, with thee they suffered;"
				   "    Gladly, Lord, with thee they died,"
				   "And by death to life immortal"
				   "    They were born, and glorified.""                  " 
				   %%% blank space before next verse
			}} 
			\line {"5  "
			    \column {
				    "Now they reign in heavenly glory,"
				    "    Now they walk in golden light,"
				    "Now they drink, as from a river,"
				    "    Holy bliss and infinite,"
				    "Love and peace they taste for ever,"
				    "    And all truth and knowledge see"
				    "In the beatific vision"
				    "    Of the blessèd Trinity."
				    "                  " %%% blank space before next verse
			}}

	     			\line {"6. "
			     \column {	     
				    "God of God, the One-begotten,"
				    "    Light of light, Emmanuel,"
				    "In whose Body joined together"
				    "    All the Saints for ever dwell;"
				    "Pour upon us of thy fullness,"
				    "    That we may for evermore"
				    "God the Father, God the Son, and"
				    "    God the Holy Ghost adore.     Amen."				                                   
     			}}
	} %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket
       
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket

