%%%% 433.png
%%%% Hymn 284. HERZLICH THUT MICH ERFREUEN. O day of rest and gladness
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—SUNDAY"
	\hspace #0.1 }}	
	
	title = "284"   
  
  meter = \markup { \small { \column { \line { \sans "HERZLICH THUT MICH ERFREUEN." \hspace #1 \roman "(7 6. 7 6. D.)" } 
                                       \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"4" #0.5 "= 132." }}}}}
	  
  arranger = \markup { \small { \center-align { 
		 \line { \italic "Chorale founded on a" }
		 \line { \italic "German Mediaeval Traditional Melody."}}}}
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override Tie #'extra-offset = #'(0.0 . 0.7)		
  \partial 4 ees4 | ees2 ees4 g2 ees4 | bes'2. bes2 ees4 | d2 bes4 c2 bes4 | g2. ~ g2 \bar "||" ees4 | bes'2 c4 d2 bes4 | \break
  ees2. d2 c4 | bes2 g4 aes4 f2 | ees2. ~ ees2 \bar "||" ees4 | bes'2 bes4 aes2 g4 | aes2. g2 ees4 | \break 
  g2 c4 bes2 aes4 | f2. \bar "||" c'2. | bes2 bes4 aes2 g4 | ees2. g2 c4 | bes2 g4 aes4 f2 | ees2. ~ ees2 \bar "||" 
}
   
alto = \relative c' { 
  \override Tie #'extra-offset = #'(0.0 . -0.5)	
  bes4 | bes2 bes4 ees2 ees4 | d2. d2 ees4 | aes2 bes4 aes2 f4 | ees2. ~ ees2 \bar "||" ees4 | f2 ees4 d2 d4 | 
  ees2. ees2 ees4 | d2 ees4 ees4 d2 | \augdots ees2. ~ ees2 \bar "||" ees4 | f2 f4 ees4 ( f4 ) ees4 | ees2 ( d4 ) ees2 c4 | 
 ees2 ees4 ees2 ees4 | d2. \bar "||" ees2. | g2 ees4 ees4 ( f4 ) ees4 | \augdots ees2. d2 c4 | ees2 ees4 ees4 d2 | \augdots ees2. ~ ees2 \bar "||" 
}

tenor = \relative c {\clef bass 
  \override Tie #'extra-offset = #'(0.0 . 0.5)	
  g'4 | g2 g4 g2 aes4 | bes2. bes2 bes4 | d2 ees4 ees2 d4 | bes2. ~ bes2 \bar "||" g4 | bes2 a4 bes2 aes!4 | 
  g2. bes2 aes4 | f2 ees4 c'4 bes2 | g2. ~ g2 \bar "||" g4 | bes2 d4 c2 bes4 | aes2. bes2 aes4 | 
  bes2 aes4 bes2 c4 | bes2. \bar "||" c2. | d2 ees4 c2 bes4 | c2. g2 aes4 | bes2 c4 c4 bes2 | g2. ~ g2 \bar "||" 
} 

bass = \relative c {\clef bass 
  \override Tie #'extra-offset = #'(0.0 . -0.5)	
  ees4 | ees2 ees4 c2 c4 | bes2. aes'2 g4 | f2 g4 aes2 bes4 | ees,2. ~ ees2 \bar "||" ees4 | d2 c4 bes2 bes4 | 
  c2. g2 aes4 | bes2 c4 aes4 bes2 | ees2.  ~ ees2 \bar "||" ees4 | d2 bes4 c4 ( d4 ) ees4 | f2. g2 aes4 | 
  ees2 aes4 g2 aes4 | bes2. \bar "||" aes2. | g2 g4 c,4 ( d4 ) ees4 | c2. bes2 aes4 | g2 c4 aes4 bes2  | ees2. ~ ees2 \bar "||" 
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
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 132 4) }}      
  		
	
} %%% Score bracket


%%% Lyric titles and attributions

 \markup { "                " }

\markup {  \small {  \hspace #64 \italic "Bishop Chr. Wordsworth, 1807-85." }} 

%%% Lyrics

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " DAY of rest and gladness,"
			                                "    O day of joy and light," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O balm of care and sadness,"
					   "    Most beautiful, most bright;"
					   "On thee the high and lowly,"
					   "    Through ages joined in tune,"
					   "Sing Holy, Holy, Holy,"
					   "    To the great God triune."
					   "                " %%% adds vertical spacing between verses
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

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
		        \hspace #1  % adds vertical spacing between verses  
			\line { \hspace #-10  \italic "Unison."  " 2  "
			\column {	     
				"On thee at the creation"
				"    The light first had its birth;"
				"On thee for our salvation"
				"    Christ rose from depths of earth;"
				"On thee our Lord victorious"
				"    The Spirit sent from heaven;"
				"And thus on time most glorious,"
				"    A triple light was given."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			\column {	     
				"Thou art a cooling fountain"
				"    In life's dry dreary sand;"
				"From thee, like Pisgah's mountain"
				"    We view our promised land;"
				"A day of sweet refection,"
				"    A day thou art of love,"
				"A day of resurrection"
				"    From earth to things above."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "4. "
			\column {	     
				"New graces ever gaining"
				"    From this our day of rest,"
				"We reach the rest remaining"
				"    To spirits of the blest."
				"To Holy Ghost be praises,"
				"    To Father, and to Son;"
				"The Church her voice upraises"
				"    To thee, blest Three in One.      Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 132 4) }}  %%Amen midi       
}  


%%%End hymn note

\markup { \hspace #42 \italic "See also Nos." "50" \italic "and" "51." }
	
} %%% book bracket

