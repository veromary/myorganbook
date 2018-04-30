\version "2.12.3"

\paper
{
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 20 20)))
    %indent = 0.0
    %line-width = 185 \mm
    %between-system-space = 5 \mm
    between-system-padding = #1
    ragged-bottom = ##t
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


%#(set-global-staff-size 23)

\header {
        title = "Godhead here in hiding"
        poet = "Thomas Aquinas"
        meter = "translation G M Hopkins"
        composer = "arr Mar. de Jong"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2011 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

global = {
       \key d \major
}

chant = \relative c' {
        \voiceOne
        \time 8/4
        d4 fis a a a( b) a2 
        g4 fis e d d1 \bar "|"
        d4 fis \break a a a( b) a2 
        g4 fis e d d1 \bar "|"
        \time 9/4 a'4 a b( cis) d d( cis) a2 
        \break 
        \time 8/4 b4 a g fis e1 \bar "|"
        fis4 a g fis e( d) e2 
        fis4 d e d d1 \bar "||"
        } 	


chantamen = \relative c' {
        \voiceOne
        \time 8/4
        d4 fis a a a( b) a2
        g4 fis e d d1 \bar "|"
        d4 fis a a a( b) a2
        g4 fis e d d1 \bar "|"
        \time 9/4 a'4 a b( cis) d d( cis) a2 
        \time 8/4 b4 a \break g fis e1 \bar "|"
        fis4 a g fis e( d) e2
        fis4 d e d d1 \bar "||"
        \time 7/4 d4( e d) cis2( d2) \bar "|."
        } 	

alt = \relative c' {
       \voiceTwo
       d4( d)( <fis d>2)( <d e>)( <cis e>2)  
       d2 b a1
       d2( d)( d)( d2)( d2) a( a1)
       e'2 fis2. a2 e2 d2 b2( b1)
       d1( d1) a2( a)( a1)
       }

ten = \relative c' {
       \voiceThree
       s1 s1 b2 g fis1
       a2( a2) e fis1 g2( g) fis2
       cis'2 d2. e2 cis2 a2( a) g1
       a1 g1 g2) e2 fis1
       }

bass = \relative c {
       \voiceFour
       s1 s1 s1 s1
       e2 d( d)( d2)( d2)( d2)( d1)
       cis'2 b2. fis2( fis2)( fis2) e( e1)
       b1( b1) d2( d)( d1)
       }

altb = \relative c' {
      \voiceTwo
d2( d2)( d2)( d2)( d2) a2( a1)
d2( d) cis d2( d2) a2( a1)
e'2 d2. e1 cis2 d2( d1)(
d2)( d2) b1 d2 a2( a1)
}

tenb = \relative c {
      \voiceThree
fis2 e fis( fis2) g2( g) fis1(
fis2( fis) e fis2 g2( g) fis1
e2 fis2. a1( a2)( a2) g1 
a2( a) g1 a2 g fis1
}

basb = \relative c {
      \voiceFour
d2( d)( d) cis2 b2 d( d1)
cis2 b( b)( b2)( b2) d2( d1)
cis2 b2. a1( a2) b( b1)(
b2) d2 e1 d2( d)( d1)
}

altc = \relative c' {
       \voiceTwo
       d4( d)( <fis d>2)( <d e>)( <cis e>2)  d2 b a1
       d2( d)( d)( d2)( d2) a2( a1)
       e'2 d2. e1 cis2 d( d1)( d2)( d) b1 d2 a( a1)
       b2. a1
       }

tenc = \relative c' {
       \voiceThree
       s1 s1 b2 g fis1( fis2)
       e2 fis2( fis2) g2( g) fis1
       e2 fis2. a1( a2)( a2) g1
       a2( a) g1 a2 g fis1
       fis2. e4 fis
       }

basc = \relative c {
       \voiceFour
       s1 s1 s1 s1 d2( d2)( d) cis2 b2 d2( d1)
       cis2 b2. a1( a2) b2( b1)( b2)
       d2 e1 d2( d)( d1) 
       b2. d1
       }


verba = \lyricmode {
     \set stanza = "1. "
     God -- head here in hid -- ing
     whom I do ad -- ore
     mask'd by these bare sha -- dows
     shape and no -- thing more
     See, Lord, at Thy ser -- vice
     low lies here a heart
     lost, all lost, in won -- der 
     at the God Thou art.
      }

verseii = \lyricmode {
    \set stanza = "2. "
     See -- ing, touch -- ing, tast -- ing,
are in thee de -- ceived,
How says trust -- y hear -- ing? 
that shall be be -- lieved;
What God's Son Hath told me,
take for truth I do;
Truth Him -- self speaks tru -- ly, 
or there's no -- thing true.

}

verseiii = \lyricmode {
    \set stanza = "3. "
On the Cross Thy God -- head
made no sign to men;
Here Thy ve -- ry man -- hood 
steals from hu -- man ken;
Both are my con -- fess -- ion, 
both are my be -- lief,
And I pray the pray -- er of the dy -- ing thief.


}


verseiv = \lyricmode {
    \set stanza = "4. "
I am not like Tho -- mas, wounds I can -- not see,
But can plain -- ly call Thee Lord and God as he;
This faith each day deep -- er be my hold -- ing of,
Dai -- ly make me hard -- er hope and dear -- er love.
}


versev = \lyricmode {
    \set stanza = "5. "
O Thou our re -- mind -- er of Christ cru -- ci -- fied,
Liv -- ing Bread, the life of us for whom He died,
Lend this life to me then; feed and feast my mind,
There be Thou the sweet -- ness man was meant to find.

}

versevi = \lyricmode {
    \set stanza = "6. "
Je -- su, whom I look at shroud -- ed here be -- low,
I be -- seech Thee send me what I long for so,
Some day to gaze on Thee face to face in light
And be blest for e -- ver with Thy glo -- ry's sight.   
A -- men.
}



\score {
        \transpose c bes,
        <<
	\new ChoirStaff <<
	    \set Score.midiInstrument = "Pipe Organ"
	    %\set Score.midiInstrument = "Choir Aahs"
	\new Staff = "plainchant" <<
          \clef treble
          \global 
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
          \new Lyrics \lyricsto "melody" \verseiii
          \new Lyrics \lyricsto "melody" \versev
          \new Voice = "alto" << \alt >>
                  >>
	\new Staff = bass <<
          \global
             \clef bass
            \new Voice = "tenors" << \ten >> 
            \new Voice = "bass" << \bass >>
	  >>
        >>
        >>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               \override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}
}

\score {
         \transpose c bes,
        <<
	         \new ChoirStaff <<
          \new Staff <<
          \global
          \clef treble
          \new Voice = "altverse" { \chant }
          \new Lyrics \lyricsto "altverse" \verseii
          \new Lyrics \lyricsto "altverse" \verseiv
          \new Voice = "altalto" << \altb >>
          >>
          \new Staff <<
          \global
          \clef bass
          \new Voice = "altten" \tenb
          \new Voice = "altbas" \basb
          >>
>>
>>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               %\override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}

}
 

\score {
         \transpose c bes,
        <<
	         \new ChoirStaff <<
          \new Staff <<
          \global
          \clef treble
          \new Voice = "lastverse" { \chantamen }
          \new Lyrics \lyricsto "lastverse" \versevi
          \new Voice = "altalto" << \altc >>
          >>
          \new Staff <<
          \global
          \clef bass
          \new Voice = "altten" \tenc
          \new Voice = "altbas" \basc
          >>
>>
>>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               %\override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}

}
 

%\markup
%{
%    \column
%    {
%	\line{\italic Text: Thomas Aquinas}
%	%\line{\italic Music: }
%	\line{\italic Arrangement: Mar. de Jong (?)}
%	%\line{\italic {Words and Music:} }
%	%\line{\italic {Tune Name:} }
%	%\line{\italic {Poetic Meter:} }
%	\line{\italic Source: Nova Organi Harmonia}
%    }
%}
