%%%% 324.png
%%%% Hymn 206. Dundee. O thous, who didst with love untold.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: ST. THOMAS"
	\hspace #0.1 }}	
	
  title = "206"   
  
  meter = \markup {  \small { \column {  \line { \sans {"DUNDEE."} \hspace #1 \roman {"(C. M.)"}}
                                        \line { \italic {Moderately slow}\general-align #Y #DOWN \note #"2" #0.5 = 66.}}}}   
  
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "Scottish Psalter, 1615, as given in"  }
			    \line { \italic  "Ravenscroft's Psalter, 1621."}}}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

soprano = \relative c' {
  \partial 1 ees1 | g2 aes2 bes2 ees,2 | f2 g2 aes1 \bar "||" \halfmeasure g1 \bar "|" \break
  f2 ees2 ees2 d2 | ees1 \bar "||" bes'1 | ees2 d2 c2 bes2 | \break
  bes2 a2 bes1 \bar "||" \halfmeasure g1 | f2 ees2 ees2 d2 | ees1 \bar "||" 
}

alto = \relative c' {
  bes1 | ees2 ees2 bes2 bes2 | des2 des2 ees1 \bar "||" ees1 | 
  d2 c2 c2 bes2 | bes1 \bar "||" ees1 | g2 f2 ees2 d2 | 
  c2 c2 d1 \bar "||"  bes1 | c2 g4 ( aes4 ) bes2 bes2 | bes1 \bar "||" 
}

tenor = \relative c { \clef bass
  g'1 | bes2 c2 f,2 g2 | aes2 bes2 c1 \bar "||" bes1 | 
  bes2 g2 aes2 f2 | g1 \bar "||" g1 | bes2 bes2 g2 f2 | 
  g2 f2 f1 \bar "||" g1 | aes2 ees2 f2 f2 | g1 \bar "||" 
}

bass = \relative c { \clef bass
  ees1 | ees2 c2 d2 ees2 | des2 bes2 aes1 \bar "||" ees'1 | 
  bes2 c2 aes2 bes2 | ees1 \bar "||" ees1 | ees2 bes2 c2 d2 | 
  ees2 f2 bes,1 \bar "||" ees1 | aes,2 c2 bes2 bes2 | ees1 \bar "||" 
} 
  
global = {
  \time 4/2 
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
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
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 66 2)
            }
       }
	
} %%score bracket


\markup { "                 "  }  %%% force some blank space between score and lyrics
\markup { "                 "  }  %%% force some blank space between score and lyrics


%%% Lyric attributions and titles


\markup { \small { \hspace #2 "(" \hspace #-1 \italic "O. H., 174-6." \hspace #-1 ")" \hspace #54 \italic "Mrs. E. Toke, 1812-72, and W. Denton." }}

\markup { "                 "  }  %%% force some blank space between score and lyrics

%%% Lyrics


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses);

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " THOU, who didst with love untold"
			                                "  Thy doubting servant chide," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Bidding the eye of sense behold"
					   "    Thy wounded hands and side:"
					   "         " %%% adds blank spacing between verses
			  		}}
		      }
		      	   \line { "2  "
			   \column {	     
				   "Grant us, like him, with heartfelt awe"
				   "    To own thee God and Lord,"
				   "And from his hour of darkness draw"
				   "    Faith in the incarnate Word."
				   "           " %%% adds vertical spacing between verses
					}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			   \line { "3  "
			   \column {	     
				   "And while that wondrous record now"
				   "    Of unbelief we hear,"
				   "O let us only lowlier bow"
				   "    In self-distrusting fear;"
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "4. "
				\column {	     
				   "And grant that we may never dare"
				   "    Thy loving heart to grieve,"
				   "But, at the last, their blessing share"
				   "    Who see not, yet believe."
				   "           " %%% adds vertical spacing between verses
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes ees'1 \bar "||" }}
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

} %%% book bracket
