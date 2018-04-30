%%%% 327.png
%%%% Hymn 208mod.  All prophets hail thee
%%%% Rev 1

\version "2.10"

\header {
  
  dedication = \markup {  \center-align { "THE PURIFICATION" \hspace #0.1 }}	
	
  title = \markup { "208 " \large \smallCaps "(Modern Tune)" } 
  
  poet = \markup { \small {  \line { \sans {"DIVA SERVATRIX."} \hspace #1 \roman {"(11 11. 11 5.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 96.} }
  
  arranger = \markup { \small \italic "Bayeux Church Melody." }			       
		
  tagline = ""
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 2/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override TextScript #'padding = #1	
  b'2^\markup { \hspace #-2 \italic "To be sung in unison." } b4 c4 | b2 g2  | a4. g8 a4 b4 | a2 g2 \bar "||" b2 b4 d4 | c2 b2 | a4. g8 fis4 g4 | \break
  e2 d2 \bar "||" b'2 a4 g4 | c2 b2 | g4. a8 b4 c4 | d2 d2 | b2 a4 g4 | a2 g2 \bar "||"
} 
   
alto = \relative c' {  
  <d g>2 <d g>4 <e g>4 | <d g>2 <b d>2 | <d fis>4. <b e>8 <d fis>4 <d g>4 | <d fis>2 <b d>2 \bar "||" <d g>2 <d g>4 <d g>4 | <e g>2 <d g>2 | <d fis>4. <b e>8 <b d>4 <b d>4 | \break
  cis2 a2 \bar "||" <d g>2 <d fis>4 <b e>4 | <e g>2 <d g>2 | <b d>4. d8 <d g>4 g4 | <d g>2 <d fis>2 | <d g>2 <c e>4 <b e>4 | <d fis>2 <b d>2 \bar "||"
}

tenor = \relative c {\clef bass 
  s2 s4 c4 | s2 s2 | s2 s4 b4 | d2 g2  \bar "||" s2 s4 d4 | c2 g2 | s2 b4 g4 | \break
  a'2 fis2 \bar "||" s1 | c2 g2 | s1 | a'2 a2 | g2 s2 | d2 g,2 \bar "||"
}

bass = \relative c {\clef bass 
  g'2 g4 s4 | g2 g2 | d4. e8 d4 s4 | s2 s2  \bar "||" g2 g4 s4 | s2 s2 | d4. e8 s2 | \break
  a,2 d2 \bar "||" g2 d4 e4 | s1 | g4. fis8 g4 e4 | d2 d2 | g2 c,4 e4 | s1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 2) }}      
  
	
} %%% Score bracket


\markup { "                "}  %%% force some blank space before lyrics begin

%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn. E." \hspace #36 \italic "Ascribed to Archbishop Rabanus" } 
		\line { \hspace #1 "(M. 214" \italic "or" "215.)" \hspace #36 \italic "Maurus, 9th cent. Tr. T. A. L." }      
	                                 \line { \hspace #32 "Quod chorus vatum." }
}}}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LL prophets hail thee, from of old announcing,"
			                                 "  By the inbreathèd Spirit of the Father," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "God's Mother, bringing prophecies to fullness,"
					   "                                            Mary the maiden."
					   "                " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
				            		\line { "2  "
			   \column {	     
				   "Thou the true Virgin Mother of the Highest,"
				   "Bearing incarnate God in awed obedience,"
				   "Meekly acceptest for a sinless offspring"
				   "                                            Purification."
				   "                " %%% adds vertical spacing between verses
			}}
			 \line { "3  "
			 \column {	     
				 "In the high temple Simeon receives thee,"
				 "Takes to his bent arms with a holy rapture"
				 "That promised Saviour, vision of redemption,"
				 "                                            Christ long awaited."
				   "                " %%% adds vertical spacing between verses
			 }}
	  } %%% end super column
}

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

%%% Second page
%%% Continuation of lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  	   
			\line { "4  "
			\column {	     
				"Now the fair realm of Paradise attaining,"
				"And to thy Son's throne, Mother of the Eternal,"
				"Raisèd all glorious, yet in earth's devotion"
				"                                            Join with us always."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "5. "
			   \column {	     
				   "Glory and worship to the Lord of all things"
				   "Pay we unresting, who alone adorèd,"
				   "Father and Son and Spirit, in the highest"
				   "                                            Reigneth eternal.      Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a g fis) \bar "|" g\breve  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo <b e>2 <c e> <b d> <a d> \bar "|" <b d>\breve \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 "A     -      -      -  " men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree s2 *4 \bar "|" s\breve \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  e2 a, b d \bar "|" g,\breve \bar "||" }}
		        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 2) }}  %%Amen midi       
       
} %%% end Amen score block
%%% See also

\markup {  \line { \hspace #42 \column { "               " %%% a few blank lines
	                                 "               " %%% a few blank lines
	                                 \line { "See also" "(for 2nd E.):" }
                                    \line { \hspace #1 \small "22  Come rejoicing." } }}}
					

} %%% book bracket
