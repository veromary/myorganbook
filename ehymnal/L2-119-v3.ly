%%%% 191.png
%%%% Hymn 119. Zu meinem herrn. And now, beloved Lord, thy soul resigning.
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "119"
  
  poet = \markup { \small {  \line { \sans {"ZU MEINEM HERRN."} \hspace #1 \roman {"(11. 10. 11. 10.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small \smallCaps "J. Schicht, 1753-1823." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% push a note slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/1
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1*2 ees1 f2 g | aes g aes aes bes bes | c aes ^\fermata \breathmark \bar "||" c1 bes2 aes | \break
  g ees aes g f f | ees1 \breathmark \bar "||" bes'1 bes2 aes | g g c bes aes g | \break
  aes f1 \breathmark \bar "||" bes2 bes c | des c bes aes f g! | aes1 \bar "||"
} 
   
alto = \relative c' {
  c1 des2 des | c c c ees f ees | ees c \bar "||" ees1 ees2. d4 |
  ees2 bes ees ees ees d | \merge ees1 \bar "||" des! ees2 f | g g aes g f e |
  f c1 \bar "||" ees2 f ees | des f f ees des des | c1 \bar "||"
}

tenor = \relative c {\clef bass 
  aes'1 aes2 bes | aes c c aes aes g | aes aes \bar "||" aes1 bes2 c4( aes) |
  bes2 g aes bes c bes4(aes) | g1 \bar "||" bes1 bes2 bes | bes des c des c c |
  c aes1 \bar "||" ges2 f a | bes c des c c bes | aes1 \bar "||"
}

bass = \relative c {\clef bass 
  aes1 des2 bes | f' e f c des ees | aes, aes _\fermata \bar "||" \merge aes'1 g2 f |
  ees2. d4 c2 bes aes bes | ees1 \bar "||" bes1 c2 des | ees ees aes, bes c c |
  f f1 \bar "||" ees2 des c | bes a bes c des ees | aes,1 \bar "||"  
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% Score block	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    { \voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket

%%% Hymn Note and Lyric Attribution and title markup

\markup { \small { \hspace #74 \italic "Mrs. E. S. Alderson, 1818-88." } }

\markup { \hspace #32 \small "‘Father, into thy hands I commend my Spirit.’" }

%%% Main lyric block

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ND now, belovèd Lord, thy soul resigning"
			                                 "  Into thy Father's arms with conscious will," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Calmly, with reverend grace, thy head inclining,"
					   "    The throbbing brow and labouring breast grow still."
			  		}} 
			         } %%% finish verse 1	
			\hspace #1 
           		\line { "2  "
			   \column {	     
				  "O Love! o'er mortal agony victorious,"
				  "    Now is thy triumph! now that Cross shall shine"
				  "To earth's remotest age revered and glorious,"
				  "    Of suffering's deepest mystery the sign."
			}} 
    }	%%% end super column  
}	


%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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


%%% second page
%%% continuation of  lyrics

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
		  	\hspace #1 
           		\line { "3  "
			   \column {	     
				   "My Saviour, in mine hour of mortal anguish,"
				   "    When earth grows dim, and round me falls the night,"
				   "O breathe thy peace, as flesh and spirit languish;"
				   "    At that dread eventide let there be light."
			}}      
    		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "To thy dear Cross turn thou mine eyes in dying;"
				  "    Lay but my fainting head upon thy breast;"
				  "Those outstretched arms receive my latest sighing;"
				  "    And then, O! then, thine everlasting rest."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne aes'1 aes \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo des1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree f1 ees \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  des1 aes \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} 

}
	
%%% alternative hymns also suitable

\markup { \hspace #30 \italic "Or the following: " \small  "102  O sacred head, sore wounded." }

\markup {\hspace #38 \italic "The following are also suitable:"}

\markup { \hspace #36 \column {
	\small {
	"  80  My God, I love thee; not because."
	"  95  Sing, my tongue, the glorious battle."
	"471  Praise to the Holiest in the height."  }
}} 

} %%% book bracket
