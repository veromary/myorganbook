%%% 362.png
%%% Hymn 231
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align { "SAINTS' DAYS: ST. MARY MAGDALENE" \hspace #0.1 }}

  title = "231"
  
  arranger = \markup { \small { "Mode i." }}
  
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
		
%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 

c8 \[ c \pes d \] d \[ d \flexa c \] f e d c \bar "|" f g a \[ g \flexa f \] g g  a \bar "|" \break

f g a g \[ f \flexa e \] \[ f \pes g \inclinatum f \inclinatum e \] d d \bar "|" d \[ d \pes g \] f \[ f \flexa d \] e d c \bar "|" \break

a \[ c \pes d \] d \[ d \flexa c \] f g g f \bar "|" a g  \[ f \flexa e \] \[ f \pes g \inclinatum f \inclinatum e \] d c d \bar "||"

}}
  
  
%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  f8 f[g] g g[f] bes a g f \bar "|" bes c d c[ bes] c c d \bar "|" \break
  bes c d c bes[ a] bes[ c bes a] g g \bar "|" g g[ c] bes bes[ g] a g f \bar "|" \break
  d f[ g] g g[ f] bes c c bes \bar "|" d c bes[ a] bes[ c bes a] g f g \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  #(set-accidental-style 'forget)	
  \brevenote d\breve *1/4 ~ \ln d4 \ln f4 ees8 d \bar "|" d f f ~ \ln f4 a8 ~ a8 a8 \bar "|"
  d,8 f f e \ln f4 ~ \brevenote f\breve *1/4 d8 d \bar "|" d \ln e4 f8 \ln d4 f8 e c \bar "|"
  d c[ d] ees \ln d4 f8 f f d \bar "|" f ees \ln f4 \brevenote d\breve *1/4 ~ d8 d d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \brevenote bes'\breve *1/4 ~ \ln bes4   \ln bes4 bes8 bes \bar "|" d c bes ~ c[ d] f ~ f  f \bar "|"
  bes, a bes g \ln f4 ~ \ln f4 ( bes8 [ c8]) bes bes \bar "|" bes c[ g] bes \ln bes4 c8 c a \bar "|"	
  bes c[ bes] bes \ln bes4 bes8 bes a bes \bar "|" bes g f[ d'] \brevenote bes\breve *1/4 ~ bes8 a bes \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  bes8 bes[ g] g g[ bes] \lnb d4 ees8 bes' \bar "|" g a bes ~ \ln bes4 \ln f4 d8 \bar "|"
  g8 f bes, c \lnb d4 ~ \lnb d4 ~ d8[ f] g g \bar "|" g \ln c,4 d8 \lnb g4 f8 c f \bar "|"
  bes a[ g]  ees \lnb bes4 d8 f f bes \bar "|" bes, c \ln d4 \brevenoteb g\breve *1/4 ~ g8 d8 g, \bar "||"
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


%%% Hymn Note markup

\markup { \hspace #54 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "If a Modern Tune is required for this hymn, it may be sung to" \smallCaps "Oriel" }
                          \line { "(" \hspace #-1 \italic "No." "228)" \italic "or" \smallCaps "Collaudemus" "(" \hspace #-1 \italic "No." "230)." }}}


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


			  
%%% Lyric titles and attributions

\markup { \hspace #6 \small {  \column { \line {\smallCaps  "Office Hymn."   " M." \italic "and" " E." \hspace #46 \italic "Philippe de Grève, d. 1236." }   
        \line { \hspace #80 \italic "Tr. L. H." }
	\line { \hspace #40 "O Maria, noli flere." }
}}}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARY, weep not, weep no longer,"
			                                 "    Now thy heart hath gained its goal;" } }     
	                  \line {  \hspace #2.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Here, in truth, the Gardener standeth,"
					   "    But the Gardener of thy soul,"
					   "Who within thy spirit's garden"
					   "    By his love hath made thee whole."
					   "             " %%% adds vertical spacing between verse
			  		}} 
			         } %%% finish verse 1
			\line {"2  "
			   \column {	     
				   "Now from grief and lamentation"
				   "    Lift thy drooping heart with cheer;"
				   "While for love of him thou mournest,"
				   "    Lo, thy Lord regained is here!"
				   "Fainting for him, thou hast found him;"
				   "    All unknown, behold him near!"
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"3*" \hspace #-0.4
			   \column {	     
				   "Whence thy sorrow, whence thy weeping,"
				   "    Since with thee true bliss abides?"
				   "In thy heart, though undiscovered,"
				   "    Balm of consolation hides:"
				   "Holding all, thou canst no longer"
				   "    Lack the cure that Health provides."
				   "             " %%% adds vertical spacing between verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -54 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "Nay, no wonder if she knows not"
				   "    Till the Sower's seed be sown,"
				   "Till from him, the Word eternal,"
				   "    Light within her heart is thrown."
				   "Lo, he calls her; lo, ‘Rabboni,’"
				   "    She in turn her Lord doth own."
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"5  "
			   \column {	     
				   "Faith that washed the feet of Jesus,"
				   "    Fed with dew the Fount of Grace,"
				   "Win for us a like compassion,"
				   "    That, with all the ransomed race,"
				   "At the glory of his rising"
				   "    We may see him face to face!"
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"6. "
			   \column {	     
				   "Glory be to God and honour,"
				   "    Who, preferring sacrifice,"
				   "Far above the rich man's bounty,"
				   "    Sweetness found in Mary's sighs,"
				   "Who for all, his love foretasting,"
				   "    Spreads the banquet of the skies."
				   "             " %%% adds vertical spacing between verse
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket


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
	                                              \voiceTwo  d8[ f d] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  bes'8[ c bes] \ln bes4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g'8[ f g] \ln g,4  \bar "||" }}
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
	                                              \voiceTwo  d8[ f d] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  bes'8[ c bes] \ln bes4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g'8[ f g] \ln g,4  \bar "||" }}
			        >>
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket
