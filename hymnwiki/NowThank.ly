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
    title = "Now thank we all our God"
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
    \key ees \major
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
    %\set vocalName = "Men/Women/Unison/SATB"
    Now thank we all our God,
    With heart and mind and voic -- es,
    Who won -- drous things hath done,
    In whom this world re -- joic -- es;
    Who from our mo -- ther's arms
    Hath blest us on our way
    With count -- less gifts of love,
    And still is ours to -- day.
}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
    Oh, may this bount -- eous God
    Through all our life be near us,
    With e -- ver joy -- ful hearts
    And bless -- ed peace to cheer us;
    And keep us in His grace,
    And guide us when per -- plexed,
    And free us from all ills
    In this world and the next.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
    All praise and thanks to God
    The Fa -- ther now be giv -- en,
    The Son and Him who reigns
    With Them in high -- est hea -- ven,
    E -- ter -- nal Three in One
    Whom earth and heav'n a -- dore;
    For thus it was, is now,
    And shall be e -- ver -- more.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
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
    \transpose ees c
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    \relative c'' {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 110
                \partial 4 bes4 bes bes c c bes2. \breathe
                bes4 aes g f g f2 ees4\fermata \breathe
                bes'4 bes bes c c bes2. \breathe
                bes4 aes g f g f2 ees4\fermata \breathe
                f4 f f g bes f2. \breathe
                f4 g8( a) bes4 c a bes2. \breathe
                bes4 c bes aes g aes2. \breathe
                g4 f ees ees d ees2.
		\bar "|."
	    }

	    \new Voice = "altos"
	    {
		\voiceTwo
	    }

	    \new Lyrics = sopranos { s1 }
	    \new Lyrics = sopranosTwo { s1 }
	    \new Lyrics = sopranosThree { s1 }
	    %\new Lyrics = sopranosFour { s1 }
	    %\new Lyrics = sopranosFive { s1 }
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
	    \relative c {
		\voiceFour
            ees4 ees4 g aes aes, ees'2.
            ees4 f g8( aes) bes4 ees,4 bes2 ees4\fermata
            ees4 ees ees8( des) c( bes) aes4 ees'2.
            ees8( d) c4 bes aes g aes bes ees\fermata
            bes4 a bes ees8( f) g( a) bes2.
            d,4 ees d c d g,2.
            g'8( f) e4 d8( e) f4 c f,2.
            g4 aes c bes bes ees2.
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
	%\context Lyrics = sopranosFour \lyricsto sopranos \sopWordsFour
	%\context Lyrics = sopranosFive \lyricsto sopranos \sopWordsFive
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
	\line{\italic Text: M Rinkart 1586-1649}
        \line{\italic Translation: Catherine Winkworth, d 1878, et al}
	\line{\italic Music: Present form of melody by J Cruger, 1598-1662}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	\line{\italic {Tune Name:} Nun Danket}
	\line{\italic {Poetic Meter:} 67.67.66.66}
	\line{\italic Source: Living Parish 1964, no. 1}
	\line{\italic {Original Key:} E flat}
    }
}
