%%%% 262.png
%%%% Hymn 162. Nicaea. Holy, Holy, Holy! Lord God Almighty!
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - TRINITY SUNDAY"
	\hspace #0.1 }}	
	
	title = "162"   
  
  poet = \markup { \small {  \line { \sans { "NICAEA."} \hspace #1 \roman {"(11 12. 12 10.)"}} }}
  
  %meter = \markup { \small { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42. } }
  
   meter = \markup { \small { \italic {Very slow} \general-align #Y #DOWN \note #"2" #0.5 = 42. } }
  
  
  arranger = \markup { \small \smallCaps "J. B. Dykes, 1823-76." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves as found in the last measure (soprano and alto) of this piece. 
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-0.8 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.3 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #-0.8 \musicglyph #"noteheads.s0" \hspace #-1.3 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.05		  

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override Score.MetronomeMark #'transparent = ##t 	
  \tempo 2=46 d2 d2 ^\fermata  fis2 fis2 ^\fermata | a1 a1 | b1 b2 b2 | a1 fis1 ^\fermata \bar "||" 
  \tempo 2=50 a2. ^\markup { \small { \italic "Slightly faster" \general-align #Y #DOWN \note #"2" #0.5 = 50.}} a4 a2 a2 | \break
  d1 cis2 a2 | e2 a2 b2. a4 | a\breve \bar "||" d,2 d2 fis2 fis2 | a1 a1 | \break
  b2. b4 b2 b2 | a1 a1 ^\fermata \bar "||" d1 a2 a2 | b1 fis1 | g2 e2 e2. d4 | \leftbreve d\breve ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  a2 a2 d2 d2 | \straddle cis2( e2) \straddle d2( cis2) | \straddle b2( cis2) d2 e2 | fis1 d1 \bar "||" e2 e2 fis2 e2 |
  \straddle d2( e2) e2 fis2 | e2 cis2 d2. cis4 | cis\breve \bar "||" a2 a2 d2 d2 | \straddle cis2( e2) \straddle d2( cis2) |
  b2 cis2 d2 e2 | fis1 d1 \bar "||" d1 d2 d2 | d1 \straddle d2( c2) | b2 b2 cis2. d4 | \merge \rightbreve d\breve \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 fis2 d2 d2 | \topstraddle e2( g2) \topstraddle fis2( a2) | \topstraddle g2( a2) b2 cis2 | \topstraddle d2( a2) a1 \bar "||" a2 a2 a2 a2 |
  \topstraddle fis2( gis2) a2 a2 | cis2 a2 gis2. a4 | \topstraddle a1( g!1) \bar "||" fis2 fis2 d2 d2 | \topstraddle e2( g2) \topstraddle fis2( a2) |
  g2 a2 b2 cis2 | \topstraddle d2( a2) fis1 \bar "||" \topstraddle fis2( g2) a2( c2) | b1 a1 | g2 g2 g2. fis4 | fis\breve \bar "||"
}

bass = \relative c {\clef bass 
  d2 d2 _\fermata b2 b2 _\fermata | a1 d1 | g,1 g2 g2 | d'1 d1 _\fermata \bar "||" cis2 cis2 d2 cis2 |
  b1 cis2 d2 | e2 e2 e2. a,4 | a\breve \bar "||" d2 d2 b2 b2 | a1 d1 |
  g,2. g4 g'2 g2 | d1 d1 _\fermata \bar "||" b1 fis2 fis2 | g1 d'1 | g,2 g2 a2. d4 | d\breve _\fermata \bar "||"
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

\midi { }      
  	
} %%% score bracket

%%% Hymn notes markup

\markup { \hspace #6 \column { 
	       \line { \hspace #6 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn is marked to be sung at a much slower rate than usual, it may," }
	       \line { \italic "if preferred, be sung at the more usual rate of" \note #"2" #0.5 "= 63" \italic "and the pauses may be omitted." }
	       \line { \hspace #18 \italic "A higher setting of this tune will be found in the Appendix." }
}}   
	       
\markup { "        " } %%% force some blank space.

\markup { "        " } %%% force some blank space.

%%% Lyric attributions and titles

\markup { \small { \hspace #4 \italic "Suitable also for other occasions." \hspace #40 \italic "Bishop R. Heber, 1783-1826." }}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OLY, Holy, Holy! Lord God Almighty!"
			                               "  Early in the morning our song shall rise to thee;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Holy, Holy, Holy! Merciful and mighty!"
					   "    God in three Persons, blessèd Trinity!"
			  		}}
		      } %%% end verse 1			
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

\markup { \hspace #26   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Holy, Holy, Holy! all the Saints adore thee,"
				   "    Casting down their golden crowns around the glassy sea;"
				   "Cherubim and Seraphim falling down before thee,"
				   "    Which wert, and art, and evermore shalt be."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "Holy, Holy, Holy! though the darkness hide thee,"
				   "    Though the eye of sinful man thy glory may not see,"
				   "Only thou art holy, there is none beside thee"
				   "    Perfect in power, in love, and purity."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { \hspace #-10.2 \italic "Unison.  " "4. "
			   \column {	     
				   "Holy, Holy, Holy! Lord God Almighty!"
				   "    All thy works shall praise thy name, in earth, and sky, and sea;"
				   "Holy, Holy, Holy! Merciful and mighty!"
				   "    God in three Persons, blessèd Trinity!     Amen."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }}  %%Amen midi       
       
}  


} %%% book bracket
