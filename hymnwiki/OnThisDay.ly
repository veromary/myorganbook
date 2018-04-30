% ŵ (UTF-8 test character: double-u circumflex)
% “ = 0147 (left formatted quote)
% ” = 0148 (right formatted quote)
% — = 0151 (dash)
% – = 0150 (shorter dash)
% © = 0169 (copyright symbol)
% ® = 0174 (registered copyright symbol)
% ⌜ = u231C
% ⌝ = u231D

\version "2.10.33"
#(ly:set-option 'point-and-click #f)

\paper
{
    indent = 0.0
    line-width = 185 \mm
    %between-system-space = 0.1 \mm
    %between-system-padding = #1
    %ragged-bottom = ##t
    %top-margin = 0.1 \mm
    %bottom-margin = 0.1 \mm
    %foot-separation = 0.1 \mm
    %head-separation = 0.1 \mm
    %before-title-space = 0.1 \mm
    %between-title-space = 0.1 \mm
    %after-title-space = 0.1 \mm
    %paper-height = 32 \cm
    %print-page-number = ##t
    %print-first-page-number = ##t
    %ragged-last-bottom
    %horizontal-shift
    %system-count
    %left-margin
    %paper-width
    %printallheaders
    %systemSeparatorMarkup
}

\header
{
    %dedication = ""
    title = "On this Day, O Beautiful Mother"
    %subtitle = ""
    %subsubtitle = ""
    % poet = \markup{ \italic Text: }
    %composer = \markup{ \italic Music: Fr. Louis Lambillotte, S.J. (1796-1855)}
    %meter = ""
    %opus = ""
    %arranger = ""
    %instrument = ""
    %piece = \markup{\null \null \null \null \null \null \null \null \null \null \null \null \null \italic Slowly \null \null \null \null \null \note #"4" #1.0 = 70-100}
    %breakbefore
    %copyright = ""
    tagline = ""
}


global =
{
    %\override Staff.TimeSignature #'style = #'()
    \time 3/4
    \key d \major
    \override Rest #'direction = #'0
    \override MultiMeasureRest #'staff-position = #0
}

sopWords = \lyricmode
{
    \override Score . LyricText #'font-size = #-1
    \override Score . LyricHyphen #'minimum-distance = #1
    \override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
   %\set vocalName = "Men/Women/Unison/SATB"
    On this day, O beau -- ti -- ful Mo -- ther,
    On this day we give thee our love.
    Near thee, Ma -- don -- na, fond -- ly we ho -- ver,
    Trust -- ing thy gen -- tle care to prove.
}
sopWordsOne = \lyricmode
{
    \set stanza = "1. "
    On this day we ask to share, Dear -- est Mo -- ther, thy sweet care,
    Aid us ere our feet a -- stray, Wan -- der from thy guid -- ing way.
}

sopWordsTwo = \lyricmode
{ 
    \set stanza = "2. " Queen of an -- gels deign to hear,
                        Lisp -- ing child -- ren's hum -- ble prayer:
                        Young hearts gain, O Vir -- gin pure,
                        Sweet -- ly to thy -- self al -- lure.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. " Rose of Sha -- ron, love -- ly flow'r,
                        Beau -- teous bud of E -- den's bow'r;
                        Cherish -- ed li -- ly of the vale,
                        Vir -- gin Mo -- ther, Queen we hail.

}
sopWordsFour = \lyricmode
{
    \set stanza = "4. " In_vain the flow'rs of love we bring,
                        In_vain sweet mu -- sic's note we sing,
                        If_con -- trite heart and low -- ly prayer,
                        Guide_not our gifts to thy bright sphere.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. " Fast our days of life we run,
                        Soon the night of death will come;
                        Tower of strength in that dread hour,
                        Come with all thy gen -- tle power.

}
sopWordsSix = \lyricmode
{
    \set stanza = "6. "
}
sopWordsSeven = \lyricmode
{
    \set stanza = "7. "
}
altoWords = \lyricmode
{

}
tenorWords = \lyricmode
{

}
bassWords = \lyricmode
{

}

	
\score
{
    \transpose d c'
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopchorus"
		\relative c {
                \voiceOne \global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
             	\tempo 4 = 120 
                fis4( e) fis a2 a4 g fis g b2 a4 fis( e) fis a2 a4 e fis g fis2 c'4\rest
                fis,4 e fis a2 a4 g fis g b2 a4 fis e fis a2 a4 e( fis) e d2 c'4\rest \bar "||"
            \new Voice = "sopverses"
                { \voiceOne 
                d2 cis4 b2 a4 b2 a4 a2 c4\rest d2 cis4 b2 a4 g2 e4 fis2 c'4\rest
                a2 gis4 b2 a4 d( cis) b b2( a4) a2 gis4 b2 a4 d2 gis,4 a2 gis8 g8
		\bar "|." }
                }

	    \new Voice = "altos"
	    \relative c {
		\voiceTwo
                d4( cis) d fis2 fis4 e dis4 e g2 fis4 d cis d cis2 cis4 cis d e d2 s4
                d4( cis) d fis2 fis4 e dis4 e g2 fis4 d cis d cis2 cis4 cis d cis d2 s4
                b'2 a4 g2 fis4 g2 fis4 fis2 s4 b2 a4 g2 fis4 e2 cis4 d2 s4
                cis2 b4 d2 cis4 fis4( e) d d2( cis4) cis2 b4 d2 cis4 fis4( f) e8( d) cis2 d8 e
	    }

	    \new Lyrics = sopranos { s1 }
            \new Lyrics = sopranosOne { s1 }
	    \new Lyrics = sopranosTwo { s1 }
	    \new Lyrics = sopranosThree { s1 }
	    \new Lyrics = sopranosFour { s1 }
	    \new Lyrics = sopranosFive { s1 }
	    %\new Lyrics = sopranosSix { s1 }
	    %\new Lyrics = sopranosSeven { s1 }
	    %\new Lyrics = altos { s1 }
	    %\new Lyrics = tenors { s1 }
	    %\new Lyrics = basses { s1 }
	>>


	\new Staff
	<<
	    \clef bass
	    \new Voice = "tenors"
	    {
		\voiceThree
		\global
	    }

	    \new Voice = "basses"
	    \relative c, {
	%	\voiceFour
                d2 d4 d2 d4 a'2 a4 e( cis) d d2 d4 a2 a4 a'2 a4 d,2 r4
                d2 d4 d2 d4 a'2 a4 e( cis) d d2 d4 a2 a4 a'2 a,4 d2 r4
                g2. g2. d2. d2 r4 d2 d4 d2 d4 a2 a4 d2 r4
                a4 cis e fis gis a b, cis d e gis a a, cis e fis gis a d,2 e4 a,2 b8 cis
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopchorus \sopWords
	\context Lyrics = sopranosOne \lyricsto sopverses \sopWordsOne
	\context Lyrics = sopranosTwo \lyricsto sopverses \sopWordsTwo
	\context Lyrics = sopranosThree \lyricsto sopverses \sopWordsThree
	\context Lyrics = sopranosFour \lyricsto sopverses \sopWordsFour
	\context Lyrics = sopranosFive \lyricsto sopverses \sopWordsFive
	%\context Lyrics = sopranosSix \lyricsto sopverses \sopWordsSix
	%\context Lyrics = sopranosSeven \lyricsto sopranos \sopWordsSeven
	%\context Lyrics = altos \lyricsto altos \altoWords
	%\context Lyrics = tenors \lyricsto tenors \tenorWords
	%\context Lyrics = basses \lyricsto basses \bassWords
    >>
	
    \midi { }
    \layout
    {	
	\context
	{
	    \Lyrics
	    \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
	}
    }
}

\markup
{
    \column
    {
        \line{\italic Text: Unknown}
	\line{\italic Music: Fr Louis Lambillotte, S.J. (1796-1855)}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: St Basil's Hymnal, 1896 (14th edition, c. 1906), no. 115}
        \line{\italic {Original Key:} D}
    }
}
