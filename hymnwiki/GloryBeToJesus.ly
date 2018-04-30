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
    title = "Glory be to Jesus"
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
    \key g \major
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
    Glo -- ry be to Je -- sus,
      Who in bit -- ter pains
     Pour'd for me the life -- blood
    From His sa -- cred veins!
}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
    Grace and life e -- ter -- nal
    In that Blood I find;
    Blest be His com -- pas -- sion,
    In -- fi -- nite -- ly kind!
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
     Blest through end -- less age -- s
     Be the pre -- cious stream,
     Which from end -- less tor -- ment
     Doth the world re -- deem!
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
    There the faint -- ing spi -- rit
    Drinks of life her fill;
    There as in a foun -- tain
    Laves her -- self at will.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
     Oh, the Blood of Christ! It
     soothes the Fa -- ther's ire;
     Opes the gate of Hea -- ven;
     Quells e -- ter -- nal fire.
}
sopWordsSix = \lyricmode
{
    \set stanza = "6. "
      A -- bel's blood for ven -- geance
        Plead -- ed to the skies;
       But the Blood of Je -- sus
        For our par -- don cries.
}
sopWordsSeven = \lyricmode
{
    \set stanza = "7. "
     Oft as it is sprinkl -- ed
     On our guilt -- y hearts
     Sa -- tan in con -- fu -- sion
     Ter -- ror -- struck de -- parts.
}
sopWordsSeven = \lyricmode
{
    \set stanza = "8. "
}
sopWordsSeven = \lyricmode
{
    \set stanza = "9. "
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
    \transpose g c
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
		\tempo 4 = 120
                b4 b a a g2 fis
                g4 g a a b1
                d4 d c c b2 a
                b4 b a a g1
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c'' {
		\voiceTwo
                g4 g g fis fis( e) dis2
                e4 g g fis g1
                fis4 g e a a( g) fis2
                g4 g g fis g1
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
                d4 d d d b2 b
                b4 b d d d1
                d4 b c d d2 d
                d4 d e d b1
	    }

	    \new Voice = "basses"
	    \relative c' {
		\voiceFour
                g4 g d d e2 b
                e4 e d d g1
                b4 g a fis g2 d
                g4 b, c d g,1
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
	\line{\italic Text: Viva! Viva! Gesu}
        \line{\italic Translated: Rev. E. Caswall}
	\line{\italic Music: F. Filitz (1847)}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Westminster Hymnal 1912, no. 95}
        \line{\italic {Original Key:} G}
    }
}
