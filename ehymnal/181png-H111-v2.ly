%%%% 181.png
%%%% Hymn 111. Das Leiden Des Herrn. O come and mourn with me awhile
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "111"
  
  poet = \markup { \small {  \line { \sans {"DAS LEIDEN DES HERRN."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  
  arranger = \markup { \small \italic "German Traditional Melody." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

%%% inserts a no-break single bar

nbbar = { | \noBreak }

%% push a note slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.6

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%% same as above but smaller movement		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.0
              \once \override Stem #'X-offset = #-2.0 }

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  e2 e e \nbbar b'2.( c4) b2 \nbbar b( a) g \nbbar fis1. \bar "||" \noBreak a2 a a \nbbar \topstraddle a2.( g4) fis2 \nbbar g2( a) b \nbbar e,1 \breathmark \bar "||" \break
  b'2 \nbbar a( fis) g4( fis) \nbbar e1 d2 \nbbar g1 a2 \nbbar b1. \bar "||" \noBreak b2 b b \nbbar a1 b2 \nbbar g fis1 \nbbar e1. \bar "||"
} 
   
alto = \relative c' {
  e2 e e \nbbar e1 e2 \nbbar g( fis) e \nbbar \straddle e2( d1) \bar "||" c2 e fis \nbbar b,1 e2 \nbbar \push e1 fis2 \nbbar \merge e1 \bar "||"
  d2 \nbbar c( e) d \nbbar c1 c2 \nbbar \smallstraddle c2( b) e \nbbar e1( dis2) \bar "||" e gis4( fis) e2 \nbbar e1 b2 \nbbar cis  \straddle e( dis) \nbbar \merge e1. \bar "||"
}

tenor = \relative c {\clef bass 
  e2 e4( fis) g( a) \nbbar b2.( a4) b2 \nbbar cis1 cis2 \nbbar a1( b2) \bar "||" c! c c \nbbar b1 a2 \nbbar g( c) b \nbbar b( a) \bar "||"
  d,2 \nbbar e( a) b4( a4) \nbbar g1 fis2 \nbbar g1 e2 \nbbar fis1. \bar "||" gis2 e' d \nbbar d( c) e \nbbar a, a1 \nbbar g1. \bar "||"
}

bass = \relative c {\clef bass 
  \override Stem #'length = #5	
  e2 e e4( fis4) \nbbar g2.( fis4) g2 \nbbar a1 a,2 \nbbar d1. \bar "||" a2 c d \nbbar e1 e2 \nbbar \push e1 d2 \nbbar \push c1 \bar "||"
  g2 \nbbar \push c1 b2 \nbbar b a1 \nbbar g c2 \nbbar b1. \bar "||" e2 e4( fis) gis!2 \nbbar 
      \once\override Slur  #'control-points = #'((1.5 . 1.5) (3 . 1.5 ) (3.5 . 1.0 ) (4 . 0))
      a( a,) g! \nbbar a2 b1 \nbbar e1. \bar "||"
}

org = \relative c { \clef bass
  \set fontSize = #-3 \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #0.2
  s1.*7 | s1 \bar "||"
  s2 | s1.*3 | s1._\markup { \hspace #5 \lower #1 \normalsize \italic Org. }  \bar "||" e,2 e4( fis) gis2 | a1 s2 | s1. | s1. \bar "||"
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
	\context Voice = org    { \voiceFour \global \org }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Hymn Note and Lyric Attribution markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune to this hymn will be found in the Appendix." }

\markup { \small { \hspace #74 \italic "F. W. Faber, 1814-63." } }
		                                                                                                     
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  COME and mourn with me awhile;"
			                                 "  See Mary calls us to her side;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O come and let us mourn with her:"
					   "    Jesus, our Love, is crucified."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Have we no tears to shed for him,"
				   "    While soldiers scoff and Jews deride?"
				   "Ah, look how patiently he hangs:"
				   "    Jesus, our Love, is crucified."
			}}	
			\hspace #1 
           		\line { "3* "
			   \column {	     
				   "How fast his hands and feet are nailed;"
				   "    His blessèd tongue with thirst is tied;"
				   "His failing eyes are blind with blood:"
				   "    Jesus, our Love, is crucified."
			}}
						\hspace #1 
           		\line { "4* "
			   \column {	     
				   "His Mother cannot reach his face;"
				   "    She stands in helplessness beside;"
				   "Her heart is martyred with her Son's:"
				   "    Jesus, our Love, is crucified."
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "5  "
			  \column {	     
				  "Seven times he spoke, seven words of love;"
				  "    And all three hours his silence cried"
				  "For mercy on the souls of men:"
				  "    Jesus, our Love, is crucified."
			}}
			\hspace #1 
           		\line { "6  "
			  \column {	     
				  "O break, O break, hard heart of mine;"
				  "    Thy weak self-love and guilty pride"
				  "His Pilate and his Judas were:"
				  "    Jesus, Our Love, is crucified."
			}}
			\hspace #1 
           		\line { "7  "
			  \column {	     
				  "A broken heart, a fount of tears,"
				  "    Ask, and they will not be denied;"
				  "A broken heart love's cradle is:"
				  "    Jesus, our Love, is crucified."
			}}			
    		        \hspace #1 
           		\line {"8. "
			  \column {	     
				  "O Love of God! O sin of Man!"
				  "    In this dread act your strength is tried;"
				  "And victory remains with Love:"
				  "    And he, our Love, is crucified."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }} 

}


%%% alternative hymns also suitable

\markup { \hspace #42 \italic "Or the following:" }

\markup { \hspace #34 \small { \column { "  97  Dost thou truly seek renown."
	                     "108  Who is this with garments gory." }}}
	
} %%% book bracket