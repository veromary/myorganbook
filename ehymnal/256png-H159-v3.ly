%%% 256.png
%%% Hymn 159 Be present, Holy Trinity
%%% Version 3

\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - TRINITY SUNDAY"
		\hspace #0.1 }}	

  title = "159"
  
  arranger = \markup { \small { "Mode iii." }}
  
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

%% macro settings for stemless long note which is 2x duration of regular white note. Slightly larger offset to cater to partially merged notes    

lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.9 }
	   	   
%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.4 }

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  \[ e8 d \] g \[ a \pes c \] \[ c c \flexa b \] \[ a \flexa g \] a \[ g \flexa f \] e \bar "|" \[ f f \flexa e \] d \[ d \pes a' \] \bar "" \break
  
  a \[ g \pes a \] g \[ f \flexa e \] e \bar "|" \[ d \pes a' \moveacci \virga bes \] a \[ a \flexa g \] \[ a \pes c \] 
      \[ \override NoteHead #'extra-offset = #'(-5.0 . 0.0 ) \override Accidental #'extra-offset = #'(-7.0 . 0.0 ) c \flexa b! \] 
      \revert NoteHead #'extra-offset \revert Accidental #'extra-offset 
      \[ a \flexa g \] a \bar "" \break
  
  \[ g \flexa f \] \[ g \pes a \] \bar "|" \[ a \flexa g \] a \[ g \flexa f \] g d \[ e f \pes g \] \[ f \flexa e \] e4 \bar "||"
} 
}
  

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  fis8[ e8] a8 b8[ d8] \ln d4( cis8) b8[ a8] b8 a8[ g8] fis8 \bar "|" \ln g4( fis8) e8 e8[ b'8] \bar "" \break
  b8 a8[ b8] a8 g8[ fis8] fis8 \bar "|" e8[ b'8 c!8] b8 b8[ a8] b8[ d8 ~ d8 cis8] b8[ a8] b8 \bar "" \break
  a8[ g8] a8[ b8] \bar "|" b8[ a8] b8 a8[ g8] a8 e8 fis8[ g8 a8] g8[ fis8] \ln fis4 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  d8[ cis8] d8 \ln d4 \ln fis4. ~ \ln fis4 fis8 \ln e4 d8 \bar "|" \lnb d4. cis8 \ln b4 \bar "" \break
  d8 d8[ fis8] e8 e8[ d8] cis8 \bar "|" \ln e4. \ln d4. \brevenote d\breve *1/4 ~ \ln d4. \bar "" \break
  \ln e4 e8[ d8] \bar "|" \ln e4. \ln e4 e8 cis8 \ln d4. \ln d4 \ln cis4 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  \ln a'4 a8 \ln g4 \ln a4. d8[ cis8] b8 \ln b4 b8 \bar "|" \ln b4( a8) a8 \ln g4 \bar "" \break
  fis8 ~ fis8[ d'8] cis8 \ln b4 a8 \bar "|" \ln b4( g8) g8 \ln fis4 \ln fis4 \ln a4 d8[ cis8] b8 \bar "" \break
  \ln b4 a8[ fis8] \bar "|" g8[ fis8] g8 \ln b4 cis8 a8 \ln a4. b8[ a8] \ln a4 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  d8[ a'8] fis8 \lnc g4 \ln d4. ~ \ln d4 d8 \lnb e4 b8 \bar "|" 
      \once\override Slur  #'control-points = #'((3.5 . -2.5) (6 . -3.0) (7 . -2.5 ) (8.5 . -1.0 ))
      \lnb g4( d'8) a8 \lnb e'4 \bar "" \break
  
  b8 d8[ b8] cis8 e8[ fis8] fis8 \bar "|" 
      \once\override Slur  #'control-points = #'((3.0 . 1.0 ) (4 . -0.3 ) (5.5 . -0.3 ) (9.0 . 0.3 ))
      \lnb g4( e8) g8 \lnb d4 
      \once\override Slur  #'control-points = #'((3.5 . -1.5) (6 . -2.0) (7 . -1.5 ) (9.5 . 0.0 ))
      \lnb b4( \ln fis'4) \lnb g4 ~ g8 \bar "" \break
      
  \lnb e4 cis8[ b8] \bar "|" 
      \once\override Tie  #'extra-offset = #'( 0.0 . -0.5 )
      \ln e4. ~ \lnb e4 \ln a,4 \lnb d4. g,8[ d'8] \ln fis,4 \bar "||"
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


%%% Hymn note

\markup { \hspace #40 \column {
	
	\line { \hspace #8 \italic "See also:" }
	"         "
	\line { \small "632  Eternal Light, Divinity." }
	\line { \small "633  All hail, adored Trinity." }
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

%%% Second page
%%% Lyric titles and attributions

\markup { \hspace #8 \column { 
	\line { \small {  \smallCaps  "Office Hymn." " E." \italic "and" "M." \hspace #38 \italic "c. 10th cent.  Tr. J. M. Neale." } }
        \line { \small {  \hspace #32  "Adeste, sancta Trinitas." } }
}}	


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E present, Holy Trinity,"
			                                 "  Like splendour, and one Deity:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Of things above, and things below,"
					   "Beginning, that no end shall know."
			  		}}
		      } %%% end verse 1	
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Thee all the armies of the sky"
				   "Adore, and laud, and magnify,"
				   "And Nature, in her triple frame,"
				   "For ever sanctifies thy name."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "And we, too, thanks and homage pay,"
				   "Thine own adoring flock to-day;"
				   "O join to that celestial song"
				   "The praises of our suppliant throng!"
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4  "
			   \column {	     
				   "Light, sole and one, we thee confess,"
				   "With triple praise we rightly bless;"
				   "Alpha and Omega we own,"
				   "With every spirit round thy throne."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5. "
			   \column {	     
				   "To thee, O unbegotten One,"
				   "And thee, O sole-begotten Son,"
				   "And thee, O Holy Ghost, we raise"
				   "Our equal and eternal praise.     Amen."
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
	 
        \[ e8 \pes f \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) e8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  d8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) e8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4 d8 \ln cis4  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  a'8[ b] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "  A   " -- _ "   men." }
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
	                                              \voiceOne fis8[ g] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4 d8 \ln cis4  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  a'8[ b] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>

   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   

} %% book bracket
