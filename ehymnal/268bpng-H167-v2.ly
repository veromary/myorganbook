%%%% 268b.png
%%%% Hymn 167. Duke Street Pour out thy Spirit from on high.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - EMBER DAYS"
	\hspace #0.1 }}	
	
	title = "167"   
  
  poet = \markup { \small {  \line { \sans { "DUKE STREET."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \smallCaps "J. Hatton," \italic "d." "1793." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d2 fis4 g a2 b4( cis) | d2 cis4( b) a1 \bar "||" a2 a4 a b2. a4 | g2 fis e1 \bar "||" \break
  fis2 fis4 e d( fis) a( d) | b( a) g( fis) e1 \bar "||" a2 b4 cis d2. g,4 | fis2 e d1 \bar "||"
} 
   
alto = \relative c' {  
  a2 d4 d e2 g | a g fis1 \bar "||" d2 cis4 d d2. d4 | cis2 d cis1 \bar "||"
  d2 d4 cis d2 fis4( d) | d2 e4 ( d) cis1 \bar "||" d2 d4 g  fis2. e4 | d2 cis \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 b4 b cis2 d4( e) | d2 d d1 \bar "||" fis,2 g4 a d2. d4 | g,2 a a1 \bar "||"
  a2 a4 g a2 a | b b cis1 \bar "||" a2 g4 g a2. b4 | a2 g fis1 \bar "||"
}

bass = \relative c {\clef bass 
  d2 b4 b a2 g'2 | fis2 g d1 \bar "||" d2 e4 fis g2. fis4 | e2 d a1 \bar "||"
  d2 d4 e fis2 d4( fis) | g2 e \straddle a( g) | fis2 g4 e d4.( e8 fis4)  g | a2 a, d1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #76 \italic "J. Montgomery" \hspace #-1 "‡," \italic "1771-1854." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #2  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "P" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " OUR out thy Spirit from on high;"
			                                 "  Lord, thine assembled servants bless;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Graces and gifts to each supply,"
					   "    And clothe thy priests with righteousness."
					   "             " %%% adds vertical spacing between verse
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "Within the temple when they stand,"
				   "    To teach the truth, as taught by thee,"
				   "Saviour, like stars in thy right hand"
				   "    May all thy Church's pastors be."
				   "             " %%% adds vertical spacing between verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "Wisdom, and zeal, and faith impart,"
				   "    Firmness with meekness, from above,"
				   "To bear thy people in their heart,"
				   "    And love the souls whom thou dost love:"
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"4  "
			    \column {	     
				    "To watch, and pray, and never faint,"
				    "    By day and night, strict guard to keep,"
				    "To warn the sinner, cheer the saint,"
				    "    Nourish thy lambs, and feed thy sheep."
				    "             " %%% adds vertical spacing between verse
			}}
	    } %%% end column 3
     } %%% end master-line
     %%% centred last verse
			\line { \hspace #30 "5. "
			     \column {	     
				     "Then, when their work is finished here,"
				     "    May they in hope their charge resign;"
				     "When the Chief Shepherd shall appear,"
				     "    O God, may they and we be thine."
			}}
   } %%% super column bracket
} %%% lyrics markup bracket


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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  


} %%% book bracket
