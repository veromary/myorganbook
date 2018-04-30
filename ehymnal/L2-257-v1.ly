%%%% 403.png
%%%% Hymn 257. Morning Hymn.  Awake, my soul, and with the sun
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	\hspace #0.1 }}	
	
	title = "257"   
  
  poet = \markup { \small {  \line { \sans { "MORNING HYMN."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96.}}
  
  arranger = \markup { \small { \smallCaps "F. H. Barth"\hspace #-1.2 \teeny "ÉLÉMON" \hspace #-1.2 ", 1741-1808."}}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
  \autoBeamOff
}

soprano = \relative c' { 
  \partial 4 g'8[ a8] | b4 b4 b4 c8[ b8] | a4 a4 a4 \bar "||" d4 | cis4 d4 cis8[ b8] a8[ g8] | fis4 e4 d4 \breathmark \bar "||" \break 
  d8[ e8] | fis4 g4 a4 fis8[ g8] | a4 b4 c4^\fermata \bar "||" b4 | e,4 fis4 g8[ b8] d8[ c8] | b4 a4 g4 \bar "||"
}
   
alto = \relative c' {  
  d4 | d4 d4 d4 e4 | a,4 cis4 d4 \bar "||" fis4 | e4 d4 d4 e4 | d4 cis4 d4 \bar "||" 
  a4 | d4 cis4 d4 d4 | d4 d4 d4 \bar "||" d4 | c4 c4 b8[ e8] d8[ e8] | d4. c8 b4 \bar "||" 
}

tenor = \relative c {\clef bass 
  b'8[ c8] | d4 d4 g,4 g4 | fis4 g4 a4 \bar "||" a4 | g4 a4 g4 b4 | a4 g4 fis4 \bar "||" 
  fis8[ g8] | a4 a4 a4 a4 | fis4 g4 fis4 \bar "||" g4 | g4 a4 g4 g4 | g4 fis4 g4 \bar "||"
}

bass = \relative c {\clef bass 
  g'4 | g4 g4 g4 c,4 | d4 e4 fis4 \bar "||" d4 | e4 fis4 g4 e4 | a4 a,4 d4 \bar "||" 
  d4 | d4 e4 fis4 d4 | c4 b4 a4_\fermata \bar "||" g4 | c4 a4 e'4 b8[ c8] | d4 d4 g,4 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #10 \smallCaps "Note" \hspace #-1.2 ".—" \italic "The second part of this hymn may also be sung to" \smallCaps "Tallis' Canon" "(" \hspace #-1 \italic "No." "267)." }


%%% Lyric titles and attributions

\markup { "                " }

\markup { "                " }

\markup {  \small {  \hspace #66 \italic "Bishop T. Ken, 1637-1711." }} 


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.8 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "WAKE, my soul, and with the sun"
			                                "   Thy daily stage of duty run;" } }          
	                  \line {  \hspace #3.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Shake off dull sloth, and joyful rise"
					   "To pay thy morning sacrifice."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2    "
			   \column {	     
				   "Redeem thy mis-spent time that's past"
				   "Live this day as ¡f 'twere thy last:"
				   "Improve thy talent with due care;"
				   "For the great Day thyself prepare."
				   "          " %%% adds vertical spacing between verses
			}}
			 \line { "3    "
			   \column {	     
				   "Let all thy converse be sincere,"
				   "Thy conscience as the noon-day clear;"
				   "Think how all-seeing God thy ways"
				   "And all thy secret thoughts surveys."
				   "          " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
      
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "4    "
			   \column {	     
				   "By influence of the light Divine"
				   "Let thy own light ¡n good works shine;"
				   "Reflect all heaven's propitious ways"
				   "In ardent love and cheerful praise."
				   "          " %%% adds vertical spacing between verses
			}}	   
			\line { "5*" \hspace #0.8
			   \column {	     
				   "Wake, and lift up thyself, my heart,"
				   "And with the Angels bear thy part,"
				   "Who all night long un-wearied sing"
				   "High praise to the eternal King."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "6    "
			   \column {	     
				   "Awake, awake, ye heavenly choir,"
				   "May your devotion me inspire,"
				   "That I like you my age may spend,"
				   "Like you may on my God attend."
				   "          " %%% adds vertical spacing between verses
			}}
			
			\hspace #1 % adds vertical spacing between verses  
			\line { \hspace #18 \italic "Part" "2." }
			\hspace #1 % adds vertical spacing between verses
	
			\line { "7    "
			   \column {	     
				   "Glory to thee, who safe hast kept"
				   "And hast refreshed me whilst I slept;"
				   "Grant, Lord, when I from death shall wake"
				   "I may of endless light partake."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "8    "
			   \column {	     
				   "Heaven is, dear Lord, where'er thou art,"
				   "O never then from me depart;"
				   "For to my soul 'tis hell to be"
				   "But for one moment void of thee."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "9    "
			   \column {	     
				   "Lord, I my vows to thee renew;"
				   "Scatter my sins as morning dew;"
				   "Guard my first springs of thought and will,"
				   "And with thyself my spirit fill."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "10" \hspace #0.56
			   \column {	     
				   "Direct, control, suggest, this day"
				   "All I design, or do, or say;"
				   "That all my powers, with all their might,"
				   "In thy sole glory may unite."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "11." \hspace #0.01
			   \column {	     
				   "Praise God, from whom all blessings flow,"
				   "Praise him, all creatures here below,"
				   "Praise him above, ye heavenly host,"
				   "Praise Father, Son, and Holy Ghost.        Amen."
			}}
			
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #6 \italic "This Doxology may be sung also after Part" "1." }   .
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn g'1 g1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }}  %%Amen midi       
       
}  


} %%% book bracket

