%%%% 441.png
%%%% Hymn 292 ST. GALL To thee, O Lord, our hearts we raise
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—HARVEST"
	                                        \hspace #0.1 }}	
	
  title = "292"   
  
  poet = \markup {  \small { \sans {"ST. GALL."}   \hspace #1 \roman {"(87 87. D.)"}} }
  
  meter = \markup { \small { \italic {Moderately fast} \general-align #Y #DOWN \note #"4" #0.5 = 112.} }
  
  arranger =  \markup { \small { \italic "St. Gall Gesangbuch, 1863."}}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
   
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat   \partial 4 c'4 | a4 d4 c4 a8[ bes8] | c8[ bes8] a8[ g8] f4 g4 | a4 g4 a4 c8[ bes8] | a2 g4 ^\fermata  \fdendrepeat \break }  
  \tag #'remainder  { a4 | f4 e4 d4 g4 | e4 d4 c4 g'4 | g4 g4 a8[ b8] c4 | c4 ( b4 -) c4 ^\fermata \bar "||" \break
  c4 | a4 d4 c4 a8[ bes8] | c8[ bes8] a8[ g8] f4 c'4 | c4 f8[ e8] d8[ c8] bes8[ a8] | g4 ( a8[ g8] -) f4 \bar "||" 
}} 
   

alto = \relative c' {  
  \tag #'repeatpart { e4 | f4 f4 f4 f4 | f4 e4 f4 e4 | f4 e4 f4 g4 | f2 e4  \fdendrepeat } 
  \tag #'remainder  { e4 | d4 c4 d4 d4 | c4 b4 c4 e4 | d4 c4 f4 e4 | d2 e4 \bar "||" 
  e4 | f4 f4 f4 f4 | f4 e4 f4 g4 | f4 f4 f4 g8 f8 | e2 f4 \bar "||"
}}


tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  c'4 | c4 bes4 c4 f,4 | g4 c8[ bes8] a4 c4 | c4 c4 c4 c4 | c2 c4  \fdendrepeat  }  
  \tag #'remainder  { c4 | a4 c4 f,4 d4 | e4 f4 g4 c4 | b4 c4 f,4 g4 | a4 ( g4 -) g4  \bar "||"
  c4 | c4 bes4 c4 f,4 | g4 c8[ bes8] a4 g4 | a4 a4 bes4 d4 | g,4 ( c8[ bes8] -) a4 \bar "||"
}}

 
bass = \relative c {\clef bass 
   \tag #'repeatpart { c4 | f4 bes,4 a4 d4 | c4 c4 d4 c4 | f4 c4 f4 e4 | f2 c4 _\fermata \fdendrepeat  }  
   \tag #'remainder  { a4 | d4 a4 bes4 b4 | c4 d4 e4 c4 | g'8[ f8] e4 d4 e4 | f4 ( g4 -) c,4 _\fermata \bar "||" 
   c4 | f4 bes,4 a4 d4 | c4 c4 d4 e4 | f8[ e8] d4 bes4 g4 | c2 f4 _\fermata \bar "||"
}}

 
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
		
} %%% Score bracket


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4)}} 

} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune for this hymn will be found in the Appendix." }


%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #64 \italic "W. Chatterton Dix, 1837-98." }} 

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.0 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "O thee, O Lord, our hearts we raise"
			                                "    In hymns of adoration;" } }          
	                  \line {  \hspace #3.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To thee bring sacrifice of praise"
					   "    With shouts of exultation."
					   "Bright robes of gold the fields adorn,"
					   "    The hills with joy are ringing,"
					   "The valleys stand so thick with corn"
					   "    That even they are singing."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
	  } %%% end supercolumn
} %%% end markup	  
       
      
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "2  "
			   \column {	     
				   "And now, on this our festal day,"
				   "    Thy bounteous hand confessing,"
				   "Upon thine altar, Lord, we lay"
				   "    The first-fruits of they blessing;"
				   "By thee the souls of men are fed"
				   "    With gifts of grace supernal;"
				   "Thou who dost give us daily bread,"
				   "    Give us the Bread eternal."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			   \column {	     
				   "We bear the burden of the day,"
				   "    And often toil seems dreary;"
				   "But labour ends with sunset ray,"
				   "    And rest is for the weary;"
				   "May we, the Angel-reaping o'er,"
				   "    Stand at the last accepted,"
				   "Christ's golden sheaves for evermore"
				   "    To garners bright elected."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { \hspace #-9.6 \italic "Unison. " "4. "
			   \column {	     
				   "O, blessèd is that land of God,"
				   "    Where Saints abide for ever;"
				   "Where golden fields spread fair and broad,"
				   "    Where flows the crystal river:"
				   "The strains of all its holy throng"
				   "    With ours to-day are blending;"
				   "Thrice blessèd is that harvest-song"
				   "    Which never hath an ending."
				   "          " %%% adds vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) }}  %%Amen midi       
       
}  



} %%% book bracket
