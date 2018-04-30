%%% 062.png - 065.png
%%% Hymn 22 Laetabundus. "Come rejoicing, faithful men"
%%% Version 3
 
 
\version "2.10"
 
\include "gregorian-init.ly"
 
\header {
   dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS" \hspace #0.1 } }     
   title = "22"
   poet = \markup { \small \italic { Christmas Sequence, and Office Hymn for Candlemas.} }
   composer = \markup { \small \italic { 11th cent. or earlier.    Tr. cento. } }
   meter = \markup { \small \sans { LAETABUNDUS. } }
   arranger = \markup { \small { Mode v. } }
   tagline = ""
}
 
global = {
  \key e \major 
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     macro block                                                             %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% *** macro settings for stemless long note which is 2x duration of regular white note    
 
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }
 
 
% *** prints four dots in a column, This will be used by other macros to create repeat signs.                   
 
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}           
            
% *** positions 4 dots at beginning of a line of score mimicking a begin repeat sign
% uses fdots macro, above
% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
% glyph at the beginning of a line without upsetting the bar at the end of the previous line
% Place \beginfdots before the first note of line you want it to begin.
 
beginfdots = {    
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.4
                   \once \override Staff.RehearsalMark #'X-offset = #'9.0
                   \mark \fdots
                   \once \override Score.SeparationItem #'padding = #1
}           
            
 
% *** Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
% This macro works by replacing the glyph used by the \bar "||" function. 
 
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                           \column { \with-color #black {  
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 .} }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                                      \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
            
            } }         
        \bar "||"} 
 
% *** Prints a repeat sign glyph comprising two thin bars then 4 dots. Used to end a section then start a repeat.
% This macro works by replacing the glyph used by the \bar "||" function.   
 
barstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                                                   \column { \with-color #black {  
                                                                                                             \fontsize #2 . \fontsize #2 . 
                                                                                                            \fontsize #2 .  \fontsize #2 . } }                                                     
            } }         
        \bar "||"}     
            
% *** Prints a repeat sign glyph comprising 4 dots then two thin bars then 4 dots. Used to end a repeat and then start another repeat.
% This macro works by replacing the glyph used by the \bar "||" function.   
 
doublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0) 
                                                                           \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } } 
                                                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                      
            } }         
        \bar "||"}     
 
%%%   
%%% Equivalent macros for plainsong    
%%%
 
 
% *** prints three dots in a column, suitable for plainsong staffs    
 
tdots = \markup { \override #'(baseline-skip . 1.6) 
                  \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . } }
}           
 
 
% *** Using the tdots macro above, positions 3 dots at beginning of a line of score thus mimicking a begin repeat sign.
% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
% glyph at the beginning of a line without upsetting the bar at the end of the previous line
% Place \pbeginfdots before the first note of line you want it to begin.
 
pbegintdots = { 
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.5
                   \once \override Staff.RehearsalMark #'X-offset = #'9.0
                   \mark \tdots
                   \once \override Score.SeparationItem #'padding = #1
}           
 
 
% *** Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
% This macro works by replacing the glyph used by the \bar "||" function. 
 
ptdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                                                      \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
            } }         
        \bar "||"}      
 
 
% *** end repeat sign comprising 3 dots and one thin bar.  (Might be a misprint for the one above.)
 
ptdendrepeatsingle = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
   \once \override Staff.BarLine #'text = \markup { \line { \raise #1.4 \override #'(baseline-skip . 1.6)  
                                                            \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
                                                            \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
        } } 
        \bar "||"}                  
 
 
% *** Prints a repeat sign glyph comprising two thin bars then 3 dots. Used to end a section then start a repeat on a plainsong staff.
% This macro works by replacing the glyph used by the \bar "||" function.   
 
pbarstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                 
            } }         
        \bar "||"} 
            
% *** Prints a repeat sign glyph comprising 3 dots then two thin bars then 3 dots. Used to end a repeat and then start another repeat on a plainsong staff.
% This macro works by replacing the glyph used by the \bar "||" function.   
 
pdoublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6) 
                                                                           \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }            
                                                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                 
            } }         
        \bar "||"}     
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     music block                                                             %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
plainsong = {  \relative c' { 
   \clef "vaticana-do1"
   \set fontSize = #3
   \set Staff.explicitClefVisibility = #end-of-line-invisible
            
   c8 \[ d8 \flexa c8 \] \[ d8 \pes e8 \] c8 \bar "|" f8 \[ g8 \pes a8 \] g8 f8 \[ g8 \pes a8 \] f8 \[ g8 \flexa f8 \] g8 \bar "|" \break
   c,8 \[ d8 \flexa c8 \] \[ d8 \pes e8 \] c8 \pdoublerepeat c8 \[ c8 \pes  d8 \] e8 \[ e8 \flexa d8 \] f8 \[ f8 \flexa d8 \] e8 \bar "|" \break
   e8 g8 g8 \[ e8 \flexa d8 \] f8 \[ f8 \flexa d8 \] e \bar "|" c8 \[ d8 \flexa c8 \] \[ d8 \pes e8 \] c8 \ptdendrepeatsingle \break
   
   
   \pbegintdots c8 \[ c8 \flexa \once \override Accidental #'extra-offset = #'(-1.3 . 0) bes!8 \] \[ a8 \flexa g8 \] \[ g8 \pes a8 \] c8 c8 \[ d8 \flexa c8 \] \bar "|" c8 \[ c8 \pes d8 \] e8 \[ c8 \pes d8 \] f8 \[ f8 \flexa d8 \] e8 \bar "|" \break
   c8 \[ d8 \flexa c8 \] \[ d8 \pes e8 \] c8 \pdoublerepeat g'8 g8 a8 f8 g8 \[ \virga f8 \inclinatum e8 \inclinatum d8 \] e8 \bar "|" \break
   g8 e8 f8 \[ e8 \flexa d8 \] \[ c8 d8 \pes e8 \] e8 e8 \bar "|" f8 \[ d8 \flexa c8 \] \[ d8 \pes e8 \flexa c8 \] \once \override TextScript #'extra-offset = #'( 0.9 . -1.2 ) c8^\markup { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . } \ptdendrepeat \break 
 
 
   \set Staff.clefPosition = #-3 \pbegintdots e8 e8 g8 a8 f8 d8 e8 \bar "|" a8 g8 \[ g8 \flexa f8 \] e8 f8 d8 \[ e8 \flexa c8 \] \bar "|" \break
   e8 c8 d8 \[ c8 \flexa b8 \] \[ a8 b8 \pes c8 \] c8 c8 \bar "|" d8 \[ b8 \flexa a8 \] \[ b8 \pes c8 \flexa a8 \] \once \override TextScript #'extra-offset = #'( 3.0 . 0.5 ) a8_\markup { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . \filled-box #'( -3.5 . -0.5 ) #'(0 . 0) #0 } \ptdendrepeat \break
   \clef "vaticana-do1" \pbegintdots a8 c8 d8 bes8 d8 c8 \bar "|" a8 c8 d8 bes!8 d8 c8 \bar "|" \break                                                                                          
   
   e8 g8 f8 \[ e8 \pes d8 \] c8 \bar "|" d8 bes!8 d8 c8 s8 \ptdendrepeat \[ c8 d8 c8 \] \[ \once \override Accidental #'extra-offset = #'(-0.8 . 0) bes!8 \pes c8 \] \bar "||" \break
} }
 
 
soprano = \relative c' {
 
   e8 fis8[ e8] fis8[ gis8] e8 \bar "|" a8 b8[ cis8] b8 a8 b8[( cis8] a8) b8[ a8] b8 \bar "|" \break
   e,8 fis8[ e8] fis8[ gis8] e8 \doublerepeat e8 e8[ fis8] gis8 gis8[ fis8] a8 a8[ fis8] gis8 \bar "|" \break
   gis8 b8 b8 gis8[ fis8] a8 a8[ fis8] gis8 \bar "|" e8 fis8[ e8] fis8[ gis8] e8 \fdendrepeat \break \pageBreak
 
   \beginfdots e8 e8[ d8] cis8[ b8] b8[ cis8] e8 e8 fis8[ e8] \bar "|" e8 e8[ fis8] gis8 e8[ fis8] a8 a8[ fis8] gis8 \bar "|" \break 
   e8 fis8[ e8] fis8[ gis8] e8 \doublerepeat b'8 b8 cis8 a8 b8 a8[ gis8 fis8] gis8 \bar "|" \break
   b8 gis8 a8 gis8[ fis8] e8[ fis8 gis8] gis8 gis8 \bar "|" a8 fis8[ e8] fis8[ gis8 e8] e8 \fdendrepeat \break \pageBreak
 
    \beginfdots b'8 b8 dis8 e8 cis8 a8 b8 \bar "|" e8 dis8 dis8[ cis8] b8 cis8 a8 b8[ gis8] \bar "|" \break
   b8 gis8 a8 gis8[ fis8] e8[ fis8 gis8] gis8 gis8 \bar "|" a8 fis8[ e8] fis8[ gis8 e8] e8 \fdendrepeat \break 
    \beginfdots cis8 e8 fis8 d!8 fis8 e8 \bar "|" cis8 e8 fis8 d!8 fis8 e8 \bar "|" \break \pageBreak
 
   gis8 b8 a8 gis8[ fis8] e8 \bar "|" fis8 d8 fis8 \ln e4 \fdendrepeat e8[ fis8 e8] d!8[ e8] \bar "||" \break
}
 
alto = \relative c' {
 
   b8 \ln b4 \ln dis4 b8 \bar "|" \ln e4. dis8 cis8 \ln e4. \ln e4 dis8 \bar "|" \break
   e8 \ln cis4 \ln dis4 b8 \doublerepeat b8 e8[ dis8] e8 e8[ fis8] e8 e8[ fis] e8 \bar "|" \break
   e8 fis8 e8 e8[ cis8] fis8 \ln dis4 e8 \bar "|" \ln b4. \ln dis4 b8 \fdendrepeat \break
 
   gis8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln a4~ a8[ gis8] b8[ gis8] cis8 b8 \ln cis4 \bar "|" b8 \ln e4 #(set-accidental-style 'forget) dis8 #(set-accidental-style 'default) \ln cis4 fis8 cis8[ dis8] e8 \bar "|" \break
   cis8 \ln cis4 \ln dis4 b8 \doublerepeat gis'8 fis8 e8 cis8 dis8 \ln cis4. e8 \bar "|"
   dis8 cis8 cis8 \ln b4 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 b8 \bar "|" cis8 b8[ gis8] \ln a4. gis8 \fdendrepeat \break
 
   fis'8 e8 a8 gis8 e8 a8 fis8 \bar "|" gis8 fis8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln gis4~ gis8 gis8 fis8 fis8[ e8] \bar "|"
   fis8 e8 fis8 \ln dis4 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 b8 \bar "|" cis8 \ln cis4 \ln dis4( cis8) b8 \fdendrepeat \break
   a8 e'8 d!8 a8 d8 cis8 \bar "|" a8 b8 a8 a8 a8 gis8 \bar "|" \break
 
   \ln b4 cis8 #(set-accidental-style 'forget) \ln dis4 #(set-accidental-style 'default) cis8 \bar "|" a8 a8 a8 a8( gis8) \fdendrepeat cis8[ d!8 cis8] d8 b8 \bar "||" \break
}
 
tenor = \relative c { 
            \clef bass
 
   gis'8 fis8[ gis8] \ln b4 gis8 \bar "|" a8 gis8[ a8] fis8 fis8 gis8[ a8 fis8] gis8[ a8] fis8 \bar "|" \break
   b8 fis8[ gis8] \ln b4 gis8 \doublerepeat gis8 \ln b4 b8 \ln b4 cis8 cis8[ b8] b8 \bar "|" \break
   cis8 b8 gis8 b8[ a8] cis8 \ln a4 cis8 \bar "|" gis8 a8[ gis8] \ln b4 gis8 \fdendrepeat \break
 
    \beginfdots b,8 cis8[ d8] \ln e4 fis8[ e8]~ \ln e4 a8[ gis8] \bar "|" gis8 \ln a4 b8 \ln cis4 cis8 \ln a4 b8 \bar "|" \break
   gis8 fis8[ gis8] \ln b4 gis8 \doublerepeat b8 b8 gis8 fis8 fis8 fis8[ gis8 a8] gis8 \bar "|" \break
   gis8 e8 \stemUp fis8 \ln dis4 cis8[ dis8] \ln e4 dis8 \bar "|" fis8 dis8[ cis8] \ln cis4. b8 \fdendrepeat \break
 
    \beginfdots dis'8 b8 a8 b8 cis8 e8 dis8 \bar "|" b8 b8 b8[ cis8] dis8 e8 cis8 \ln b4 \bar "|" \break
   dis8 cis8 cis8 \ln b4 gis8[( fis8] \ln e4) dis8 \bar "|" fis8 fis8[ gis8] \ln b4( a8) gis8 \fdendrepeat \break
    \beginfdots e8 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 a\breve*1/4~ a8 \bar "|" e8 e8 cis8 d!8 d8 b8 \bar "|" \break
 
   \ln e4~ e8 \ln b'4 gis8 \bar "|" fis8 fis8 \once \override NoteHead #'duration-log = #4 \once \override Stem #'flag-style = #'no-flag d!16( \once \override NoteHead #'duration-log = #4 \once \override Stem #'flag-style = #'no-flag cis16) \ln b4 \fdendrepeat \once \override Tie #'extra-offset = #'( 0.0 . 0.5 )\ln a'4.~ a8[ gis8] \bar "||" \break
 
}
 
bass = \relative c { 
       \clef bass
            
   e8 dis8[ e8] \ln b4 e8 \bar "|" cis8 b8[ a8] b8 fis'8 \ln e4. e8[ cis8] b8 \bar "|" \break
   gis8 a8[ cis8] \ln b4 e,8 \doublerepeat e'8 gis8[ fis8] e8 e8[ dis8] cis8 cis8[ dis8] e8 \bar "|" \break
   cis8 dis8 e8 e8[ fis8] fis8 \ln fis4 cis8 \bar "|" \ln e4. \ln b4 e8 \fdendrepeat \break
 
   \ln e,4.~ \ln e4 dis'8[ cis8] a8 gis8 fis8[ cis'8] \bar "|" e8 \ln cis4 b8 \ln a4 fis8 \ln fis4 e8 \bar "|" \break
   cis'8 a8[ cis8] \ln b4 e8 \doublerepeat e8 dis8 cis8 fis8 b8 \ln fis4. cis8 \bar "|" \break
   gis8 cis8 fis,8 \ln gis4 \ln a4( \ln gis4) gis8 \bar "|" fis8 b8[ cis8] \ln a4. e8 \fdendrepeat \break
 
   b''8 gis8 fis8 e8 a8 cis8 b8 \bar "|" e,8 b'8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln gis4~ gis8 cis,8 fis8 dis8[ e8] \bar "|" \break
   b8 cis8 fis,8 gis8[ b8] \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 gis8 \bar "|" fis8 a8[ cis8] b8[( gis8 a8]) e'8 \fdendrepeat \break
   a,8 cis8 d8 fis8 d8 a'8 \bar "|" a,8 gis8 fis8 fis8 d8 e8 \bar "|" \break
 
   e8 gis8 a8 \ln b4 cis8 \bar "|" d!8 d8 d,!8 \ln e4 \fdendrepeat a8[ d!8 a8] fis8[ e8] \bar "||" \break
}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     lyrics block                                                            %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
lyricsOne = \lyricmode {
 
\set stanza = "1  " Come re -- joic -- ing, Faith -- ful men, with "rap     -     ture" sing -- ing Al -- le -- lu -- ya!  
 
\set stanza = "3  " An -- gel of the Coun -- sel here, Sun from star, he doth ap -- pear, Born of mai -- den:
 
\set stanza = "5  " As a star its kind -- red ray, Ma -- ry doth her Child dis -- play, Like in na -- ture;
 
\set stanza = "7  " Le -- ba -- non his ce -- dar tall To the hys -- sop on the wall Low -- ly bend -- eth;
 
\set stanza = "9  " Yet the syn -- a -- gogue de -- nied What E -- sai -- as had de -- scried: Blind -- ness fell up -- on the guide, Proud, un -- heed -- ing.
 
\set stanza = "11 " No long -- er then de -- lay, Hear what the Scrip -- tures say, Why be cast a -- way A race for -- lorn?
 
}
 
lyricsTwo = \lyricmode {
 
\set stanza = "2  " Mon -- arch's Mon -- arch, From a ho -- ly "mai      -      den" spring -- ing, Migh -- ty won -- der!
 
\set stanza = "4  " He a sun who knows no night, She a star whose pa -- ler light Fad -- eth ne -- ver. 
 
\set stanza = "6  " Still un -- dimmed the star shines on, And the mai -- den bears a Son, Pure as e -- ver.
 
\set stanza = "8  " From the high -- est, him we name Word of God, to hu -- man frame Now de -- scend -- eth. 
 
\set stanza = "10 " If her pro -- phets speak in vain, Let her heed a Gen -- tile strain, And, from mys -- tic Sy -- bil, gain Light and lead -- ing.
 
\set stanza = "12." Turn and this Child be -- hold, That ve -- ry Son, of old In God's writ fore -- told, A maid hath borne.
 
A -- men_*.
 
} 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     score block                                                             %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
#(ly:set-option 'point-and-click #f)
 
\book {
 
\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}
 
\score { <<
 
\context VaticanaStaff <<
   \new VaticanaVoice = "cantus" { \plainsong }
>> % end vaticana staff
    
\context ChoirStaff <<
   \context Staff = upper << 
      \context Voice = sopranos { \voiceOne << \global \soprano >> }
      \context Voice = altos {\voiceTwo << \global \alto >> }
                          >> 
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \small \override LyricSpace #'minimum-distance = #1.8 \lyricsOne }
 
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \small \lyricsTwo }
 
   \context Staff = "lower" << \clef bass
      \context Voice = tenors { \voiceOne << \global \tenor >> }
      \context Voice = bass { \voiceTwo << \global \bass >> }
                            >> 
>> % choir staff
 
>> % score
 
\layout {
            
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
               % *** Remove custos
               \remove Custos_engraver
               % *** needed for certain tweaks
               \consists "Mark_engraver"
           \remove Key_engraver
           \override Accidental #'transparent = ##f }
} % end layout
 
} % end score
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%     repeats and midi block                                                  %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% *** This next section of code is for unfolding the repeats and generating the midi
 
% *** Not needed for visual layout
                
 
\score { 

\new ChoirStaff <<
 
\new Staff = "soprano" { \relative c' { \global
 
\unfoldRepeats { 
   \repeat volta 2 {
   e8 fis8[ e8] fis8[ gis8] e8 \bar "|" a8 b8[ cis8] b8 a8 b8[( cis8] a8) b8[ a8] b8 \bar "|" 
   e,8 fis8[ e8] fis8[ gis8] e8 }
 
   \repeat volta 2 {
   e8 e8[ fis8] gis8 gis8[ fis8] a8 a8[ fis8] gis8 \bar "|"
   gis8 b8 b8 gis8[ fis8] a8 a8[ fis8] gis8 \bar "|" e8 fis8[ e8] fis8[ gis8] e8 }
 
   \repeat volta 2 {
   e8 e8[ d8] cis8[ b8] b8[ cis8] e8 e8 fis8[ e8] \bar "|" e8 e8[ fis8] gis8 e8[ fis8] a8 a8[ fis8] gis8 \bar "|"  
   e8 fis8[ e8] fis8[ gis8] e8 }

   \repeat volta 2 { 
   b'8 b8 cis8 a8 b8 a8[ gis8 fis8] gis8 \bar "|"
   b8 gis8 a8 gis8[ fis8] e8[ fis8 gis8] gis8 gis8 \bar "|" a8 fis8[ e8] fis8[ gis8 e8] e8 }
 
   \repeat volta 2 {
   b'8 b8 dis8 e8 cis8 a8 b8 \bar "|" e8 dis8 dis8[ cis8] b8 cis8 a8 b8[ gis8] \bar "|" 
   b8 gis8 a8 gis8[ fis8] e8[ fis8 gis8] gis8 gis8 \bar "|" a8 fis8[ e8] fis8[ gis8 e8] e8 } 
 
   \repeat volta 2 {
   cis8 e8 fis8 d!8 fis8 e8 \bar "|" cis8 e8 fis8 d!8 fis8 e8 \bar "|" 
   gis8 b8 a8 gis8[ fis8] e8 \bar "|" fis8 d8 fis8 \ln e4 }
 
   e8[ fis8 e8] d!8[ e8] \bar "||"
} % unfold 
} % relative
} % staff   


\new Staff = "alto" { \relative c' { \global 

\unfoldRepeats { 
   \repeat volta 2 { 
   b8 \ln b4 \ln dis4 b8 \bar "|" \ln e4. dis8 cis8 \ln e4. \ln e4 dis8 \bar "|"
   e8 \ln cis4 \ln dis4 b8 }

   \repeat volta 2 { 
   b8 e8[ dis8] e8 e8[ fis8] e8 e8[ fis] e8 \bar "|" 
   e8 fis8 e8 e8[ cis8] fis8 \ln dis4 e8 \bar "|" \ln b4. \ln dis4 b8 }
 
   \repeat volta 2 { 
   gis8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln a4~ a8[ gis8] b8[ gis8] cis8 b8 \ln cis4 \bar "|" b8 \ln e4 #(set-accidental-style 'forget) dis8 #(set-accidental-style 'default) \ln cis4 fis8 cis8[ dis8] e8 \bar "|" 
   cis8 \ln cis4 \ln dis4 b8 }

   \repeat volta 2 { 
   gis'8 fis8 e8 cis8 dis8 \ln cis4. e8 \bar "|"
   dis8 cis8 cis8 \ln b4 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 b8 \bar "|" cis8 b8[ gis8] \ln a4. gis8 }
 
   \repeat volta 2 { 
   fis'8 e8 a8 gis8 e8 a8 fis8 \bar "|" gis8 fis8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln gis4~ gis8 gis8 fis8 fis8[ e8] \bar "|"
   fis8 e8 fis8 \ln dis4 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 b8 \bar "|" cis8 \ln cis4 \ln dis4( cis8) b8 }

   \repeat volta 2 { 
   a8 e'8 d!8 a8 d8 cis8 \bar "|" a8 b8 a8 a8 a8 gis8 \bar "|"
   \ln b4 cis8 #(set-accidental-style 'forget) \ln dis4 #(set-accidental-style 'default) cis8 \bar "|" a8 a8 a8 a8( gis8) }

   cis8[ d!8 cis8] d8 b8 \bar "||" \break 
}
}
}
 
\new Staff = "tenor" { \relative c { \clef bass \global

\unfoldRepeats { 
   \repeat volta 2 { 
   gis'8 fis8[ gis8] \ln b4 gis8 \bar "|" a8 gis8[ a8] fis8 fis8 gis8[ a8 fis8] gis8[ a8] fis8 \bar "|" 
   b8 fis8[ gis8] \ln b4 gis8 }

   \repeat volta 2 { 
   gis8 \ln b4 b8 \ln b4 cis8 cis8[ b8] b8 \bar "|" 
   cis8 b8 gis8 b8[ a8] cis8 \ln a4 cis8 \bar "|" gis8 a8[ gis8] \ln b4 gis8 }
 
   \repeat volta 2 { 
   b,8 cis8[ d8] \ln e4 fis8[ e8]~ \ln e4 a8[ gis8] \bar "|" gis8 \ln a4 b8 \ln cis4 cis8 \ln a4 b8 \bar "|" 
   gis8 fis8[ gis8] \ln b4 gis8 }

   \repeat volta 2 { 
   b8 b8 gis8 fis8 fis8 fis8[ gis8 a8] gis8 \bar "|" 
   gis8 e8 \stemUp fis8 \ln dis4 cis8[ dis8] \ln e4 dis8 \bar "|" fis8 dis8[ cis8] \ln cis4. b8 }
 
   \repeat volta 2 { 
   dis'8 b8 a8 b8 cis8 e8 dis8 \bar "|" b8 b8 b8[ cis8] dis8 e8 cis8 \ln b4 \bar "|" 
   dis8 cis8 cis8 \ln b4 gis8[( fis8] \ln e4) dis8 \bar "|" fis8 fis8[ gis8] \ln b4( a8) gis8 }

   \repeat volta 2 { 
   e8 \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 a\breve*1/4~ a8 \bar "|" e8 e8 cis8 d!8 d8 b8 \bar "|" 
   \ln e4~ e8 \ln b'4 gis8 \bar "|" fis8 fis8 \once \override NoteHead #'duration-log = #4 \once \override Stem #'flag-style = #'no-flag d!16( \once \override NoteHead #'duration-log = #4 \once \override Stem #'flag-style = #'no-flag cis16) \ln b4 }

   \once \override Tie #'extra-offset = #'( 0.0 . 0.5 )\ln a'4.~ a8[ gis8] \bar "||" 
}
}
}

 
\new Staff = "bass" { \relative c { \clef bass \global

\unfoldRepeats { 
   \repeat volta 2 {          
   e8 dis8[ e8] \ln b4 e8 \bar "|" cis8 b8[ a8] b8 fis'8 \ln e4. e8[ cis8] b8 \bar "|" 
   gis8 a8[ cis8] \ln b4 e,8 }

   \repeat volta 2 {  
   e'8 gis8[ fis8] e8 e8[ dis8] cis8 cis8[ dis8] e8 \bar "|" 
   cis8 dis8 e8 e8[ fis8] fis8 \ln fis4 cis8 \bar "|" \ln e4. \ln b4 e8 }
 
   \repeat volta 2 {     
   \ln e,4.~ \ln e4 dis'8[ cis8] a8 gis8 fis8[ cis'8] \bar "|" e8 \ln cis4 b8 \ln a4 fis8 \ln fis4 e8 \bar "|" 
   cis'8 a8[ cis8] \ln b4 e8 }

   \repeat volta 2 {   
   e8 dis8 cis8 fis8 b8 \ln fis4. cis8 \bar "|" 
   gis8 cis8 fis,8 \ln gis4 \ln a4( \ln gis4) gis8 \bar "|" fis8 b8[ cis8] \ln a4. e8 }
 
   \repeat volta 2 {     
   b''8 gis8 fis8 e8 a8 cis8 b8 \bar "|" e,8 b'8 \once \override Tie #'extra-offset = #'( 0.0 . -0.5 ) \ln gis4~ gis8 cis,8 fis8 dis8[ e8] \bar "|" 
   b8 cis8 fis,8 gis8[ b8] \once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 cis\breve*1/4 gis8 \bar "|" fis8 a8[ cis8] b8[( gis8 a8]) e'8 }

   \repeat volta 2 {     
   a,8 cis8 d8 fis8 d8 a'8 \bar "|" a,8 gis8 fis8 fis8 d8 e8 \bar "|" 
   e8 gis8 a8 \ln b4 cis8 \bar "|" d!8 d8 d,!8 \ln e4 }

   a8[ d!8 a8] fis8[ e8] \bar "||" \break
}
}
}

 
>> % choir staff
 
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }

} % end repeat and midi block score
 
 
\markup { \italic "* Amen is sung only when used as an Office Hymn, not when used as a Sequence." } 
            
} % end book