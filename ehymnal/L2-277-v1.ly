%%%% 426.png
%%%% Hymn 277. LES COMMANDEMENS DE DIEU.  The day thou gavest, Lord, is ended
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "277"   
  
  meter = \markup { \small { \column { \line { \sans "LES COMMANDEMENS DE DIEU." \hspace #1 \roman " (9 8. 9 8.)" } 
  \line { { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 "= 50" "("\general-align #Y #DOWN \note #"4" #0.5 = 100")." }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Original form of melody composed" }
		 \line { \italic "or adapted by" \smallCaps "L. Bourgeois" }
		 \line { \italic "for the Genevan Psalter, 1543." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% Hide Triplet bracket 

hidetup = \override TupletBracket #'stencil = ##f 

%%% Hide Triplet number

hidetupnum =   \override TupletNumber #'stencil = ##f

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%% Macro to specify partial measure in the middle of a piece.
%%% In this case, the macro specifies that 3 1/2 notes in a 4/2 measure have past,
%%% hence a partial measure of a single half note.

partmeasure =  \set Score.measurePosition = #(ly:make-moment 3 2)
	      
%%% Macro to suppress printing of time signature once.	 

notimesig = \once \override Staff.TimeSignature #'stencil = ##f	

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \hidetup	
  \notimesig
  g'2 g4 a4 \times 2/3 { b2( b4) } \times 2/3 { c2( c4) } | b2 a1 \breathmark \bar "||" b2 | c4 b4 a4 g4 fis2 g2 | a1 \bar "||" \break
  d2 c4 b4 | \time 3/2 a2 fis2 g4 fis4 | \movenote #1.4 e2 d1 \breathmark \bar "||"  \notimesig \time 4/2 \partmeasure b'2 | c4 b4 a4 g4 b2 a2 | g1 \bar "||" 
}
   
alto = \relative c' { 
  \hidetup
  \hidetupnum
  d2 e4 fis4 \times 2/3 { g2 g4 } \times 2/3 { g2 g4 } | g2 fis1 \bar "||" g2 | g4 g4 e4 b4 d2 d4 ( e4 -) | fis1 \bar "||" 
  d2 e4 g4 | e2 d4 ( c4 -) b4 d4 | d4 ( cis4 -) d1 \bar "||" d2 | c4 d4 e4 b4 d4 ( e4 -) fis2 | \merge g1 \bar "||" 
}

tenor = \relative c {\clef bass 
  \hidetup
  \hidetupnum
  \notimesig
  b'2 b4 d4 \times 2/3 { d2 d4 } \times 2/3 { e2 e4 } | d2 d1 \bar "||" d2 | c4 d4 c4 g4 a2 g2 | d'1 \bar "||" 
  g,2 c4 d4 | c2 a2 g4 a4 | b4 ( a4 -) fis1 \bar "||" \notimesig g2 | g4 g4 e4 g4 g2 d'4 ( c4 -) | b1 \bar "||" 
}

bass = \relative c {\clef bass 
  \hidetup	
  g'2 e4 d4 \times 2/3 { g2( g4) } \times 2/3 { c,2( c4) } | g'2 d1 \bar "||" g2 | e4 g4 c,4 e4 d2 b2 | d1 \bar "||" 
  b2 a4 b4 | c2 d2 e4 fis4 | g4 ( a4 -) d,1 \bar "||" g2 | e4 g4 c,4 e4 b4 ( c4 -) d2 | g,1 \bar "||" 
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
	%	\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}      
  		
	
} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune for this hymn will be found in the Appendix." }


%%% Lyric titles and attributions

\markup { "                " }


\markup {  \small {  \hspace #80 \italic "J. Ellerton, 1826-93." }} 

\markup { "                " }


%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #2  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE day thou gavest, Lord, is ended,"
			                                 "    The darkness falls at thy behest;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To thee our morning hymns ascended,"
					   "    Thy praise shall sanctify our rest."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2   "
			   \column {
				   "We thank thee that thy Church unsleeping,"
				   "    While earth rolls onward into light,"
				   "Through all the world her watch is keeping,"
				   "    And rests not now by day or night."

				    "      " %%% adds vertical spacing between verses
		       }}

		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "As o'er each continent and island"
				   "    The dawn leads on another day,"
				   "The voice of prayer is never silent,"
				   "    Nor dies the strain of praise away."

				   "               " %%% add vertical spacing between verses
			}}
			\line {"4  "
			    \column {	     
				    "The sun that bids us rest is waking"
				    "    Our brethren 'neath the western sky,"
				    "And hour by hour fresh lips are making"
				    "    Thy wondrous doings heard on high."

				    "               " %%% add vertical spacing between verses
			}}
	    } %%% end column 3
	} %%% end master-line
	%%% centred last verse
			\line { \hspace #28 "5. "
			     \column {	     
				   "So be it, Lord; thy throne shall never,"
				   "    Like earth's proud empires, pass away;"
				   "Thy kingdom stands, and grows for ever,"
				   "    Till all thy creatures own thy sway."
			}}   

   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1  \bar "||" }}
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


} %%% book bracket

