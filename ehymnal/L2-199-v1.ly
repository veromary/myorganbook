%%%% 316a.png	
%%%% Hymn 199. Ballerma. How bright these glorious spirits shine! 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
	title = "199"   
  
  poet = \markup { \small { \line { \sans { \smallCaps "BALLERMA."} \hspace #1 \roman {"(C. M.)" }} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 116.} }
  
  arranger = \markup { \small \italic "Probably Spanish Melody." }
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%% raise and lower ties a little to clear of other notes.

tieraise = \once \override Tie #'extra-offset = #'(0.0 . 1.0) 

tielower = \once \override Tie #'extra-offset = #'(0.0 . -1.0) 

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key a \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { \partial 4 a'4 | cis2 b4 a2 fis4 | e2 fis4 a2 \bar "||" a4 | cis2 b4 cis4 ( e4 ) cis4 | \tieraise b2. ~ b2 \bar "||" \break 
  a4 | cis2  b4 a2 fis4 | e2 cis4 e2 \bar "||" b'4 | cis4 ( e4 ) cis4 b4. ( cis8 ) b4 | \tieraise a2. ~ a2 \bar "||" }
  \tag #'Amen { \cadenzaOn a1 a1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'Tune {  e4 | e2 d4 cis2 d4 | cis2 d4 e2 \bar "||" fis4 | e2 e4 e2 e4 | \tielower e2. ~ e2 \bar "||" 
  e4 | e2 d4 cis2 d4 | e2 a,4 b2 \bar "||" e4 | e2 e4 fis2 d4 | \tielower cis2. ~ cis2 \bar "||" }
      \tag #'Amen { d1 cis1  \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'Tune {  cis'4 | a2 gis4 a2 a4 | a2 a4 a2 \bar "||" a4 | a2 gis4 a4 ( cis4 ) a4 | \tieraise gis2. ~ gis2 \bar "||" 
  cis4 | a2 gis4 a2 a4 | a2 a4 gis2 \bar "||" gis4 | a4 ( cis4 ) a4 a2 gis4 | \tieraise a2. ~ a2 \bar "||" }
      \tag #'Amen { fis1 e1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'Tune {  a'4 | a2 e4 fis2 d4 | a2 d4 cis2 \bar "||" d4 | a'2 e4 a2 cis,4 | \tielower e2. ~ e2 \bar "||" 
  a4 | a2 e4 fis2 d4 | cis2 fis4 e2 \bar "||" e4 | a2 cis,4 d2 e4 | \tielower a,2. ~ a2 \bar "||" }
      \tag #'Amen { d1 a1 \bar "||" }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #28 A -- men.
}
	
vfoursoprano = \relative c' { 
	\override Score.SeparationItem #'padding = #4	
	\once \override TextScript #'padding = #1
	a'4 ^\markup { \hspace #-8 \small \italic "Verse 4, line 1, should be sung:"}  
                  cis b a2 fis4 \bar "|" e2 fis4 a2 \bar "||" }

vfouralto = \relative c' { e4 e d cis2 d4 \bar "|" cis2 d4 e2 \bar "||" }

vfourtenor = \relative c { \clef bass cis'4 a gis a2 a4 \bar "|" a2 a4 a2 \bar "||" }

vfourbass = \relative c { \clef bass a'4 a e fis2 d4 \bar "|" a2 d4 cis2 \bar "||" }

vfourlyrics = \lyricmode {
   \override LyricText #'font-size = #-1.
   Hun -- ger and thirst are felt no more,
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
 
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \inlinelyrics }
 			      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
} %%% Score bracket


%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 116 4) }}      
  	
	
} %%% end score bracket

%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 116 4) }}      
  	
	
} %%% Score bracket


%%% Score block for the alternative tune for Verse 4 - layout only, no midi

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \vfoursoprano }
	\context Voice = altos    { \voiceTwo \global \vfouralto }
	                      >>
 
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \vfourlyrics }
 			      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \vfourtenor }
	\context Voice = basses { \voiceTwo \global \vfourbass }
			        >>
>>
\layout {
		indent=0
		ragged-right = ##t
		line-width = 20 \cm 
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
} %%% Score bracket


%%% Lyric attributions and titles


\markup { \small { \hspace #66 \italic "I. Watts and others, 16th cent." }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OW bright these glorious spirits shine!"
			                                "  Whence all their white array?" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "How came they to the blissful seats"
					   "    Of everlasting day?"
					   "         " %%% adds blank spacing between verses
			  		}}
		      }
		      	   \line { \hspace #-9.6 \italic "Unison. "  "2  "
			   \column {	     
				   "Lo! these are they from sufferings great"
				   "    Who came to realms of light,"
				   "And in the Blood of Christ have washed"
				   "    Those robes that shine so bright."
				   "           " %%% adds vertical spacing between verses
			}}
		      
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

			   \line { "3  "
			   \column {	     
				   "Now with triumphal palms they stand"
				   "    Before the throne on high,"
				   "And serve the God they love amidst"
				   "    The glories of the sky."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "Hunger and thirst are felt no more,"
				   "    Nor sun with scorching ray;"
				   "God is their sun, whose cheering beams"
				   "    Diffuse eternal day."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "5  "
			   \column {	     
				   "The Lamb, which dwells amid the throne,"
				   "    Shall o'er them still preside,"
				   "Feed them with nourishment divine,"
				   "    And all their footsteps guide."
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "6. "
				\column {	     
				   "In pastures green he'll lead his flock"
				   "    Where living streams appear;"
				   "And God the Lord from every eye"
				   "    Shall wipe off every tear."
     			}}

	  }
} %%% lyric markup bracket
  

} %%% book bracket
