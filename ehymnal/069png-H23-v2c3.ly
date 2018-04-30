%%%069.png
%%%Hymn 23 Dent Dale. (7 7. 7 7.) Hark, how all the welkin rings!
%%%Version 2 069png-H23-v2.ly Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "23"
  poet = \markup { \small {  \line { \sans {"DENT DALE."} \hspace #1 \roman {"(7 7. 7 7.)"}} }}
  meter = \markup { \small { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.} }
  arranger =  \markup { \small \italic "English Traditional Melody."}
  tagline =""
}


global = {
  \time 4/4 
  \key bes \major 
  \set Staff.midiInstrument = "church organ"
}

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
 }

soprano = \relative c' {
  bes'4. bes8 bes4 bes \nbbar a bes c2 \nbbar bes4. c8 d4 d \nbbar ees8[ d] c[ bes] f2 \bar "||" \break
  g8[ f] bes[ g] f4 f \nbbar \override NoteColumn #'force-hshift = #-0.04 ees4. f8 d2 \nbbar f4. f8 f4 ees' \nbbar d c bes2 \bar "||"
}

alto = \relative c' {
  f4. f8 g4 f \nbbar ees d f2 \nbbar \augdots bes4. f8 f4 g \nbbar g8[ f] ees[ d] c2 \bar "||" \break
  ees8[ f] ees4 f d \nbbar \override NoteColumn #'force-hshift = #0.04 ees c bes2 \nbbar f'4. f8 f4 g \nbbar f ees d2 \bar "||"
}

tenor = \relative c { \clef bass
  d'4. d8 bes4 bes \nbbar f f a2 \nbbar d4. c8 bes4 bes \nbbar bes g a2 \bar "||" \break
  bes4 bes8[ a] bes4 bes \nbbar bes a bes2 \nbbar f4. a8 bes4 bes \nbbar bes a bes2 \bar "||"
}

bass = \relative c { \clef bass
  bes'4. bes8 ees,4 d \nbbar c bes f'2 \nbbar g4. a8 bes4 g \nbbar c, ees f2 \bar "||" \break
  ees8[ d] c4 d bes \nbbar c f bes,2 \nbbar \augdots f'4. ees8 d4 c \nbbar f f bes,2 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.1
%  between-system-padding = 2\mm
  after-title-space = 2\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            }
       }
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	  \line { \hspace #81 \small \italic {"C. Wesley, 1707-88."}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "ARK, how all the welkin rings!" " 'Glory to the King of kings,"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Peace on earth and mercy mild," 
				"God and sinners reconciled.'" 
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Joyful, all ye nations, rise," 
			       "Join the triumph of the skies;" 
			       "Universal nature say" 
			       "'Christ the Lord is born to-day.'"
		   }}

		\hspace #0.2 % adds vertical spacing between verses
		\line { "3  "
		    \column {	     
			    "Christ, by highest heaven adored," 
			    "Christ, the everlasting Lord," 
			    "Late in time behold him come" 
			    "Offspring of a Virgin's womb."  	   
	   }} 
	   	\hspace #0.2 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
			    "Veiled in flesh, the Godhead see!" 
			    "Hail the incarnate Deity!" 
			    "Pleased as man with men to appear" 
			    "Jesus, our Emmanuel here!" 
 	   }}  
 
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -52 . -1) #0 }       %%Column 2. This is the line dividing the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { \hspace #4 %%start page column 3		
 
	  \line { \hspace #-5 \italic "Unison." " 5  "
             \column {    
		     "Hail the heavenly Prince of peace!" 
		     "Hail the Sun of righteousness!" 
		     "Light and life to all he brings," 
		     "Risen with healing in his wings." 
 	   }} %% end stanza 5

	  \hspace #0.2
	  \line { \hspace #3.8 "6  "
             \column {    
		     "Mild he lays his glory by," 
		     "Born that man no more may die," 
		     "Born to raise the sons of earth," 
		     "Born to give them second birth!" 
 	   }} %% end stanza 6

	  \hspace #0.2
	  \line { \hspace #3.8 "7  "
             \column {    
		     "Come, Desire of nations, come," 
		     "Fix in us thy humble home;" 
		     "Rise, the woman's conquering Seed," 
		     "Bruise in us the serpent's head." 
 	   }} %% end stanza 7

	  \hspace #0.2
	  \line { \hspace #-5 \italic "Unison." " 8. "
             \column {    
		     "Now display thy saving power," 
		     "Ruined nature now restore," 
		     "Now in mystic union join" 
		     "Thine to ours, and ours to thine." 
 	   }} %% end stanza 8

	  } %% end column 3
	  } %% master line bracket
	} %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne bes'1 bes1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                        <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 f1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  ees1 bes1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi 

} 	
	

} %% book bracket