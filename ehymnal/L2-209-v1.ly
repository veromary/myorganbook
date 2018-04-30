%%% 328.png
%%% Hymn 209. Old 120th Hail to the Lord who comes
%%% Rev 1.


\version "2.10"

\header {
	dedication = \markup { \center-align { "THE PURIFICATION" \hspace #0.1 }}
	title = "209"
	poet = \markup { \small { \sans "OLD 120th." \hspace #1 \roman  "(6 6. 6 6. 6 6.)" } }
	meter =  \markup { \small { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
	arranger = \markup { \small \italic "Melody from Este's Psalter, 1592."}
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

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key b \minor
\set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
  \partial 1 d1 | fis2 g2 a2 b2 | a1 \bar "||" a1 | b2 cis2 d2 b2 | cis1 \breathmark \bar "||" \break
  a1 | d2 cis2 b2 a2 | gis1 \bar "||" a1 | b2 a2 a2 gis2 | a1 \breathmark \bar "||" \break 
  fis1 | b2 a2 g2 fis2 | e1 \bar "||" a1 | g2 fis2 e2 e2 | d1 \bar "||" 
}


alto = \relative c' {
  \merge d1 | d2. e4 fis2 g2 | fis1 \bar "||" d1 | d2 e2 fis2 e2 | e1 \bar "||" 
  fis1 | fis2 a2 fis2 cis2 | e1 \bar "||" e1 | fis2 fis2 b,2 e2 | e1 \bar "||" 
  d1 | g2 e2 d2 d2 | cis1 \bar "||" cis1 | d4 ( e4 -) d2 d2 cis2 | \merge d1 \bar "||" 
}


tenor = \relative c {
  \clef bass fis1 | a2 d2 cis2 b2 | d1 \bar "||" fis,1 | fis2 a2 a2 gis2 | a1 \bar "||" 
  a1 | b2 e2 d2 a2 | b1 \bar "||" a1 | d2 cis2 e2 b2 | cis1 \bar "||" 
  a1 | d2 c2 b2 a2 | a1 \bar "||" a1 | b4 ( a4) a2 a2 a4 ( g4) | fis1 \bar "||" 
}


bass = \relative c { 
  \clef bass  d1 | d2 b2 a2 g2 | d'1 \bar "||" d1 | d2 cis2 b2 e2 | a,1 \bar "||" 
  d1 | b2 cis2 d2 fis2 | e1 \bar "||" cis1 |d2 fis2 e2 e2 | a,1 \bar "||" 
  d1 | g,2 a2 b2 d2 | a1 \bar "||" fis'1 | b,4 ( cis4) d2 a2 a2 | d1 \bar "||" 
}


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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}}%% midi score bracket

}%%score


%%% Lyric attributions and titles

\markup { \hspace #60 \small \italic "J. Ellerton, 1826-93."}  


%%% lyrics

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL to the Lord who comes,"
			                               "  Comes to his temple gate!" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Not with his Angel host,"
					   "    Not in his kingly state;"
					   "No shouts proclaim him nigh,"
					   "    No crowds his coming wait;"
					   "           " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1		
		      
		                 		\line { "2  "
			   \column {	     
				   "But borne upon the throne"
				   "    Of Mary's gentle breast,"
				   "Watched by her duteous love,"
				   "    In her fond arms at rest;"
				   "Thus to his Father's house"
				   "    He comes, the heavenly Guest."
				   "           " %%% adds vertical spacing between verses
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

\markup { \hspace #36   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  

           		\line { "3  "
			   \column {	     
				   "There Joseph at her side"
				   "    In reverent wonder stands;"
				   "And, filled with holy joy,"
				   "    Old Simeon in his hands"
				   "Takes up the promised Child,"
				   "    The glory of all lands."
				   "           " %%% adds vertical spacing between verses
			}}
           		
			\line { \hspace #-9.7 \italic "Unison. " "4  "
			   \column {	     
				   "Hail to the great First-born"
				   "Whose ransom-price they pay!"
				   "    The Son before all worlds,"
				   "The Child of man to-day,"
				   "    That he might ransom us"
				   "Who still in bondage lay."
				   "           " %%% adds vertical spacing between verses
			}}			
  
           		\line { "5. "
			   \column {	     
				   "O Light of all the earth,"
				   "Thy children wait for thee!"
				   "    Come to thy temples here,"
				   "That we, from sin set free,"
				   "    Before thy Father's face"
				   "May all presented be!"
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  


} %% book bracket
