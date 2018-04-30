%%% 212.png
%%% Hymn 129 Orientis Partibus. Christ the Lord is risen again!
%%% Version 2

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - EASTERTIDE" } 
					       \hspace #1
						} }	
  title = "129"
  
  poet = \markup { \small {  \line { \sans {"ORIENTIS PARTIBUS."} \hspace #1 \roman {"(7 7. 7 7. 4.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "Mediaeval French Melody." }			       
		
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% increase space between markup and staff

pad = \once \override TextScript #'padding = #1		      

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 3/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \pad f2^\markup {\hspace #-3 \italic "To be sung in unison."} g4 | a2 f4 | g2 e4 | f2. \bar "||" c'2 c4 | d2 a4 | \break
  c2 c4 | a2. \bar "||" a2 g4 | bes2 a4 | g2 f4 | a2. \bar "||" \break
  c2 bes4 | a2 f4 | g2 e4 | f2. \bar "||" f2 g4 | a2( g4) | f2. \bar "||"
}

alto = \relative c' {
  <a c>2 <c e>4 | <c e>2 <a d>4 | <bes d>2 <g c>4 | <a c>2. \bar "||" <c e>2 f4 | f2 <c f>4 |
  <c f>2 <c e>4 | <c f>2. \bar "||" <c f>2 <c ees>4 | <d f>2 <c f>4 | <bes d>2 <a d>4 | <c e>2. \bar "||"
  f2 d4 | c2 <a d>4 | <bes d>2 <g c>4 | <a c>2. \bar "||" <a d>2 <c e>4 | <c f>2 <c e>4 | <a c>2. \bar "||"
}

tenor = \relative c { \clef bass
  s2 c4 | a2 d4 | bes2 c4 | s2. \bar "||"  a'2 a4 | a2 a4 |
  g2 g4 | f2. \bar "||" s2 c4 | bes2 f4 | g2 f'4 | e2. \bar "||"
  a2 g4 | e2 f4 | d2 g4 | f2. \bar "||" \new Voice = "alleluya" { \stemUp d2 c4 | a4.( bes8 c4) | f,2. } \bar "||"
}

bass = \relative c { \clef bass
  f2 s4 | s2. | s2. | f2. \bar "||" a,2 f'4 | d2 f4 |
  c2 c4 | \augdots f2. \bar "||" f2 s4 | s2. | s2 d4 | a2. \bar "||"
  f2 g4 | a2 d4 | bes2 c4 | f,2. \bar "||" s2. | s2. | s2. \bar "||"
}

%%% Score Lyrics

scoreLyrics = \lyricmode {
  \set ignoreMelismata = ##t
  \once \override LyricText #'self-alignment-X = #-1
  "Al   -" 
  \once \override LyricText #'self-alignment-X = #-1
  "le   -" "lu"  -  -  ya!	
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
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
	\context Lyrics { \lyricsto "alleluya" {\scoreLyrics   }}
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }
       }	
} %%score bracket


%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune to this hymn will be found in the Appendix." }

%%% Lyric attribution and titles

\markup { \hspace #83 \small { \center-align { \line { \italic "Michael Weisse, c. 1480-1534." }  
                                               \line { \italic "Tr. C. Winkworth." }
}}}


%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.   
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux and looks a little better so it is used here.
%%% Humboldt has been reported to give problems when compiling
%%% on Macintosh installations, so GF Gesetz can be used instead.
%%% In the original image, "s" and "t" were joined in a Fraktur style ligature
%%% comprising a long-s (the one that looks like a "f") and a t.
%%% HumboldtFraktur does have a st ligature, mapped to the pound sign. 
%%% However, to allow the text to degrade gracefully for users who do not have the 
%%% Fraktur font, I did not use the ligatured characters.  Instead, the regular 
%%% unicode character for the long-s (unicode 017F) was used, together with a Fraktur "t", moved
%%% a little closer together, to look like a ligature.
%%% If you do not have a Fraktur font, you should see, for example "Chriſtus". 
%%% If you use another Fraktur font, simply put the name into the font-name override below.


 \markup { \small { \hspace #42 \override #'(font-name . "HumboldtFraktur") {"Chriſ" \hspace #-1.35 "tus" "iſ" \hspace #-1.35 "t" "erſ" \hspace #-1.35 "tanden." }}}

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "HRIST the Lord is risen again!"
                                                         "  Christ hath broken every chain!" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "Hark, the angels shout for joy,"
					   "Singing evermore on high,"
					   "                                            Alleluya!"
                                        }}
		      		} %% finish verse 1 
}  %%% end markup       



%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% Continuation of lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column {        
		 \hspace #1 
		 \line { "2  "
			\column {         
				"He who gave for us his life,"
				"Who for us endured the strife,"
				"Is our Paschal Lamb to-day!"
				"We too sing for joy, and say"
					   "                                            Alleluya!"
                        }}  
                \hspace #1 
                \line { "3  "
                           \column {         
				   "He who bore all pain and loss"
				   "Comfortless upon the Cross,"
				   "Lives in glory now on high,"
				   "Pleads for us, and hears our cry."
					   "                                            Alleluya!"
                        }}
		\hspace #1 
                \line { "4  "
                           \column {         
				   "He whose path no records tell,"
				   "Who descended into hell;"
				   "Who the strong man armed hath bound,"
				   "Now in highest heaven is crowned."
					   "                                            Alleluya!"
                        }}
		\hspace #1 
                \line { "5  "
                           \column {         
				   "Now he bids us tell abroad"
				   "How the lost may be restored,"
				   "How the penitent forgiven,"
				   "How we too may enter heaven."
					   "                                            Alleluya!"
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line {"6. "
			\column {        
				"Thou, our Paschal Lamb indeed,"
				"Christ, to-day thy people feed;"
				"Take our sins and guilt away,"
				"That we all may sing for ay,"
					   "                                            Alleluya!"
                }}
          }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
			      \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 ^\markup {\hspace #-4 \small \italic "Harmony."} f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
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

       }

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}   
       
}  

} %%book bracket

