%%%% 198.png
%%%% Hymn 123. Modern Tune. The day draws on with golden light.
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = \markup { "123 " \large \smallCaps "(Modern Tune)" }
  
  poet = \markup { \small {  \line { \sans { \smallCaps "SOLEMNIS HAEC FESTIVITAS."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {With vigour} \general-align #Y #DOWN \note #"4" #0.5 = 150.} }
  
  arranger = \markup { \small \italic "Angers Church Melody." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%prints four dots in a column, mimicking repeat sign comprising of 4 dots	       
fdots = \markup { \override #'(baseline-skip . 1.0) \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }}	

%%using the fdots macro above, positions 4 dots at beginning of a line of score. Place \beginfdots before the first note of the score
beginfdots = { 	
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

%%% Macro to specify a partial measure in the middle of a piece.
%%% The Manual does not recommend using \partial in such cases.
%%% In this case, the macro specifies that 3 half notes in a 4/2 measure have past,
%%% hence a pickup of one half note

partmeasure =  \set Score.measurePosition = #(ly:make-moment 3 2)
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  
  \tag #'mainHymn {	
  \once \override TextScript #'padding = #2
  \partial 4 ees4 ^\markup { \hspace #-10 \italic "To be sung in unison." } | g2 aes4 | bes2 bes4 | c4( bes) aes ^\markup { \hspace #-1.5 "(" \teeny \raise #0.6 \natural ")" } | bes2 bes4 | \break
  c2 d4 | ees2 bes4 | <c, ees g>2  <c f aes>4 | bes'2 g4 | bes2 aes4 | f2 g4 | \break
  aes4 g4 f4 | g2 bes4 | ees,2 f4 | g( ees) aes | g2 f4 | ees2 ^\fermata \bar "||"
  bes'4 | bes2 c4 | aes2 bes4 | aes2 g4 | f2 g4 | aes2 bes4 | \pageBreak 

%%%pp 2

  aes2 g4 | f4 ees f | g2 bes4 | c2 bes4 | aes2 f4 | \break 
  g2 aes4 | bes2 c4 | bes2 ees4 | d2 bes4 | c2 bes4 | bes2 ^\fermata \bar "||" \break
  bes4 | c2 ees4 | bes2 c4 | g2 aes4  | bes2 ees4 | bes2 c4 | \break 
  aes4( g) aes4  | bes4( aes4 ) g4 | f2 bes4 | bes2 c4 | bes2  ees4 | \break 
  d2 c4 | bes2 g4 | aes2 bes4  | ees,2 aes4 | g2 f4 | ees2 ^\fermata \bar "||" \pageBreak 

%%%pp3

  bes'4 ^\markup { \hspace #-6 "(" \hspace #-1 \italic "Part 2" \hspace #-1 ")" } | 
      ees,2 g4 | bes2 bes4 | c4( d) ees4 | bes2 g4 | aes2 bes4 | \break 
  g2 bes4 | aes2  g4 | f2 bes4 | c2 bes4 | aes2 f4 | \break 
  g2 aes4 | bes2 ees,4 | f2 g4 | aes2 g4 | f2 ees4 | ees2 ^\fermata \bar "||"
  g4 ^\markup { \bold \fontsize #4 "*" } | bes2 g4 | aes2 g4 | f( ees) f | g2 bes4 | c2 ees4 | \break 
  d2 bes4 | c2 bes4 | bes2 g4 | bes2 g4 | aes2 g4 | \pageBreak
  
%%%pp4

  f4( ees) f | g2 bes4 | aes2 f4 | g2 ees4 | f2 ees4  | ees2 ^\fermata \bar "||" \break }
  
  \tag #'repeatpart { \time 4/2 \partmeasure \beginfdots bes'2 | bes2 c2 aes2 bes2 | aes2. g4 f2 ^\fermata g2 | g2 aes2  aes2 g2 | \break 
  f2. ees4 ees2 ^\fermata bes'2 | bes2 c2 aes2 bes2 | aes2. g4 f2. ^\fermata g4 | \break 
  \time 3/4 bes2 ees,4 | f2 aes4 | g2 f4 | ees2 ^\fermata \fdendrepeat }
      
  \tag #'Amen { 
      \once \override Staff.TimeSignature #'stencil = ##f
      \time 8/2 ees2( f ees d ees) ees1 \bar "||" }
} 
   
alto = \relative c' {  

  \tag #'mainHymn {	
  <g bes>4 | <c ees>2 <c f>4 | <d f>2 <ees g>4 | <ees aes>4 <ees g> <c f> | <d f>2 <ees g>4 | \break
  <ees g>2 <f bes>4 | <g bes>2 <d g>4 | s2 s4 | <d f>2 <bes ees>4 | <ees g>2 <c f>4 | <bes d>2 <bes ees>4 | \break
  <c ees>4 <bes ees> <bes d> | <bes ees>2 <d f>4 | <g, c>2 <bes d>4 | <bes ees>4 <g bes> <c ees> | <bes ees>2 <bes d>4 | g2 \bar "||" \break
  <ees' g>4 <ees g>2 <e g>4 | f2 <des f>4 | <c f>2 <c e>4 | aes2 <c e>4 | <c f>2 <ees g>4 | \break

%%%pp2

  <c ees>2 <bes ees>4 | <bes d>4 <g c> <bes d> | <bes ees>2 <ees g>4 | <ees aes>2 <ees g>4 | <c f>2 <bes d>4 | \break
  <bes ees>2 ees4 | d2 <f a>4 | <d g>2 <g bes>4 | <f bes>2 <d g>4 | <f a>2 d4 | d2 \bar "||" \break
  <ees g>4 | <ees aes>2 <g c>4 | <ees g>2 <ees g>4 | <c ees>2 <c f>4 | <ees g>2 <g bes>4 | <ees g>2 <e g>4 | \break
  <c f>4 <c e> <c f> | <des f> <c f> <c e> | aes2 <d! f>4 | <ees g>2 <ees aes>4 | <ees g>2 <g c>4 | \break 
  <f bes>2 <f a>4 | <d f>2 <c ees>4 | <c f>2 <d f>4 | <g, c>2 <c ees>4 | <bes ees>2 <bes d>4 | <g bes>2 \bar "||"

%%%pp3

  <ees' g>4 | <g, bes>2 <bes ees>4 | <ees g>2 <ees g>4 | <ees g> <f bes> <ees bes'> <ees g>2 ees4 | c2 <d f>4 | \break 
  <bes ees>2 <d f>4 | <c ees>2 <bes ees>4 | <bes d>2 <d f>4 | <ees aes>2 <ees g>4 | <c f>2 <bes d>4 | \break 
  <bes ees>2 ees4 | <d f>2 <g, c>4 | <bes d>2 <bes ees>4 | <c ees>2 <bes ees>4 | <bes d>2 <g bes>4 | <g bes>2 \bar "||" \break 
  <bes ees>4 | <ees g>2 <bes ees>4 | <c ees>2 <bes ees>4 | <bes d> <g c> <bes d> | <bes ees>2 <ees g>4 | <ees g>2 <g c>4 | \break
  <g bes>2 <d g>4 | <f a>2 <d f>4 | <d f>2 <bes ees>4 | <ees g>2 <bes ees>4 | <c ees>2 <bes ees>4 | \break

%%%pp4

  <bes d>4 <g c> <bes d> | <bes ees>2 <ees g>4 | <c f>2 <bes d>4 | <g bes>2 <g c>4 | <bes d>2 <g bes>4 | <g bes>2 \bar "||" \break }
  \tag #'repeatpart { \new Voice = enterVSeven { \voiceTwo \time 4/2 <ees' g>2 | <ees g> <e g> f <des f> | <c f>2. <c e>4 aes2 <c ees> |  <c ees> <c ees> <c ees> <bes ees> | \break 
  <bes d>2. <g bes>4 <g bes>2 <ees' g>2 | <ees g> <e g> f <des f> | <c f>2. <c e>4 aes2. <c ees>4 | \break 
  \time 3/4 <d g>2 <g, c>4 | <bes d>2 <c ees>4 | <bes ees>2 <bes d>4 | <g bes>2 \fdendrepeat  }}
  
  \tag #'Amen {
      \new Voice = Amen { \voiceTwo	  
      \once \override Staff.TimeSignature #'stencil = ##f
      \time 8/2 <g c>2 <aes c> <aes c> <f bes> <g bes> <g bes>1 \bar "||" }}
  
}

bass = \relative c { \clef bass

  \tag #'mainHymn {	
  \stemNeutral ees4 | c2 f4 | bes,2 ees4 | aes, ees' f | bes,2 ees4 | \break
  c2 bes4 | ees2 g4 | c,2 f4 | bes,2 ees4 | ees2 f4 | bes,2 ees4 | \break
  aes,4 ees' bes | ees2 bes4 | c2 bes4 | ees2 aes,4 | ees'2 bes4 | ees2 _\fermata
  ees4 | ees2 c4 | f2 bes,4 | f'2 c4 | f2 c4 | f2 ees4 | \break 

%%%pp2

  aes,2 ees'4 | bes4 c bes4 | ees2 ees4 | aes,2 ees'4 | f2 bes,4 | \break
  ees2 c4 | bes2 f'4 | g2 ees4 | bes2 g'4 | f2 bes,4 | bes2 _\fermata \break 
  ees4 | aes2 c,4 | ees2 c4 | c2 f4 | ees2 ees4 | ees2 c4 | \break 
  f4 c f | bes,4 f' c | f2 bes,4 | ees2 aes,4 | ees'2 c4 | \break 
  d2 f4 | bes,2 c4 | f2 bes,4 | c2 aes4 | ees'2 bes4 | ees2 _\fermata \bar "||"   

%%%pp3

  ees4 | ees2 ees4 | ees2 ees4 | c4( bes) g | ees'2 ees4 | f2 bes,4 | \break
  ees2 bes4 | c2 ees4 | bes2 bes4 | aes2 ees'4 | f2 bes,4 | \break
  ees2 c4 | bes2 c4 | bes2 ees4 | aes,2 ees'4 | bes2 ees4 | ees2 _\fermata \bar "||"
  ees4 | ees2 ees4 | aes,2 ees'4 | bes4 c bes | ees2 ees4 | c2 c4 | \break 
  
  \once \override TextScript #'padding = #4  
  g'2 _\markup { \lower #1 \bold \fontsize #4 "*" 
                 \fontsize #0 \smallCaps "Note" \hspace #-1.2 ".—" 
                 \italic "This verse must be played through twice when accompanying Hymn" "124." }
      g4 | f2 bes,4 | bes2 ees4 | ees2 ees4 | aes,2 ees'4 | \break 

%%%pp4

  bes4 c4 bes4 | ees2 ees4 | f2 bes,4 | ees2 c4 | bes2 ees4 | ees2 _\fermata \bar "||" \break }
  \tag #'repeatpart { \time 4/2 \beginfdots ees2 | ees2 c2 f2 bes,2 | f'2. c4 f2 _\fermata c2 | c2 aes2 aes2 ees'2 | \break 
  bes2. ees4 ees2 _\fermata ees2 | ees2 c2 f2 bes,2 | f'2. c4 f2. _\fermata c4 | \break 
  \time 3/4 g2 c4 | bes2 aes4 | ees'2 bes4 | ees2 _\fermata \fdendrepeat }
  
  \tag #'Amen {      
      \once \override Staff.TimeSignature #'stencil = ##f
      \time 8/2 c2 f, aes bes ees ees1 \bar "||" }

}

wordsOne = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #0.6
  "1  The" day draws on with gold -- en light, Glad
  songs go echo -- ing through the height. The broad earth lifts an
  an -- swer -- ing cheer, The deep makes "moan ."  with wail -- ing fear.

  \once \override LyricText #'self-alignment-X = #0.6
  "2  For" lo, he comes, the migh -- ty King, To take from 
  death his pow -- er and sting, To tram -- ple down his
  gloom -- y reign, And break the wea -- ry prison -- er's chain.

  "3  En --" closed he lay in rock -- y cell, With guard of
  arm -- ed sen -- ti -- nel; But thence re -- turn -- ing,
  strong and free, He comes with pomp of ju -- bi -- lee. 

  \once \override LyricText #'self-alignment-X = #0.6
  "4  The" sad A -- pos -- tles mourn him slain, Nor hope to
  see their Lord a -- gain; Their Lord, whom reb -- el
  thralls de -- fy, Ar -- raign, ac -- cuse, and doom to die.

  \once \override LyricText #'self-alignment-X = #0.6
  "5  But" now they put their grief a -- way, The pains of
  hell are loosed to -- day; For by the grave, with
  flash -- ing  eyes,  ‘Your Lord is risen,’  the  An -- gel cries.

  "6  Ma" -- ker of  all, to thee we pray, Ful -- fil in us thy
  joy to -- day; When death as -- sails, grant, Lord, that we May
  share  thy  Pas -- chal  vic -- to -- ry.	
}

wordsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #0.8 
  "7. To" thee who, dead, a -- gain dost live, All glo -- ry, Lord, thy
  peo -- ple give; All glo -- ry, as is ev -- er meet,  To
  Fa -- ther and to Pa -- ra -- 
  \set associatedVoice = "Amen"
  clete. A -- _ _ _ _  men.
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
	\new Lyrics \lyricsto "sopranos" \wordsOne
	\new Lyrics \lyricsto "enterVSeven" \wordsTwo
	\context Staff = lower <<
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		%%% at time signature change, no cautionery time-signature should be shown at the end of the previous line
		\context { \Staff \override TimeSignature #'break-visibility = #end-of-line-invisible }
		
	} %% close layout

} %%% Score bracket

%%% A separate score block to unfold repeats and generate Hymn Midi without the Amen     

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano \keepWithTag #'repeatpart \soprano }
        \context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto \keepWithTag #'repeatpart \alto }
                              >>
  \context Staff = lower <<
        \context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass \keepWithTag #'repeatpart \bass }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 150 4)}} 

} %%% end Hymn midi Score 


%%% A separate score block to generate the Amen midi     

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global  \keepWithTag #'Amen \soprano }
        \context Voice = altos    { \voiceTwo \global  \keepWithTag #'Amen \alto }
                              >>
  \context Staff = lower <<
        \context Voice = basses { \voiceTwo \global  \keepWithTag #'Amen \bass }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 150 4)}} 

} %%% end Amen midi Score 


%%% Hymn Note markup

\markup { \hspace #12 \smallCaps "Note" \hspace #-1.2 ".—" \italic "The whole hymn may be sung to the melody of verse 1, 4, or 5 if preferred." }


} %%% book bracket
