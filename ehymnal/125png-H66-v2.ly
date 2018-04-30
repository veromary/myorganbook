%%% 125png
%%% Hymn 66 Modern Tune Cannons O Kind Creator bow thine ear
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title =  \markup { "66 " \large \smallCaps "(Modern Tune)" }
  poet = \markup {  \small { \sans {"CANNONS."}   \hspace #1 \roman {"(L. M.)"}} }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 92.} }
  arranger =  \markup { \small { \smallCaps "G. F. Handel, 1685-1759." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }

%% Music function for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This function generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
%% Use this on the lower of the two voices sharing the dotted note.
%% The function accepts a variable to allow the dots to be moved slightly left or right 
%% to avoid the tails of quavers or to align with the dots on other staffs.
%% E.g. \augdotsoffset #-1.2 moves the dots leftwards by -1.2 units

augdotsoffset = #(define-music-function (parser location displacement) (number?)
     #{
       \once \override Voice.Dots #'stencil = #ly:text-interface::print 
       \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \hspace #$displacement
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
     #})   
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% SATB Voices

global = {
  \time 4/4
  \key f \minor
  \set Staff.midiInstrument = "church organ"
  \autoBeamOff
}

soprano = \relative c' { 
  f4 c8. e16 f4 g4 | aes4. bes8 g2 \breathmark \bar "||" 
      aes4 ees8. g16 aes4 bes4 | c4. des8 bes4 ^\fermata \breathmark \bar "||" \break
  c4 | des4. c8 bes4. aes8 | g4 f4 e4 ^\fermata \bar "||"
      g4 | c4 f,4 bes8[ c8] aes8[ g8] | g4. f8 f2 ^\fermata \bar "||" 
}

alto = \relative c' { 
  c4 c8. bes16 c4 c4 | f4 f4 e2 \bar "||" 
      f4 \augdotsoffset #-1.4 ees8. des16 ees4 ees4 | ees4 f4 ees4 \bar "||" 
  ees4 | des4 ees4 f4 ees4 | des4 bes4 c4 \bar "||" 
      e!4 | f4 f4 e4 f4 | f4 e4 f2 \bar "||" 
}

tenor = \relative c { \clef bass
  aes'4 aes8. bes16 aes4 c4 | c4 des4 c2 \bar "||" 
      c4 aes8. bes16 c4 bes4 | aes4 aes4 g4 \bar "||" 
  g4 | aes4 g4 f4 aes4 | bes4 f4 g4 \bar "||" 
      c4 | c4 des8[ c8] bes4 c4 | c4 bes4 aes2 \bar "||" 
}

bass = \relative c { \clef bass
  f4 \augdotsoffset #0 aes8. g16 f4 e4 | f4 bes,4 c2 \bar "||" 
      f4 c8. bes16 aes4 g4 | aes4 des4 ees4 _\fermata \bar "||" 
  ees4 | f4 ees4 des4 c4 | bes4 des4 c4 _\fermata \bar "||" 
  bes4 aes4 bes8[ aes8] g4 f4 | c'4 _\markup { \hspace #0 \lower #1.5 \italic "Org." } << {c4 } 
      \new Voice = "org" { \voiceFour \once \override NoteColumn #'force-hshift = #0.2 \smallnote c,4 } >>
      f2 _\fermata \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

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
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4)}} 

} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Angers Melody at Hymn 51." }

%%% Lyric titles

\markup { \small { \hspace #6 \smallCaps "Office Hymn." " M." \italic " Till Lent" "iii." \hspace #20 \italic {"Asc. to St. Gregory the Great, 6th cent.  Tr. T. A. L."} }  }

\markup { \small { \hspace #40 "Audi benigne Conditor."} } 

%%% Main block of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
	  \column { %%% super column for entire block of lyrics 
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  KIND Creator, bow thine ear"  "  To mark the cry, to know the tear" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Before thy throne of mercy spent"
					   "In this thy holy fast of Lent."
			  		}}
			       
			           } %% finish verse 1	 
		  \hspace #1  % adds vertical spacing between verses  		   
		  \line { "2  "
		    \column {	     
			    "Our hearts are open, Lord, to thee:"
			    "Thou knowest our infirmity;"
			    "Pour out on all who seek thy face"
			    "Abundance of thy pardoning grace."
			}}
		   \hspace #1  % adds vertical spacing between verses  	
		   \line { "3  "
		     \column {	     
			    "Our sins are many, this we know;"
			    "Spare us, good Lord, thy mercy show;"
			    "And for the honour of thy name"
			    "Our fainting souls to life reclaim."
			}}
			
	  }			   
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		\hspace #1  % adds vertical spacing between verses   
		\line { "4  "
		    \column {	     
			    "Give us the self-control that springs"
			    "From discipline of outward things,"
			    "That fasting inward secretly"
			    "The soul may purely dwell with thee."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "5. "
		   \column {	     
			   "We pray thee, Holy Trinity,"
			   "One God, unchanging Unity,"
			   "That we from this our abstinence"
			   "May reap the fruits of penitence.     Amen."
     			}}
	  }
}% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo des1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }} 

}


} %%% book bracket