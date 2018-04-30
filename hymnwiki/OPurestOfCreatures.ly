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
    title = "O Purest of Creatures"
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
    \time 3/4
    \key f \major
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
       O pur -- est of crea -- tures, sweet Mo -- ther, sweet maid!
       The one spot -- less womb where -- in Je -- sus was laid!
       Dark night hath come down on us Mo -- ther and we
       Look our for thy shin -- ing Sweet Star of the Sea!

}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
Deep night hath come down on
this rough -- spo -- ken world.
And_the ban -- ners of dark -- ness
are bold -- ly un -- furled;
and_the temp -- est -- tossed Church,
all her eyes are on thee.
They look to thy shin -- ing,
sweet star of the sea.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
Earth gave him one lodg -- ing;
'twas deep in thy breast,
and God found a home where
the sin -- ner finds rest;
his home and his hid -- ing -- place,
both were in thee;
he_was won by thy shin -- ing, 
sweet star of the sea.
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
    \transpose f d
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
        \partial 4 c4 f f g a a bes8( d) c( bes) a4 g f2
        c4 f f g a a bes8( d) c( bes) a4 g f2
        a8( bes) c4 a c bes8( a) g4 bes a f a g2
        c,4 f f g a a bes8( d) c( bes) a4 g f2 
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c' {
		\voiceTwo
               c4 c a c c f f f f e c2
               c4 c a c c f f f f e c2
               f4 f f f f e g f f f e2
               c4 c c c c c f f f e c2
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
	    \relative c {
		\voiceThree
		\global
                e4 f f e f c' bes c8( d) c4 bes a2
                e4 f f e f c' bes c8( d) c4 bes a2
                c4 c c c d c c c c c c2
                g4 a f e f c' bes c8( d) c4 bes a2
	    }

	    \new Voice = "basses"
	    \relative c {
		\voiceFour
       c4 a f c' f f d8( bes8) a(bes) c4 c f,2
       c'4 a f c' f f d8( bes) a( bes) c4 c f,2
       f'8( g) a4 f a g c, e f a f c2
       e4 f a, c f f d8( bes) a( bes) c4 c f,2

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
	\line{\italic Text: Frederick W Faber, 1814-63}
	\line{\italic Music: Paderborn Gesangbuch, 1765}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	\line{\italic {Tune Name:} Maria zu Lieben (11.11.11.11)}
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Living Parish Hymnbook 1964}
        \line{\italic {Original Key:} F}
    }
}
