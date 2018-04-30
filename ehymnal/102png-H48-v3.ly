%%% 102.png
%%% Hymn 48 Cantate Domino. The Lord is Come! On Syrian soil.
%%% Version 3

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM EPIPHANY TILL SEPTUAGESIMA" } 
					       \hspace #1
						} }	
  title = "48" 
			       
  arranger = \markup { \small { \smallCaps "J. Barnby, 1838-96."} }
  poet = \markup { \small { \sans  "CANTATE DOMINO." \hspace #1 \roman { "(D. L. M.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.} }
  tagline = ""
}

%%%%%%%%%%%%%%% Macro Definitions

%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%% Used to pull a note left. Used when a slurred note pair straddles a longer note when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices. Includes alternative voices for A,T and B, comprising notes of smaller size

global = {
  \time 4/2
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 2 fis2 | a2 b2 a2 fis4( e4) | d2 e2 fis2 \breathmark \bar "||" a2 | fis2 gis2 a2 b4( cis4) | \break
  b2 b2 a2 \breathmark \bar "||" a2 | fis2 b2 a2 fis4( e4) | d2 e2 fis2 \breathmark \bar "||" gis2 | a2 b2 cis2 d4( cis4) | \break
  b2 b2 a2^\fermata \breathmark \bar "||" a2^\markup { \italic "Unison." } | d2 d2 cis2 d4( cis4) | b2 b2 a2 \breathmark \bar "||" d,2^\markup {\italic "Harmony." } | \break
  g2 g2 fis2 gis4( a4) | b2 a4( gis4) a2 \breathmark \bar "||" a2^\markup { \italic "Unison." } | d2 d2 cis2 d4( cis4) | \break \pageBreak
  b2 b2 a2 \breathmark \bar "||" d,2^\markup { \italic "Harmony."} | g2 fis2 e2 d2 | cis2( d2) e1 | 
      \once \override Dots #'transparent = ##t
      d1.^\fermata \bar "||"
}

alto = \relative c' {
  d2 | d2 d2 d2 cis2 | d2 cis2 d2 \bar "||" e2 | fis2 d2 cis2 d4( e4) |
  fis2 e4( d4) cis2 \bar "||" e2 | d2 d2 e2 cis2 | d2 a2 fis'2 \bar "||" d2 | cis2 e2 e2 d4( e4) |
  fis2 e4( d4) cis2 \bar "||" a'2 | d2 d2 cis2 d4( cis4) | b2 b2 a2 \bar "||" d,2 |
  d2 cis2 fis2 fis2 | fis2 eis2 fis2 \bar "||" a2 | d2 d2 cis2 \once \override Slur #'transparent = ##t  d4( cis4) |
  b2 b2 a2 \bar "||" d,!2 | d2 dis2 e2 b2 | a2( d2) cis1 | 
      \once \override NoteColumn #'force-hshift = #-0.01 
      d1. \bar "||"

}

altoAlt = \relative c' {
  \set fontSize = #-3 
  \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #1
	
  s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" s2 | fis\breve | d1 ~ d2 \bar "||" s2 |
  s1 s1 | s1. \bar "||" cis2 | d2 e2 e2 fis4( e4) |
  \override Accidental #'extra-offset = #'(1.5 . 0.0)  
      dis2 e2 e2 \bar "||" s2 | s1 s1 | s1 s1 | s1. \bar "||"
}

tenor = \relative c { \clef bass
  a'2 | fis2 g2 e2 a4( g4) | fis2 a2 a2 \bar "||" a2 | a2 b2 a2 a2 |
  a2 gis2 a2 \bar "||" a2 | a2 g2 g4( e4) a4( g4) | fis2 a2 a2 \bar "||" b2 | a2 gis2 a2 a2 |
  a2 gis2 a2 \bar "||" a2 | d2 d2 cis2 d4( cis4) | b2 b2 a2 \bar "||" a2 |
  b2 a2 a2 d4( cis4) | b2 b2 a2 \bar "||" a2 | d2 d2 cis2 d4( cis4) |
  b2 b2 a2 \bar "||" fis2 | g2 a2 g2 fis2 | e2( fis2) g1 | fis1. \bar "||"
}

tenorAlt = \relative c {
  \set fontSize = #-3 
  \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #1.2
	
  s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" s2 | \tieDown b'1 ~ b2 a2 | a2 g2 fis2  \bar "||" s2 |
  \override Accidental #'extra-offset = #'(1.5 . 0.0)  
      s1 s1 | s1. \bar "||" g2 | fis2 gis2 a2 ais2 |
  \once \override NoteColumn #'force-hshift = #-1 b4( a4) g2 g2 \bar "||" s2 | s1 s1 | s1 s1 | s1. \bar "||"
}

bass = \relative c { \clef bass
  d2 | d2 g,2 a2 a2 | b2 a2 d2 \bar "||" cis2 | d2 b2 fis'2 e2 |
  d2 e2 a,2 \bar "||" cis2 | d2 b2 cis2 a2 | b2 cis2 d2 \bar "||" b2 | fis'2 e2 \straddle a4( gis!4) fis4( e4) |
  d2 e2 a2 _\fermata \bar "||" a2 | d2 d2 cis2 
      \once \override Slur #'transparent = ##t d4( cis4) | b2 b2 a2 \bar "||" fis2 |
  e2 a,2 d4( cis4) b4( a4) | gis2 cis2 fis2 \bar "||" a!2 | d2 d2 cis2 
      \once \override Slur #'transparent = ##t d4( cis4) |
  b2 b!2 a2 \bar "||" d,2 | b2 b2 e2 g,2 | a1 a1 | d1. _\fermata \bar "||"
}

bassAlt = \relative c {
  \set fontSize = #-3 
  \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #1.2
	
  s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" s2 | s1 s1 | s1. \bar "||" s2 | s1 s1 |
  s1. \bar "||" a2 | \tieDown b2 d2 fis2 fis,2 | g2 b2 d2  \bar "||" s2 |
  s1 s1 | s1. \bar "||" e2 | d2 b2 a2 fis2 |
  b2   
      \once \override NoteHead #'X-offset = #-0.6
      \once \override Stem #'X-offset = #-0.6
      e4( d4) cis2 \bar "||" s2 | s1 s1 | s1 s1 | s1. \bar "||"
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
	\context Voice = altos    {\voiceTwo \global \alto }
	\context Voice = altoAlt    {\voiceFour \global \altoAlt }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
	\context Voice = tenorAlt { \voiceThree \global \tenorAlt }
        \context Voice = bassAlt { \voiceFour \global \bassAlt }
	                        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }
       }	

} %%score bracket

%%% Text markup - permission line

\markup { \hspace #37 \small \smaller {  "[" \italic "By permission of Novello & Co. Ltd." "]" } }

%%% Lyric markups

\markup { \hspace #80 \small { \italic "A. P. Stanley, 1815-81." }}

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \line { %% a master line of 3 columns    
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Lord is come! On Syrian soil,"  "  The child of poverty and toil;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Man of Sorrows, born to know"
					   "Each varying shade of human woe:"
					   "His joy, his glory, to fulfil,"
					   "In earth and heaven, his Father's will;"
					   "On lonely mount, by festive board,"
					   "On bitter Cross, despised, adored."
			  		}}
			       
			           } %% finish verse 1
		}  %% finish page column 1
		
	\hspace #4 %% adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -24 . -1) #0 }  %% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %% adds horizontal space between columns 2 and 3	
	
	\column { %% start page column 3		
 
           		\line { "2  "
			  \column {	     
				   "The Lord is come! In him we trace"
				   "The fullness of God's truth and grace;"
				   "Throughout those words and acts divine"
				   "Gleams of the eternal splendour shine;"
				   "And from his inmost Spirit flow,"
				   "As from a height of sunlit snow,"
				   "The rivers of perennial life,"
				   "To heal and sweeten Nature's strife."
			}}
	    } %% end column 3
     } %% end master-line
    		\hspace #1 
           		\line { \hspace #26  "3. "
			  \column {	     
				   "The Lord is come! In every heart"
				   "Where truth and mercy claim a part;"
				   "In every land where right is might,"
				   "And deeds of darkness shun the light;"
				   "In every Church where faith and love"
				   "Lift earthward thoughts to things above"
				   "In every holy, happy home,"
				   "We bless thee, Lord, that thou hast come."
     			}}
             }
} %% lyrics markup bracket

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
       
%%% Amen midi    
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}     
       
}  

%%% List of hymns also suitable

\markup {\hspace #35 \column {
	\line{ \hspace #3 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
	"364  All hail the power of Jesu's name."
	"380  Come, ye faithful, raise the anthem."
	"381  Crown him with many crowns."
	"384  Eternal Ruler of the ceaseless round."
	"395  God of mercy, God of grace."
	"419  Jesu, the very thought of thee."
	"420  Jesus shall reign where'er the sun."
	"423  Judge eternal, throned in splendour."
	"459  O Love, how deep, how broad, how high."
	"481  Songs of praise the angels sang."
	"514  Who is this so weak and helpless."  }
}} 


} %% book bracket
