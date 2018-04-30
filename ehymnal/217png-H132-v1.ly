%%%% 217.png
%%%% Hymn 132. Gott Des Himmels. He is risen, he is risen:
%%%% Rev 1.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
  title = "132"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "GOTT DES HIMMELS."} \hspace #1 \roman {"(8 7. 8 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 120.} }
  
  arranger = \markup { \column { \small \smallCaps "H. Albert, 1604-51." 
                                 "        "  %%% blank line to force a bit of space before the music staff
  }}
  
  tagline =""
}


%%% SATB voices

global = {
  \time 3/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  	
  g'2 a4 | b( d) c | b( g) fis | e2 d4 | e2 fis4 | g2 a4 | b4 a2 | g2. \bar "||" \break
  g2 a4 | b( d) c | b( g) fis | e2 d4 | e2 fis4 | g2 a4 | b4 a2 | g2. \bar "||" \break
  b2 fis4 | g( b) a | g( fis) e | fis2. | g2 a4 | b( c) b | a( g) a | g2. \bar "||" 
} 
   
alto = \relative c' {  
  d2 d4 | d2 e4 | d2 d4 | c2 b4 | c2 c4 | d2 e4 | d2 c4 | b2. \bar "||"
  e2 d4 | d2 e4 | d2 d4 | cis2 a4 | c!2 c4 | b2 e4 | d2 c4 | b2. \bar "||"
  b2 b4 | b4( cis) d | e( d) cis | d2. | b2 d4 | d( e) d | e2 fis4 | g2. \bar "||"
}

tenor = \relative c {\clef bass  
  b'2 d4 | b2 g4 | g2 g4 | g2 g4 | g2 a4 | g2 e4 | g2 fis4 | g2. \bar "||"
  b2 d4 | b2 g4 | g2 a4 | a( g) fis | g2 a4 | g2 e4 | g2 fis4 | g2. \bar "||"
  g2 b4 | g2 a4 | b2 cis4 | a2. | g2 fis4 | g2 g4 | c4( b) d | b2. \bar "||"
}

bass = \relative c {\clef bass  
  g'2 fis4 | g2 c,4 | g2 b4 | c2 g4 | c2 a4 | b2 c4 | d2 d4 | g,2. \bar "||"
  e'2 fis4 | g2 c,4 | g2 d'4 | a2 d4 | c2 a4 | e'2 c4 | d2 d4 | g,2. \bar "||"
  e'2 dis4 | e2 fis4 | g2 a4 | d,2. | e2 d4 | g2 g4 | c,4( e) d | g,2. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4)}} 

} %%% Score bracket

%%% Lyric Attribution 

\markup { \small { \hspace #64 \italic "Mrs. C. F. Alexander, 1823-95." } }

\markup { "         "} %%% force a blank line

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E is risen, he is risen:"
			                                 "  Tell it with a joyful voice;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "He has burst his three days' prison;"
					   "    Let the whole wide earth rejoice."
					   "Death is conquered, man is free,"
					   "Christ has won the victory."
			  		}} 
			         } %%% finish verse 1	
					  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Come, ye sad and fearful-hearted,"
				   "    With glad smile and radiant brow;"
				   "Lent's long shadows have departed,"
				   "    All his woes are over now,"
				   "And the passion that he bore:"
				   "Sin and pain can vex no more."
			}}    
    }	%%% end super column  
}	

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


%%% second page
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "3. "			  
				\column {	     
					"Come, with high and holy hymning,"
					"    Chant our Lord's triumphant lay;"
					"Not one darksome cloud is dimming"
					"    Yonder glorious morning ray,"
					"Breaking o'er the purple East,"
					"Brighter far our Easter-feast."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }} 

}


} %%% book bracket
