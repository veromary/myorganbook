%%%% 185.png
%%%% Hymn 114 Alternative Version. Melody in the tenor. The dying robber raised his aching brow
%%%% Rev 2

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = \markup { \center-align { "114"
	\line { \large { \smallCaps "Alternative Version" "(melody in the tenor)" }}
	\hspace #1  %%% insert a blank line
	}}
  
  meter = \markup { \small {\column {  \line { \sans { \smallCaps "OLD 124th."} \hspace #1 \roman {"(10. 10. 10. 10. 10.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.}
                                  }
                  }}
 
  arranger =  \markup { \small { \center-align {
		            \line{ \italic "Harmony by" \smallCaps "W. Parsons" "(" \hspace #-1 \italic "slightly" }
			    \line { \italic "altered" \hspace #-1 ")" \italic "in Day's Psalter, 1563."  }
  		} } } 	

  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% push a note slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  \once \override Staff.TimeSignature #'stencil = ##f
  c1 e2 f | f1 f | e2 d d c | c\breve \bar "||" f1 g2 a | \break
  bes1 a | g2 f e d | cis\breve \bar "||" c!1 c2 c | c1 c | \break
  e2 g f g | fis\breve \bar "||" g1 g2 g | f1 e | f2 g a g | \break
  g\breve \bar "||" f1 e2 d | c1 d | \time 3/1 d2( \push g1) f2 f4( g) e2 | f\breve \bar "||"
} 
   
alto = \relative c' {  \once \override Staff.TimeSignature #'stencil = ##f
  a1 c2 c | d1 c | c2 a bes g | a\breve \bar "||" c1 ees2 ees |
  f1 f | d2 c c a | a\breve \bar "||" g1 a2 a | g1 a |
  c2 d d c | d\breve \bar "||" e!1 e2 d | c1 c | c2 e f d |
  e\breve \bar "||" c1 c2 a | a1 a | \time 3/1 bes2 d c1 ~ c4( bes) a( g) | a\breve \bar "||"
}

tenor = \relative c {\clef bass  \once \override Staff.TimeSignature #'stencil = ##f
  f1 g2 a | bes1 a | g2 f f e | f\breve \bar "||" a1 bes2 c |
  d1 c | bes2 a g f | e\breve \bar "||" c1 f2 f | e1 f |
  g2 bes a g | a\breve \bar "||" c1 c2 bes | a1 g | a2 c c b |
  c\breve \bar "||" a1 g2 f | e1 f | \time 3/1 g2 bes a1 \push g1  | f\breve \bar "||"
}

bass = \relative c {\clef bass  \once \override Staff.TimeSignature #'stencil = ##f
  \merge f1 c2 f | bes,1 f | c'2 d bes c | f,\breve \bar "||" f'1 ees2 c |
  bes1 f | g2 a c d | a\breve \bar "||" \merge c1 f,2 f | c'1 f, \bar "||"
  c'2 g d' ees | d\breve \bar "||" c1 c2 g | a1 c | f2 c f g |
  c,\breve \bar "||" f1 c2 d | a1 d | \time 3/1 \push g, a bes2 c | f,\breve \bar "||"
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
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}} 

} %%% Score bracket


%%% Hymn Note Markup

\markup{ \hspace #4  \override #'(line-width . 94)

\justify{  { "     [" \italic {This version may be used in connexion with the other in those verses only where the} \smallCaps { Choir sings alone. }  
	       \italic { "    It is not suitable when the hymn is sung at a Three Hours' Service, but may" } 
                \italic { "be used on other occasions, and also for No. 352." } "]" } } }

		
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

%%% Second page

%%% Lyric Attribution 

\markup { \small { \hspace #74 \italic "T. A. L." } }

%%% Main lyric block

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE dying robber raised his aching brow"
			                                 "  To claim the dying Lord for company;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And heard, in answer to his trembling vow,"
					   "The promise of the King: Thou—even thou—"
					   "    To-day shalt be in Paradise with me."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "We too the measure of our guilt confess,"
				   "    Knowing thy mercy, Lord, our only plea;"
				   "That we, like him, through judgement and distress,"
				   "For all the weight of our unworthiness,"
				   "    May win our way to Paradise with thee."
			}}     
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "But so bewildered is our failing heart,"
				   "    So dim the lustre of thy royalty."
				   "We hardly know thee, Lord, for what thou art,"
				   "Till we begin to take the better part"
				   "    And lose ourselves in Paradise with thee."
			}}  
    		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "Then lift our eyes, dear Lord, from this poor dross,"
				  "    To see thee reigning in humility,"
				  "The King of love; that, wresting gain from loss,"
				  "We too may climb the ladder of the Cross,"
				  "    To find our home in Paradise with thee."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}
	
%%% alternative hymns also suitable

\markup { \hspace #34 \italic "Or the following: " \small  "99  Glory be to Jesus." }

} %%% book bracket