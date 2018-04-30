
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
    title = "Firmly I Believe"
    %subtitle = ""
    %subsubtitle = ""
    % poet = \markup{ \italic Text: }
    % composer = \markup{ \italic Music: }
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
    \time 4/4
    \key e \major
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
    \set stanza = "1. "
    Firm -- ly I be -- lieve and tru -- ly
    God is Three and God is One
    And I next ac -- know -- ledge du -- ly
    Man -- hood ta -- ken by the Son.
}   %\set vocalName = "Men/Women/Unison/SATB"

sopWordsTwo = \lyricmode
{
    \set stanza = "2. " And I trust and hope most ful -- ly
                       In that Man -- hood cru -- ci -- fied
                       And each thought and deed un -- ru -- ly
                       Do to death as He has died.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. " Simp -- ly to His grace and whol -- ly
                       Light and life and strength be -- long
                      And I love su -- preme -- ly, sole -- ly
                     Him the ho -- ly, Him the strong.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. " And I hold in ve -- ne -- ra -- tion,
                       For the love of Him a -- lone,
                      Ho -- ly Church as His cre -- a -- tion,
                     And her teach -- ings, as His own.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. " Ad -- o -- ra -- tion aye be giv -- en,
                       With and through th'an -- gel -- ic host,
                      To the God of earth and heav -- en
                     Fa -- ther, Son and Ho -- ly Ghost.
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
    \transpose e c
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    \relative c' {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 120
                e4 e fis2 e gis4 b a2 gis e4 fis gis b b2 ais b1
                b4 b cis2 b a4 gis fis2 gis e4 fis gis a fis2. fis4 e1
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c' {
		\voiceTwo
       b4 cis dis2 e e4 e fis2 dis cis4 dis e dis8( e) fis2. e4 dis1
       e4 e e2 e dis4 e dis2 dis cis4 dis e e e2. dis4 e1

	    }

	    \new Lyrics = sopranos { s1 }
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
	    \relative c' {
		\voiceThree
		\global 
       gis4 gis b2 gis b4 b cis2 bis gis4 b b b cis2 cis b1
       gis4 b a2 b b4 b b2 b gis4 b b a cis2 b4 a gis1

	    }

	    \new Voice = "basses"
	    \relative c {
		\voiceFour
                \global
       e4 cis4 b2 e e4 gis, fis2 gis cis4 b e gis fis2 fis b,1
       e4 gis a2 gis fis4 e b2 gis cis4 b e cis a2 b e1
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
	\context Lyrics = sopranosFour \lyricsto sopranos \sopWordsFour
	\context Lyrics = sopranosFive \lyricsto sopranos \sopWordsFive
	%\context Lyrics = sopranosSix \lyricsto sopranos \sopWordsSix
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
	%\line{\italic Text: }
	%\line{\italic Music: }
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Westminster Hymnal, 1912, no. 245}
        \line{ rearranged with the rhythm from Omni Die by David Corner.}
    }
}
