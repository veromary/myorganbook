%%%% 204.png
%%%% Hymn 124. Modern Tune. His cheering message from the grave.
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
  title = \markup { "124 " \large \smallCaps "(Modern Tune)" }
  
  meter = \markup { \small { \column { 
	                     \line  { \sans { "SOLEMNIS HAEC FESTIVITAS."} \hspace #1 \roman {"(L. M.)" } }      
	                     \line  { \italic {With vigour} \general-align #Y #DOWN \note #"4" #0.5 = 150.} }
                  }}
  
   arranger = \markup { \small  { \center-align { 
	 					 \line {  \italic "Angers Church Melody." }
	  					 \line { "(" \hspace #-1 \italic "same melody as preceding hymn" \hspace #-1 ")." }
  	}}}		  
		  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%prints four dots in a column, mimicking repeat sign comprising of 4 dots	       
fdots = \markup { \override #'(baseline-skip . 1.0) \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }}	

%%using the fdots macro above, positions 4 dots at beginning of a line of score. Place \beginfdots before the first note of the score
beginfdots = { 	
	       \override Score.RehearsalMark #'Y-offset = #'1.35 
	       \override Score.RehearsalMark #'X-offset = #'8
	       \mark \fdots
	       \once \override Score.SeparationItem #'padding = #1
}

%%same as above but allows more space to accommodate a time-signature
beginfdotstime = { 	
	       \override Score.RehearsalMark #'Y-offset = #'1.35 
	       \override Score.RehearsalMark #'X-offset = #'11
	       \mark \fdots
	       \once \override Score.SeparationItem #'padding = #1
}

%%% prints a end repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})
		
%%% Macro to specify a partial measure in the middle of a piece.
%%% The Manual does not recommend using \partial in such cases.
%%% "moment 2 4" specifies that at this point 2 crochets have past, 
%%% and "moment 3 2" specifies that 3 minims have past.

partmeasureOne =  \set Score.measurePosition = #(ly:make-moment 2 4)

partmeasureTwo =  \set Score.measurePosition = #(ly:make-moment 3 2)
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%%soprano voice

global = {
  \time 3/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  
  \tag #'mainHymn {  \once \override Staff.TimeSignature #'stencil = ##f	
  \partial 4 ees4 | g2 aes4 | \stemUp bes2 bes4 \stemNeutral | c4( bes) aes ^\markup { \hspace #-1.5 "(" \teeny \raise #0.6 \natural ")" } | \stemUp bes2 bes4 \stemNeutral | c2 d4 | \break
  ees2 bes4 | g2 aes4 | \stemUp bes2 g4 | bes2 aes4 | f2 g4 | \break
  aes4( g4) f4 | g2 bes4 | ees,2 f4 | g( ees) aes | g2 f4 | ees2 ^\fermata \bar "||" \break
  bes'4 | bes2 \stemNeutral c4 | aes2 \stemUp bes4 | aes2 g4 | f2 g4 | aes2 bes4 | \break 
  
  aes2 g4 | f4( ees) f | g2 bes4 | \stemNeutral c2 bes4 | aes2 f4 | \break 
  g2 aes4 | bes2 c4 | bes2 ees4 | d2 bes4 | c2 bes4 | bes2 ^\fermata \bar "||" \break
  bes4 | c2 ees4 | bes2 c4 | g2 aes4  | bes2 ees4 | bes2 c4 | \break 
  aes4( g) aes4  | \stemUp bes4( aes4 ) g4 | f2 \stemNeutral bes4 | bes2 c4 | bes2  ees4 | \break 
  d2 c4 | \stemUp bes2 g4 | aes2 bes4  | ees,2 aes4 | g2 f4 | ees2 ^\fermata \bar "||" \break 

%%%pp2

  bes'4 ^\markup { \hspace #-6 "(" \hspace #-1 \italic "Part 2" \hspace #-1 ")" } | 
      ees,2 g4 | bes2 bes4 | \stemNeutral c4( d) ees4 | \stemUp bes2 g4 | aes2 bes4 | \break 
  g2 bes4 | aes2  g4 | f2 bes4 | \stemNeutral c2 bes4 | aes2 f4 | \break 
  g2 aes4 | \stemUp bes2 ees,4 | f2 g4 | aes2 g4 | f2 ees4 | ees2 ^\fermata \bar "||" }
  
  \tag #'repeatOne {
  \partmeasureOne \beginfdots g4 | bes2 g4 | aes2 g4 | f( ees) f | g2 bes4 | \stemNeutral c2 ees4 | \break 
  d2 bes4 | c2 \stemUp bes4 | bes2 g4 | bes2 g4 | aes2 g4 | \break
  f4( ees) f | g2 bes4 | aes2 f4 | g2 ees4 | f2 ees4  | ees2 ^\fermata \bar "||" \fdendrepeat \break }
  
  \tag #'repeatTwo { \time 4/2 \partmeasureTwo \beginfdotstime \stemUp 
      bes'2 | bes2 \stemNeutral c2 aes2 \stemUp bes2 | aes2. g4 f2 ^\fermata g2 | g2 aes2  aes2 g2 | \break 
  f2. ees4 ees2 ^\fermata bes'2 | bes2 \stemNeutral c2 \stemUp aes2 bes2 | aes2. g4 f2. ^\fermata g4 | \break 
  \time 3/4 bes2 ees,4 | f2 aes4 | g2 f4 | ees2 ^\fermata \fdendrepeat }
      
  \tag #'Amen { 
      \once \override Staff.TimeSignature #'stencil = ##f
      \time 8/2 ees2( f ees d ees) ees1 \bar "||" }
} 


wordsOne = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  "1  His"  cheer -- ing  mes -- sage from the grave  An An -- gel
  to the  wo -- men gave:  ‘Full  soon   your  Mas -- ter
  ye  shall see;  He goes be -- fore to Ga -- li -- lee.’
  
  \once \override LyricText #'self-alignment-X = #0.65
  "2  But" while with fly -- ing steps they press To bear the
  news, all ea -- ger -- ness,   Their Lord, the liv -- ing
  Lord, they meet, And pros -- trate  fall to kiss his feet.
  
  \once \override LyricText #'self-alignment-X = #0.7
  "3  So"  when his mourn -- ing follow -- ers heard The  tid -- ings
  of that faith -- ful word,  Quick went they forth to
  Ga -- li -- lee,  Their loved  and  lost once more to see. 

  \once \override LyricText #'self-alignment-X = #0.7  
  "4  On"  that   fair  day of  Pas -- chal joy,   The  sun -- shine
  was  with -- out al -- loy,  When to their ve -- ry
  eyes  re -- stored  They looked  up -- on the  ris -- en  Lord.
  
  \once \override LyricText #'self-alignment-X = #0.65
  "5  The" wounds  be -- fore  their eyes dis -- played  They see   in
  liv -- ing  light ar -- rayed,  And  that   they  see   they
  tes -- ti -- fy   In   o -- pen  wit -- ness fear -- less -- ly.
  
  \once \override LyricText #'self-alignment-X = #0.65
  "7  Ma" -- ker of  all,  to  thee  we pray,  Ful -- fil  in  us  thy
  joy to -- day; When death as -- sails, grant, Lord,  that we May
  share  thy  Pas -- chal vic -- to -- ry.  A -- men.
}

wordsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \skips #128
  \once \override LyricText #'self-alignment-X = #0.85
  "6     O" Christ,  the  King  of  gen -- tle -- ness,  Our  sev' -- ral
  hearts   do  thou   pos -- sess,   That  we   may  ren -- der
  all   our  days  Thy meed  of  thank -- ful -- ness  and praise.
  
  \once \override LyricText #'self-alignment-X = #0.85
  "8.  To"  thee who, dead, a -- gain dost live,  All  glo -- ry, Lord, thy
  peo -- ple give; All   glo -- ry  as   is   e -- ver meet,  To
  Fa -- ther  and  to  Pa -- ra -- clete.
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
	\context Voice = sopranos { \global \soprano }
	\new Lyrics \lyricsto "sopranos" \wordsOne
	\new Lyrics \lyricsto "sopranos" \wordsTwo
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		%%% at time signature change, no cautionery time-signature should be shown at the end of the previous line
		\context { \Staff \override BarLine #'break-visibility = #begin-of-line-invisible }
		\context { \Staff \override TimeSignature #'break-visibility = #end-of-line-invisible }
		
	} %% close layout

} %%% Score bracket

%%% A separate score block to unfold repeats and generate Hymn Midi without the Amen     

\score{
\new ChoirStaff 
<<
        \context Voice = sopranos {  \global \keepWithTag #'mainHymn \soprano 
	                                     \keepWithTag #'repeatOne \soprano 
	                                     \keepWithTag #'repeatOne \soprano
	\keepWithTag #'repeatTwo \soprano 
	\keepWithTag #'repeatTwo \soprano 
	
	}
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 150 4)}} 

} %%% end Hymn midi Score 


%%% A separate score block to generate the Amen midi     

\score{
\new ChoirStaff 
<<
        \context Voice = sopranos {  \global  \keepWithTag #'Amen \soprano }

>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 150 4)}} 

} %%% end Amen midi Score 


%%% Hymn Note markup

\markup { \hspace #54 \center-align  { 
	                \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "The melody only is given for this hymn.  The organ accompaniment will be" }
                        \line { \italic "the same as that of the preceding hymn" "(" \hspace #-1 \italic "No." "123" \hspace #-1 ")." }
        }}
} %%% book bracket
