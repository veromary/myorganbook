%%% 331-337.png
%%% Hymn 212 I bind unto myself today 
%%% Version 1

\version "2.10"

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros


%% Macro to pull notes leftwards, used to create those merged semibreves

merge = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.01 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0 
              \once \override Stem #'X-offset = #0.3 }	      

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddleb = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6 
              \once \override Stem #'X-offset = #-1.3 }	      

%% Same as above but for the small notes 
smallnotetopstraddle = { \once \override Score.SeparationItem #'padding = #3
		\once \override NoteHead #'X-offset = #-4.4 
		\once \override Stem #'X-offset = #-3.48 }       
       
%% Used to pull a note left. Used when a note pair straddles a longer note and when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #3
              \once \override NoteHead #'X-offset = #-3.2
              \once \override Stem #'X-offset = #-3.2 }
	      
%% Same as above but moves a smaller amount	      
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.6 
              \once \override Stem #'X-offset = #-1.6 }	      
	
%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}
	      
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%% prints four dots in a column, mimicking repeat sign comprising of 4 dots	       
fdots = \markup { \override #'(baseline-skip . 1.0) \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }}	

%% using the fdots macro above, positions 4 dots at beginning of a line of score. Place \beginfdots before the first note of the score
beginfdots = { 	
	        \override Score.RehearsalMark  #'break-visibility = #end-of-line-invisible
	       \override Score.RehearsalMark #'Y-offset = #'1.35 
	       \override Score.RehearsalMark #'X-offset = #'8
	       \mark \fdots
	       \once \override Score.SeparationItem #'padding = #1
}

      
%% Shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }	      

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #0 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%% Macro to specify a partial measure in the middle of a piece or
%%% In this case, the macro specifies that 2 1/2 notes in a 3/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

	
       
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions	


\header {
  dedication = \markup { \center-align { "SAINTS' DAYS: ST. PATRICK"
                         \hspace #0.1 }}	
  
  title = \markup \center-align {   "212" }
  
  subtitle = \markup \center-align { "ST. PATRICK (March 17th)."  \normalsize { \italic "St. Patrick's Breastplate." } }
  
  poet = \markup { \small { \column { "         " 
	  \line { \italic "Suitable also for general occasions." }
  }}}
  	  
 composer = \markup { \small { \center-align { \italic "St. Patrick, 372-466."           
	           \italic "Tr. Mrs. C. F. Alexander." }
  }}	

%%% There is a title in Gaelic script. In order to generate this, a Gaelic font is needed.
%%% There are free Gaelic fonts available on the internet. Google for "Free Irish uncial fonts".and follow the links for some examples.
%%% The example used here is "Bunchló GC"  If you do not have a Gaelic font installed, you should
%%% see this title in regular Latin characters: "Atomriug indiu".
  
  meter = \markup { \hspace #43  \override #'(font-name . "Bunchló GC") \huge "Atomriug indiu." }
  
  tagline =""  

}  

global = {
  \time 3/2 		
  \set Staff.midiInstrument = "church organ" 
}


soprano = \relative c' { 
  	\key bes \major

  %%%verse 1
  \tag #'verseOne { 
  \partial 2 d2^\markup { \hspace #-2 \italic "Voices in unison."}  | \stemNeutral g1 g2 | \topstraddle \slurDown f2( d2) f | \straddle \slurUp bes( d) c4( bes4) | \slurDown \stemUp bes2( a) a \stemNeutral | \straddle \slurUp c2( a) f | \break  
  \topstraddleb \slurDown f2( a) c | bes1 \stemUp bes2 | \stemNeutral a1 \breathmark \bar "||" d2 | g,2.( a4) \stemUp bes4( g4) | \topstraddle f2( d) bes | \break
  bes'1  f2 | g2( a) \stemNeutral \slurUp bes4( c4) | d1 c4( d4) | \slurDown \stemUp bes2( g2) a2 | g1 g2 | g1^\fermata \bar "||" \break
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven { 
  \partmeasure \beginfdots d2 |  \stemNeutral g1 g2 | \topstraddle \slurDown f2( d2) f | \straddle \slurUp bes( d) c4( bes4) | \slurDown \stemUp bes2( a) a \stemNeutral | \straddle \slurUp c2( a) f  | \break  
  \topstraddleb \slurDown f2( a) c | bes1 \stemUp bes2 | \stemNeutral a1 \breathmark \bar "||" d2 | g,2.( \( a4) \stemUp bes4( g4) \) | \topstraddle f2( d) bes | \break
  
  bes'1  f2 | g2( a) \stemNeutral \slurUp bes4( c4) | d1 c4( d4) | \slurDown \stemUp bes2( g2) a2 | \noBreak g1 g2 | \noBreak g1^\fermata \bar "||" \break
  f2 | \stemUp bes1 bes2 | \stemNeutral \slurUp bes1 c4( d4) | c1 b2 | c1 d2 | g,1 g2 | \break

  \topstraddleb \slurDown f2( a) c | bes1 \stemUp bes2 | \stemNeutral a1 d,2 | g2.( a4) \stemUp bes4( g4) | \topstraddle f2( d) bes | bes'1 f2 | \break
  g2( a) \stemNeutral \slurUp bes4( c4) | d1 c4( d4) | \slurDown \stemUp bes2( g2) a2 | g1 g2 | g1 \fdendrepeat \bar "||" \break
  }
  
  %%%verse 8
  \tag #'verseEight {
  \pageBreak
  \once \override Staff.KeyCancellation  #'break-visibility = ##(#t #t #t)  %% this turns on key cancellations for both end of line and begin of line   
  \key g \major
  \once \override TextScript #'padding = #3.0
  g4. ^\markup { \hspace #-8 \column { \small { \line { \sans {"DEIRDRE."} \hspace #1 \roman {"(8 8. 8 8.)"}}
                                                \line { \italic "In Harmony." }}}} 
      e8 | g2 d2 e4. a8 | g2 g2  g4. g8 |     
      c2 b2 a4. \once \override TextScript #'padding = #3.0 g8 
      ^\markup { \hspace #8 \center-align { \small { \italic "Adapted from an"
                                         \italic "Ancient Irish Melody." }}}      
      |  b2 a2 \breathmark \bar "||" \break
  b4. a8 | c2 b2 b4. a8 | a2 g2 g4. e8 | g2 g2 g4. b8 | a2 g2^\fermata \bar "||"
  g4. e8 | g2 d2 e4. a8 | g2 g2 g4. g8 | c2 b2 a4. g8 | b2 a2 \bar "||" \break
  b4. a8 | c2 b2 b4. a8 | a2 g2 g4. e8 | g2 g2 g4. b8 | a2 \melisma  g2 ^\fermata \melismaEnd  \bar "||" \break
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  d2 |  \stemNeutral g1 g2 | \topstraddle \slurDown f2( d2) f | \straddle \slurUp bes( d) c4( bes4) | \slurDown \stemUp bes2( a) a \stemNeutral | \straddle \slurUp c2( a) f  | \break  
  \topstraddleb \slurDown f2( a) c | bes1 \stemUp bes2 | \stemNeutral a1 \breathmark \bar "||" d2 | g,2.( \( a4) \stemUp bes4( g4) \) | \topstraddle f2( d) bes | \break
  bes'1  f2 | g2( a) \stemNeutral \slurUp bes4( c4) | d1 c4( d4) | \slurDown \stemUp bes2( g2) a2 | \noBreak g1 g2 | \noBreak g1^\fermata \bar "||" \break

  f2 | \stemUp bes1 bes2 | \stemNeutral \slurUp bes1 c4( d4) | c1 b2 | c2  c2 d2 | g,1 g2 | \break
  \topstraddleb \slurDown f2( a) c | bes1 \stemUp bes2 | \stemNeutral a1 d,2 | g2.( a4) \stemUp bes4( g4) | \topstraddle f2( d) bes | bes'1 f2 | \break
  g2 a2 \stemNeutral \slurUp bes4( c4) | d1 c4( d4) | \slurDown \stemUp bes2( g2) a2 | g1 g2 | g1 \bar "||" 
  }
  
  %%%Amen
  \tag #'Amen {
  \cadenzaOn s1 s1 \bar "||"
  }
  
}

alto = \relative c' {
  \key bes \major  
  
  %%%verse 1
  \tag #'verseOne {
  \partial 2 s2 | s1. * 5 | \break
  s1. * 5 \break
  s1. * 5 | s1 \bar "||" \break
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  s2 | s1. * 5 | \break
  s1. * 2 \stemUp \voiceThree \smallnotetopstraddle \smallnote a'2 \smallnote a2 \bar "||" s2 s1. s1.  \break
  
  s1. * 5 \smallnotetopstraddle \smallnote g2 \smallnote g2  \bar "||" \break
  s2 s1. * 5 \break   

  s1. * 2 \stemDown \straddle \smallnote a2 \smallnote a2 s2 s1. * 3 \break
  s1. * 4 | \smallnotetopstraddle \stemUp \smallnote g2 \smallnote g2 \bar "||" \break
  }
  
  %%%verse 8
  \tag #'verseEight {
  \key g \major
  \stemDown d4. e8 | d2 a2 c4. c8 | e2 e2 \augdots g4. fis8 | e2 d2 c4. e8 | \slurDown d4( e4) fis2 \bar "||" 
  g4. fis8 | g2 g2 fis4. fis8 | e2 e2 d4. e8 | d2 e2 e4. d8 | \slurDown e4( d4) b2 \bar "||"
  d4. e8 | d2 a2 c4. c8 | e2 e2 \augdots g4. fis8 | e2 d2 c4. e8 | d4( e4) fis2 \breathmark \bar "||" \break
  g4. fis8 | g2 g2 fis4. fis8 | e2 e2 d4. e8 | d2 e2 e4. d8 | e4( d4) b2 \bar "||" \break
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  s2 | s1. * 5 | \break
  s1. * 5  \break
  s1. * 5 s1  \bar "||" \break
  
  s2 s1. * 5 \break   
  s1. * 6 \break
  s1. * 4 | s1 \bar "||" 
  }
    
}

tenor = \relative c {
  \clef bass
  \key bes \major  
  
  %%verse 1  
  \tag #'verseOne {
  \partial 2 s2 | s1. * 5 | \break
  s1. * 5
  s1. * 5 | s1 \bar "||"
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  s2 | s1. * 5 | \break
  s1. * 5
  
  s1. * 5 s1
  s2 s1. * 5 \break   
  
  s1. * 6 \break
  s1. * 4  s1 \bar "||" \break
  }
  
  %%%verse 8
  \tag #'verseEight {
  \override Staff.KeyCancellation  #'break-visibility = ##(#t #t #t)  %% this turns on key cancellations for both end of line and begin of line   
  \key g \major
  b'4. c8 | g2 fis2 g4. a8 | b2 b2 g4. g8 | g2 g2 c4. b8 | g2 d'2 \bar "||"
  d4. d8 | e2 e2 d4. d8 | c2 c2 g4. g8 | g2 g2 g4. g8 | g4( fis4) g2 \bar "||" \break
  b4. c8 | g2 fis2 g4. a8 | b2 b2 g4. g8 | g2 g2 c4. b8 | g2 d'2 \bar "||" \break
  d4. d8 | e2 e2 d4. d8 | c2 c2 g4. g8 | g2 g2 g4. g8 | g4( fis4) g2 \bar "||" \break
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  s2 | s1. * 5 | \break
  s1. * 5  \break
  s1. * 5 s1  \bar "||" \break

  s2 s1. * 5 \break   
  s1. * 6 \break
  s1. * 4 | s1 \bar "||"
  }
  
}

bass = \relative c {
  \clef bass
  \key bes \major  
  
  %%verse 1
  \tag #'verseOne {
  \partial 2 s2 | s1. * 5 | \break
  s1. * 5
  s1. * 5 | s1 \bar "||"
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  s2 | s1. * 5 | \break
  s1. * 5
  
  s1. * 5 s1
  s2 s1. * 5 \break   
  
  s1. * 6 \break
  s1. * 4  s1 \bar "||" \break
  }
  
  %%%verse 8 
  \tag #'verseEight {
  g4. c8 | b4( c4) d2 c4. a8 | e'2 e2 e4. d8 | c2 g2 a4. e'8 | b4( c4) d2 \bar "||"
  g4. d8 | c2 e2 b4. d8 | a2 c2 b4. c8 | b2 e4( d4) c4. g8 | c4( d4) g,2_\fermata \bar "||" \break
  g4. c8 | b4( c4) d2 c4. a8 | e'2 e2 e4. d8 | c2 g2 a4. e'8 | b4(c4) d2 \bar "||" \break
  g4. d8 | c2 e2 b4. d8 | a2 c2 b4. c8 | b2 e4( d4) c4. g8 | c4( d4) g,2_\fermata \bar "||" \break
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  s2 | s1. * 5 | \break
  s1. * 5  \break
  s1. * 5 s1  \bar "||" \break

  s2 s1. * 5 \break   
  s1. * 6 \break
  s1. * 4 | s1 \bar "||" 
  }
  
}



organsoprano = \relative c' {
  \autoBeamOff	
  \key bes \major  
  
  %%verse 1  
  \tag #'verseOne {
  \partial 2 d2 | g1 g2 | \topstraddle f( d f ) | \topstraddle bes2( d) c4( bes) | bes2( a) a |\topstraddle c( a) f | \break
  \topstraddleb f2( a) c | bes1 <g bes>2 | a1 \breathmark \bar "||" <d, f d'>2 |  \topstraddle g2.( a4) bes4( g4) | \topstraddle f2( d) bes | \break
  bes'1 f2 | g2( a) bes4( c4) | d1 c4( d4) | bes2( g2) a2 | g1. ~ | g1^\fermata \bar "||" \break
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  \beginfdots d2 | g1 g2 | \topstraddle f( d) f  | \topstraddle bes2( d) c4( bes) | bes2( a) a |\topstraddle c( a) f | \break
  \topstraddleb f2( a) c | bes1 <g bes>2 | a1 \breathmark \bar "||" <d, f d'>2 |  \topstraddle g2.( \( a4) bes4( g4) \) | \topstraddle f2( d) bes | \break
  
  bes'1 f2 | g2( a) bes4( c4) | d1 c4( d4) | bes2( g2) a2 | g1. ~ | \noBreak g1^\fermata \bar "||" \break
  f2 | bes1 bes2 | bes1 c4( d4) | <ees, c'>1 b'2 | c1 d2 | g,1. | \break

  \topstraddleb f2( a) c | bes1 bes2 | a1 d,2 |  \topstraddle g2.( a4) bes4( g4) | \topstraddle f2( d) bes | bes'1 f2 | \break
  g2( a) bes4( c4) | d1 c4( d4) | bes2( g2) a2 | g1. ~ | g1 \fdendrepeat \bar "||" \break
  }
  
  %%%verse8
  \tag #'verseEight {
  \key g \major
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  d2 | g1 g2 | \topstraddle f( d) f  | \topstraddle bes2( d) c4( bes) | bes2( a) a |\topstraddle c( a) f | \break
  \topstraddleb f2( a) c | bes1 <g bes>2 | a1 \breathmark \bar "||" <d, f d'>2 |  \topstraddle g2.( \( a4) bes4( g4) \) | \topstraddle f2( d) bes | \break
  
  bes'1 f2 | g2 a2 bes4( c4) | d1 c4( d4) | bes2( g2) a2 | g1. ~ | \noBreak g1^\fermata \bar "||" \break
  f2 | bes1 bes2 | bes1 c4( d4) | <ees, c'>1 b'2 | c1 d2 | g,1. | \break

  \topstraddleb f2( a) c | bes1 bes2 | a1 d,2 |  \topstraddle g2.( a4) bes4( g4) | \topstraddle f2( d) bes | bes'1 f2 | \break
  g2( a) bes4( c4) | d1 c4( d4) | bes2( g2) a2 | g1. ~ | g1 \bar "||" 
  }
  
  %%%Amen
  \tag #'Amen {  
  \once \override TextScript #'padding = #1.0
  g1^\markup { \small { \italic "Harmony."}} g1 \bar "||"
  }
  
}

organalto = \relative c' { 
  \autoBeamOff	
  \key bes \major  
  
  %%verse 1
  \tag #'verseOne {
  \partial 2 d2 | 
      \once\override Tie  #'control-points = #'(( 3.5 . -2.5 ) (6.5 . -3.2) (11 . -3.2 ) (15.0 . -2.5 )) 
      <d ~ bes>1. | <d a>1. | <d f>1 <ees g>2  | << { \voiceTwo \movenote #0.5 c1 c2} \\ { \voiceThree f1.} >> | <c f>1. | \break
  \movenote #-1 <c f>1 <c ees>2 | f1 ees4( d4) | <c f>1 \bar "||" s2 | \movenote #1 <ees g>1 <bes ees>2 | <bes d>1 bes2 | \break
  <bes d>1 <bes f'>2 | bes2 <d f>2 d4( f4) | <d f>1 f2 | f2 ees f | d1 ees2 | d1 \bar "||" \break
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  d2 | 
    \once\override Tie  #'control-points = #'(( 3.5 . -2.5 ) (8.5 . -3.2) (11 . -3.2 ) (16.0 . -2.5 )) 
    <d ~ bes>1. | <d a>1. | <d f>1 <ees g>2  | << { \voiceTwo \movenote #0.5 c1 c2} \\ { \voiceThree f1.} >> | <c f>1. | \break
  \movenote #-1 <c f>1 <c ees>2 | f1 ees4( d4) | <c f>1 \bar "||" s2 | \movenote #1 <ees g>1 <bes ees>2 | <bes d>1 bes2 | \break
  
  <bes d>1 <bes f'>2 | bes2 <d f>2 d4( f4) | <d f>1 f2 | f2 ees f | d1 ees2 | d1 \bar "||" \break
  d2 | f1 <ees g>2 | f1 ees4( d4) | \straddle ees2( g2) <d g>2 | <ees g>1 <d g>2 | ees1. \bar "||" \break

  \movenote #-1 <c f>1 <c f>2 | f1 <ees g>2 | <c f>1 d2 | bes1. | <bes d>1 bes2 | <bes d>1 f'2 | \break
  ees2 f2 d4( f4) | f1 f2 | d2 ees f | d1 ees2 | d1 \fdendrepeat \bar "||" \break
  }
  
  %%%verse8
  \tag #'verseEight {
  \key g \major
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  d2 | 
    \once\override Tie  #'control-points = #'(( 3.5 . -2.5 ) (6.5 . -3.2) (12 . -3.2 ) (15.0 . -2.5 )) 
    <d ~ bes>1. | <d a>1. | <d f>1 <ees g>2  | << { \voiceTwo \movenote #0.5 c1 c2} \\ { \voiceThree f1.} >> | <c f>1. | \break
  \movenote #-1 <c f>1 <c ees>2 | f1 ees4( d4) | <c f>1 \bar "||" s2 | \movenote #1 <ees g>1 <bes ees>2 | <bes d>1 bes2 | \break
  
  <bes d>1 <bes f'>2 | bes2 <d f>2 d4( f4) | <d f>1 f2 | f2 ees f | d1 ees2 | d1 \bar "||" \break
  d2 | f1 <ees g>2 | f1 ees4( d4) | \straddle ees2( g2) <d g>2 | <ees g>1 <d g>2 | ees1. \bar "||" \break

  \movenote #-1 <c f>1 <c f>2 | f1 <ees g>2 | <c f>1 d2 | bes1. | <bes d>1 bes2 | <bes d>1 f'2 | \break
  ees2 f2 d4( f4) | f1 f2 | d2 ees f | d1 ees2 | d1 \bar "||" 
  }
  
  %%%Amen  
  \tag #'Amen {
  ees1 d1 \bar "||"
  }
  
}

organtenor = \relative c { \clef bass
  \key bes \major  
  
  %%verse 1
  \tag #'verseOne {
  \partial 2 d2 |  
      \once\override Tie  #'control-points = #'((2.5 . 0.0 ) (6.5 . 0.7) (11 . 0.7 ) (16.0 . 0.0 )) 
      <d ~ g>1. | <d f>1. | f1 ees2  |f1. | <f a>1. | \break
  s1 g2 | f1 bes2 | f1 \bar "||" s2 | << { \voiceOne \movenote #1 bes1 g2} \\ { \voiceThree ees1. } >>  | f1 f2 | \break
  g1 f2 | ees2 f2 g4( a4) | bes1 <f a>2 | <f bes>2 <g bes> <a d> | << {\tieDown g1. ~ } \new Voice = "alt" { \voiceThree \movenote #-0.0 bes1 c2 } >> | <g bes>1 \bar "||" \break
  }
  
  %%%verses 2-7
  \tag #'verseTwoSeven {
  \beginfdots d2 |  
      \once\override Tie  #'control-points = #'((2.5 . 0.0 ) (8.5 . 0.7) (11 . 0.7 ) (16.0 . 0.0 )) 
      <d ~ g>1. | <d f>1. | f1 ees2  |f1. | <f a>1. | \break
  s1 g2 | f1 bes2 | f1 \bar "||" s2 | << { \voiceOne \movenote #1 bes1 g2} \\ { \voiceThree ees1. } >>  | f1 f2 | \break
  
  g1 f2 | ees2 f2 g4( a4) | bes1 <f a>2 | <f bes>2 <g bes> <a d> | << {\tieDown g1. ~ } \new Voice = "alt" { \voiceThree \movenote #-0.0 bes1 c2 } >> | <g bes>1 \bar "||" \break
  bes2 | d2 bes2 bes2 | bes1 a4( bes4) | g1 g2 | g1 <g bes!>2 | <g bes>1. | \break

  <f a>1. | <f bes>1 << {bes2} \new Voice = "alt" { \voiceFour \movenote #0 \stemDown bes2 } >>  | f1 d2 | <ees g>1.  | f1 d2 | <d g>1 bes'2 | \break
  bes2 d2 bes4( a4) | <f bes>1 \movenote #2 <f a>2 | <g bes>2 <g bes> <d a' d> | 
      << { \once\override Tie  #'control-points = #'(( 1.5 .  5.0 ) (3.5 .  6.2) (18 .  6.2 ) (20.0 .  5.05 ))  g1. ~ } 
      \new Voice = "alt" { \voiceThree \movenote #-0.0 bes1 c2 } >> 
      | <g bes>1 \fdendrepeat \bar "||" \break
  }
  
  %%%verse8
  \tag #'verseEight {
  \key g \major
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2     
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  d2 |  
      \once\override Tie  #'control-points = #'((2.5 . 0.0 ) (5.5 . 0.7) (12 . 0.7 ) (15.0 . 0.0 )) 
      <d ~ g>1. | <d f>1. | f1 ees2  |f1. | <f a>1. | \break
  s1 g2 | f1 bes2 | f1 \bar "||" s2 | << { \voiceOne \movenote #1 bes1 g2} \\ { \voiceThree ees1. } >>  | f1 f2 | \break
  
  g1 f2 | ees2 f2 g4( a4) | bes1 <f a>2 | <f bes>2 <g bes> <a d> | << {\tieDown g1. ~ } \new Voice = "alt" { \voiceThree \movenote #-0.0 bes1 c2 } >> | <g bes>1 \bar "||" \break
  bes2 | d2 bes2 bes2 | bes1 a4( bes4) | g1 g2 | g1 <g bes!>2 | <g bes>1. | \break

  <f a>1. | <f bes>1 << {bes2} \new Voice = "alt" { \voiceFour \movenote #0 \stemDown bes2 } >>  | f1 d2 | <ees g>1.  | f1 d2 | <d g>1 bes'2 | \break
  bes2 d2 bes4( a4) | <f bes>1 \movenote #2 <f a>2 | <g bes>2 <g bes> <d a' d> | 
      << { \once\override Tie  #'control-points = #'(( 1.5 .  5.0 ) (3.5 .  6.2) (18 .  6.2 ) (20.0 .  5.05 ))  g1. ~ } 
      \new Voice = "alt" { \voiceThree \movenote #-0.0 bes1 c2 } >> 
      | <g bes>1 \bar "||" 
  }    
      
  %%%Amen 
  \tag #'Amen {
  \once \override TextScript #'padding = #2.0
  c1^\markup { \small " A     -    men." } b1 \bar "||"      
  }
  
}

organbass = \relative c { \clef bass 
  \key bes \major  
  
  %%verse 1
  \tag #'verseOne {
  \partial 2 d2 | \straddle g,2 bes g | d1 d'2 |bes1 ees2  | \merge f1. | f,1. | \break
  <f' a>1 c2 | d1 ees2 | \merge f1 \bar "||" <bes, f' bes>2 | ees2( ees,2) g2 | bes1 <bes d>2 | \break
  <g d'>1 
        \once \override TextScript #'padding = #4.0
      d'2_\markup { \hspace #-6  \italic "*  This refers to the complete tune only as given for verses" "2-7." }  
      | ees2 d2 g4( f4) | <bes, f'>1 f2 | d( ees) d | g1 c2 | g1_\fermata \bar "||"
  }
      
  %%%verses 2-7
  \tag #'verseTwoSeven {
  d'2 | \straddle g,2 bes g | d1 d'2 |bes1 ees2  | \merge f1. | f,1. | \break
  <f' a>1 c2 | d1 ees2 | \merge f1 \bar "||" <bes, f' bes>2 | ees2( ees,2) g2 | bes1 <bes d>2 | \break
  
  <g d'>1 d'2 | ees2 d2 g4( f4) | <bes, f'>1 f2 | d( ees) d | g1 c2 | g1_\fermata \bar "||" \break
  bes2 | bes2 d2 ees2 | d1 c4( bes4) | \smallstraddle c2( ees2)  g2 | c,1 g2 | ees1. | \break

  f1. | d1 ees2 | f1 <d d'>2 | ees1. | bes'1 bes4( a4) | g1 d'2 | \break
  ees2( d2) g4( f4) | bes,1  f'4( d4) | g,2( ees2) d2 | <g d'>1 c2 | <g d'>1 \fdendrepeat \bar "||"
  }
  
  %%%verse8
  \tag #'verseEight {
  \key g \major
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2
  s2 s1. * 3 s2 s2  
  }
  
  %%%verse 9
  \tag #'verseNine {
  \key bes \major
  d'2 | \straddle g,2 bes g | d1 d'2 |bes1 ees2  | \merge f1. | f,1. | \break
  <f' a>1 c2 | d1 ees2 | \merge f1 \bar "||" <bes, f' bes>2 | ees2( ees,2) g2 | bes1 <bes d>2 | \break
  
  <g d'>1 d'2 | ees2 d2 g4( f4) | <bes, f'>1 f2 | d( ees) d | g1 c2 | g1_\fermata \bar "||" \break
  bes2 | bes2 d2 ees2 | d1 c4( bes4) | \smallstraddle c2( ees2)  g2 | c,1 g2 | ees1. | \break

  f1. | d1 ees2 | f1 <d d'>2 | ees1. | bes'1 bes4( a4) | g1 d'2 | \break
  ees2( d2) g4( f4) | bes,1  f'4( d4) | g,2( ees2) d2 | <g d'>1 c2 | <g d'>1 \bar "||"
  }
  
  %%%Amen
  \tag #'Amen {  
  c1 g1 \bar "||"
  }
  
}

wordsOne = \lyricmode {
  \override LyricText #'font-size = #-1.
  \once \override LyricText #'self-alignment-X = #1
  "1    I" bind  un -- to my -- self to -- day The strong name
  of the Trin -- i -- ty,   By in -- vo -- ca -- tion
  of the same, The Three in One, and One in Three.
  
  \once \override LyricText #'self-alignment-X = #1
  "2    I" bind this day to me for "ev - er," By power of
  faith, Christ's In -- car -- nation; His bap -- \skips #1 tism in
  
  Jor -- dan river; His death on Cross for my sal -- vation;
  His burst -- ing from the spic -- ed tomb; His rid -- ing

  up the heaven -- ly way; His com -- ing at the day of
  "doom: ..." I bind un -- to my -- self to day.

  \once \override LyricText #'self-alignment-X = #0.8
  "8    Christ" be with me, Christ with -- in  me, Christ be -- hind me, Christ be -- fore me,
  Christ be -- side me, Christ to win me, Christ to com -- fort and re -- store me.
  Christ be -- neath me, Christ a -- bove me, Christ in qui -- et, Christ in  dan -- ger,
  Christ in hearts of all that love me, Christ in mouth of friend and \once \override LyricText #'self-alignment-X = #-1 stranger. 

  \once \override LyricText #'self-alignment-X = #1
  "9.   I" bind un -- to  my -- self the name, The strong name
  of the Trin -- i -- ty;  By in -- vo -- ca -- tion
  of the same, The Three in One, and One in Three.
  Of whom all na -- ture hath cre -- a -- tion; E -- ter -- nal
  Fa -- ther, Spi -- rit, Word: Praise to the Lord of my "sal -"
  va -- tion, Sal -- va -- tion is of Christ the Lord.

}

wordsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  \skips #32
 
  \once \override LyricText #'self-alignment-X = #1
  "3    I" bind un -- to my -- self the power Of the great
  love of Cher -- u -- bim; The sweet ‘Well done’ in
  
  judge -- ment "hour; ..." The ser -- vice of the Ser -- a -- phim,
  Con -- fess -- ors' faith, A -- pos -- tles' word, The Pa -- triarchs'

  prayers, the Pro -- phets' scrolls, All good deeds done un -- to the
  "Lord, ..." And pu -- ri -- ty of vir -- gin souls.

}

wordsThree = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.6
  \skips #32
  
  \once \override LyricText #'self-alignment-X = #1
  "4    I" bind un -- to my -- self to -- day The vir -- tues
  of the star -- lit heaven, The glo -- rious sun's "life -"
  
  "- giv" -- ing "ray, ..." The white -- ness of the moon at even,
  The flash -- ing of the light -- ning free, The whirl -- ing

  wind's tem -- pes -- tuous shocks, The sta -- ble earth, the deep salt
  "sea, ..." A -- round the old e -- ter -- nal rocks.
 
}

wordsFour = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.8
  \skips #32
  
  \once \override LyricText #'self-alignment-X = #1
  "Pt. 2.  5    I" bind un -- to my -- self to -- day The power of  
  God to hold and lead, His eye to watch, his
  
  might to "stay, ..." His ear to heark -- en to my need.
  The wis -- dom of my God to teach, His hand to

  guide, his shield to ward; The word of God to give me
  "speech, ..." His heaven -- ly host to be my guard.

}

wordsFive = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.8
  \skips #32
  
  \once \override LyricText #'self-alignment-X = #1
  "6* A" -- gainst the de -- mon snares of sin, The vice that 
  gives tempt -- a -- tion force, The na -- tural lusts that
  
  war with -- "in, ..." The hos -- tile men that mar my course;
  Or few or ma -- ny, far or nigh, In ev -- ery

  place, and in all hours, A -- gainst their fierce hos -- ti -- "li -"
  "- ty, ..." I bind to me these ho -- ly powers.

}

wordsSix = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.8
  \skips #32
  
  \once \override LyricText #'self-alignment-X = #1
  "7* A" -- gainst all Sa -- tan's spells and wiles, A -- gainst false
  words of he -- re -- sy, A -- gainst the know -- ledge
  
  that de -- files, A -- gainst the heart's i -- do -- la -- try,
  A -- gainst the wiz -- ard's e -- vil craft, A -- gainst the

  death -- wound and the "burn - ing," The chok -- ing wave, the poi -- soned
  "shaft, ..." Pro -- tect me, Christ, till thy re -- "turn - ing."

}
	

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
%   printallheaders=##t
}

\book{


%%% Score block to generate the visual layout but not the midi	
	
\score{

\new ChoirStaff	
<<   
    <<
        \context Staff = harmonyupper
	                        <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \override Score.VerticalAxisGroup #'remove-first = ##t \voiceTwo \global \alto}
                                >>
	
        \new Lyrics \lyricsto "sopranos" \wordsOne
	\new Lyrics \lyricsto "sopranos" \wordsTwo
	\new Lyrics \lyricsto "sopranos" \wordsThree
	\new Lyrics \lyricsto "sopranos" \wordsFour
	\new Lyrics \lyricsto "sopranos" \wordsFive
	\new Lyrics \lyricsto "sopranos" \wordsSix
				
	\context Staff = harmonylower 
	                        <<
        \context Voice = tenors {  \voiceOne \global \tenor }
        \context Voice = basses {  \voiceTwo \global \bass }
                                >>							
				
	\new PianoStaff  
	                  <<  
	   \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\smallCaps "Organ."   } } 
	    \context Staff =  organupper  
	                     << 
			     \context Voice = "organsopranos" {  
			           \voiceOne \global \organsoprano }
	                     \context Voice = "organaltos"   { 
	                          \voiceTwo \global \organalto }
	                      >>
		
	    \context Staff = organlower 
	                            <<
	     \context Voice = "organtenors" { 
	                           \voiceOne \global \organtenor }
	     \context Voice = "organbasses" { 
	                           \voiceTwo \global \organbass }
			            >> 
		              >>	      
    >>
>> %% close choirstaff

\header {
      piece = \markup { \small { \column { \line { \sans "ST. PATRICK." \hspace #1 \roman " (D. L. M.)*" } 
	                               \line { { \italic "Slow and dignified" \general-align #Y #DOWN \note #"2" #0.5 "= 72." }}
				       \line {    "          " }  %%% force some space before music staves begin
      		}}}	    
      opus = \markup { \small {\center-align {
                            \line { \italic "From an Ancient" }
                            \line { \italic "Irish Hymn Melody." }
                }}}
}	

\layout {       
	        indent = 2.5\cm
		\context { \RemoveEmptyStaffContext }
		\context { \Score \override VerticalAxisGroup #'remove-first = ##t }
		\context { \Score \remove "Bar_number_engraver" }		        
		\context { \PianoStaff \remove "Span_bar_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
%		\context { \Staff \override BarLine #'break-visibility = #begin-of-line-invisible }
		
		%%%Lilypond tended to put the staffs too close together. This next setting spreads it a little to match the image
%		\context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'(-6 . 6) }
	}	
}


%%% A separate score block to generate the midi for the Main tune without the Amen
%%% Only the midi tune for Verses 2-7 has been generated as it is the most representative of the entire song.
%%% If you wish to have the tune for verse 1, 8 or 9, simply change the tag  in \keepWithTag: for example 
%%% \keepWithTag #'verseOne for verse One.

\score{

\new ChoirStaff	
<<   
    <<
        \context Staff = harmonyupper
	                        <<
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'verseTwoSeven \soprano }
	\context Voice = altos { \voiceTwo \global \keepWithTag #'verseTwoSeven \alto}
                                >>
				
	\context Staff = harmonylower 
	                        <<
        \context Voice = tenors {  \voiceOne \global \keepWithTag #'verseTwoSeven \tenor }
        \context Voice = basses {  \voiceTwo \global \keepWithTag #'verseTwoSeven \bass }
                                >>							
				
	\new PianoStaff  
	                  <<  
	   \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\smallCaps "Organ."   } } 
	    \context Staff =  organupper  
	                     << 
			     \context Voice = "organsopranos" {  
			           \voiceOne \global \keepWithTag #'verseTwoSeven \organsoprano }
	                     \context Voice = "organaltos"   { 
	                          \voiceTwo \global \keepWithTag #'verseTwoSeven \organalto }
	                      >>
		
	    \context Staff = organlower 
	                            <<
	     \context Voice = "organtenors" { 
	                           \voiceOne \global \keepWithTag #'verseTwoSeven \organtenor }
	     \context Voice = "organbasses" { 
	                           \voiceTwo \global \keepWithTag #'verseTwoSeven \organbass }
			            >> 
		              >>	      
    >>
>> %% close choirstaff
	
\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }
       } 

}



%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<   

	                  <<  
	    \context Staff =  organupper  
	                     << 
			     \context Voice = "organsopranos" {  
			           \voiceOne \global \keepWithTag #'Amen \organsoprano }
	                     \context Voice = "organaltos"   { 
	                          \voiceTwo \global \keepWithTag #'Amen \organalto }
	                      >>
		
	    \context Staff = organlower 
	                            <<
	     \context Voice = "organtenors" { 
	                           \voiceOne \global \keepWithTag #'Amen \organtenor }
	     \context Voice = "organbasses" { 
	                           \voiceTwo \global \keepWithTag #'Amen \organbass }
			            >> 
		              >>	      

>> %% close choirstaff

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}      
  
}

} %%book bracket
