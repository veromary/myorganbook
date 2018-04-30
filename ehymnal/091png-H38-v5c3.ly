%%%091.png
%%%38 St. Venantius (L. M.) "Why, impious Herod, shouldst thou fear"
%%%Version 5 091png-H38-v5.ly


\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = \markup { \line { \center-align {"38"} \large \smallCaps {"(Modern Tune)"}}}
  poet = \markup { \column { \line { \sans \small {"ST. VENANTIUS."} \hspace #1 \roman \small {"(L. M.)"}} }}
  meter = \markup { \small { \italic {"In moderate time"} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 144. } }
  arranger = \markup { \italic \small {"Rouen Church Melody."}  }
  piece = \markup { \italic \small {"    To be sung in unison."} }
  tagline =""
}  %% close header


global = {
  \time 3/4 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}  %% close global

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

soprano = \relative c' {  
  \partial 4 f4 \nbbar a( c) bes \nbbar a( g) a \nbbar f2 g4 \nbbar a2 \bar "||" \noBreak c4 \nbbar d( c) bes \bar "|" \break
  a( bes) c \nbbar c( bes) a \nbbar g2 \bar "||" \noBreak g4 \nbbar bes( a) g \nbbar f( d) e \bar "|" \break
  f( e4.) d8 \nbbar c2 \bar "||" \noBreak g'4 \nbbar a( f) bes \nbbar a( g) <f a,>4 \nbbar e2 f4 \nbbar f2 \bar "||"
}

alto = \relative c' {
  \partial 4 c4 \nbbar f2( <f d >4) \nbbar <f c >4 ~ <e c >2 \nbbar <d a >2 <e c >4 \nbbar <f c >2 \bar "||" \noBreak <a f >4 \nbbar <bes f >4  <g e >4 ~ <g d >4 \bar "|" \break
  <f d >2 <g e >4 \nbbar <f c >4 <f d >2 \nbbar <d bes >2 \bar "||" \noBreak <e c >4 \nbbar 
      \once\override Tie  #'control-points = #'(( 1.6 . -2.8 )( 4 . -4 ) ( 9 . -4 )(11.6 . -2.8 ))
      <f d >2 ~ 
      \once\override Tie  #'control-points = #'(( 1.8 . -2.8 ) ( 3.6 . -4 ) ( 6 . -4 ) (8 . -2.8 ))
      <d bes >4 ~ \nbbar <d a >4 s2 \bar "|" \break
  s2. \nbbar s2 \bar "||" \noBreak \override TieColumn #'tie-configuration = #'((-3.0 . 1) (-6.5 . -1)) <e c >4 ~ \nbbar <e c >4 d2 \nbbar <f c >4 d s4 \nbbar \tieUp c2 ~ <c a >4 \nbbar <c a >2 \bar "||"
}

tenor = \relative c { \clef bass
  \partial 4 a'4 \nbbar c( a) s \nbbar s c, a \nbbar s2 c4 \nbbar s2 \bar "||" \noBreak s4 \nbbar bes c s \bar "|" \break
  s2 c4 \nbbar a bes s \nbbar s2 \bar "||" \noBreak c4 \nbbar bes s2 \nbbar s4 <f' a >4  <g c~ >4 \bar "|" \break
  <c a >4 <c g >4. \tieDown <b g~ >8 \nbbar <g e >2 \bar "||" \noBreak c,4 \nbbar s4 f g \nbbar s4 \override Accidental #'transparent = ##t bes f \nbbar g2 f,4 \nbbar f2 \bar "||"
}

bass = \relative c { \clef bass
  \partial 4 f4 \nbbar f2 bes,4 \nbbar f' s2 \nbbar d s4 \nbbar f2 \bar "||" \noBreak f4 \nbbar s2 g4 \bar "|" \break
  d2 s4 \nbbar s2 d4 \nbbar 
      <<  { \voiceTwo g2 } 
    \new Voice = "pedals" {\once \override NoteColumn #'force-hshift = #0.1 \voiceFour \set fontSize = #-3 g,2  }  >>
  \bar "||" \noBreak s4 \nbbar s d' g \nbbar d2 c4 \bar "|" \break
  f, c'4. g8 \nbbar c2 \bar "||" \noBreak s4 \nbbar a d g, \nbbar a bes d \nbbar c2 s4 \nbbar s2 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {  
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  page-top-space = 1\mm
  print-page-number = ##f
  next-padding = 2.5\mm
  after-title-space = 1\mm
  between-system-padding = #0.1
  between-system-space = #0.1
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 144 4)
            }
       }
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	  \line { \small { \smallCaps {"Office Hymn.   E."} \italic {"and"} \smallCaps {" M."} \hspace #43 \italic {"C. Sedulius, c. 450.  Tr. P. D."}} }
	  \line { \hspace #42 \small {"Hostis Herodes impie."} }
	    \line { %% a master line of 3 columns
              \column { %% column 1
		\hspace #0.2
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HY, impious Herod, shouldst thou fear" "Because the Christ is come so near?"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"He who doth heavenly kingdoms grant" 
				"Thine earthly realm can never want." 
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Lo, sages from the East are gone" 
			       "To where the star hath newly shone:" 
			       "Led on by light to Light they press," 
			       "And by their gifts their God confess."
		   }}
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -1) #0 }       %%Column 2. This is the line dividing the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3	
		\hspace #0.2	
		\line { "3  "
		    \column {	     
				"The Lamb of God is manifest" 
				"Again in Jordan's water blest," 
				"And he who sin had never known" 
				"By washing hath our sins undone."  	   
	   }} 
	   	\hspace #0.2 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
				"Yet he that ruleth everything" 
				"Can change the nature of the spring," 
				"And gives at Cana this for sign—" 
				"The water reddens into wine." 
 	   }}  

	  } %% end column 3
	  } %% master line bracket
	  
	  \hspace #0.2
	  \line { \hspace #27 "5. "
             \column {    
		     "Then glory, Lord, to thee we pay" 
		     "For thine Epiphany to-day;" 
		     "All glory through eternity" 
		     "To Father, Son, and Spirit be.  Amen." 
 	   }} %% end last stanza
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
                                                  \global \time 5/1 \voiceOne  f1( g1 f1 e1) f1 \bar "||" }}
	\context Voice = "altos" { \relative c' {   \global \time 5/1 \voiceTwo <d a >1 <d bes >1 <c a >1 <c g >1 <c a >1 \bar "||" }}
	 		>>
			 
	\context Lyrics \lyricsto "altos" {  \override LyricText #'font-size = #-1 A1 -1 -1 -1 men.1 }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                 <<
	\context Voice = "basses" { \relative c {  \global \clef bass \time 5/1 \voiceFour d1 g,1 a1 c1 f,1 \bar "||" }}
			 >> 
 >>			 
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
         indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

 }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  %%Amen midi 

} 	
	

} %% book bracket
