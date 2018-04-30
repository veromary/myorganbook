%%%085.png
%%%Hymn 33 TANTUM ERGO Word Supreme
%%%Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ST. JOHN THE EVANGELIST"
		\hspace #0.1 }}	
  title = "33"
  meter = \markup {  \small { \column {  \line { \sans {"TANTUM ERGO."} \hspace #1 \roman {"(8 7. 8 7. 8 7.)"}}
                                        \line { \italic {Moderately slow, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "Melody from" \smallCaps "S. Webbe's" } 
  			    \line { \italic  "'Motetts or Antiphons,' 1792."}}}
  tagline =""
}

soprano = \relative c' {
  g'2 a2 b2 c2 | d2 c2 b2 a2 \bar "||" g2 g2 g2 c2 | b2 a2 g1 \bar "||" 
  e2 e2 d2 d2 | g2 g2 g2 fis2 \bar "||" a2 d2 cis4( b4) a4( g4) | fis2 e2 d1 \bar "||" 
  fis2 fis2 g2 d2 | e2 fis2 g2 a2 \bar "||" b4( a4) g4( fis4) e2 c'2 | b2 a2 g1 \bar "||" 
}

alto = \relative c' {
  d2 d2 d2 g2 | fis2 e4( d4) d2 d2 \bar "||" b2 d2 e2 e2 | d2. c4 b1 \bar "||" 
  c2 c2 b2 b2 | b2 d2 d2 d2 \bar "||" d2 d2 d2 e2 | d2 cis2 \once \override NoteColumn #'force-hshift = #0.02 d1 \bar "||" 
  d2 d2 d2 b2 | e2 dis2 e2 fis2 \bar "||" g2 d2 c2 e2 | d2. c4 b1 \bar "||" 
}

tenor = \relative c { \clef bass
  b'2 a2 g2 g2 | a2 g4( a4) g2 fis2 \bar "||" g2 g2 g2 g2 | g2 fis2 g1 \bar "||" 
  g2 g2 g4( a4) b4( c4) | d2 b2 b2 a2 \bar "||" fis2 a2 g2 b2 | a2. g4 fis1 \bar "||" 
  a2 a2 g2 g2 | g2 b2 b2 d2 \bar "||" d2 g,2 g2 g2 | g2 fis2 g1 \bar "||" 
}

bass = \relative c { \clef bass
  g'2 fis2 g2 e2 | d2 e4( fis4) g2 d2 \bar "||" e2 b2 c2 a2 | d2 d2 g,1 \bar "||" 
  c2 c2 g'2 g2 | g,4( a4) b4( c4) d2 d2 \bar "||" d2 fis2 g2 e2 | a,2 a2 d1 \bar "||" 
  d2. c4 b2 g2 | c2 b2 e2 d2 \bar "||" g2 b,2 c2 a2 | b4( c4) d2 g,1 \bar "||" 
}

global = {
  \time 4/2 
  \key g \major 
  \set Staff.midiInstrument = "church organ"
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
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 46 2)
            }
       }
	
} %%score bracket

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  \line { \hspace #-10 \smallCaps "Note." "—" \italic "A higher setting of this tune will be found at Hymn 63." } 
		  \hspace #1
		  \line { \hspace #-10 \small {  \italic { "(Office Hymns, 174-6.)"} \hspace #25 \italic {"J. Keble, 1792-1866."}  }  } 
		  \hspace #1
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD supreme, before creation" "   Born of God eternally," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who didst will for our salvation"
					   "    To be born on earth, and die;"
					   "Well thy Saints have kept their station,"
					   "    Watching till thine hour drew nigh."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Now 'tis come, and faith espies thee;"
				   "    Like an eaglet in the morn,"
				   "One in steadfast worship eyes thee,"
				   "    Thy beloved, thy latest born:"
				   "In thy glory he descries thee"
				   "    Reigning from the tree of scorn."
			}}		
		}  
}	  
	
%%second page
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
           	\line { "3  "
		    \column {	     
			    "* He first hoping and believing"
			    "    Did beside the grave adore;"
			    "Latest he, the warfare leaving,"
			    "    Landed on the eternal shore;"
			    "And his witness we receiving"
			    "    Own thee Lord for evermore."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "* Much he asked in loving wonder,"
			    "    On thy bosom leaning, Lord!"
			    "In that secret place of thunder,"
			    "    Answer kind didst thou accord,"
			    "Wisdom for thy Church to ponder"
			    "    Till the day of dread award."
			}}  
		\hspace #1 % adds vertical spacing between verses
           	\line { "5  "
		   \column {	     
			   "Lo! heaven's doors lift up, revealing"
			   "    How thy judgements earthward move;"
			   "Scrolls unfolded, trumpets pealing,"
			   "    Wine-cups from the wrath above,"
			   "Yet o'er all a soft voice stealing—"
			   "    'Little children, trust and love!'"
     			}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "6. "
		   \column {	     
			   "Thee, the Almighty King eternal,"
			   "    Father of the eternal Word;"
			   "Thee, the Father's Word supernal,"
			   "    Thee, of both, the Breath adored;"
			   "Heaven, and earth, and realms infernal"
			   "Own, one glorious God and Lord.  Amen."
     			}}	
	  }
}% lyric markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }}  %%Amen midi       
       
}  


} %%book bracket