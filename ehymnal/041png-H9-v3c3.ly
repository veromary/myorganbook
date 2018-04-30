%%% 041.png
%%% Hymn 9 Winchester New. "On Jordan's bank the Baptist's cry"
%%% Version 3 Reset fonts

\version "2.10"

\header {
 dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
 title = "9"
 meter = \markup { \small { \column { \line { \sans {"WINCHESTER NEW."} \hspace #1 \roman {"(L. M.)"}}
		                  \line { \italic {Slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.} } } } 
 arranger = \markup { \small { \center-align {
		 \line{ \italic {"Adapted from Chorale in the" } }
		 \line { \italic { "'Musikalisches Hand-Buch,' Hamburg, 1690."} } } } }
 tagline =""
}


global = {
  \time 4/2 
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
  \partial 2 f2 | bes2 f2 g2 g | f2 ees2 d2\fermata \bar "||" d2 | ees2 d2 c2 f2 | \break
  f2 e2 f2\fermata \bar "||" f2 | bes2 c2 d2 bes2 | \break
  ees2 d2  c2\fermata \bar "||" d2 | bes2 g2  f2 bes2 | bes2 a2 bes2\fermata \bar "||" 
}

alto = \relative c' {
   d2 | f2 d2  ees2 ees4( d4) | c2 a2  bes2 \bar "||" bes2 | bes2 bes2  c2 d2 | 
   d2 c2  c2 \bar "||" f2 | f2 ees2  d2 g4( f4) 
   ees2 f2  f2 \bar "||" f2 | f2 ees2  f2 d2 | g2 f2  f2 \bar "||" 
}


tenor = \relative c { \clef bass
   bes'2 | bes2 bes2 bes2 ees, | f2 f2  f2 \bar "||" f2 | g2 f4( g4)  a2 a2 |
   bes4( a4) g2  a2 \bar "||" a2 | bes2 g4( a4)  bes2 bes2 |
   bes4( a4) bes2  a2 \bar "||" bes2 | bes2 bes2  bes2 bes2  | c2 c2  d2 \bar "||"
}


bass = \relative c { \clef bass
   bes2 | d2 bes2  ees2 c4( bes4) | a2 f2  bes2_\fermata \bar "||" bes2 | g2 bes2  f2 d'2 | 
   bes2 c2  f,2_\fermata \bar "||" f'4( ees4) | d2 c2  bes2 ees4( d4) |
   c2 d4( ees4)  f2_\fermata \bar "||" bes, |  d2 ees2  d2 g2 | ees2 f2  bes,2_\fermata \bar "||" 
}




#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
 between-system-padding = 2\mm
 before-title-space = 0\mm
 after-title-space = 1.5\mm
 top-margin = 3\mm
 bottom-margin = 5\mm
 print-page-number = ##f
 between-system-space = #0
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

%% This next part is an identifier for the 5th verse.  In order to save space, this 5th verse will be inserted
%% on the left side of the Amen score block.  This is done by setting the 5th stanza as the markup text in the instrument name
%% field of the soprano staff of the Amen score. Doing this allows the entire hymn to be printed on 1 page.

insertverse = \markup { \hspace #0 \translate #(cons 0 -6.4)  
	             \line { \fontsize #3 { \hspace #16 \italic "Unison." " 5. "
		     \override #'(baseline-skip . 3.1) \column { 
			 "All praise, eternal Son, to thee"
			 "Whose advent sets thy people free,"
			 "Whom, with the Father, we adore,"
		      "And Holy Ghost, for evermore.   Amen.          " }
 	 }} %% end last stanza
}


\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos {\voiceTwo \global \alto }
	 >>
 
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			 >> 
			 

 >>
\layout {
		indent=0
%%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
	
\midi { 
 \context {
 \Score 
 tempoWholesPerMinute = #(ly:make-moment 56 2)
 }
 }
	
} %%score bracket


\markup { \hspace #4 %%add space as necc. to center the column
 \column { %% super column of everything
	 \hspace #0.2
	 \line { \hspace #60 \small \italic {C. Coffin, 1676-1749.  Tr. J. Chandler.}}
	 \line { \hspace #38 \small {"Jordanis oras praevia."}}
	 \line { %% a master line of 3 columns
	 \column { %% column 1
	 \hspace #0.2 % adds vertical spacing between verses
               \column {
		 \hspace #0.2      
		 \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" } %%Drop Cap goes here
			 \hspace #-1 %% adjust this if other letters are too far from Drop Cap
			\column { \raise #0 "N Jordan's bank the Baptist's cry" "  Announces that the Lord is nigh;"} } 
	 \line { \hspace #2.5 %%adjust hspace until this line left edge is flush with Drop Cap
			\lower #1.56 %%adjust this until the line spacing looks right
			\column { 
				"Come then and hearken, for he brings"
				"Glad tidings from the King of kings."
			 		}}
	 } %% finish stanza 1
		 
		 \hspace #0.2 % adds vertical spacing between verses
		 \line { "2 "
		 \column {	 
			 	"Then cleansed be every Christian breast,"
				"And furnished for so great a guest!"
				"Yea, let us each our hearts prepare"
				"For Christ to come and enter there."
		 }}
		 } %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2 
			 
	\column { \filled-box #'(0.0 . 0.1) #'( -28 . -5) #0 } %%Column 2. This is the line dviding the columns 1 and 3. 
			 	 
	\hspace #4 %%adds horizontal space between columns 2 and 3
	 
	\column { %%start page column 3		
		\hspace #0.1 % adds vertical spacing between verses
		\line { \italic "Unison." }
		\line { "3 "
		 \column {	 
			 	"For thou art our salvation, Lord,"
				"Our refuge and our great reward;"
				"Without thy grace our souls must fade,"
				"And wither like a flower decayed."	 
		}} 
	 	\hspace #0.1 % adds vertical spacing between verses
		\line { "4 "
		 \column { 
			 	"Stretch forth thine hand, to heal our sore,"
				"And make us rise to fall no more;"
				"Once more upon thy people shine,"
				"And fill the world with love divine."
		}} 
 
	 } %% end column 3
	 } %% master line bracket

 } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
		
	
 \new ChoirStaff
 <<
 \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                       << 
        \context Voice = "sopranos" { \relative c' {        
	                           \overrideProperty #"Score.NonMusicalPaperColumn"
                                                #'line-break-system-details #'((Y-offset . 135)
                                                        (alignment-offsets . (0 -5.4 -11.6)))
                                    \set Staff.instrumentName = \insertverse 
                                                    \global \voiceOne  bes'1 bes1 \bar "||" }}
	\context Voice = "altos" { \relative c' {   \global \voiceTwo g'1 f1 \bar "||" }}
	 		>>
			 
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                <<
	\context Voice = "tenors" { \relative c {  \global \clef bass \voiceThree ees'1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c {  \global \clef bass \voiceFour ees1 bes1 \bar "||" }}
			 >> 
 >>			 
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
         indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

 }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }} %%Amen midi 

} 	
	

} %% book bracket

