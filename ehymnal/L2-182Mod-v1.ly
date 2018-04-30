%%%% 295.png
%%%% Hymn 182 Modern tune. Das Herrlich Hohe Fest.  The merits of the Saints.
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - MARTYRS"
		\hspace #0.1 }}	

	title = \markup { "182 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "DAS HERRLICH HOHE FEST."} \hspace #1 \roman {"(6 6. 6 6. 6 6 8.)"}} }}
  
  meter = \markup { \small { \italic {Slow and dignified} \general-align #Y #DOWN \note #"4" #0.5 = 100.} }
  
  arranger = \markup { \small { \smallCaps "C. Peter," \italic "c." "1674." }}
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 3/4
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  c4 e g | a2 b4 | c2. \bar "||" c4 d c | b2 a4 | b2. \bar "||" d4 d d | \break
  e2 e4 | d2. \bar "||" e4 c c | b2 b4 | a2. ^\fermata \bar "||" e4 e g | g2 fis4 | g2. \bar "||" \break
  a4 a c | c2 b4 | c2. \bar "||" b4 d g, | c4.( d8 \bar "dashed" e4) e4 \bar "dashed" d d | c2. \bar "||"
} 
   
alto = \relative c' {  
  c4 c d | f2 f4 | e2. \bar "||" e4 e a | g2 fis4 | g2. \bar "||" f4 a f | 
  e2 g4 | g2. \bar "||" e4 e e \bar "||" f2 e4 | c2. \bar "||" c4 c d | e2 d4 | d2. \bar "||"
  c4 f g | a2 g4 | g2. \bar "||" g4 d d | g4.( f8 \bar "dashed" e4) g \bar "dashed" a g | e2. \bar "||"
}

tenor = \relative cis {\clef bass 
  c'4 c b | c2 d4 | g,2. \bar "||" a4 a c | d2 d4 | d2. \bar "||" d4 a b | 
  c2 c4 | b2. \bar "||" b4 c a | a2 gis4 | a2. \bar "||" g4 g g | c2 c4 | b2. \bar "||"
  a4 c c | f2 f4 | e2. \bar "||" d4 b b | c4.( b8 \bar "dashed" c4) c \bar "dashed" c b | c2. \bar "||"
}

bass = \relative cis {\clef bass 
  c'4 a g | f( e) d | c2. \bar "||" a4 c a | b4.( c8) d4 | g,2. \bar "||" d'4 f d |
  c2 e4 | g2. \bar "||" gis4 a c, | d2 e4 | a,2. _\fermata \bar "||" c4 c b | a2 d4 | g,2. \bar "||"  
  f'4 f e | d2 g4 | c,2. \bar "||" g'4. a8 g[ f] | e4.( d8 \bar "dashed" c4) e \bar "dashed" f g | c,2. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)}} 
		
} %%% Score bracket


%%% Lyric titles and attributions

\markup { \hspace #9 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of many" \hspace #39 \italic "8th cent.  Tr. J. M. Neale." }    
	\line { \hspace #4  "Martyrs. " "E." \italic "and" "M." } 
	\line { \hspace #35 "Sanctorum meritis." }
	\line { "          " }  %%% force blank space before lyric text
}}}



%%% Lyrics

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE merits of the Saints,"
			                                 "  Blessèd for evermore," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Their love that never faints,"
					   "    The toils they bravely bore—"
					   "For these the Church to-day"
					   "Pours forth her joyous lay—"
					   "These victors win the noblest bay."
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

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			  \line { "2  "
			   \column {	     
				  "They, whom this world of ill,"
				  "    While it yet held, abhorred;"
				  "Its withering flowers that still"
				  "    They spurned with one accord—"
				  "They knew them short-lived all,"
				  "And followed at thy call,"
				  "King Jesu, to thy heavenly hall."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			   \column {	     
				   "Like sheep their blood they poured;"
				   "    And without groan or tear,"
				   "They bent before the sword"
				   "    For that their King most dear:"
				   "Their souls, serenely blest,"
				   "In patience they possest,"
				   "And looked in hope towards their rest."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "What tongue may here declare,"
				   "    Fancy or thought descry,"
				   "The joys thou dost prepare"
				   "    For these thy Saints on high!"
				   "Empurpled in the flood"
				   "Of their victorious blood,"
				   "They won the laurel from their God."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "5. "
				\column {	     
					"To thee, O Lord most high."
					"    One in Three Persons still,"
					"To pardon us we cry,"
					"    And to preserve from ill:"
					"Here give thy servants peace,"
					"Hereafter glad release,"
					"And pleasures that shall never cease.     Amen."
     			}}

	  }
} %%% lyric markup bracket

       
%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 c1 \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c1 \bar "||" }}
		        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
} %%% end Amen score block


} %%% book bracket
