%%% 294.png
%%% Hymn 182.  The merits of the Saints
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - MARTYRS"
		\hspace #0.1 }}	

  title = "182"
  
  arranger = \markup { \small { "Mode vii." }}
  
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
           \once \override NoteColumn #'force-hshift = #'1.6 }	   
	   
%%% Half-height bar.  Prints a bar glyph which spans only the middle two staff lines.  
%%% This macro works by replacing the glyph used by the \bar "|" function.

halfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {   \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.0 . 1.0) #0  
                                                                                                                    
            }         
        \bar "|"}  	

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where you might normally put \bar "|:"	

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
					\once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0)
							\raise #1.4 \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
					} }	
					\bar "|:"
}	

%%% Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%% This macro works by replacing the glyph used by the \bar "||" function. 
%%% This special glyph is wider to correspond to the plainsong equivalent which includes a custos
 
fdendrepeatcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \hspace #1.8 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                           \column { \with-color #black {  
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 .} }
                                                              \hspace #0 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
           
            } }         
        \bar "||"} 	

%%% Prints a single line bar but spaces it to match a plainsong aingle bar that includes a custos.
 
barcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  { 
                                                              \hspace #2.4 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
            
             }         
        \bar "|"} 		
	
%%% raise tie a little to clear of other notes.

tieraise = \once \override Tie #'extra-offset = #'(0.0 . 1.0) 

%%%%%%   
%%%%%% Equivalent macros for plainsong    
%%%%%%	   
	      
%%% prints a repeat sign glyph comprising 3 dots. Used  to begin a repeat at the start of a piece on a plainsong staff 

ptdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
					\once \override Staff.BarLine #'text = \markup  {  \line { \hspace #0.0 \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
					} }	
					\bar "|:"
}	

%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
%%% This special glyph includes a custos on the 3rd staff line
 
ptdendrepeatcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
		    \hspace #0.1 \raise #0.8 { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . }}                          
		    \hspace #0  \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
             }         
        \bar "||"}	

%%% prints a singleline bar with a custos just before it on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "|" function.
	
pbarcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { 
		    \hspace #0.1 \lower #1.4 { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . }}                          
		    \hspace #0  \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
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
	\clef "vaticana-do2"
	\set fontSize = #3
        \key c \major 
        \set Staff.explicitClefVisibility = #end-of-line-invisible
  
  \ptdstartrepeat g'8 b c \[ d \pes e \] c d \phalfbar g, \[ a \pes b \] c \[ \virga b \inclinatum a \inclinatum g \] a g \ptdendrepeatcustos \break

  %%% change clef
  \once \override VaticanaStaff.Clef #'non-default = ##t 
  \clef "vaticana-do1"
  
  c d e g f e \phalfbar g f e d c \[ b \flexa a \] \pbarcustos \break

  %%% change clef
  \once \override VaticanaStaff.Clef #'non-default = ##t 
  \clef "vaticana-do2"  
  
  \[ b c \pes d \] a \[ g \pes a \flexa f \] a \[ g \pes a \] b \[ \virga c \inclinatum b \inclinatum a \] g \bar "||"
}}
  
  
%%% SATB voices

global = {
  \key a \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  \tag #'repeatpart { \fdstartrepeat e8 gis a b[ cis] a b \halfbar e, fis[ gis] a gis[ fis e] fis e \fdendrepeatcustos }
  \tag #'remainder  { a b cis e d cis \halfbar e d cis b a gis[ fis] \barcustos
  gis[ a b ] fis e[ fis d] fis e[ fis] gis a[ gis fis] e \bar "||" }

}


alto = \relative c' {
	\autoBeamOff
  \tag #'repeatpart { b8 e e \ln e4 cis8 e \halfbar e \ln d4 e8 \ln cis4( e8) d b \bar "|" }
  \tag #'remainder  { e8 e e gis a a \halfbar a fis a gis fis e[ d] \barcustos
  d8( \ln e4) cis8 b[ cis d] cis8 ~ \ln cis4 ~ cis8 ~ cis8[ e d] b \bar "||" }
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \tag #'repeatpart { \fdstartrepeat gis'8 b cis \ln gis4 a8 gis \halfbar gis \ln b4 cis8 \ln e,4( a8) a gis \fdendrepeatcustos }
  \tag #'remainder  { a8 gis a b d e \halfbar cis d e e cis cis[ a] \barcustos
  b[ a gis] a b( \ln a4 ~ ) \tieraise a8 ~ \lnc a4 e8 ~ \ln e4 ( a8) gis8 \bar "||" }
}

bass = \relative c { \clef bass
	\autoBeamOff
  \tag #'repeatpart { e8 ~ e cis \lnb e4 fis8 e \halfbar cis \lnb b4 a8 \lnb cis4. d8 e \bar "|" }
  \tag #'remainder  { cis e a e fis a \halfbar a d, a' e fis cis[ d] \barcustos
  b[ cis e] fis gis( \lnb fis4 ~ ) fis8 a8[ fis] cis a[ cis d] e \bar "||" }
}


#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
 % between-system-space = 0\mm
 bottom-margin = 4\mm
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
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
      \context Voice = altos {\voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
      \context Voice = bass {\voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%% Lyric titles and attributions

\markup { \hspace #9 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of many" \hspace #34 \italic "8th cent.  Tr. J. M. Neale." }    
	\line { \hspace #4  "Martyrs. " "E." \italic "and" "M." } 
	\line { \hspace #35 "Sanctorum meritis." }
	\line { "           " }
}}}


%%% Lyrics

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE merits of the Saints,"
			                                 "  Blessèd for evermore," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Their love that never faints,"
					   "    The toils they bravely bore—"
					   "For these the Church to-day"
					   "Pours forth her joyous lay—"
					   "These victors win the noblest bay."
			  		}}
		      } %%end verse 1
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

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
		  	% \hspace #1  % adds vertical spacing between verses  
			  \line { "2  "
			   \column {	     
				  "They, whom this world of ill,"
				  "    While it yet held, abhorred;"
				  "Its withering flowers that still"
				  "    They spurned with one accord—"
				  "They knew them short-lived all,"
				  "And followed at thy call,"
				  "King Jesu, to thy heavenly hall."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			   \column {	     
				   "Like sheep their blood they poured;"
				   "    And without groan or tear,"
				   "They bent before the sword"
				   "    For that their King most dear:"
				   "Their souls, serenely blest,"
				   "In patience they possest,"
				   "And looked in hope towards their rest."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "What tongue may here declare,"
				   "    Fancy or thought descry,"
				   "The joys thou dost prepare"
				   "    For these thy Saints on high!"
				   "Empurpled in the flood"
				   "Of their victorious blood,"
				   "They won the laurel from their God."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "5. "
				\column {	     
					"To thee, O Lord most high."
					"    One in Three Persons still,"
					"To pardon us we cry,"
					"    And to preserve from ill:"
					"Here give thy servants peace,"
					"Hereafter glad release,"
					"And pleasures that shall never cease.     Amen."
     			}}

	  }
} %%% lyric markup bracket


%%% Amen score block

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ g'8 \pes a8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) g8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  f8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) g8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ fis] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln cis4 ~ cis8[ d b] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln a'4 ~ \ln a4( gis8) \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ fis8] a8[ fis8 e8] \bar "||" }}
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
	                                              \voiceOne e8[ fis] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln cis4 ~ cis8[ d b] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln a'4 ~ \ln a4( gis8) \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ fis8] a8[ fis8 e8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }

} %% book bracket

