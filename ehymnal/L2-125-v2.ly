%%% 206.png
%%% Hymn 125 The Lamb's high banquet we await.
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	

  title = "125"
  
  arranger = \markup { \small { "Mode viii." }}
  
  tagline =""
}

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

	   
%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-0.2 . 0 )

push = \once \override NoteHead #'X-offset = #'1

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  g'8 c8 \[ a8 \flexa g8 \] \[ c8 \flexa b8 \] \[ c8 \pes d8 \] c8 b8 a8 \bar "|" a8 \[ a8 \flexa g8\] \bar "" \break

  \once \override Score.SeparationItem #'padding = #4 \[ e8 \pes f8 \] g8 \[ e8 \pes g8 \] f8 e8 d8 \bar "|" e8 e8 \[ d8 \flexa c8 \] g'8 \[ g8 \pes a8\] \bar "" \break

  c8 c8 b8 \bar "|" \[ c8 \pes d8 \] \[ c8 \flexa b8 \] \[ a8 \flexa g8 \] b8 \[ a8 b8 \pes c8 \] a8 g8 g8 \bar "||"
}}
  
  
%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
g'8 c a[ g]  c[ b]  c[ d]  c b a \bar "|" a a[ g]  \bar "" \break
e[ f]  g e[ g]  f e d \bar "|" e e d[ c]  g' g[ a]  \bar "" \break
c c b \bar "|" c[ d]  c[ b]  a[ g]  b a[ b c]  a g g \bar "||"
}


alto = \relative c' {
	\autoBeamOff
	
e8 g e[ d]  \ln e4 ~ e8[ f]  g e c \bar "|" e f[ e]  \bar "" \break 
\ln c4 ~ c8  ~ \ln c4 ~ \ln c4 a8 \bar "|" c8 c a[ c]  b ~ b[ d]  \bar "" \break
e8 g d \bar "|" g[ f]  \ln e4  ~ e8[ d]  g \ln e4. f8 e d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff

c'8 e c[ d]  \ln c4 ~ c8[ a]  g ~ g a \bar "|" c \ln c4 \bar "" \break
\ln g4 e8 g8[ e]  f a f \bar "|" g g f[ g]  ~ g ~ g[ f]  \bar "" \break
\ln g4 ~ g8 \bar "|" g[ a]  a[ b]  c[ d]  d \ln c4. c8 c b \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
c8 c c'[ b]  \lnb a4 ~ a8[ d,]  e ~ e a \bar "|" a f[ c ~ ]  \bar "" \break
\lnb c4 ~ c8 ~ \ln c4 \ln a4 d8 \bar "|" c c d[ e ~ ]  e ~ e[ d]  \bar "" \break
c8 e g \bar "|" e[ d]  \ln a'4 ~ a8[ b]  g \lnb a4. f8 c g' \bar "||"
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

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "On Sundays, tune" "123" \hspace #-1.2 \italic ", part" "2" \hspace #-1.2 \italic ", was anciently used for this hymn." }

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

%%% Second page. Lyrics

%%% Lyric titles and attributions

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn."  \italic " Low Sunday" \hspace #46 \italic "7th cent.  Tr. J. M. Neale." } }  
	    \line { \small { \hspace #11 \italic "till Ascension," "E."       }} 
            \line { \small { \hspace #42 "Ad cenam Agni providi." }}
}}
 

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #3 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Lamb's high banquet we await"
			                                 "  In snow-white robes of royal state;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And now, the Red Sea's channel past,"
					   "To Christ, our Prince, we sing at last."
					   "        "  %%% adds vertical spacing between verses  
			  		}}
		      } %%% end verse 1
		      \line { "2  "
			      \column {	     
				      "Upon the altar of the Cross"
				      "His Body hath redeemed our loss;"
				      "And tasting of his roseate Blood"
				      "Our life is hid with him in God." 
				      "        "  %%% adds vertical spacing between verses  
     			}}
			\line { "3  "
				\column {	     
					"That Paschal eve God's arm was bared;"
					"The devastating Angel spared:"
					"By strength of hand our hosts went free"
					"From Pharaoh's ruthless tyranny."
					"        "  %%% adds vertical spacing between verses  
     			}} 
			\line { "4  "
				\column {	     
					"Now Christ our Paschal Lamb is slain,"
					"The Lamb of God that knows no stain;"
					"The true Oblation offered here,"
					"Our own unleavened Bread sincere."
     			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -49 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "5  "
				\column {	     
					"O thou from whom hell's monarch flies,"
					"O great, O very Sacrifice,"
					"Thy captive people are set free,"
					"And endless life restored in thee."
					"        "  %%% adds vertical spacing between verses  
			}}
           		\line {"6  "
				\column {	     
					"For Christ, arising from the dead,"
					"From conquered hell victorious sped;"
					"He thrusts the tyrant down to chains,"
					"And Paradise for man regains."
					"        "  %%% adds vertical spacing between verses  
			}}
           		\line {"7  "
				\column {	     
					"Maker of all, to thee we pray,"
					"Fulfil in us thy joy to-day;"
					"When death assails, grant, Lord, that we"
					"May share thy Paschal victory."
					"        "  %%% adds vertical spacing between verses  
			}}
           		\line {"8. "
				\column {	     
					"To thee who, dead, again dost live,"
					"All glory, Lord, thy people give;"
					"All glory, as is ever meet,"
					"To Father and to Paraclete.     Amen."
			}}
	    } %%% end column 3   
	    } %%% end master line    
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
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ g'8 \pes a8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) g8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  f8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.0 ) g8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ a] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  e8[ f8] e8[ c8 d8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4  \ln c4( b8)  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f8] c8[ a8 g8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  "A  " -- _ "  men." }
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
	                                              \voiceOne g'8[ a] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  e8[ f8] e8[ c8 d8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4  \ln c4( b8)  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f8] c8[ a8 g8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket

