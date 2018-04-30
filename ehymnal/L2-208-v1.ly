%%% 326.png
%%% Hymn 208 All prophets hail thee
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "THE PURIFICATION"
	\hspace #0.1 }}	

  title = "208"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves as found in the last measure (soprano and alto) of this piece. 
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-0.1 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.2 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #0.8 \musicglyph #"noteheads.s0" \hspace #-1.2 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01


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

%%% macro settings for stemless long note which is 2x duration of regular white note    
%%% this one sets a larger offset to avoid collision

lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #1.6 }	   

%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

%%% same as \brevenote but modified for the same reason as \lnb is modified for \ln		
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #1.6 }	
		
%%% setting to hide accidental. As timing is turned off, accidentals have to be set manually

noacci = \once \override Staff.Accidental #'transparent = ##t
				
%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )
		   		
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

  \[ d8 \pes f \] d d c d \phalfbar f f d e e d \bar "|" \[ d \pes a' \moveacci \virga bes \] a a \[ a \flexa g \] \bar "" \break

  \once \override Score.SeparationItem #'padding = #4 \[ g \pes a \] \phalfbar f \[ g \pes a \] g \[ f \pes g \] \[ \virga g \inclinatum f \inclinatum e \] d \bar "|" \[ d \pes g \] \[ f \flexa e \] \[ d \flexa c \] d c \phalfbar \break

  \[ f \flexa e \] \[ f \pes g \] \[ f \flexa e \] \[ d \flexa c \] \[ d \pes e \] e \[ d \pes f \] d d c d \bar "||"

}}
  
  
%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  g'8[ bes] g g f g \halfbar bes bes g a a g \bar "|" g[ d' ees] d d d[ c] \bar "" \break
  c[ d] \halfbar bes c[ d] c bes[ c] c[ bes a] g \bar "|" g[ c] bes[ a] g[ f] g f \halfbar \break
  bes[a] bes[ c] bes[ a] g[ f] g[ a] a \bar "|" g[ bes] g g f g \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  \ln d4 d8 e d d \halfbar \ln g4 e8 f f d \bar "|" \ln g4. \brevenote f\breve *1/4 ~ \bar "" \break
  \ln f4 \halfbar \ln d4. e8 d[ e] \ln f4. d8 \bar "|" \ln e4 \ln f4 \ln c4 ~ e8 f \halfbar \break
  \brevenote d\breve *1/4 ~ \ln d4 \ln d4 \ln e4 f8 \bar "|" \ln d4 \ln e4 d8 d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \ln bes'4 bes8 c a bes \halfbar \ln d4 \ln c4 ~ c8 bes \bar "|" \ln bes4. \brevenote \leftbreve bes\breve  *1/4 \bar "" \break
  \ln a4 \halfbar \ln bes4. g8 \lnc g4 a8[ d c] bes \bar "|" \ln c4 \ln f,4 g8[ a] c a \halfbar \break
  \brevenoteb f\breve *1/4 \ln g4 \ln a4 \ln c4 ~ c8 \bar "|" \ln bes4 \ln c4 a8 bes \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  \lnb g'4 g8 c, d g, \halfbar \lnb g'4 c,8 f f g \bar "|" \ln g4( ees8) \brevenoteb \rightbreve bes'\breve *1/4 \bar "" \break
  f8[ d] \halfbar \lnb g4. c,8 g'8[ c,] \ln f4. g8 \bar "|" \lnb c,4 \lnb d4 \noacci e8[ f] c f \halfbar 
  \brevenoteb bes,\breve *1/4 \lnb g4 \lnb d'4 \lnb c4 f,8 \bar "|" \lnb g4 \lnb c4 d8 g, \bar "||"
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
	 
        \[ d8 e8 d8 \] d4
  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln e4. \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4. \ln bes4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a c] \ln g4  \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A -- _ _ men. }
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
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln e4. \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4. \ln bes4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a c] \ln g4  \bar "||" }}
			        >>
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	
%%% See also

\markup {  \line { \hspace #42 \column { "               " %%% a few blank lines
	                                 "               " %%% a few blank lines
	                                 \line { "See also" "(for 2nd E.):" }
                                    \line { \hspace #1 \small "22  Come rejoicing." } }}}
					

} %% book bracket
