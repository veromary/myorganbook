%%%% 406.png
%%%% Hymn 260. Melcombe. New every morning is the love
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	\hspace #0.1 }}	
	
	title = "260"   
  
  poet = \markup { \small {  \line { \sans { "MELCOMBE."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderate slow} \general-align #Y #DOWN \note #"2" #0.5 = 69.}}
  
  arranger = \markup { \small { \smallCaps "S. Webbe" "the elder, 1740-1816." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%creates double dots when two dotted noteheads are merged. Lilypond only places one dot by default.

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
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
  \autoBeamOff
}

soprano = \relative c' { 
  \partial 2 a'2 | a2 g2 fis2 e2 | d2 b'2 a2^\fermata \bar "||" a2 | d2 cis2 b2 a2 | a2 gis2 a2^\fermata \bar "||" \break
  fis2 | fis2 g2 a2 fis2 | e2. fis4 g2^\fermata \bar "||" g2 | fis2 e2 a2 g2 | fis2 e2 d2^\fermata \bar "||"
}
   
alto = \relative c' {  
  d2 | a2 b4 ( cis4 -) d2 cis2 | b2 d2 d2 \bar "||" d2 | d2 e2 fis2 e2 | d2 e4 ( d4 -) cis2 \bar "||" 
  d2 | d2 cis4 ( b4 -) a2 d2 | \augdots e2. d4 b2 \bar "||" e2 | d2 cis2 d2 d2 | d2 cis2 d2 \bar "||" 
}

tenor = \relative c {\clef bass 
  fis2 | fis2 g2 a2 a2 | fis2 g2 fis2 \bar "||" fis2 | a2 gis2 fis2 a2 | b2 b2 a2 \bar "||" 
  a2 | a2 g2 fis2 a2 | a2. a4 g2 \bar "||" a2 | a2 a2 a2 b2 | a2 g2 fis2 \bar "||" 
}

bass = \relative c {\clef bass 
  d2 | fis2 e2 d2 a2 | b2 g2 d'2_\fermata \bar "||" fis2 | fis2 e2 d2 cis2 | b2 e2 a,2_\fermata \bar "||" 
  d2 | d2 e2 fis2 d2 | cis2. d4 e2_\fermata \bar "||" cis2 | d2 a4 ( g4 -) fis2 g2 | a2 a2 d2_\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "A higher setting of this tune will be found at Hymn" "631." }


%%% Lyric titles and attributions

\markup { "                " }

\markup { "                " }

\markup {  \small {  \hspace #66 \italic "J. Keble, 1792-1866." }} 


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.0 \column { \lower #2.4 \fontsize #8 "N" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EW every morning is the love"
			                                "  Our wakening and uprising prove;" } }          
	                  \line {  \hspace #3.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Through sleep and darkness safely brought,"
					   "Restored to life, and power, and thought."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2   "
			   \column {	     
				   "New mercies, each returning day,"
				   "Hover around us while we pray;"
				   "New perils past, new sins forgiven,"
				   "New thoughts of God, new hopes of heaven."
				   "          " %%% adds vertical spacing between verses
			}}
			 \line { "3   "
			   \column {	     
				   "If on our daily course our mind"
				   "Be set to hallow all we find,"
				   "New treasures still, of countless price,"
				   "God will provide for sacrifice."
				   "          " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
      
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "4   "
			   \column {	     
				   "Old friends, old scenes, will lovelier be,"
				   "As more of heaven in each we see;"
				   "Some softening gleam of love and prayer"
				   "Shall dawn on every cross and care."
				   "          " %%% adds vertical spacing between verses
			}}	   
			\line { "5*" \hspace #0.28
			   \column {	     
				   "We need not bid, for cloistered cell,"
				   "Our neighbour and our work farewell,"
				   "Nor strive to wind ourselves too high"
				   "For sinful man beneath the sky:"
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "6*" \hspace #0.28
			   \column {	     
				   "The trivial round, the common task,"
				   "Would furnish all we ought to ask,--"
				   "Room to deny ourselves, a road"
				   "To bring us daily nearer God."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "7.  "
			   \column {	     
				   "Only, O Lord, in thy dear love"
				   "Fit us for perfect rest above;"
				   "And help us this and every day"
				   "To live more nearly as we pray."
				   "          " %%% adds vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn d1 d1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  

%%% Markup for "See also:" line
\markup {\hspace #20 \column {
	\line{ \italic "See also for Sunday Morning:" " 50 This day the first of days was made."}
	\line{ \italic "For other days, Hymns" "52" \italic "to" "57."}
	\line{ \italic "For Sundays and Week-days:" " 165 Father, we praise thee."}
	
}}      
      

} %%% book bracket

