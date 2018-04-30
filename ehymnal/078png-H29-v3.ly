%%%078.png
%%%Hymn 29 A Virgin Unspotted.  (11 11. 11 11. and refrain.)
%%%Rev 3.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "29"
  poet = \markup { \small {  \line { \sans {"A VIRGIN UNSPOTTED."} \hspace #1 \roman {"(11 11. 11 11. and refrain.)"}} }}
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 96.} }
  arranger =  \markup { \small \italic "English Traditional Carol."}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%macros

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar
	      
%%prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%%prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	          \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	                                                 \raise #1.4 \column { \with-color #black { 
							                \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	          } }	
                 \bar "|:"}

%%
movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
		 		 
%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions


global = {
\time 3/4
\key g \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { \partial 4 \autoBeamOff
  \fdstartrepeat << { \movenote #0.5 d4 } 
      	\new Voice = alt { \voiceThree \autoBeamOff \movenote #-1
      	\set fontSize = #-3 \override Stem #'length = #5 d8 d8 } >>   \nbbar 
      	g4 b4 d4 \nbbar d8[ c8] b4 g8[a8] \nbbar b4 c8[ b8] a4 \nbbar g2 \fdendrepeat \break
  fis8[g8] \nbbar a4 e4 a8[g8] \nbbar fis8[ e8] d4 d4 \nbbar g4 g8[a8] b8[g8] \bar "|" \break 
  c2 b8[a8] \nbbar g4 b4 d4 \nbbar d8[c8] b4 g8[a8] \nbbar b4 c8[b8] a4 \nbbar g2 \bar "||" \break
  fis8^\markup { \smallCaps "Refrain." } [   g8] \nbbar a4 e4 a8[g8] \nbbar fis8[e8] d4 d4 \nbbar g4 g8[a8] b8[g8] \bar "|" \break
  c2 b8[a8] \nbbar g4 b4 d4 \nbbar d8[c8] b4 g8[a8] \nbbar b4 c8[b8] a4 \nbbar g2 \bar "||" 
}

alto = \relative c' { \partial 4  
  \fdstartrepeat << { \movenote #0.5 d4 } 
        \new Voice = alt { \voiceFour \autoBeamOff
	\set fontSize = #-3 \override Stem #'length = #5 d8 d8 } >>  \nbbar 
        d4 g4 g4 \nbbar d4 d4 g4 \nbbar g4 g4 fis4 \nbbar g2 \fdendrepeat \break
  d4 \nbbar e4 e4 e4 \nbbar d4 a4 a4 \nbbar d4 d4 f4 \bar "|" \break
  e2 fis!4 \nbbar g4 g4 g4 \nbbar d4 d4 g4 \nbbar g4 g4 fis4 \nbbar g2 \bar "||" \break
  d4 \nbbar e4 e4 e4 \nbbar d4 a4 a4 \nbbar d4 d4 f4 \bar "|" \break
  e2  fis!4 \bar "|" g4 g4 g4 \bar "|" d4 d4 g4 \bar "|" g4 g4 fis4 \bar "|" g2 \bar "||"
}

tenor = \relative c { \clef bass \partial 4
  \fdstartrepeat << { \movenote #0.5 b'4 } 
  	\new Voice = alt { \voiceThree \autoBeamOff \movenote #-1
	\set fontSize = #-3 \override Stem #'length = #5 b8 b8 } >> \nbbar 							      
        b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 \fdendrepeat \break
  b4 \nbbar cis4 cis8[b8] a4 \nbbar a8[g8] fis4 fis4 \nbbar g4 g4 d'4 \bar "|" \break	
  c2 d8[c8] \nbbar b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 \bar "||" \break
  a8[b8] \nbbar cis4 cis8[b8] a4 \nbbar a8[g8] fis4 fis4 \nbbar g4 g4 d'4 \bar "|" \break
  c2 d8[c8] \nbbar b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 \bar "||"
}

bass = \relative c {\clef bass \partial 4
  \fdstartrepeat << { \movenote #0.5 g'4 } 
  	\new Voice = alt { \voiceFour \autoBeamOff
	\set fontSize = #-3 \override Stem #'length = #5 g8
        _\markup { \normalsize \italic { (Small notes for verse 6, line 2). } }  g8 } >> \nbbar 
        g4 g4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 \fdendrepeat \break
  b,4 \nbbar a4 a8[b8] cis4 \nbbar d4 d8[e8] d8[c8] \nbbar b4 b4 g4 \bar "|" \break
  a2 d4 \nbbar g,4 g'4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 \bar "||" \break 
  d4 \nbbar a4 a8[b8] cis4 \nbbar d4 d8[e8] d8[c8] \nbbar b4 b4 g4 \bar "|" \break
  a2 d4 \nbbar g,4 g'4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
   #(set-paper-size "a4")
%%  annotate-spacing = ##t
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
	
	
} %%score bracket

\markup{ \hspace #15  "      [" \italic "In one or more verses the first part of this tune may be sung as a solo." "]" } 


%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}

\markup { \column  { \hspace #1 %% adds space on top to help those who use letter-size
          \line {  \hspace #16 \small \italic {"Suitable till Candlemas." \hspace #38   "H. R. Bramley." } } } }

\markup { \hspace #25   %%add space as necc. to center the column
          \column { 
	        
		     \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE great God of heaven is come down to earth," "   His mother a Virgin, and sinless his birth;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Father eternal his Father alone:"
					   "He sleeps in the manger; he reigns on the throne:"
					  }}
					  \hspace #1
					  \line { \italic "             Then let us adore him, and praise his great love:"}
					  \line { \italic "             To save us poor sinners he came from above."}
			  		
			       
			           } %% finish stanza 1	
				   
	       	\hspace #1 
		\hspace #1
           	\line { "2  "
			\column {	     
				"A Babe on the breast of a Maiden he lies,"
				"Yet sits with the Father on high in the skies;"
				"Before him their faces the Seraphim hide,"
				"While Joseph stands waiting, unscared, by his side:"
			}}
			       	\hspace #1 
           	\line { "3  "
			\column {	     
				"Lo! here is Emmanuel, here is the Child,"
				"The Son that was promised to Mary so mild;"
				"Whose power and dominion shall ever increase,"
				"The Prince that shall rule o'er a kingdom of peace:"
			}}
	       	\hspace #1 
           	\line { "4  "
			\column {	     
				"The Wonderful Counsellor, boundless in might,"
				"The Father's own image, the beam of his light;"
				"Behold him now wearing the likeness of man,"
				"Weak, helpless, and speechless, in measure a span:"
			}}
		\hspace #1 
           	\line { "5  "
			\column {	     
				"O wonder of wonders, which none can unfold:"
				"The Ancient of days is an hour or two old;"
				"The Maker of all things is made of the earth,"
				"Man is worshipped by Angels, and God comes to birth:"
			}}
	       	\hspace #1 
           	\line { "6. "
			\column {	     
				"The Word in the bliss of the Godhead remains,"
				"Yet in flesh comes to suffer the keenest of pains;"
				"He is that he was, and for ever shall be,"
				"But becomes that he was not, for you and for me." 
			}}
	  }
}

%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  
  \unfoldRepeats  {  \repeat volta 2 { d4  \nbbar 
        g4 b4 d4 \nbbar d8 c8 b4 g8[a8] \nbbar b4 c8 b8 a4 \nbbar g2 }} \break
  fis8[g8] \nbbar a4 e4 a8[g8] \nbbar fis8 e8 d4 d4 \nbbar g4 g8[a8] b8[g8] \bar "|" \break 
  c2 b8[a8] \nbbar g4 b4 d4 \nbbar d8[c8] b4 g8[a8] \nbbar b4 c8[b8] a4 \nbbar g2 \bar "||" \break
  fis8^\markup { \smallCaps "Refrain" } [   g8] \nbbar a4 e4 a8[g8] \nbbar fis8[e8] d4 d4 \nbbar g4 g8[a8] b8[g8] \bar "|" \break
  c2 b8[a8] \nbbar g4 b4 d4 \nbbar d8[c8] b4 g8[a8] \nbbar b4 c8[b8] a4 \nbbar g2 \bar "||" 

}
}

\new Staff = "alto" {\relative c' {\clef treble \global 
  \unfoldRepeats {   \repeat volta 2 {  d4   \nbbar 
        d4 g4 g4 \nbbar d4 d4 g4 \nbbar g4 g4 fis4 \nbbar g2 }} \break
  d4 \nbbar e4 e4 e4 \nbbar d4 a4 a4 \nbbar d4 d4 f4 \bar "|" \break
  e2 fis4 \nbbar g4 g4 g4 \nbbar d4 d4 g4 \nbbar g4 g4 fis4 \nbbar g2 \bar "||" \break
  d4 \nbbar e4 e4 e4 \nbbar d4 a4 a4 \nbbar d4 d4 f4 \bar "|" \break
  e2  fis4 \bar "|" g4 g4 g4 \bar "|" d4 d4 g4 \bar "|" g4 g4 fis4 \bar "|" g2 \bar "||"

}	
}

\new Staff = "tenor" { \relative c {\clef bass \global 
  \unfoldRepeats {   \repeat volta 2 { b'4  \nbbar 							      
        b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 }} \break
  b4 \nbbar cis4 cis8[b8] a4 \nbbar a8[g8] fis4 fis4 \nbbar g4 g4 d'4 \bar "|" \break	
  c2 d8[c8] \nbbar b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 \bar "||" \break
  a8[b8] \nbbar cis4 cis8[b8] a4 \nbbar a8[g8] fis4 fis4 \nbbar g4 g4 d'4 \bar "|" \break
  c2 d8[c8] \nbbar b4 d4 b4 \nbbar a4 g4 b8[c8] \nbbar d4 e8[d8] c4 \nbbar b2 \bar "||"

} 
}


\new Staff = "bass" { \relative c { \clef bass \global 
  \unfoldRepeats {   \repeat volta 2 { g'4  \nbbar 
        g4 g4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 }} \break
  b,4 \nbbar a4 a8[b8] cis4 \nbbar d4 d8[e8] d8[c8] \nbbar b4 b4 g4 \bar "|" \break
  a2 d4 \nbbar g,4 g'4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 \bar "||" \break 
  d4 \nbbar a4 a8[b8] cis4 \nbbar d4 d8[e8] d8[c8] \nbbar b4 b4 g4 \bar "|" \break
  a2 d4 \nbbar g,4 g'4 g4 \nbbar fis4 g4 e4 \nbbar d4 c4 d4 \nbbar g2 \bar "||"
}
}


>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 96 4)
            }
       }
} %% midi score bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                        <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi 

} 

} %%book bracket