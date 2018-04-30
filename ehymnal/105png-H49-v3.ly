%%%105.png
%%%Hymn 49 Modern Tune St.Gregory Creator of the Earth and Sky
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT"
		\hspace #0.1 }}	
		title = \markup { "49 " \large \smallCaps "(Modern Tune)" }
  meter = \markup {  \small { \column {  \line { \sans {"ST. GREGORY (ZEUCH MEINEN GEIST)."} \hspace #1 \roman {"(L. M.)"}}
                                        \line { \italic {Slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 50.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "From" "K" \hspace #-1.2 \teeny "ÖNIG'S" \italic "Choralbuch (1738)" } 
  			    \line { \italic  "(slightly altered)."}}}
  tagline =""
}

soprano = \relative c' {
  \partial 2 bes'2 | g2 bes2 c2 ees2 | bes2 aes2 g2^\fermata \bar "||" bes2 | \break
  ees,2 g2 aes2 g2 | f2 ees2 f2 ^\fermata \bar "||" bes2 | g2 bes2 c2 ees2 | \break
  bes2 aes2 g2^\fermata \bar "||" bes2 | ees,2 g2 aes2 g2 | f2 f2 ees2^\fermata \bar "||"
}

alto = \relative c' {
  g'2 | ees2 ees2 ees2 ees4( g4) | f4( ees4) f4( d4) ees2 \bar "||" f2 |
  ees2 ees2 ees2 ees2 | bes2 ees2 d2 \bar "||" f2 | ees2 ees2 aes2 bes2 |
  f4( ees4) f4( d4) ees2 \bar "||" d2 | ees2 ees2 ees2 ees2 | ees2 d2 ees2 \bar "||"
}

tenor = \relative c { \clef bass
  bes'2 | bes2 ees4( d4) c2 bes2 | bes2 bes2 bes2 \bar "||" bes2 |
  g2 c2 c2 bes2 | f2 g2 bes2 \bar "||" bes2 | bes2 bes2 aes2 g4( aes4) |
  bes2 bes2 bes2 \bar "||" bes2 | g2 g2 c2 bes2 | c2 bes4( aes4) g2 \bar "||"
}

bass = \relative c { \clef bass
  ees2 | ees4( f4) g2 aes2 g4( ees4) | d4( c4) d4( bes4) ees2_\fermata \bar "||" d2 |
  c4( d4) c4( bes4) aes2 ees'2 | d2 c2 bes2_\fermata \bar "||" d2 | ees4( f4) g2 f2 ees2 |
  d4( c4) d4( bes4) ees2_\fermata \bar "||" g,2 | c4( d4) c4( bes4) aes2 ees'2 | aes,2 bes2 ees2_\fermata \bar "||"

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
       tempoWholesPerMinute = #(ly:make-moment 50 2)
            }
       }
	
} %%score bracket

\markup {
	\column {
	    \line { \small { \hspace #10 \smallCaps "Office Hymn." \italic "Saturday," "E." \hspace #25 \italic "St. Ambrose, 340-97.   Tr. C. B."  }  }
	    \line { \hspace #40 \small "Deus Creator omnium."}
} }
   
   
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "REATOR of the earth and sky,"  "  Ruling the firmament on high,"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
"Clothing the day with robes of light,"
"Blessing with gracious sleep the night,"
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
"That rest may comfort weary men,"
"And brace to useful toil again,"
"And soothe awhile the harassed mind,"
"And sorrow's heavy load unbind:"
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
"Day sinks; we thank thee for thy gift;"
"Night comes; and once again we lift"
"Our prayer and vows and hymns that we"
"Against all ills may shielded be."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
"Thee let the secret heart acclaim,"
"Thee let our tuneful voices name,"
"Round thee our chaste affections cling,"
"Thee sober reason own as King."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
"That when black darkness closes day,"
"And shadows thicken round our way,"
"Faith may no darkness know, and night"
"From faith's clear beam may borrow light."
		}}
							\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
"Rest not, my heaven-born mind and will;"
"Rest, all ye thoughts and deeds of ill;"
"May faith its watch unwearied keep,"
"And cool the dreaming warmth of sleep."
		}}
							\hspace #1 % adds vertical spacing between verses  
           	\line {"7  "
		    \column {	     
"From cheats of sense, Lord, keep me free,"
"And let my heart's depth dream of thee;"
"Let not my envious foe draw near,"
"To break my rest with any fear."
		}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "8. "
		   \column {	     
"Pray we the Father and the Son,"
"And Holy Ghost: O Three in One,"
"Blest Trinity, whom all obey,"
"Guard thou thy sheep by night and day.     Amen." 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi       
       
}  

} %%book bracket