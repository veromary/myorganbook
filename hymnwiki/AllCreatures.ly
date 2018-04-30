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
    title = "Canticle of the Sun"
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
    \time 6/4
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
    \set stanza = "1. "
       All crea -- tures of our God and King
      Lift up your voice and with us sing
      Al -- le -- lu -- ia, al -- le -- lu -- ia!
      Thou burn -- ing sun with gold -- en beam,
      Thou sil -- ver moon with soft -- er gleam:
      O praise Him, O praise Him,
      Al -- le -- lu -- ia, al -- le -- lu -- ia,
      al -- le -- lu -- ia!
   %\set vocalName = "Men/Women/Unison/SATB"
}
sopWordsTwo = \lyricmode
{
   \set stanza = "2. "
 Thou flow -- ing wa -- ter, pure and clear,
Make mu -- sic for thy Lord to hear,
Al -- le -- lu -- ia, Al -- le -- lu -- ia!
Thou fire so mas -- ter -- ful and bright,
That giv -- est man both warmth and light:
%O praise him, O praise him,
%Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
Dear mo -- ther earth, who day by day
Un -- fold -- est bless -- ings on our way,
O _ praise him, al -- le -- lu -- ia!
The flowers and fruits that in thee grow,
Let them his glo -- ry al -- so show:
%O praise him, O praise him,
%Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
And all ye men of ten -- der heart,
For -- giv -- ing oth -- ers, take your part,
O _ praise him, al -- le -- lu -- ia!
Ye who long pain and sor -- row bear,
Praise God and on him cast your care:
%O praise him, O praise him,
%Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
Let all things their Cre -- a -- tor bless,
And wor -- ship him in hum -- ble -- ness,
O _ praise him, al -- le -- lu -- ia!
Praise, praise the Fa -- ther, praise the Son,
And praise the Spi -- rit, three in One:
%O praise him, O praise him,
%Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
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
    \transpose d c
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
          \partial 2
        d2 d4 e fis d fis g a1 d,2 d4 e fis d fis g a1 
        d4 cis b2 a2 d4 cis b2 a\fermata 
        d2 d4 a a g fis g a1 d2 d4 a a g fis g a1 
        g4( fis) e2 d g4( fis) e2 d d'4 cis b2 a d4 cis b2 a g4 fis e1. d1 
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c' {
		\voiceTwo
        a2 d1 d2 d cis d a4 cis d2 d d cis
        a'4 a a( g) fis2 d4 e fis( e) cis2
        a'4 g fis2( fis4) e d2 d2 cis d4 e d cis d d2. d4 cis fis e
        d4 d d( cis) d2 d4 d d( cis) b2 fis'4 e fis( e) cis2 fis2( fis4) e( e) b b d d2 cis1 a1

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
	    {
		\voiceThree
		\global
	    }

	    \new Voice = "basses"
	    \relative c {
		\voiceFour
       d2 d2( d4) d8[ cis] b4 e4 a,2 a'4 g fis g fis e d cis b e a,2 a'4 g
       fis4 fis g2 d b4 cis d( e) a,2\fermata
       fis'4 e d cis b cis d b a2 a'4 g fis g fis e d b' a g fis e d cis
       b4 a g2 fis e4 fis g( a) b2 b4 cis d( e) a,2 b4 cis d e cis dis e fis g2 a a, d,1 

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
	\line{\italic Text: St. Francis of Assisi, 1182-1226}
        \line{\italic Translation: W. H. Draper}
	\line{\italic Music: Geistliche Kirchengesang}
	\line{\italic Arrangement: R. Vaughan Williams, 1872-1958}
	%\line{\italic {Words and Music:} }
	%\line{\italic {Tune Name:} }
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Living Parish Hymnbook 1964, no. 3}
    }
}
