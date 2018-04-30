%%% 123.png
%%% Hymn 65 Modern Tune Jesu Corona. The fast, as taught by holy lore
%%% Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = \markup { "65 " \large \smallCaps "(Modern Tune)" }
			       
  arranger = \markup { \small {\italic "Rouen Church Melody."} }
  poet = \markup { \small { \sans  "JESU CORONA." \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 144.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%% Macro Definitions

%%% pushes notes slightly to the right
push = \once \override NoteColumn #'force-hshift = #0.5

%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% SATB voices

global = {
 \time 3/4 
 \key d \minor 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d4^\markup { \italic "To be sung in unison." } | f2 g4 | a4( g4) a4 | f2 e4 | d2 \bar "||" d'4 | c2 d4 | \break  
  e4( d4) c4 | b2 a4 | a2 \bar "||" a4 | bes2 g4 | e4( f4) g4 | \break
  a4( g4.) f8 | f2 \bar "||" c'4 | a4( g4) e4 | f4( < e g>4) < f a >4 | f4( e4.) d8 | d2 \bar "||"
}

alto = \relative c' { 
  s4 | < a d >2 < c e >4 | << { f4 e4 } \new Voice="hightenor" { \voiceFour \push c2 } >>  <c f>4 | < f, c' >2 < g c >4 | < f a >2 \bar "||" < d' f >4 | e2 g4 | 
  g2 e4 | < d g >2 < c e >4 | < c e >2 \bar "||" d4 | d2 d4 | e4 d4 e4 | 
  < c e>2 ~ < c e >8[ < a  c >8] | < a c >2 \bar "||" f'4 | < c f>4 < bes d >4 < a c >4 | < a d >4 c2 | 
      c4 < g c>4. < f a >8 | < f  a>2 \bar "||" 
}

tenor = \relative c { \clef bass 
  f4 | d2 c4 | \stemDown f4( \stemUp c4) f,4 | a2 c4 | d2 \bar "||" a'4 | a2 b4 | 
  c4 b4 c4 | g2 e4 | e2 \bar "||"  f4 |  g2 g4 | c4  a4  c4 |
  a,4 c4. \stemDown f8 | f2 \bar "||"  \stemUp a4 | f,4 g4 a4 | d4 c4 \stemDown f4 | \stemUp f4 c4. d8 | d2 \bar "||" 
}

bass = \relative c { \clef bass 
  d4 | s2. | s2. | s2. | s2 \bar "||" d4 | a'2 g4 |
  c,4 g'4 a4 | g,2 a4 | a2 \bar "||" d4 | g,2 bes4 | c4 d4 c4 |
  s2. | s2 \bar "||" f4 | s2. | s2. | a,4 s2 | s2 \bar "||"
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
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>       
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
 
\layout {
	indent=0
%	\context { \Score timing = ##f }
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
	
} %%% score bracket

%%% Text markups - lyrics titles

\markup {
	\column { \small {
		\line { \hspace #10 \smallCaps "Office Hymn." "  E." \italic "  Till Lent" "iii." \hspace #25  \italic "c. 6th cent.  Tr. J. M. Neale." }
		                                                                                                     
	    \line { \hspace #42 \small "Ex more docti mystico."}
} } } 

%%% Main lyrics markup block
  
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE fast, as taught by holy lore,"  "  We keep in solemn course once more:"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The fast to all men known, and bound"
					   "In forty days of yearly round."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "The law and seers that were of old"
				   "In divers ways this Lent foretold,"
				   "Which Christ, all seasons' King and guide,"
				   "In after ages sanctified."
			}}		
		}  
}	  

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

	
%%% second page
%%% Continuation of lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		  \line { "3  "
		    \column {	     
			    "More sparing therefore let us make"
			    "The words we speak, the food we take,"
			    "Our sleep and mirth,—and closer barred"
			    "Be every sense in holy guard."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "In prayer together let us fall,"
			    "And cry for mercy, one and all,"
			    "And weep before the Judge's feet,"
			    "And his avenging wrath entreat."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "Thy grace have we offended sore,"
			    "By sins, O God, which we deplore;"
			    "But pour upon us from on high,"
			    "O pardoning One, thy clemency."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "Remember thou, though frail we be,"
			    "That yet thine handiwork are we;"
			    "Nor let the honour of thy name"
			    "Be by another put to shame."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"7  "
		    \column {	     
			    "Forgive the sin that we have wrought;"
			    "Increase the good that we have sought;"
			    "That we at length, our wanderings o'er,"
			    "May please thee here and evermore."
		}}
		\hspace #1 % adds vertical spacing between verses  
		\line {"8. "
		    \column {	     
			    "We pray thee, Holy Trinity,"
			    "One God, unchanging Unity,"
			    "That we from this our abstinence"
			    "May reap the fruits of penitence.     Amen."
		}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d2( e2 d2 c2) \bar "|" d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo a2 c2 d2 a2 \bar "|" a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree  f2 c'2 f,1 \bar "|" f1  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d2 c2 bes2 f2 \bar "|" d1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}    
       
}  

} %%book bracket