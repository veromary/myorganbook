%%%% 184.png
%%%% Hymn 114. Old 124th The dying robber raised his aching brow
%%%% Rev 1.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "114"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "OLD 124th."} \hspace #1 \roman {"(10. 10. 10. 10. 10.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  
  arranger = \markup { \small \italic "Melody in Genevan Psalter, 1551." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% push a note slightly to the right

push = \once \override NoteHead #'X-offset = #1

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.2
              \once \override Stem #'X-offset = #-3.2 }

%% same as above but smaller movement		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.4
              \once \override Stem #'X-offset = #-1.4 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  \once \override Staff.TimeSignature #'stencil = ##f
f1 g2 a | bes1 a1 | g2 f f e | f\breve \bar "||" a1 bes2 c2 | \break
d1 c | bes2 a g f | e\breve \bar "||" c1 f2 f | e1 f | \break
g2 bes a g | a\breve \bar "||" c1 c2 bes | a1 g | a2 c c b | \break
c\breve \bar "||" a1 g2 f | e1 f | \time 3/1 g2 bes2 \push a1 g | f \bar "||"
} 
   
alto = \relative c' {  \once \override Staff.TimeSignature #'stencil = ##f
c1 c2 c | f1 \smallstraddle f2( e) | d d c c | c\breve \bar "||" c1 f2 e |
d1 ees | f2 f d d | c\breve \bar "||" \merge c1 a2 b |  c1 \merge f |
d2 d f d | e\breve \bar "||" f1 f2 g | f1 \smallstraddle d2( e) | f2. e4 d2 d |
e\breve \bar "||" \smallstraddle f2( e) d d | c1 \merge f | \time 3/1 d2 g \push f1. e2 | \merge f1 \bar "||"
}

tenor = \relative c {\clef bass  \once \override Staff.TimeSignature #'stencil = ##f
a'1 c2 c | bes1 c1 | bes2. a4 g2 g | a\breve \bar "||" f1 f4( g) a2 |
bes1 \topstraddle g2( a) | bes c bes2. a4 | g\breve \bar "||" f1 f2 f | \topstraddle g( c) \topstraddle bes( a) |
g g c d | \topstraddle d1( cis) \bar "||" c! a2 g | c1 bes | c2. b4 a2 g |
g\breve \bar "||" f1 bes2. a4 | g1 c | \time 3/1 d2 bes c( d) g,1 | a1 \bar "||"
}

bass = \relative c {\clef bass  \once \override Staff.TimeSignature #'stencil = ##f
f1 e2 f | d1 f | bes,2 bes c c | f\breve \bar "||" \straddle f2( e) d e |
bes1 c | d2 f bes, bes | c\breve \bar "||" a1 d2 d | c1 d1 |
bes2 g a bes | a\breve \bar "||" a1 d2 e2 | f1 \merge bes | a2. g4 f2 g | 
c,\breve \bar "||" \merge f1 bes,2 bes | c1 \smallstraddle bes2( a) | \time 3/1 bes2 g a( bes) c1 | f,1 \bar "||"
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

%%% Lyric Attribution 

\markup { \small { \hspace #74 \italic "T. A. L." } }

\markup { "" }  %%% need to force a blank line as Lilypond did not leave enough space

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
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
    }	%%% end super column  
}	


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


%%% second page
%%% continuation of  lyrics

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
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