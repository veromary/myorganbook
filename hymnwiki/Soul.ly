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
    title = "Soul of my Saviour"
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
    \key aes \major
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
      Soul of my Sav -- iour, sanc -- ti -- fy my breast
      Bo -- dy of Christ, be Thou my sav -- ing guest
      Blood of my Sav -- iour, bathe me in Thy tide
      Wash me ye wa -- ters gush -- ing from His side.

}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
    Strength and pro -- tec -- tion may His pas -- sion be;
    O bless -- èd Je -- sus, hear and an -- swer me!
    Deep in Thy wounds, Lord, hide and shel -- ter me;
    So shall I ne -- ver, ne -- ver part from Thee. 
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
    Guard and de -- fend me from the foe mal -- ign;
   In death's dread mo -- ments make me on -- ly Thine;
   Call me and bid me come to Thee on high,
   When I may praise Thee with Thy saints for aye.
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
    \transpose aes f
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
        ees2 aes4 aes aes2 g aes4 aes bes bes c1
        c2 bes4 c aes2 g g4 aes g f ees1
        ees'2 des4 ees c2 bes ees4 ees des ees c1
        bes4( des) c bes aes2 des c4 c bes bes aes1
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c' {
		\voiceTwo
         ees2 f4 f f2 ees ees4 des8( c) f4 ees ees1
         ees4( f) g g ees( d) ees2 ees4 ees ees d ees1
         ees4( g) aes ees bes'( aes) aes( g) g a bes8( aes) g4 aes1
         g2 g4 g g( f) f2 e4 f f ees8( des) c1
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
	    \relative c' {
		\voiceThree
		\global
           c2 c4 c bes2 bes aes4 aes aes g aes1
           c4( d) ees ees c( bes) bes( b) c c bes( bes8) aes8 g1
           bes2 aes4 bes ees2 ees ees4 c bes bes aes2( c)
           des4( f) ees des c2 bes4( aes) g aes aes g aes1
	    }

	    \new Voice = "basses"
	    \relative c' {
		\voiceFour
          aes4( g) f ees des( bes) ees( des) c f des ees aes,1
          aes'2 g4 c, f( bes,) ees2 aes4 f bes bes, ees1
          g4( ees) f g aes( c) ees( des) c f, bes ees, aes1
          ees2 ees4 ees f2 bes, c4 f des ees aes,1
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
	\line{\italic Text: Attrib Pope John XXII (1240-1334)}
        \line{\italic Translation: Anon}
	\line{\italic Music: W J Maher, S.J. (1823-77)}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Westminster Hymnal, 1912, no. 74 }
        \line{\italic {Original Key:} A flat}
    }
}
