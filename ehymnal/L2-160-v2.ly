%%% 258.png
%%% Hymn 160 Father most holy, merciful and tender

\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - TRINITY SUNDAY"
		\hspace #0.1 }}	

  title = "160"
  
  arranger = \markup { \small { "Mode iv." }}
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note    

ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }

%% a second set of macro settings for stemless long notes ( 2x duration of regular white note )
%% this one uses X-offset instead of force-hshift.
%% All long notes are offset slightly to the right with respect to any beamed notes which 
%% they are aligned with.  Normally, this is done with force-hshift.  
%% However, when 2 long notes occur one atop the other (i.e. in S + A pats or in T + B parts), then applying force-hshift
%% to both does not work.  Hence one note needs to be moved with the regular force-hshift in the \ln macro above,
%% while the other is moved with X-offset with the macro \lnb
%% In general force-hshift is preferred whenever possible as slurs are adjusted automatically, while X-offset especially
%% when used with a bottom slur often results in a slur starting too far to the left and which then needs manual adjustment. 

lnb = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteHead #'X-offset = #0.8 }

%%% same as \ln but without note offsets, for use in the Amen block	   
	   
lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.0 }
	   
%%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  f8 d e e e \bar "|" e e g a a g \bar "|" a bes \bar "" \break
  a g g \bar "|" a g f d e e \bar "|" f d c \bar "" \break
  d d \bar "|" f g a g g f \bar "|" a g f e e \bar "||"
} }
  

%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  aes'8 f g g g \bar "|" g g bes c c bes \bar "|" c des \bar "" \break
  c bes bes \bar "|" c bes aes f g g \bar "|" aes f ees \bar "" \break
  f f \bar "|" aes bes c bes bes aes \bar "|" c bes aes g g \bar "" \break
}

alto = \relative c' {
	\autoBeamOff
  f8 d ees ees d \bar "|" \ln ees4 f8 ees ees ees \bar "|" ees f \bar "" \break
  ees ees ees \bar "|" ees ees c d ees d \bar "|" ees des bes \bar "" \break
  des! des \bar "|" \ln ees4. f8 ees c \bar "|" ees ees c ees \noacci d \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  c'8 bes bes c bes \bar "|" \ln bes4 bes8 g aes g \bar "|" aes ~ aes \bar "" \break
  aes ~ aes g \bar "|" aes g aes bes bes bes \bar "|" aes aes g \bar "" \break
  aes bes \bar "|" aes g aes f g aes \bar "|" g g aes bes bes \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  f8 bes, ees c g' \bar "|" \lnb ees4 d8 c aes ees' \bar "|" aes des, \bar "" \break
  aes' ees ees \bar "|" aes, ees' f bes, ees g \bar "|" c, des! ees \bar "" \break
  des! bes \bar "|" c bes aes des! ees aes \bar "|" c, ees f ees g \bar "||"
}


#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\score {	
  <<
  \new VaticanaStaff {\plainsong }
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
		 >>  
  >>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
  	   % *** Remove custos
	   \remove Custos_engraver
	   % needed for certain tweaks
	   \consists "Mark_engraver"
           }
     }
} %%% score bracket 

%%% A separate score block to generate the midi minus the plainsong voice
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%% Lyric titles and attributions

\markup { \column { 
	\line { \small { \hspace #16 \smallCaps  "Office Hymn." "M." \hspace #36 \italic "c. 10th cent.  Tr. P. D." } }
        \line { \small { \hspace #44 \small "O Pater sancte." } }
}}
	

%%% Lyrics

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ATHER most holy, merciful and tender;"
			                                 "Jesus our Saviour, with the Father reigning;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Spirit of mercy, Advocate, Defender,"
					   "        Light never waning;"
			  		}}
		      } %%% end verse 1	
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
           		\line { \hspace #14 \italic "Part 2." }
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Trinity sacred, Unity unshaken;"
				   "    Deity perfect, giving and forgiving,"
				   "Light of the Angels, Life of the forsaken,"
				   "        Hope of all living;"
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "Maker of all things, all thy creatures praise thee;"
				   "    Lo, all things serve thee through thy whole creation:"
				   "Hear us, Almighty, hear us as we raise thee"
				   "        Heart's adoration."
				   "                " %%% adds vertical spacing between verses
			}}
		        \line { \hspace #-10.2 \italic "Unison.  " "4. "
			    \column {	     
				   "To the almighty triune God be glory:"
				   "    Highest and greatest, help thou our endeavour;"
				   "We too would praise thee, giving honour worthy,"
				   "        Now and for ever.     Amen."
     			}}
	  } %%% end supercolumn
} %%% end markup	  
       

%%% Amen score block

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ e8 \pes f8 \flexa e8  \] e4 }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ aes g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \lnc ees4. \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \lnc c'4. \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour  \lnc c4. \ln g4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "    A" - - " men." }
  >>
>>

\header { breakbefore = ##f piece = " " opus = " " }

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }
     \context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'( -5 . 4) }
     \context { \Score \remove "Bar_number_engraver"
		timing = ##f 
              }
     \context { \Staff \override NoteHead #'duration-log = #1 }
     \context { \Staff \override Stem #'flag-style = #'no-flag }
     \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	} 
} 

}

%%% Separate score block for Amen midi minus plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                                                             << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ aes g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \lnc ees4. \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \lnc c'4. \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour  \lnc c4. \ln g4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   

} %% book bracket
