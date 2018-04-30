%%% 378.png
%%% Hymn 241
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "ST. MICHAEL AND ALL ANGELS"
	\hspace #0.1 }}	

  title = "241"
  
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


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."   " E." \italic "and" " M." \hspace #32 \italic "Ascr. to Archbishop Rabanus Maurus," }   
         \line { \hspace #62 \italic "9th Cent.  Tr. J. M. Neale." }
	\line { \hspace #30 "Tibi, Christe, splendor Patris." }
	\line { "              " }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEE, O Christ, the Father's splendour,"
			                                "    Life and virtue of the heart," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "In the presence of the Angels"
					   "    Sing we now with tuneful art,"
					   "Meetly in alternate chorus"
					   "    Bearing our responsive part."
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  
			\line { "2  "
			   \column {	     
				   "Thus we praise with veneration"
				   "    All the armies of the sky;"
				   "Chiefly him, the warrior Primate,"
				   "    Of celestial chivalry,"
				   "Michael, who in princely virtue"
				   "    Cast Abaddon from on high."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			\column {	     
				"By whose watchful care repelling—"
				"    King of everlasting grace—"
				"Every ghostly adversary,"
				"    All things evil, all things base,"
				"Grant us of thine only goodness"
				"    In thy Paradise a place."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "4. "
			   \column {	     
				   "Laud and honour to the Father,"
				   "    Laud and honour to the Son,"
				   "Laud and honour to the Spirit,"
				   "    Ever Three, and ever One,"
				   "Consubstantial, co-eternal,"
				   "    While unending ages run.      Amen."
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
