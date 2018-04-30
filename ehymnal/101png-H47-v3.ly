%%% 101.png (1st system on 100png)
%%% Hymn 47 St Edmund. Songs of thankfulness and praise
%%% Version 3

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM EPIPHANY TILL SEPTUAGESIMA" } 
					       \hspace #1
						} }	
   title = "47" 
			       
  arranger = \markup { \small \smallCaps "C. Steggall, 1826-1905."}
  poet = \markup { \small { \sans { "ST. EDMUND." } \hspace #1 \roman { "(7 7. 7 7. D.)"} } }
  meter = \markup { \small { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.} }
  tagline = ""
}


global = {
  \time 4/4	
  \key  g \major	
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  b'4 d4 a4 b4 | g4 e4 d2 | e4 g4 a4 b4 | a4 a4 a2 \bar "||" \break
  b4 d4 a4 b4 | g4 e4 d2 | e4 g4 a4 b4 | a4 a4 g2 \bar "||" \break
  e4 g4 d4 d4 | g4 a4 b2 | b4 c4 b4 g4 | fis4 fis4 e2 \bar "||" \break
  g4. g8 a4 a4 | b4 b4 c2 | a4 d4 g,4 c4 | a4 a4 g2 \bar "||" 
}

alto = \relative c' {
  d4 d4 d4 d4 | d4 c4 b2 | c4 d4 d4 d4 | d4 cis4 d2 \bar "||" \break
  d4 d4 d4 d4 | d4 c4 b2 | c4 d4 c4 d4 | d4. c8 b2 \bar "||" \break
  c4 c4 c4 b4 | b4 e4 dis2 | e4 e4 dis4 e4 | e4 dis4 e2 \bar "||" \break
  e4. d!8 c4 d4 | d4 e4 e2 | d4 d4 b4 e4 | d4. c8 b2 \bar "||" 
}

tenor = \relative c { \clef bass
  g'4 g4 fis4 g4 | g4 g4 g2 | g4 g4 fis4 g8[ fis8] | e4 e4 fis2 \bar "||" \break
  g4 g4 fis4 g4 | g4 g4 g2 | g4 g4 fis4 g4 | g4 fis4 g2 \bar "||" \break
  g4 g4 g4 g4 | g4 e4 fis2 | g4 a8[ g8] fis4 g8[ a8] | b4. a8 g2 \bar "||" \break
  g4. g8 e4 fis4 | g4 g4 a2 | fis4 g4 g4 g4 | g4 fis4 g2 \bar "||" 
}

bass = \relative c { \clef bass
  g4 b4 d4 g4 | b,4 c4 g2 | c4 b4 d4 g,4 | a4 a4 d2 \bar "||" \break
  g,4 b4 d4 g4 | b,4 c4 g2 | c4 b4 a4 g4 | d'4 d4 g,2 \bar "||" \break
  c4 e4 g4 g,4 | e'4 c4 b2 | e4 a,4 b4 e4 | b4 b4 e2 \bar "||" \break
  c4. b8 a4 d4 | g,4 e'4 a,2 | d4 b4 e4 a,4 | d4 d4 g,2 \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
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
	}
	
\midi { 
   \context {
       \Score  tempoWholesPerMinute = #(ly:make-moment 100 4 ) }
       }
	
}

\markup { \hspace #37 \small \smaller {  "[" \italic "By permission of Novello & Co. Ltd." "]" } }

%%second page
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f composer = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}


\markup { \hspace #46 \small { \hspace #20 \italic {"Bishop Chr. Wordsworth, 1807-85."}  } }

\markup { \hspace #4   %%add space as necc. to center the column
          \column { 
		  \line { %% a master line of 3 columns
		     \column { %% column 1
		       \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ONGS of thankfulness and praise,"  "  Jesu, Lord, to thee we raise," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Manifested by the star"
					   "To the sages from afar;"
					   "Branch of royal David's stem"
					   "In thy birth at Bethlehem;"
					   "Anthems be to thee addrest,"
					   "God in Man made manifest."
			  		}} 
		       } %% finish verse 1
		       \hspace #1 % adds vertical spacing between verses
			\line { "2  "
			   \column {	     
				   "Manifest at Jordan's stream,"
				   "Prophet, Priest, and King supreme;"
				   "And at Cana wedding-guest"
				   "In thy Godhead manifest;"
				   "Manifest in power divine,"
				   "Changing water into wine;"
				   "Anthems be to thee addrest,"
				   "God in Man made manifest."
			}}
		  } %% finish Page column 1
		  
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -46 . 1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3	
						
		  \line { "3  "
		    \column {	     
			    "Manifest in making whole"
			    "Palsied limbs and fainting soul;"
			    "Manifest in valiant fight,"
			    "Quelling all the devil's might;"
			    "Manifest in gracious will,"
			    "Ever bringing good from ill;"
			    "Anthems be to thee addrest,"
			    "God in Man made manifest."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "* Sun and moon shall darkened be,"
			    "Stars shall fall, the heavens shall flee;"
			    "Christ will then like lightning shine,"
			    "All will see his glorious sign;"
			    "All will then the trumpet hear,"
			    "All will see the Judge appear;"
			    "Thou by all wilt be confest,"
			    "God in Man made manifest."
			}}  
	      } %% end-column 3
	} %%end master-line	  
	  	\hspace #1 % adds vertical spacing between verses
           	\line { \hspace #27 "5. "
		   \column {	     
			   "Grant us grace to see thee, Lord,"
			   "Mirrored in thy holy word;"
			   "May we imitate thee now,"
			   "And be pure, as pure art thou;"
			   "That we like to thee may be"
			   "At thy great Epiphany,"
			   "And may praise thee, ever blest,"
			   "God in Man made manifest."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
}  

} %% book bracket
