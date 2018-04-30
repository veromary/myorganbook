%%% 342.png
%%% Hymn 216. Ave Maria! blessed Maid!
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. MARY THE VIRGIN" \hspace #0.1 }}
	title = "216"
	poet = \markup { \small { \sans "ST. ALBAN." \hspace #1 \roman  "(8 8 6. D.)" } }
	meter =  \markup { \small { \italic "Moderately slow" \general-align #Y #DOWN \note #"4" #0.5 = 108.} }
	arranger = \markup { \small \italic "St. Alban's Tune Book, 1865."}
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin
%%generates the breathmarks

breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 6/4
\key g \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 d4 \bar "|" g2 a4 g(fis) g \bar "|" c2 d4 c(b) \breathmark \bar "||" b4 \bar "|" a(fis) g c2 b4 \bar "|" a2 b8 a \once \override NoteColumn #'force-hshift = #1.5 a2 \breathmark \bar "||" \break
  a4 \bar "|" d2 e4 b2 a4 \bar "|" g2.~g2 \bar "||" g4 \bar "|" b2 a4 a(g) a \bar "|" g2 fis4 e2 \breathmark \bar "||" \break
  b'4 \bar "|" c(e) d c(b) g \bar "|" a2 g4 fis2 \breathmark \bar "||" a4 \bar "|" d2 c4 b2 a4 \bar "|" g2.~g2 \bar "||" }
 
alto = \relative c' { 
  \partial 4 d4 \bar "|" d2 e4 d2 d4 \bar "|" g2 a4 g2 \bar "||" g4 \bar "|" fis(d) g fis(a) g \bar "|" e2 g4 g(fis) \bar "||" \break
  e8 d \bar "|" d4(g) g g2 fis4 \bar "|" \augdots g2.~g2 \bar "||" g4 \bar "|" g2 fis4 fis(e) fis \bar "|" e2 dis4 e2 \bar "||" \break
  e4 \bar "|" g2 a4 g2 b,4 \bar "|" e2 e4 d2 \bar "||" fis4 \bar "|" g2 a4 g2 fis4 \bar "||" \augdots g2.~g2 \bar "||"  }

tenor = \relative c { 
  \clef bass \partial 4 b'4 \bar "|" b2 c4 b(a) b \bar "|" c2 a4 d2 \bar "||" d4 c2 b4 a(fis) g \bar "|" a(c) e d2 \bar "||" \break
  fis,4 \bar "|" g(b) a d2 c4 \bar "|" b2.~b2 \bar "||" b4 \bar "|" d2 c4 b2 c4 \bar "|" b2 a4 g2 \bar "||" \break
  g4 \bar "|" c2 a4 d2 g,4 \bar "|" c2 cis4 d2 \bar "||" d4 \bar "|" d2 e4 d2 c4 \bar "|" b2.~b2 \bar "||" }

bass = \relative c { 
  \clef bass \partial 4 g'4 \bar "|" g2 c,4 d2 g4 \bar "|" e2 fis4 g2 \bar "||" g4 \bar "|" d2 d4 d2 g,4 \bar "|" c2 cis4 d2 \bar "||" \break
  d4 \bar "|" b2 cis4 d2 d4 \bar "|" g2.~g2 \bar "||" g4 \bar "|" g2 dis4 e2 a,4 \bar "|" b2 b4 e2 \bar "||" \break
  e4 \bar "|" e2 fis4 g2 e4 \bar "|" c2 a4 d2 \bar "||" d4 \bar "|"  b2 c4 d2 d4 \bar "|" g2.~g2 \bar "||" }

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

\book{

%%% Score block	

\score{
\new ChoirStaff
<<
	\context Staff = upper <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \voiceTwo \global \alto }
							>>
		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
%%midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4)}}%% midi score bracket

}%%score

\markup { \hspace #54 \center-align {
	\line {\smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1  \italic "This hymn may also be sung to" \smallCaps " Magdalen College (" \hspace #-1 \italic "No." "457)." }
%       \line {"                "}  %%% force blank space before start of lyrics if needed
%	\line {"                "}  %%% and more blank space if needed
%	\line {"                "}  %%% and more blank space if needed.
}}


%%lyric titles

\markup { \hspace #70 \small \italic "J. Keble, 1792-1866."}  


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.8    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "VE Maria! blessèd Maid!"
			                               "    Lily of Eden's fragrant shade!" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "    Who can express the love"
					   "That nurtured thee, so pure and sweet,"
					   "Making thy heart a shelter meet"
					   "    For Jesus' holy Dove!"
					   "             " %%% add vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Ave Maria! Mother blest,"
				   "To whom, caressing and caressed,"
				   "    Clings the eternal Child;"
				   "Favoured beyond Archangels' dream."
				   "When first on thee with tenderest gleam"
				   "    Thy new-born Saviour smiled."
				   "             " %%% add vertical spacing between verses
			}} 

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
			
			\line { "3  "
			   \column {	     
				   "Thou wept'st meek Maiden, Mother mild,"
				   "Thou wept'st upon thy sinless Child,"
				   "    Thy very heart was riven:"
				   "And yet, what mourning matron here"
				   "Would deem thy sorrows bought too dear"
				   "    By all on this side heaven!"
				   "             " %%% add vertical spacing between verses
			}}
           		\line { "4  "
			   \column {	     
				   "A Son that never did amiss,"
				   "That never shamed his Mother's kiss,"
				   "    Nor crossed her fondest prayer:"
				   "E'en from the Tree he deign'd to bow"
				   "For her his agonizèd brow,"
				   "    Her, his sole earthly care."
				   "             " %%% add vertical spacing between verses
			}}  
           		\line { "5. "
			   \column {	     
				   "Ave Maria! thou whose name"
				   "All but adoring love may claim."
				   "    Yet may we reach thy shrine;"
				   "For he, thy Son and Saviour, vows"
				   "To crown all lowly lofty brows"
				   "    With love and joy like thine."
				   "             " %%% add vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne g'1 g \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo e1 d \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne c'1 b \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo c1 g \bar "||" }}
		>>
>>

\header { breakbefore = ##f piece = " " opus = " " }
\layout {
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove "Time_signature_engraver" }
	}%%layout

%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4) }} %%Amen midi 



}%%amen score

} %% book bracket
