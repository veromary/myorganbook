%%% 169.png
%%% Hymn 101 Der Tag Bright An. My God! My God! and can it be
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE" \hspace #0.1 }}
  title = "101"
  poet = \markup {  \small { \sans {"DER TAG BRICHT AN."}   \hspace #1 \roman {"(L. M.)"}} }
  meter = \markup { \small { \italic {Slow and solemn } \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 84 "(" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42")." }  }
  arranger =  \markup { \small { \italic "Melody probably by" \smallCaps "M. Vulpius, 1560-1616?" } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%Macros

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

%%%%%%%%%%%%%%%%%%%%%End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  e2 b'4 b | c2 b |  a4(e) g(fis) |  e2. \bar "||" e4 | \break
  g e b' cis |  d(b) d4 (cis) | b2. \bar "||" b4 | b ais b fis | \break
  a2 g |  fis2. \bar "||"   b4 | b a g e | g2 fis | e1^\fermata \bar "||"  
}

alto = \relative c' { 
  g4(a) b fis' | e2 g4(fis) | e2 e4(dis) | \augdots e2. \bar "||" c4 | \break
  b e fis e | d (fis) fis2 | dis2. \bar "||" g4 | fis e dis d | \break
  e(dis) e2 | fis2. \bar "||" g4 | g fis8 e d4 e | cis(e2) dis4 | \once \override NoteColumn #'force-hshift = #-0.02  e1 \bar "||" 
}

tenor = \relative c { \clef bass 
  e4(fis) g b | g(a) b2 |  c4(a) b2 |  g2. \bar "||"  a4 | \break
  g g fis ais | b2. ais4 | b2. \bar "||" b4 | b e, fis b | \break
  c2 b4(cis) | dis2. \bar "||" d!4 | d c d b | cis2 fis, | g1 \bar "||" 
}

bass = \relative c { \clef bass 
  e2 e4 d | c2 g | a4(c) b2 |  e2. \bar "||" a,4 | \break
  e'4 e d cis | b(d) fis2 | b,2. \bar "||" e4 | d cis b b | \break
  a2 e' | b2. \bar "||" g4 | g a b g | a2 b | e1_\fermata \bar "||" 
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
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2)}} 

} %%% Score bracket

%%% alternative tune text markup

\markup { \hspace #19  \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "St. Crispin" \italic "(No. 246)."}

%%% Lyrics title markup

\markup { \line { \small { \hspace #66 \italic "F. W. Faber, 1814-63." } } }  

%%% Main lyric block markup  

\markup { \hspace #28 %%add space as necc. to center the column
	       \column { %%% everything goes into a super column with sub columns as necessary  
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "Y God! my God! and can it be"  
			                                 "  That I should sin so lightly now," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And think no more of evil thoughts"
					   "    Than of the wind that waves the bough?"
			  		}}
			       
			           } %%% finish verse 1	
			\hspace #1 % adds vertical spacing between verses  
			\line { "2  "
			\column {	     
				"I walk the earth with lightsome step,"
				"    Smile at the sunshine, breathe the air,"
				"Do my own will, nor ever heed"
				"    Gethsemane and thy long prayer."
			}}
         }  %%% end super column
} %%% end markup	 
	
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
%%% Continuation of lyrics

\markup { \hspace #28   %%add space as necc. to center the column
          \column { 
           	\line { "3  "
		   \column {	     
			   "Shall it be always thus, O Lord?"
			   "    Wilt thou not work this hour in me"
			   "The grace thy Passion merited,"
			   "    Hatred of self, and love of thee!"
			}}
		  \hspace #1 % adds vertical spacing between verses  
		  \line { "4  "
		    \column {	     
			    "Ever when tempted, make me see,"
			    "    Beneath the olives' moon-pierced shade,"
			    "My God, alone, outstretched, and bruised,"
			    "    And bleeding, on the earth he made;"
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5. "
		    \column {	     
			    "And make me feel it was my sin,"
			    "    As though no other sins there were,"
			    "That was to him who bears the world"
			    "    A load that he could scarcely bear."
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

       } %%% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }} }

}  %%% close book bracket