%%% 050png
%%% Hymn 14 Come thou redeemer of the Earth
%%% Version 3


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - CHRISTMAS EVE"
		\hspace #0.1 }}	
  title = "14"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}


%% macro settings for stemless long note which is 2x duration of regular white note    
longnote = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }



plainsong = \context VaticanaVoice  {  \relative c' { 
        \override Staff.Clef #'#'font-size = #3
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6	
        \key c \major 
  \[ c,8 \pes d8 \]  
      \override Accidental #'extra-offset = #'(-1 . 0.2 ) 
      \[d8\melisma \pes a' \virga bes\melismaEnd \] 
      a8 a8 \[ a8 \flexa g8 \] \[ g8 \pes a8 \]
      g8 \[ g8 \flexa f8 \] \bar "|" a8 a8 g8 \bar "" \break 
      
  \[ f8 \flexa e8 \]  d8 \[ e8 \pes f8 \] \[ d8 \flexa c8 \]
      \[c8 \pes d8 \] \bar "|" a8 \[ c8 \pes d8 \]  
      d8 \[ d8 \pes f8 \] \[ f8 \flexa d8 \] \bar "" \break

  e8 d8 c8 \bar "|" g'8 g8 f8 
      \[ g8\melisma a8 g8\melismaEnd \] 
      \[ e8 \flexa d8 \] \[ e8 \pes f8 \] \[ d8 \flexa c8 \] 
      \[ c8 \pes d8 \] \bar "||" 
}}

soprano = \relative c' {
	\autoBeamOff

  ees8[ f8] f8[ c'8 des8] c8 c8 
      c8[ bes8] bes8[ c8] bes8 bes8[ aes8] \bar "|" c8 c8 bes8 \bar ""

  aes8[ g8] f8 g8[ aes8] f8[ ees8] ees8[ f8] \bar "|" 
      c8 ees8[ f8] f8 f8[ aes8] aes8[ f8] \bar ""

  g8 f8 ees8 \bar "|" bes'8 bes8 aes8 bes8[ c8 bes8] 
      g8[ f8] g8[ aes8] f8[ ees8] ees8[ f8] \bar "||" 
}


alto = \relative c' {
	\autoBeamOff
	
  \longnote c4 \longnote f4. ~ f8 aes8 
      aes8[ ees8] \longnote ees4 ~ ees8 ees8[ c8] \bar "|" aes'8 aes8 g8 
       
   \longnote c,4 ~ c8 \longnote ees4 des8[ c8] bes8[ aes8] \bar "|" 
       c8 \longnote c4 ~ c8 ~ 
       \once \override NoteHead #'duration-log = #-1  
       \once \override NoteColumn #'force-hshift = #0.8
       c\breve*1/4
       
   ees8 d!8 ees8 \bar "|" ees8 ees8 c8 \longnote ees4. ~ ees8[ c8] 
       \longnote ees4 des8[ c8]  \longnote c4 \bar "||" 
}

tenor = \relative c { \clef bass
	\autoBeamOff

   \longnote \once \override NoteColumn #'force-hshift = #1.6 aes'4 \longnote aes4. aes8 c8 
      c8[ ees8] ees8[ aes,8] ~ aes8 g8[ aes8] \bar "|" ees'8 ees8 ees8 
      
   \longnote c4 ( aes8 ) \longnote c4 \longnote aes4 ees8[ c8] \bar "|" 
       aes'8 ~ \longnote \once \override NoteColumn #'force-hshift = #1.6 aes4 ~ 
       aes8 ~ \once \override NoteHead #'duration-log = #-1 aes\breve*1/4
       
   bes8 ~ bes8 g8 \bar "|" g8 g8 f8 \longnote g4.( bes8[ ) aes8] \longnote c4 
       \longnote aes4 g8[aes8] \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  aes'8[ f8] \longnote f4 des8 f8 f8 
      f8[ g8] g8[ aes8] ees8 ees8[ aes8] \bar "|" aes8 aes8 ees8 
      
  \longnote f4 ~ f8 \longnote c4 des!8[ aes8] g8[ f8] \bar "|" 
      aes'8 aes8[ f8] f8 \once \override NoteHead #'duration-log = #-1 f\breve*1/4
 
  ees8 bes8 ees8 \bar "|" ees8 ees8 f8 \longnote ees4. ~ ees8[ f8] \longnote c4 
      des!8[ aes8] c8[ f,8] \bar "||" 
}


global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
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
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
		  \consists "Mark_engraver"
 	}
	
 }
 
\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

\markup {
	\column {
	    \line { \small { \hspace #10 \smallCaps { "Office Hymn. E."} \hspace #25 \italic {"St. Ambrose, 340-97.    Tr. J. M. Neale and others."}  }  }
	    \line { \hspace #42 \small "Veni, Redemptor gentium"}
   }}

\markup { \hspace #0   %%add space as necc. to center the column
	    \fill-line  {	
 
             \column { 
          \column { 
		  \line { \hspace #0.1 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "OME, thou Redeemer of the earth," "And manifest thy virgin-birth:"  } }          
	          \line { \hspace #0.2  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Let every age adoring fall;" 
				"Such birth befits the God of all." 
			  		}}
	           } %% finish stanza 1

      }}}

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}

%%second page		

\markup { \hspace #33   %%add space as necc. to center the column  
         	 \column {		 		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Begotten of no human will," 
			       "But of the Spirit, thou art still" 
			       "The Word of God in flesh arrayed," 
			       "The promised fruit to man displayed."
		   }} %% finish stanza 2

		   \hspace #0.2 % adds vertical spacing between verses
		      \line { "3  "
		       \column {	     
			      "The virgin womb that burden gained" 
			      "With virgin honour all unstained;" 
			      "The banners there of virtue glow;" 
			      "God in his temple dwells below."  	   
	          }} %% finish stanza 3

		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "4  "
		    \column {    
			    "Forth from his chamber goeth he," 
			    "That royal home of purity," 
			    "A giant in twofold substance one," 
			    "Rejoicing now his course to run." 
 	          }} %% finish stanza 4


		\hspace #0.2 % adds vertical spacing between verses
	  	\line { "5  "
             \column {    
		     "From God the Father he proceeds," 
		     "To God the Father back he speeds;" 
		     "His course he runs to death and hell," 
		     "Returning on God's throne to dwell." 
 	   }} %% finish stanza 5

		\hspace #0.2 % adds vertical spacing between verses
		\line { "6  "
		\column {
			"O equal to thy Father, thou!"
			"Gird on thy fleshly mantle now;"
			"The weakness of our mortal state"
			"With deathless might invigorate."
		}} %% finish stanza 6

		\hspace #0.2 % adds vertical spacing between verses
		\line { "7  "
		\column {
			"Thy cradle here shall glitter bright,"
			"And darkness breathe a newer light,"
			"Where endless faith shall shine serene,"
			"And twilight never intervene."
		}} %% finish stanza 7

		\hspace #0.2 % adds vertical spacing between verses
		\line { "8. "
		\column {
			"All laud to God the Father be,"
			"All praise, eternal Son, to thee:"
			"All glory, as is ever meet,"
			"To God the Holy Paraclete."
		}} %% finish last stanza 
	  
          } %% column bracket
} %%markup bracket


\score {  %%Amen score block	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c' { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
     \[ d,8 \pes e8 \] 
     \[  \override NoteHead #'extra-offset = #'(0.0 . -0.2) d8 
         \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  c8 \pes 
          \override NoteHead #'extra-offset = #'(0.02 . 0.0) d8 \] }}
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g8] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo c8[ ees8] des8 \longnote c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass \global
	                                          \voiceThree aes'8[ c8] \longnote aes4 ~ aes8  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass \global
						  \voiceFour f8[ c8] des8[ aes8 f8]\bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- _ men. }
  >>
>>

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }	 
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

%%Amen midi
%%Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }

}
	

} %% book bracket