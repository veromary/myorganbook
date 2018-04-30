%%% 280.png
%%% Hymn 174  Lord of creation, bow thine ear, O Christ, to hear 
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
	dedication = \markup { \center-align {  \line { \smallCaps "Part II" }
		\line { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS" }
		\hspace #0.1 }}	

  title = "174"
  
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

%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }
%%% same as \brevenote but modified for the same reason as \lnb is modified for \ln		
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #1.6 }		
	   		
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
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
  \[ d8 \pes a' a \pes b \] g \[ a \pes b \] c \[ b \flexa a \] \phalfbar d c \[ b \flexa a \] g c \[ \virga b \inclinatum a \inclinatum g \] a \bar "|" a \[ a \pes c \inclinatum b \inclinatum a \] \bar "" \break

  g \[ f g f \] \[ e \flexa d \] \phalfbar g \[ a \pes b \] c \[ b \flexa a \] g a a \bar "|" d \[ c \flexa b \] \[ c \pes d \] \[ c \flexa b \] a \phalfbar \break

  b c a b g a a \bar "|" a \[ a \pes c \inclinatum b \inclinatum a \] g \[ f g  f \] \[ e \flexa d \] \phalfbar e f d e c d d4 \bar "||"

}} 
  
%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  d8[ a' ~ a b] g a[ b] c b[ a] \halfbar d c b[ a] g c b[ a g] a \bar "|" a a[ c b a] \bar "" \break
  g f[ g f] e[ d] \halfbar g a[ b] c b[ a] g a a \bar "|" d c[ b] c[ d] c[ b] a \halfbar \break
  b c a b g a a \bar "|" a a[ c b a] g f[ g f] e[ d] \halfbar e f d e c d \ln d4 \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  \once \override Slur #'extra-offset = #'(1.2 . 0.0)		
  \ln d4( \ln e) \ln d4. e8 ~ e8[ c] \halfbar f g \ln g4. e8 \ln e4. e8 \bar "|" e \brevenote e\breve *1/4 \bar "" \break
  e8 \ln c4. ~ c8[ b] \halfbar c8 \ln f4 \ln g( e8) e \ln e4 \bar "|" \ln g4. \ln e4 ~ \ln e4. \halfbar \break
  \ln g4 \ln f4 e8 f e \bar "|" f \brevenote c\breve * 1/4 ~ c8 \ln c4. ~ c8[ b] \halfbar \ln c4 \ln b a8 b \ln a4 \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \ln f4( \ln e) \ln g4. e8 g[ a] \halfbar a c d[ c] b a g[ a b] c \bar "|" c \brevenote c\breve *1/4 \bar "" \break
  b8 \ln a4. \ln g4 \halfbar g8 \ln d'4 e8 d[ c] b \ln c4 \bar "|" b8 e[ d] c[ b] a[ b] c \halfbar \break
  d8 c c d b d c \bar "|" c \brevenote a\breve * 1/4 c8 \ln a4. \ln g4 \halfbar g8 a \ln g4 e8 g \ln f4 \bar "||"
}


bass = \relative c { \clef bass
	\autoBeamOff
  \once \override Slur #'extra-offset = #'(2.0 . 0.0)		
  \lnb d4( \lnb c) \lnb b4. a8 e'[ f] \halfbar d e \ln g4. a8 \ln e4. a,8 \bar "|" a'8 \brevenoteb a\breve *1/4 \bar "" \break
  e8 \lnb f4. c8[ g'] \halfbar e \lnb d4 c8 g'[ a] e \lnb a4 \bar "|" \ln g4. \ln a4 \ln a,4 a'8 \halfbar \break
  g8 e f d e d a \bar "|" f' \brevenoteb f\breve *1/4 e8 \lnb f4. c8[ g] \halfbar c f, g e a g \ln d4 \bar "||"
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


\markup {  \column { \line { \hspace #32 \italic "See also for Procession on any Saint's Day:" }
	\line { "             " }
	\line { \hspace	#36 \small "638  Jerusalem, my happy home." }
	\line {	\hspace #36 \small "639  The Church triumphant in thy love." }
}}		


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

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of Apostles and"  \hspace #24 \italic "Before 11th cent.  Tr. T. A. L." }    
	\line { \hspace #2 \italic "Evangelists.  " "E." \italic "and" "M." } 
	\line { \hspace #22 "Annue Christe saeculorum Domine." }
}}}


%%% Lyrics

\markup { \hspace #22 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD of Creation, bow thine ear. O Christ, to hear"
			                                 "  The intercession of thy servant true and dear," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "That we unworthy, who have trespassed in thy sight,"
					   "May live before thee where he dwells in glorious light."

					   "          " %%% adds space between verses
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "O God our Saviour, look on thine inheritance,"
				   "Sealed by the favour shining from thy countenance;"
				   "That no false spirit bring to nought the souls of price"
				   "Bought by the merit of thy perfect Sacrifice."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				   "We bear the burden of our guilt and enmity,"
				   "Until thy pardon lift the heart from slavery:"
				   "Then through the spending of thy life-blood, King of grace,"
				   "Grant us unending triumph in thy holy place."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "4. "
			   \column {	     
				   "To thee the glorious Christ, our Saviour manifest,"
				   "All wreaths victorious, praise and worship be addrest,"
				   "Whom with the living Father humbly we adore,"
				   "And the life-giving Spirit, God for evermore.     Amen."
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
	                                              \voiceOne d8[ e d] \ln d4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ c b] \ln a4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln g'4. \ln f4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g8[ c g] \ln d4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A  - - "  men." }
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
	                                              \voiceOne d8[ e d] \ln d4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ c b] \ln a4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln g'4. \ln f4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g8[ c g] \ln d4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket

