%%%065.png
%%%Hymn 22(Mod) Laetabundus Come rejoicing, Faithful men 
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
		title = \markup { "22 " \large \smallCaps "(Modern Tune)" }
		
		meter = \markup {  \small { \column {  \line { \sans {"LAETABUNDUS."} \hspace #1 \roman {"(Irreg.)"}}
                                        \line { \italic {In moderate time, majestically} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 76.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ " " } 
  			    \line { \smallCaps "Nicholas Gatty."}}}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%Prints a repeat sign glyph comprising two thin bars then 4 dots. Used to end a section then start a repeat.
%%This macro works by replacing the glyph used by the \bar "||" function. 	
barstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
		                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
								   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
								   \column { \with-color #black {  
								             \fontsize #2 . \fontsize #2 . 
								            \fontsize #2 .  \fontsize #2 . } }					 
	} }	
        \bar "||"} 

%%Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%This macro works by replacing the glyph used by the \bar "||" function. 
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
		                                                   \column { \with-color #black {  
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 	
	
%% music function to allow lyrics to skip over any number of note-syllables. 
%% The standard \skip command has its duration ignored when using \lyricsto or \addlyrics. 
%% Each instance of \skip will only skip one note-syllable. 
%% To avoid entering too many \skip commands, use this workaround function. 
%% To skip 8 note-syllables, for example, issue the command \skips #8
skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})

%% Macro to push notes rightwards
push = \once \override NoteColumn #'force-hshift = #0.45 

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

soprano = \relative c' {	                   
  \tag #'tune { a'2.^\markup { \italic "To be sung in unison."}  a4 a2 a2 | a2 fis2 b2 a2 | g2 fis2 e2 fis2 | d1( e2) fis2 | \break 
  g4( fis4 e2) fis1 \breathmark | b2. b4 b2 a2 | g2 a2 b2 cis2 | d2 a2 b2 b2 | \break
  
  a1( b2) d2 | d2( cis2) d1^\fermata \barstartrepeat a2. a4 a2 a2 | b2 a2 a1 | \break
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | d1( e2) fis2 | g4( fis4 e2) fis1 | \break
  b2. b4 b2 b2 | b2 a2 \once \override NoteColumn #'force-hshift = #1.6 < e a >1 | 
      g2 a2 b2 cis2 |  d2 a2 \once \override NoteColumn #'force-hshift = #1.6 b1 | \break
  a1( b2) d2 | d2( cis2) d1 \fdendrepeat a2. a4 a2 a2 | b2 a2 a1 | \break
  
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | fis2 d2 g2 fis2 | e2 d2 e2( fis2) | \break
  d1( e2) fis2 | g4( fis4 e2) fis1 | b2. b4 b2 b2 | b2 a2 < e a >1 | \break
  g2 a2 b2 cis2 | d2 a2 b1 | a2 b2 cis2 d2 | e2 b2 < cis e,>1 | \break
  a1( b2) d2 | d2( cis2) d1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) a2 | a2. a4 a2 a2 | \break
   
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | e2 d2 e2 fis2 | d1( e2) fis2 | \break
  g4( fis4) e2 fis1 | b1 b2 a2 |g2 a2 b2 cis2 | d2 a2 b2 b2 | \break
  a2( b2) cis2 d2 | e2 b2 < cis e, >1 | a1 b2( d2) | d2( cis2) d1\fermata \bar "||" } d,1^\markup { \italic "Harmony."} d1 \bar "||" 
}

alto = \relative c' {
  \tag #'tune { \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 d2 < a d >2 | 
      < b d >2 < a d >2 \push < a cis >1 | b1. < a d >2 | \break
  < b d >2 < a cis >2 < a d >1 | \push < d fis >\breve | \push d1. g2 | fis2 a2 ~ a2 g2 | \break 
  
  < d fis >1. g2 | \push e1 fis1 \bar "||" \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 < cis e >1 | \break
  \push < d fis >1 d2 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | b1. < a d >2 | < b d >2 < a cis >2 < a d >1 | \break
  \push < d fis > 1. < b fis' >2 |  < d g >2 < d ~ fis >2 d2 cis2 | \push d1. g2 |fis2 a2 ~ a2  g2 | \break
  < d fis >1. g2 | \push e1 fis1 \bar "||" \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 < cis e >1 | \break

  \push < d fis >1 d2 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | \push < b d> 1 b1 | s1 s1 | \break
  b1. < a d >2 | < b d >2 < a cis >2 < a d >1 | \push < d fis >1. < b fis' >2 | 
      < d g >2 < d ~ fis >2 \once \override NoteColumn #'force-hshift = #-1.3 d2 cis2 | \break
  \push d1. g2 | fis2 a2 ~ \once \override NoteColumn #'force-hshift = #-1.3 a2 g2 | a2 g2 fis4 e4 d2 | 
      g2 \tieUp < e b' ~ >2 \once \override NoteColumn #'force-hshift = #-0.5  b'2 a4 g4 | \break
  < d fis >1. g2 | \push e1 fis1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) < cis e >2 | \push < d fis >\breve | \break

  < cis e >2 \push d1 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | s1 s1 | b1. < a d >2 | \break
  < b d >2 < a cis >2 < a d >1 | < d fis >1 < d g >2 < d fis >2 | \push d1. g2 | fis2 \tieDown a2 ~ a2  g2 | \break
  \push < cis, e >1 < e a >2 < d a' >2 | g2 \tieUp < e b'~ >2 b'2 a4 g4  | < d fis >1 < d fis >2 g2 | \push e1 fis1 \bar "||" } b,1 a1 \bar "||"
}

tenor = \relative c { \clef bass
  \tag #'tune { d1 a2 d2 | d1 g,2 fis2 | g2 d'2 a2 fis2 | < b fis' >1 g'2 s2 | \break
  e,2 a2 d,1 | b'1. d2 | s1 s1 | \once \override NoteColumn #'force-hshift = #1.6 d'\breve | \break
  
  s1 s2 < g, b >2 | a1 a1 \barstartrepeat d,1 a2 d2 | b2 d2 a1 | \break
  d1 g,2 fis2 | g2 d'2 a2 fis2 | < b fis' >1 < g g' >2 fis2 | e2 a2 d,1 | \break
  b'1. d2 | g,2 d'2 a1 | s1 s1 | 
      \once \override NoteColumn #'force-hshift = #1.6
      d'\breve | \break
  s1 s2 < g, b>2 | a1 a1 \fdendrepeat d,1 a2 d2 | b2 d2 a1 | \break
  
  d1 g,2 fis2 | g2 d'2 a2 fis2 | b1 e,2 d2 | < fis' b >1 b2 < ais cis >2 | \break
  < b, fis' >1 < g g'>2 fis2 | e2 a2 d,1 | s1 s1 | g2 d'2 a1 | \break
  s1 s1 | 
      \once \override NoteColumn #'force-hshift = #1.6
      d'\breve | d1 s1 | b2 s2 s1 | \break
  s1 s2 < g b >2 | < a, a' >1 < d a' >1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) a2 | d\breve | \break 
  
  a2 d2 g,2 fis2 | g2 d'2 a2 fis2 | < fis' b >1 b2 < ais cis >2 | fis1( < g, g' >2 ) fis2 | \break
  e2 a2 d,1 | b'1 g2 d'2 | s1 s1 | \push d'1. s2 | \break
  s1 s1 | s1 s1 | d,2 cis2 b2 < g' b >2 | a1 a1 \bar "||" } g1 fis1 \bar "||"
}	
	
bass = \relative c { \clef bass
  \tag #'tune { s1 s1 | s1 s1 | s1 s1 | s1 g2 fis2 |
  s1 s1 | s1 s1| < e' b' >2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 |
  
  d1 b2 g2 | a1 d1 _\fermata \bar "||" s1 s1 | s1 s1 | 
  s1 s1 | s1 s1 | s1 s1 | s1 s1 |
  s1 s1 | s1 s1 | < e b'>2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 |
  d1 b2 g2 | a1 d1 \bar "||" s1 s1 | s1 s1 |
  
  s1 s1 | s1 s1 | s1 s1 | b1 g2 fis2 |
  s1 s1 | s1 s1 | b1. d2 | s1 s1 |
  < e b' >2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 | fis2 g2 < a cis >2 b2 | e,2 g,2 a1 |
  d2 cis2 b2 g2 | s1 s1 \bar "||" s2 | s1 s1 |
  
  s1 s1 | s1 s1 | b1 g2 fis2 | b1 s1 |
  s1 s1 | s1 s1 | < e b' >2 <fis a >2 g2 < e e' >2 | b'2 fis2 g2 < e e'>2 |
  a1 g2 fis 2 | < e b' >2 g,2 a1 | s1 s2 g2 | a1 d1 _\fermata \bar "||" } g,1 d'1 \bar "||"
}

global = {
  \time 4/2 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}


midline = \lyricmode {
  "1 Come" re -- joic -- ing, Faith -- ful men, with rap -- ture sing -- ing Al -- le -- 
  lu -- ya! "(2) Mon"  -- arch's Mon -- arch, From a ho -- ly mai -- den spring -- ing,
  Might -- y won -- der! "5 As" a star its kin -- dred ray,
  Ma -- ry doth her Child dis -- play, Like in na --  -- ture;
  \once \override LyricText #'self-alignment-X = #0.2
  "(6) Still" un -- dimmed the star shines on, And the mai -- den bears a Son,
  Pure as e -- ver. "9 Yet" the sy -- na -- gogue de -- nied 
  What E -- sai -- as had de -- scried: Blind -- ness fell up -- on the guide,
  Proud, un -- heed -- ing. 
  \once \override LyricText #'self-alignment-X = #0.5
  "(10) If" her pro -- phets speak in vain,
  Let her heed a Gen -- tile strain, And, from mys -- tic Sy -- bil, gain
  Light and lead -- ing. 
  \once \override LyricText #'self-alignment-X = #0.5
  "11 No" lon -- ger then de -- lay, 
  Hear what the Scrip -- tures say, Why be cast a -- way A
  race for -- lorn? 
  \once \override LyricText #'self-alignment-X = #0.5
  "(12.) Turn" and this Child be -- hold, That ve -- ry Son, of
  old In God's writ fore -- told, A maid hath borne. A -- men.
}

topline = \lyricmode {
\skips #32	
  "3 An" -- gel of the Coun -- sel here,
  Sun from star, he doth ap -- pear, Born of maid -- en:
  \once \override LyricText #'self-alignment-X = #0.5
  "(4) He" a sun who knows no night,
  She a star whose pa -- ler light Fad -- eth ne -- ver. 
}

bottomline = \lyricmode {
\skips #32
  "7 Le" -- ba -- non his ce -- dar tall
  To the hys -- sop on the wall Low -- ly bend -- eth;
  "(8) From" the high -- est, him we name Word of God, to hu -- man frame
  Now de -- scend -- eth.
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

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\new Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 \topline }			      
	\new Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 \midline }
	\new Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 \bottomline }
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
	}

	
} %%score bracket

%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                
\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" { \relative c' {\clef treble \global  
  a'2.^\markup { \italic "To be sung in unison."}  a4 a2 a2 | a2 fis2 b2 a2 | g2 fis2 e2 fis2 | d1( e2) fis2 | \break 
  g4( fis4 e2) fis1 \breathmark | b2. b4 b2 a2 | g2 a2 b2 cis2 | d2 a2 b2 b2 | \break
  
  a1( b2) d2 | d2( cis2) d1^\fermata \unfoldRepeats  { \repeat volta 3 { a2. a4 a2 a2 | b2 a2 a1 | \break
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | d1( e2) fis2 | g4( fis4 e2) fis1 | \break
  b2. b4 b2 b2 | b2 a2 \once \override NoteColumn #'force-hshift = #1.6 < e a >1 | 
      g2 a2 b2 cis2 |  d2 a2 \once \override NoteColumn #'force-hshift = #1.6 b1 | \break
  a1( b2) d2 | d2( cis2) d1 }} a2. a4 a2 a2 | b2 a2 a1 | \break
  
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | fis2 d2 g2 fis2 | e2 d2 e2( fis2) | \break
  d1( e2) fis2 | g4( fis4 e2) fis1 | b2. b4 b2 b2 | b2 a2 < e a >1 | \break
  g2 a2 b2 cis2 | d2 a2 b1 | a2 b2 cis2 d2 | e2 b2 < cis e,>1 | \break
  a1( b2) d2 | d2( cis2) d1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) a2 | a2. a4 a2 a2 | \break
   
  a2 fis2 b2 a2 | g2 fis2 e2( fis2) | e2 d2 e2 fis2 | d1( e2) fis2 | \break
  g4( fis4) e2 fis1 | b1 b2 a2 |g2 a2 b2 cis2 | d2 a2 b2 b2 | \break
  a2( b2) cis2 d2 | e2 b2 < cis e, >1 | a1 b2( d2) | d2( cis2) d1\fermata \bar "||" 	  
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 d2 < a d >2 | 
      < b d >2 < a d >2 \push < a cis >1 | b1. < a d >2 | \break
  < b d >2 < a cis >2 < a d >1 | \push < d fis >\breve | \push d1. g2 | fis2 a2 ~ a2 g2 | \break 
  
  < d fis >1. g2 | \push e1 fis1 \unfoldRepeats  { \repeat volta 3 { \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 < cis e >1 | \break
  \push < d fis >1 d2 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | b1. < a d >2 | < b d >2 < a cis >2 < a d >1 | \break
  \push < d fis > 1. < b fis' >2 |  < d g >2 < d ~ fis >2 d2 cis2 | \push d1. g2 |fis2 a2 ~ a2  g2 | \break
  < d fis >1. g2 | \push e1 fis1 }} \push < d fis >1 < cis e >2 < d fis >2 | \push < d fis >1 < cis e >1 | \break

  \push < d fis >1 d2 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | \push < b d> 1 b1 | s1 s1 | \break
  b1. < a d >2 | < b d >2 < a cis >2 < a d >1 | \push < d fis >1. < b fis' >2 | 
      < d g >2 < d ~ fis >2 \once \override NoteColumn #'force-hshift = #-1.3 d2 cis2 | \break
  \push d1. g2 | fis2 a2 ~ a2 g2 | a2 g2 fis4 e4 d2 | 
      g2 \tieUp < e b' ~ >2 \once \override NoteColumn #'force-hshift = #-0.5  b'2 a4 g4 | \break
  < d fis >1. g2 | \push e1 fis1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) < cis e >2 | \push < d fis >\breve | \break

  < cis e >2 \push d1 < a d >2 | < b d >2 < a d >2 \push < a cis >1 | s1 s1 | b1. < a d >2 | \break
  < b d >2 < a cis >2 < a d >1 | < d fis >1 < d g >2 < d fis >2 | \push d1. g2 | fis2 \tieDown a2 ~ a2  g2 | \break
  \push < cis, e >1 < e a >2 < d a' >2 | g2 \tieUp < e b'~ >2 b'2 a4 g4  | < d fis >1 < d fis >2 g2 | \push e1 fis1 \bar "||"
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  d1 a2 d2 | d1 g,2 fis2 | g2 d'2 a2 fis2 | < b fis' >1 g'2 s2 | \break
  e,2 a2 d,1 | b'1. d2 | s1 s1 | \once \override NoteColumn #'force-hshift = #1.6 d'\breve | \break
  
  s1 s2 < g, b >2 | a1 a1 \unfoldRepeats  { \repeat volta 3 { d,1 a2 d2 | b2 d2 a1 | \break
  d1 g,2 fis2 | g2 d'2 a2 fis2 | < b fis' >1 < g g' >2 fis2 | e2 a2 d,1 | \break
  b'1. d2 | g,2 d'2 a1 | s1 s1 | 
      \once \override NoteColumn #'force-hshift = #1.6
      d'\breve | \break
  s1 s2 < g, b>2 | a1 a1 }} d,1 a2 d2 | b2 d2 a1 | \break
  
  d1 g,2 fis2 | g2 d'2 a2 fis2 | b1 e,2 d2 | < fis' b >1 b2 < ais cis >2 | \break
  < b, fis' >1 < g g'>2 fis2 | e2 a2 d,1 | s1 s1 | g2 d'2 a1 | \break
  s1 s1 | 
      \once \override NoteColumn #'force-hshift = #1.6
      d'\breve | d1 s1 | b2 s2 s1 | \break
  s1 s2 < g b >2 | < a, a' >1 < d a' >1 \bar "||" \set Score.measurePosition = #(ly:make-moment 3 2) a2 | d\breve | \break 
  
  a2 d2 g,2 fis2 | g2 d'2 a2 fis2 | < fis' b >1 b2 < ais cis >2 | fis1( < g, g' >2 ) fis2 | \break
  e2 a2 d,1 | b'1 g2 d'2 | s1 s1 | \push d'1. s2 | \break
  s1 s1 | s1 s1 | d,2 cis2 b2 < g' b >2 | a1 a1 \bar "||" 	  
} 
}

\new Staff = "bass" { \relative c { \clef bass \global  
  s1 s1 | s1 s1 | s1 s1 | s1 g2 fis2 |
  s1 s1 | s1 s1| < e' b' >2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 |
  
  d1 b2 g2 | a1 d1 _\fermata \unfoldRepeats { \repeat volta 3 { s1 s1 | s1 s1 | 
  s1 s1 | s1 s1 | s1 s1 | s1 s1 |
  s1 s1 | s1 s1 | < e b'>2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 |
  d1 b2 g2 | a1 d1 }} s1 s1 | s1 s1 |
  
  s1 s1 | s1 s1 | s1 s1 | b1 g2 fis2 |
  s1 s1 | s1 s1 | b1. d2 | s1 s1 |
  < e b' >2 < fis a >2 g2 < e e' >2 | b'2 fis2 g1 | fis2 g2 <a cis>2 b2 | e,2 g,2 a1 |
  d2 cis2 b2 g2 | s1 s1 \bar "||" s2 | s1 s1 |
  
  s1 s1 | s1 s1 | b1 g2 fis2 | b1 s1 |
  s1 s1 | s1 s1 | < e b' >2 <fis a >2 g2 < e e' >2 | b'2 fis2 g2 < e e'>2 |
  a1 g2 fis 2 | < e b' >2 g,2 a1 | s1 s2 g2 | a1 d1 _\fermata \bar "||" 
}
}
>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 76 2)
            }
       }
} %% midi score bracket

%%% score block to generate Amen midi without main tune

\score {
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'tune \soprano }
	\context Voice = altos    {\voiceTwo \global \removeWithTag #'tune \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'tune \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'tune \bass }
			        >>
 >>
	
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) } }

} 



} %%book bracket