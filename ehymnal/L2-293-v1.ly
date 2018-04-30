%%%% 442.png
%%%% Hymn 293. WIR PFLUGEN. We plough the fields, and scatter
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—HARVEST"
	\hspace #0.1 }}	
	
	title = "293"   
  
  meter = \markup { \small { \column { 
		\line { "                " }
	  	\line { \sans "WIR PFLUGEN." \hspace #1 \roman "(7 6. 7 6. 7 6. 7 6. 6 6. 8 4.)" } 
  		\line { { \italic "In moderate time" \general-align #Y #DOWN \note #"4" #0.5 "= 100."  }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { "‘" \hspace #-1  \italic  "Bible Class Magazine" \hspace #-1.2 ",’"  "1854," }
		 \line { \italic "said to be arranged from" }
		 \line { \smallCaps "J. A. P. Schulz, 1747-1800." } }} }
 
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
  \time 4/4
  \key a \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 e4 | a4 a4 e4 e4 | cis'2 a4 e4 | d4 cis4 b4 a4 | e'2. \bar "||" a4 | gis4 fis4 e4 cis'4 | b4 ( a4 ) gis4 e4 | \break
  fis4 cis'4 b4 dis,!4 | e2. \bar "||" e4 | b'4 b4 cis4 cis4 | d2 b4 b4 | e4 e4 d4 cis4 | b2. \bar "||" \break
  e,4 | a4 a4 e4 e4 | fis2 cis4 cis4 | d4. b8 e4 gis4 | a1 \bar "||" a4 a4 a4 a4 | b2 b4  b4 | \break
  cis4. e8 d4 cis4 | b2. \bar "||" b4 | cis4 b4 cis4. b8 | a4 gis4  a4. ^\markup { \hspace #1 \fontsize #4 "," } e!8  | 
  %% midi tempo is slightly slowed here as directed by the singing instructions.
  \once \override Score.MetronomeMark #'transparent = ##t
  \once \override TextScript #'padding = #2
  \tempo 4=92 fis4 ^\markup { \italic "A little slower." } ( b4 ) a4 ( gis4 ) | a2. \bar "||"
}
   
alto = \relative c' { 
  e4 | a4 a4 e4 e4 | cis'2 a4 e4 | d4 cis4 b4 a4 | \augdots e'2. \bar "||" e4 | e4 dis4 e4 e4 | e4 ( dis4 ) e4 e4 |
  e4 e4 dis4 b4 | b2. \bar "||" e4 | e4 e4 e4 e4 | e2 e4 e4 | e4 e4 e4 e4 | e2. \bar "||" 
  e4 | a4 a4 e4 e4 | fis2 cis4 cis4 | d4. b8 e4 d4 | cis1 \bar "||" cis4 cis4 cis4 cis4 | e2 e4 gis4 | 
  a4. a8 gis4 a4 | gis2. \bar "||" e4 | e4 e4 e4. e8 | cis4 eis4 fis4. e!8 | d4 ( fis4 ) e2 | e2. \bar "||"
}

tenor = \relative c {\clef bass 
  e4 | a4 a4 e4 e4 | cis'2 a4 e4 | d4 cis4 b4 a4 | e'2. \bar "||" a4 | b4 b4 b4 a4 | gis4 ( fis4 ) e4 b'4 |
  cis4 fis,4 fis4 a4 | gis2. \bar "||" e4 | gis4 gis4 a4 a4 | gis2 gis4 gis4 | a4 a4 gis4 a4 | gis2. \bar "||" 
  e4 | a4 a4 e4 e4 | fis2 cis4 cis4 | d4. b8 e4 b'4 | a1 \bar "||" e4 e4 a4 cis4 | gis2 gis4 e'4 | 
  e4. e8 e4 e4 | e2. \bar "||" b4 | a4 gis4 a4. gis8 | fis4 cis'4 cis4. a8 | a4 ( d4 ) cis4 ( b4 ) | cis2. \bar "||"
}

bass = \relative c {\clef bass 
  e4 | a4 a4 e4 e4 | cis'2 a4 e4 | d4 cis4 b4 a4 | e'2. \bar "||" cis4 | b4 a4 gis4 a4 | b2 cis4 gis4 | 
  a4 a4 b4 b4 | e2. \bar "||" e4 | d4 d4 cis4 cis4 | b2 e4 d4 | cis4 cis4 b4 a4 | e'2. \bar "||" 
  e4 | a4 a4 e4 e4 | fis2 cis4 cis4 | \augdots d4. b8 e4 e4 | a,1 \bar "||" a4 e'4 cis4 a4 | e'2 e4 e4 |
  a4. cis8 b4 a4 | e2. \bar "||" gis4 | a4 e4 \augdots a4. e8 | fis4 cis4 fis4. cis8 | d4 ( b4 ) e2 | a,2. \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}      
  		
	
} %%% Score bracket


%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

%%% Lyric attribution

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.   
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux and looks a little better so it is used here.
%%% Humboldt has been reported to give problems when compiling
%%% on Macintosh installations, so GF Gesetz can be used instead.
%%% In the original image, "s" and "t" were joined in a Fraktur style ligature
%%% comprising a long-s (the one that looks like a "f") and a t.
%%% HumboldtFraktur does have a st ligature, mapped to the pound sign. 
%%% However, to allow the text to degrade gracefully for users who do not have the 
%%% Fraktur font, I did not use the ligatured characters.  Instead, the regular 
%%% unicode character for the long-s (unicode 017F) was used, together with a Fraktur "t", moved
%%% a little closer together, to look like a ligature.
%%% If you do not have a Fraktur font, you should see "Wir pflugen und wir ſtreuen.". 
%%% If you use another Fraktur font, simply put the name into the font-name override below.

\markup {  \small {  \hspace #54 \italic "M. Claudius, 1740-1815.    Tr. June M. Campbell." }} 

\markup { \small { \hspace #42 \override #'(font-name . "HumboldtFraktur") {"Wir pflugen und wir ſ" \hspace #-1.35 "treuen."}}}

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
	     \column {  %% a super column for entire block of lyrics 
                        \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.5 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
                                  \hspace #-0.6   %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "E plough the fields, and scatter"
                                                         "    The good seed on the land," } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "But it is fed and watered"
					   "    By God's almighty hand;"
					   "He sends the snow in winter,"
					   "    The warmth to swell the grain,"
					   "The breezes and the sunshine,"
					   "    And soft refreshing rain;"
					   \italic "    All good gifts around us"
					   \italic "        Are sent from heaven above,"
					   \italic "    Then thank the Lord, O thank the Lord,"
					   \italic "        For all his love."
					   "      " %%% adds vertical spacing between verses
                                        }}
                                   } %% finish verse 1    

                \line { "2  "
                           \column {         
				   "He only is the Maker"
				   "    Of all things near and far."
				   "He paints the wayside flower,"
				   "    He lights the evening star."
				   "The winds and waves obey him,"
				   "    By him the birds are fed;"
				   "Much more to us, his children,"
				   "    He gives our daily bread:"
				   "      " %%% adds vertical spacing between verses
                        }}

                  \line { "3. "
			  \column {        
				  "We thank thee then, O Father,"
				  "    For all things bright and good;"
				  "The seed-time and the harvest,"
				  "    Our life, our health, our food."
				  "No gifts have we to offer"
				  "    For all thy love imparts,"
				  "But that which thou desirest,"
				  "    Our humble, thankful hearts:"
                        }}
          }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  a'1 a1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 cis1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree fis1 e1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d1 a1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
}  

\markup {\hspace #32 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\small {
		\line { \hspace #-18 "309  For the beauty of the earth." \hspace #10 "475  Rejoice, O land, in God thy might." }
		\line {\hspace #-18 "447  O God of Bethel, by whose hand." \hspace #5.4 "532  Let us, with a gladsome mind." }
	}
}} 

\markup { \hspace #24 \italic "Also the other Hymns of Thanksgiving, Nos." "533" \italic "to" "537." }

} %%% book bracket

