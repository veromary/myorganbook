%%%088.png
%%%Hymn 36 Das Walt' Gott Vater O Happy Day
%%%Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE CIRCUMCISION OF CHRIST"
		\hspace #0.1 }}	
  title = "36"
  meter = \markup {  \small { \column {  \line { \sans {"DAS WALT' GOTT VATER."} \hspace #1 \roman {"(L. M.)"}}
                                        \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 46.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "Melody by" \smallCaps "D. Vetter," \italic "c. 1713." } 
  			    \line { \italic  "Adapted and harmonized by" \smallCaps "J. S. Bach."}}}
  tagline =""
}

soprano = \relative c' {
  \partial 2 ees2 | g2 bes2 bes2 g2 | 
      ees2 f2 g2 ^\fermata \bar "||" ees2 | \break 

  bes'2 bes2 c2 d2 | ees4 ( d4 ) c2 bes2 ^\fermata \bar "||" 
      bes2 | g2 bes2 c2 bes2 | \break
      
  aes2 g2 f2^\fermata \bar "||" bes2 | 
      g4 ( aes4 ) bes2 aes2 g4 ( f4 ) | ees2 f2 ees2 ^\fermata \bar "||" 
}

alto = \relative c' {
  bes2 | ees2 ees2 d2 d2 | 
      \once \override Score.SeparationItem #'padding = #2
      \once \override NoteHead #'X-offset = #-2.8 
      \once \override Stem #'X-offset = #-2.8 d4 ( c4 )
      bes2 bes2 \bar "||" bes2 | 
      
  ees2 f2 g4 ( a4 ) bes2 | bes2. a4 f2 \bar "||" 
      f2 | 
      \once \override Score.SeparationItem #'padding = #2
      \once \override NoteHead #'X-offset = #-2.8 
      \once \override Stem #'X-offset = #-2.8 
      f4 ( ees8 d8 ) ees2 ees2 ees2 | 
      
  \once \override Score.SeparationItem #'padding = #2
      \once \override NoteHead #'X-offset = #-1.6
      \once \override Stem #'X-offset = #-1.6
      f4( bes,4 ) bes4 ( ees4 ) 
      \once \override Score.SeparationItem #'padding = #2
      \once \override NoteHead #'X-offset = #-2.8 
      \once \override Stem #'X-offset = #-2.8
      ees4 ( d4 )_\fermata \bar "||" f2 | 
      ees2 ees2 ees2 d2 | c4 ees2 ( d4 ) ees2  \bar "||" 
}

tenor = \relative c { \clef bass
  g'2 | bes2 bes2 f2 g2 | 
      g2 f2 ees2  \bar "||" g2 | 
      g2 bes2 ees2 d2 | << {g2 } 
                           \new Voice = "alt" { \voiceThree 
                           \set fontSize = #-3 \override Stem #'length = #5 
                           \once \override NoteColumn #'force-hshift = #0.2
                            g,2 } 
			>> 
      c2 d2  \bar "||" 
      bes2 | bes2 bes2 bes4 ( aes4 ) aes4 ( g4 ) | 
      
  f2 g4. ( aes8 ) bes2  \bar "||" bes2 | 
      bes2 bes2 c2 bes4 ( aes4 ) | g2 bes4. ( aes8 ) g2  \bar "||" 
}

bass = \relative c { \clef bass
  ees2 | ees2 g,4 ( aes4 ) bes2 b2 | 
      c2 d2 ees2 _\fermata \bar "||" ees2 | 
     
  ees2. d4 c2 g'4 ( f4 ) | ees2 f2 bes,2 _\fermata \bar "||" 
      d2 | ees2 g4 ( ees4 ) c2 ees2 | 
    
  \once \override Score.SeparationItem #'padding = #2
      \once \override NoteHead #'X-offset = #-2.8
      \once \override Stem #'X-offset = #-2.8
      ees4 ( d4 ) ees2 bes2 _\fermata \bar "||" d2 | 
      ees2 g,2 aes2 bes2 | c2 bes2 ees2 _\fermata \bar "||"
}

global = {
  \time 4/2 
  \key ees \major 
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

\markup {
	\column {
	    \line { \small { \hspace #10 \italic { "(Office Hymns, E. M. 18, M. 17.)"} \hspace #25 \italic {"S. Besnault, d. 1724.   Tr. J. Chandler."}  }  }
	    \line { \hspace #42 \small "Felix dies quem proprio."}
   }}

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " HAPPY day, when first was poured"  "  The blood of our redeeming Lord!" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O happy day, when first began"
					   "His sufferings for sinful man!"
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Just entered on this world of woe,"
				   "His blood already learned to flow;"
				   "His future death was thus expressed,"
				   "And thus his early love confessed."
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
           	  \hspace #1  %% extra blank line -- helps those who print on Letter size paper.
		  \line { "3  "
		    \column {	     
			    "From heaven descending to fulfil"
			    "The mandates of his Father's will,"
			    "E'en now behold the victim lie,"
			    "The Lamb of God, prepared to die!"
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Lord, circumcise our hearts, we pray,"
			    "Our fleshly natures purge away;"
			    "Thy name, thy likeness may they bear:"
			    "Yea, stamp thy holy image there!"
			}}  
		\hspace #1 % adds vertical spacing between verses
           	\line { "5. "
		   \column {	     
			   "O Lord, the virgin-born, to thee"
			   "Eternal praise and glory be,"
			   "Whom with the Father we adore,"
			   "And Holy Ghost for evermore.   Amen."
     			}}
	  }
}% lyric markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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
