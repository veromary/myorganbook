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
    title = "Praise to the Lord"
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
     Praise to the Lord the Al -- might -- y the King of cre -- a -- tion
     O my soul praise Him for He is thy health and sal -- va -- tion
     All you who hear, now to His al -- tar draw near
     Join in pro -- found ad -- or -- a -- tion.

}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
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
    \transpose g d
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 120 
            g'4 g' d'' b'4. a'8 g'4 fis' e' d' e' fis' g' a'2. g' 
            g'4 g' d'' b'4. a'8 g'4 fis' e' d' e' fis' g' a'2. g' 
            d''4 d'' d'' e''2. b'4 c'' d'' d''4 c'' b'4 a'2. 
            d'4 e' fis' g' a' b' a'2. g'
		\bar "|."
	    }

	    \new Voice = "altos"
	    {
		\voiceTwo 
             d'4 e' d' d'4. fis'8 e'4 d' c' b c' c' b e' d' c' b2. 
             d'4 e' d' d'4. fis'8 e'4 d' c' b c' c' b e' d' c' b2. 
             d'4 fis' g' g'2. g'4 g' d'' g'8 fis' e' e' d'4 d'2. 
             d'4 c' c' b d' d' e' d' c' b2. 
	    }

	    \new Lyrics = sopranos { s1 }
	    %\new Lyrics = sopranosTwo { s1 }
	    %\new Lyrics = sopranosThree { s1 }
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
           b4 b a d'4. c'8 b4 b8 a g4 g g a g g fis2 g2. b4 b a d'4. c'8 b4 b8 a g4 g g a g g fis2 g2. b4 c' d' c'2. d'4 c' a g g g fis2. g4 g a g fis g g fis2 g2.
	    }

	    \new Voice = "basses"
	    {
		\voiceFour g4 e fis g4. d8 e4 b, c g, c a, e c d2 g,2. g4 e fis g4. d8 e4 b, c g, c a, e c d2 g,2. g4 a b c'2. g4 e d b, c g, d2. b,4 c a, e d b, c d2 g,2. 
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	%\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	%\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
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

\score
{
    \transpose g d
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 120 
            g'4 g' d'' b'4. a'8 g'4 fis' e' d' e' fis' g' a'2. g' 
            g'4 g' d'' b'4. a'8 g'4 fis' e' d' e' fis' g' a'2. g' 
            d''4 d'' d'' e''2. b'4 c'' d'' d''4 c'' b'4 a'2. 
            d'4 e' fis' g' a' b' a'2. g'
		\bar "|."
	    }

	    \new Lyrics = sopranos { s1 }
	    %\new Lyrics = sopranosTwo { s1 }
	    %\new Lyrics = sopranosThree { s1 }
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
	    \new Voice = "altos"
	    {
		\voiceThree
                \global 
             d'4 e' d' d'4. fis'8 e'4 d' c' b c' c' b e' d' c' b2. 
             d'4 e' d' d'4. fis'8 e'4 d' c' b c' c' b e' d' c' b2. 
             d'4 fis' g' g'2. g'4 g' d'' g'8 fis' e' e' d'4 d'2. 
             d'4 c' c' b d' d' e' d' c' b2. 
	    }


	    \new Voice = "tenors"
	    {
		\voiceFour
           b4 b a d'4. c'8 b4 b8 a g4 g g a g g fis2 g2. b4 b a d'4. c'8 b4 b8 a g4 g g a g g fis2 g2. b4 c' d' c'2. d'4 c' a g g g fis2. g4 g a g fis g g fis2 g2.
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	%\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	%\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
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
	%\line{\italic Text: }
	%\line{\italic Music: }
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	%\line{\italic Source: }
    }
}
