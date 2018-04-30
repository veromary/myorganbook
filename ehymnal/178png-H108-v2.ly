%%%% 178.png
%%%% Hymn 108. Ebenezer (Ton-Y-Botel). "Who is this with garments gory"
%%%% Rev 2.

\version "2.10.23"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
	\hspace #0.1 }}	

  title = "108"

  poet = \markup { \small {  \line { \sans {"EBENEZER (TON-Y-BOTEL)."} \hspace #1 \roman {"(87. 87. D.)"}} }}

  meter = \markup { \small { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 48.} \small { "   [" \italic {This tune may be sung throughout in unison.} "]" }}
 
  arranger = \markup { \small \italic "Welsh Hymn Melody." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
					\once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0)
							\raise #1.4 \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
					} }	
					\bar "|:"
}	

%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
				\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
						\column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
							\hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
				} }
				\bar "||"
}

%%%% Make Triplet bracket transparent

hidetup = { \override TupletBracket #'transparent = ##t }


%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 8/4
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { \hidetup 
  \tag #'repeatpart { \fdstartrepeat f2 \times 2/3 { f4 (g aes) } g2 f | g \times 2/3 { g4 (aes bes) } aes4.(g8) f2 | c' \times 2/3 { bes4 (c des) } c4.(bes8) aes2 | \break
   
  bes4.(aes8) g2 f1 \fdendrepeat } 
      \tag #'remainder { c'2 \times 2/3 { aes4(bes c)} bes2 bes | aes \times 2/3 {f4(g aes)} g2 g | \break

  f \times 2/3 {f4(g aes)} bes2 bes | aes \times 2/3 {bes4(aes bes)} c1 \bar "||" f,2 \times 2/3 {f4(g aes)} g2 f | \break
  
  g \times 2/3 {g4(aes bes)} aes4.(g8) f2 | c' \times 2/3 {bes4 (c des)} c4.(bes8) aes2 | bes4.(aes8) g2 f1 \bar "||" }
}

alto = \relative c' { \hidetup
  \tag #'repeatpart { \fdstartrepeat c2 c e f | f e f c | c \times 2/3 {ees!2(f4)} g2 f | \break
	  
  f e \merge f1 \fdendrepeat }
      \tag #'remainder { ees!2 ees ees ees | c f f e | \break
  
  f c f ees | c f e1 \bar "||" aes,2 f' e f | \break
  
  f e f f | ees ees ees f | f e \merge f1 \bar "||" }
}

tenor = \relative c { \hidetup \clef bass 
  \tag #'repeatpart { \fdstartrepeat aes'2 c c aes | des c c4.(bes8) aes2 | ees' \times 2/3 {bes2(aes4)} c2 c | \break
  
  des4.(c8) bes2 aes1 \fdendrepeat }
      \tag #'remainder { aes2 aes aes g | aes c c c | \break
  
  f, aes aes g | aes f g1 \bar "||" f2 c' c aes | \break
  
  des c c4.(bes8) aes2 | aes \times 2/3 {g4(aes bes)} aes4.(g8) f2 | des'4.(c8) bes2 aes1 \bar "||" }
}

bass = \relative c { \hidetup \clef bass 
  \tag #'repeatpart { \fdstartrepeat f,2 aes c des | bes c f f | aes \times 2/3 {g2(f4)} e2 f | \break
  
  bes, c f1 \fdendrepeat }
      \tag #'remainder { aes,2 c ees ees | f aes, c c | \break
  
  f ees des ees | f4(ees) des2 c1 \bar "||" des2 aes c des | \break
  
  bes c f f | aes ees aes, des | bes c f1 \bar "||" }
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book {

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
	
} %% Score bracket

%%% A separate score block to unfold the repeat and generate the Hymn Midi	

\score{

\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 48 2)}} 
	
}

%%% Permission line markup

\markup { \hspace #34 \small \smaller \italic "(By permission of W. Gwenlyn Evans, Carnarvon.)" }

%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Zum Frieden" "(" \hspace #-1 \italic "No. 499" \hspace #-1 ")." }

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

%%% Lyric attribution

\markup { \small { \hspace #70 \italic "Bishop A. Cleveland Coxe, 1818-96." } } 
                                                                                                                                                                                                        
%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verse 1), column 2 (a dividing line), column 3 (verse2), with verses 3 and 4 centred below them. 

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HO is this with garments gory,"
			                                "  Triumphing from Bozrah's way;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "This that weareth robes of glory,"
					   "    Bright with more than victory's ray?"
					   "Who is this unwearied comer"
					   "    From his journey's sultry length,"
					   "Travelling through Idumè's summer"
					   "    In the greatness of his strength?"
			  		}} 
			         } %%% finish verse 1
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -21 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "2  "
			   \column {	     
				   "Wherefore red in thine apparel"
				   "    Like the conquerors of earth,"
				   "And arrayed like those who carol"
				   "    O'er the reeking vineyard's mirth?"
				   "Who art thou, the valleys seeking"
				   "    Where our peaceful harvests wave?"
				   "‘I, in righteous anger speaking,"
				   "    I, the mighty One to save;"
			}}
	    } %%% end column 3
     } %%% end master-line
     
     %%% centred verses 3 and 4
     			\hspace #1 
           		\line { \hspace #28 "3  "
			   \column {	     
				   "‘I, that of the raging heathen"
				   "    Trod the winepress all alone,"
				   "Now in victor-garlands wreathen"
				   "    Coming to redeem mine own:"
				   "I am he with sprinkled raiment,"
				   "    Glorious for my vengeance-hour,"
				   "Ransoming, with priceless payment,"
				   "    And delivering with power.’"
			}}
     			\hspace #1 
           		\line { \hspace #18 \italic "Unison. " "4. "
			   \column {	     
				   "Hail! All hail! Thou Lord of Glory!"
				   "    Thee, our Father, thee we own;"
				   "Abram heard not of our story,"
				   "    Israel ne'er our Name hath known."
				   "But, Redeemer, thou hast sought us,"
				   "    Thou hast heard thy children's wail,"
				   "Thou with thy dear Blood hast bought us:"
				   "    Hail! Thou mighty Victor, hail!"
			}}
   } %%% super column bracket
} %%% lyrics markup bracket


%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo des1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 48 2) }}

}


%%% Markup for other hymns also suitable
%%% Hymns are in 3 columns,  column 1 (Hymns), column 2 (a dividing line), column 3 (Hymns)

\markup { \line { \hspace #20 \small \italic "The following are suitable, in addition to several of the Lent Hymns:" } }

\markup { \hspace #16 %%add space as necc. to center the entire block of lyrics

	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
			\small "409  In the Cross of Christ I glory."
	                \small "416  Jesu, meek and lowly."
			\small "418  Jesu, name all names above."                      
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -6 . 1 ) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\small "471  Praise to the Holiest in the height."
	                \small "649  Litany of the Passion."
			\small "656  The Story of the Cross."
	    } %%% end column 3
     } %%% end master-line
} %%% lyrics markup bracket


} %%% book bracket