%%% 168png
%%% Hymn 100 Nicht So Taurig Go to Dark Gethsemane
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
		\hspace #0.1 }}	
  title = "100"
  poet = \markup {  \small { \sans "NICHT SO TRAURIG."   \hspace #1 \roman "(7 7. 7 7. 7 7.)" }}
  meter = \markup { \small { \italic {Slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 50.} }
  arranger =  \markup { \small { \italic "Ascribed to" \smallCaps "J. S. Bach," "1685-1750."} }
  tagline =""
}

global = {
  \time 4/2
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 bes'2 a4(g) | d'2 c4(bes) a2 bes4(c) | fis,1^\fermata \bar "||" 
      g4(a) bes2 | ees,2 d c f | d1^\fermata \bar "||" \break
  bes'2 a4(g) | d'2 c4(bes) a2 bes4(c) | fis,1^\fermata \bar "||" 
      g4(a) bes2 | ees,2 d c f | d1^\fermata \bar "||" \break
  d'2 f,2 | e2 f bes a4(g) | a1^\fermata \bar "||" 
      a2 bes4(c) | fis,2 d' bes a4(g) | g1^\fermata \bar "||" }

alto = \relative c' { 
  \partial 1 d2 c | bes4(c) d2 ees d4(c) | d1 \bar "||" 
      d2 d | c4(a) bes2 bes a | bes1 \bar "||" \break
  d2 c | bes4(c) d2 ees d4(c) | d1 \bar "||" 
      d2 d | c4(a) bes2 bes a | bes1 \bar "||" \break
  bes2 bes | c c d c | c1 \bar "||" 
      c2 c | d d d c4(bes) | bes1 \bar "||" }

tenor = \relative c { \clef bass 
  \partial 1 g'2 fis | g g g fis4(g) | a1 \bar "||" 
      g2 g | g f f f | f1 \bar "||" \break
  g2 fis | g g g fis4(g) | a1 \bar "||" 
      g2 g | g f f f | f1 \bar "||" \break
  f2 f | g f f e | f1 \bar "||" 
      f2 g | a g g fis | g1 \bar "||" }

bass = \relative c { \clef bass 
  \partial 1 g2 a | bes g c d4(ees) | d1_\fermata \bar "||" 
      bes4(a) g2 | c d4(ees) f2 f,2 | bes1_\fermata \bar "||" \break
  g2 a | bes g c d4(ees) | d1_\fermata \bar "||" 
      bes4(a) g2 | c d4(ees) f2 f,2 | bes1_\fermata \bar "||" \break
  bes2 d | c4(bes) a2 g c | f,1_\fermata \bar "||" 
      f'2 ees! | d4(c) bes(c) d2 d | g,1_\fermata \bar "||" }

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%%annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book {
		
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2)}} 

} %%% Score bracket

%%% text markups

\markup { \hspace #20  \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Redhead 76" \italic "(No. 477)." }

\markup { \hspace #66 \small \italic {"J. Montgomery, 1771-1854."}}
   
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "G" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
		 	          \column  { \raise #0.0 "O to dark Gethsemane," "  Ye that feel the Tempter's power;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Your Redeemer's conflict see,"
					   "    Watch with him one bitter hour:"
					   "Turn not from his griefs away,"
					   "Learn of Jesus Christ to pray."
			  		}}
			           } %% finish stanza 1	
		}  
}	  
	
%%% second page
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
           	\line { "2  "
		   \column {	     
			   "See him at the judgement-hall."
			   "    Beaten, bound, reviled, arraigned;"
			   "See him meekly bearing all!"
			   "    Love to man his soul sustained."
			   "Shun not suffering, shame, or loss;"
			   "Learn of Christ to bear the Cross."
			}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "3. "
		   \column {	     
			   "Calvary's mournful mountain view;"
			   "    There the Lord of Glory see,"
			   "Made a sacrifice for you,"
			   "    Dying on the accursèd tree:"
			   "'It is finished!' hear him cry;"
			   "Trust in Christ and learn to die."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
       \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }
       } %% close Amen layout
       
%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}   

} %% Amen Score bracket

} %% close book bracket