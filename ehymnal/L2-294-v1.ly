%%%% 443.png
%%%% Hymn 294. DEVONSHIRE.  The year is swiftly waning
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—AUTUMN"
	\hspace #0.1 }}	
	
	title = "294"   
  
  poet = \markup { \small {  \line { \sans { "DEVONSHIRE."} \hspace #1 \roman {"(7 6. 7 6.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 104 "("\general-align #Y #DOWN \note #"2" #0.5 = 52")." }}
  
  arranger = \markup { \small { \italic "English Traditional Melody." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 f2 | a4 a4 a2. a4 | a4 ( g4 ) f2. g4 | a4 c4 c2 bes4 ( a4 ) | g1 \bar "||" \break
  g2 | a4 bes4 c2. d4 | c4 ( a4 ) f2. f4 | f4 a4 bes2 ( ~ \times 2/3 { bes4 a4) g4 }  | f1 \bar "||"
}
   
alto = \relative c' {  
  c2 | f4 f4 f2. f4 | f4 ( e4 ) d2. c4 | f4 e4 d2 d2 | e1 \bar "||" 
  c2 | c4 f4 f2. f4 | e2 f2. c4 | d4 f4 f2 ( ~ \times 2/3 { f4 d4) e4 }  | \merge f1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 | c4 c4 a2. bes4 | c4 ( bes4 ) a2. c4 | c4 c4 f,2 f2 | c'1 \bar "||" 
  bes2 | a4 f4 f2. f4 | a4 ( c4 ) c2 ( bes4 ) a4 | bes4 c4 d2 bes2 | a1 \bar "||" 
}

bass = \relative c {\clef bass 
  f2 | f4 f4 f2 ( e4 ) d4 | c2 d2. e4 | f4 a,4 bes2 g2 | c1 \bar "||" 
  e2 | f4 d4 a2. bes4 | c2 d2. c4 | bes4 a4 g2 c2 | << { f1 } \new Voice = "alt" { \voiceFour \movenote #0.2 \smallnote f,1 } >> \bar "||" 
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
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #74 \italic "Bishop W. W. How, 1823-97." }} 

\markup { "                " }

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE year is swiftly waning,"
			                                 "    The summer days are past;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "And life, brief life, is speeding;"
					  "    The end is nearing fast."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2   "
			   \column {
				   "The ever-changing seasons"
				   "    In silence come and go;"
				   "But thou, eternal Father,"
				   "    No time or change canst know."
				   "      " %%% adds vertical spacing between verses
		       }}
		      	\line {  "3   "
			   \column {
				   "O pour thy grace upon us,"
				   "    That we may worthier be,"
				   "Each year that passes o'er us,"
				   "    To dwell in heaven with thee."
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "Behold the bending orchards"
				   "    With bounteous fruit are crowned;"
				   "Lord, in our hearts more richly"
				   "    Let heavenly fruits abound."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			    \column {	     
				    "O, by each mercy sent us,"
				    "    And by each grief and pain,"
				    "By blessings like the sunshine,"
				    "    And sorrows like the rain,"
				    "               " %%% add vertical spacing between verses
			}}
			\line {"6. "
			    \column {	     
				    "Our barren hearts make fruitful"
				    "    With every goodly grace,"
				    "That we thy name may hallow,"
				    "    And see at last thy face."
			}}
			
			
	    } %%% end column 3
	} %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn f1 f1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }}  %%Amen midi       
       
}  


} %%% book bracket

