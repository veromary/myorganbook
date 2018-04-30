%%% 266.png
%%% Hymn 165 Father we praise thee, now the night is over
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - TRINITY TO ADVENT"
		\hspace #0.1 }}	

  title = "165"
  
  arranger = \markup { \small { "Mode vi." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

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


%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

%% settings to generate blacknotes in the SATB staffs.  To match the plainsong staffs, a black note duration is 1/16		
		
crochet = { \once \override NoteHead #'duration-log = #2  }
	   		
%%% Half-height bar.  Prints a bar glyph which spans only the middle two staff lines.  
%%% This macro works by replacing the glyph used by the \bar "|" function.

halfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {   \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.0 . 1.0) #0  
                                                                                                                    
            }         
        \bar "|"}  	

%%% Plainsong half-bar.  Prints a bar glyph on a plainsong staff slightly shorter than a full height bar.
%%% Corresponds to a half-height bar on a normal SATB staff
%%% This macro works by replacing the glyph used by the \bar "|" function.	
	
phalfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.8 . 1.8 ) #0
            }          
        \bar "||"} 
		

%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 

d8 f \[ e \flexa d \] f f \phalfbar d e c d f f \bar "|" \break
f f f g f \phalfbar f f f g a g \bar "|" a g f \bar "" \break
g f \phalfbar g a f e \[ d \pes f \] c \bar "|" d c d f f \bar "||"
}}
  
  
%%% SATB voices

global = {
  \key bes \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  g'8  bes a[ g] bes bes \halfbar g a f g bes bes \bar "|" 
  bes bes bes c bes \halfbar bes bes bes c d c \bar "|" d c bes \bar "" \break
  c bes \halfbar c d bes a g[ bes] f \bar "|" g f g bes bes \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  \ln d4 \ln ees \ln f \halfbar \ln ees f8 ees ees d \bar "|"
  d8 \ln f4 f8 d \halfbar \ln ees4 \ln f4. ~ f8 \bar "|" \ln f4 d8 \bar "" \break
  f8 d \halfbar \ln f4 d8 f \ln ees4 c8 \bar "|" ees f ees d d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \ln bes'4 \ln c \ln d \halfbar bes8 c bes ees, f  ~ f \bar "|"
  bes \ln bes4 a8 bes \halfbar \ln g4 \ln f4 ~ \crochet f8 *1/2 [ \crochet g8 *1/2] a8 \bar "|" \ln a4 g8 \bar "" \break
  a bes \halfbar \ln a4 bes8 d \ln bes4 a8 \bar "|" \ln bes4 ees,8 f f \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  \lnb g'4 \lnb c, \lnb bes \halfbar ees8 c d c bes ~ bes \bar "|"
  bes \lnb d4 f8 g \halfbar \lnb ees4 d8 c bes f' \bar "|" d f g \bar "" \break
  f g \halfbar f d g d \lnb ees4 f8 \bar "|" ees d c bes bes \bar "||"
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


%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn." \italic "Sundays and" \hspace #30 \italic "Ascr. to St. Gregory the Great." } 
          	                         \line { \hspace #6 \italic "week-days." " M." \hspace #42 \italic "6th cent.  Tr. P. D." }    
					 \line { \hspace #33 "Nocte surgentes." }
}}}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ATHER, we praise thee, now the night is over."
			                                 "  Active and watchful, stand we all before thee;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Singing we offer prayer and meditation:"
					   "                                Thus we adore thee."
			  		}} 
			         } %%% finish verse 1
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
           		\line { "2  "
			   \column {	     
				   "Monarch of all things fit us for thy mansions;"
				   "Banish our weakness, health and wholeness sending;"
				   "Bring us to heaven, where thy Saints united"
				   "                                Joy without ending."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "3. "
			   \column {	     
				   "All-holy Father, Son and equal Spirit,"
				   "Trinity blessèd, send us thy salvation;"
				   "Thine is the glory, gleaming and resounding"
				   "                                Through all creation.     Amen."
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
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ f8 \pes g8 \] 
	\override NoteHead #'extra-offset = #'(-3.8 . 0.0 ) \[ a8 \flexa g8 \] 
        \revert NoteHead #'extra-offset
        \[ g8 \flexa f8 \]
  
  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne bes'8[ c d c] c8[ bes] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln f4. g8 f8[ d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \brevenote bes'\breve *1/4 a8[ bes] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8 bes c] f8[ bes,]  \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A - - - "  men." }
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
	                                              \voiceOne bes'8[ c d c] c8[ bes] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln f4. g8 f8[ d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \brevenote bes'\breve *1/4 a8[ bes] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8 bes c] f8[ bes,]  \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

%%% Evening Office Hymn Markup

\markup { \hspace #54 \center-align { \italic "The evening Office Hymn for Sunday, and for every day except Saturday is:"
                           \small "51  O blest Creator of the light." }}



} %% book bracket
