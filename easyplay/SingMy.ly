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
        title = "Sing my Tongue"
        poet = "Thomas Aquinas"
        meter = "translation Fr. Edward Caswall"
        composer = "arr Mar. de Jong"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2011 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

global = {
       \key c \major
}

chant = \relative c' {
        \voiceOne
        \time 10/4
        e4 e f e( d) g g a( c) c \bar "|"
        c( d) c c b a c b( a g) \break
        \time 8/4 g a c b a g a g \bar "|"
        a b g g e a a( d,) \break
        e g g e g a a g \bar "|"
        \time 9/4 a b g a( g) f( e) d e \bar "||"
        } 	


chantamen = \relative c' {
        \voiceOne
        \time 10/4
        e4 e f e( d) g g a( c) c \bar "|"
        c( d) c c b a c b( a g) \break
        \time 8/4 g a c b a g a g \bar "|"
        a b g g e a a( d,) \break
        e g g e g a a g \bar "|"
        \time 9/4 a b g a( g) f( e) d e \bar "||"
        \time 5/4 e4( f e) d( e) \bar "|."
        } 	

alt = \relative c' {
       \voiceTwo
       s2 s4 s2 s f2 g4 e2.( e2)( e) d( d4)
       e2( e)( e) d e d c d
       s2 d2 e2( e)( e)( e4)( e2) d2 s2
       }

ten = \relative c' {
       \voiceThree
       c2( c4) b2 c2( c)( c4)( c2.)( c2)( c)( c) b4
       c2( c)( c) b c b a( a)
       c b a b c2( c4)( c2)( c) b4 c
       }

bass = \relative c' {
       \voiceFour
       s2 a4 g2 e f e4 a2. g2 f g2( g4) 
       s2 a2 c s2 a2( a) g f
       c2( c)( c) e a2 c4 b2 a2( a4)( a)
       }

altb = \relative c' {
      \voiceTwo
      c2 a4 b2 c( c)( < c g' >4) e2. f2 c( c) b4
      c2( c) e d c b a( a)
      c2 d c b e( e4)( e2) c b4 c
}

tenb = \relative c' {
      \voiceThree
      g2.( g2)( g) f g4 a2.( a2) f d( d4)
      e2( e)( e)( e)( e) d c d
      g e( e)( e)( e) c'4 b2 a2.( a4)
}

basb = \relative c {
      \voiceFour
      c2. g'2 e f e4 c2. d2( d) g,2( g4)
      c2 a c b a( a) g f
      c' b a e' c( c4)( c2) d2. a4
}

altc = \relative c' {
       \voiceTwo
       s2 s4 s2 s f2 e4( e2.) f2 c( c) b4
       c2( c) e d c b a( a)
       c2 d c b c( c4)( c2)( c) b4 c
       a2.( a4) e4
       }

tenc = \relative c' {
       \voiceThree
       c2( c4) b2 c2( c)( c4) a2.( a2) f d2( d4)
       e2( e)( e)( e)( e) d c d
       g e( e)( e)( e)( e4)( e2) d2. a'4
       c,2. a4 b
       }

basc = \relative c' {
       \voiceFour
       s2 a4 g2 e f a4 a,2. d2( d) g,2( g4) 
       c2 a c b a( a) g f
       c' b a e a c4 b2 a2.( a4)
       g2. f4 e
       }


verba = \lyricmode {
     \set stanza = "1. "
    Sing my tongue the Sa -- viour's glo -- ry
    Of His Flesh the my -- st'ry sing
    Of the Blood all price ex -- ceed -- ing
    Shed by our im -- mor -- tal King
    De -- stined for the world's re -- demp -- tion
    Of a no -- ble womb to spring.
      }

verseii = \lyricmode {
    \set stanza = "2. "
    Of a pure and spot -- less Vir -- gin 
Born for us on earth be -- low,
He, as man with man con -- vers -- ing,
Stayed, the seeds of truth to sow;
Then he closed in sol -- emn or -- der
Won -- drous -- ly his life of woe.

}


verseiii = \lyricmode {
    \set stanza = "3. "
 
On the night of that last sup -- per,
Seat -- ed with his cho -- sen band,
He the Pas -- chal vic -- tim eat -- ing,
First ful -- fils the law's com -- mand;
Then, as food to His a -- pos -- tles,
Gives Him -- self with His own hand.

}


verseiv = \lyricmode {
    \set stanza = "4. "
Word made flesh, the bread of na -- ture
By his word to flesh he turns;
Wine in -- to his blood he chang -- es;
What though sense no change dis -- cerns?
On -- ly be the heart in earn -- est,
Faith her les -- son quick -- ly learns.
}


versev = \lyricmode {
    \set stanza = "5. "
Down in ad -- o -- ra -- tion fall -- ing
Lo, the sac -- red host we hail;
Lo, o'er an -- cient forms de -- part -- ing
New -- er rites of grace pre -- vail;
Faith for all de -- fects sup -- ply -- ing
Where the fee -- ble sens -- es fail.

}

versevi = \lyricmode {
    \set stanza = "6. "
To the ev -- er -- last -- ing Fa -- ther
And the Son who reigns on high,
With the Ho -- ly Ghost pro -- ceed -- ing
Forth from each e -- ter -- nal -- ly,
Be sal -- va -- tion, ho -- nour, bless -- ing,
Might and end -- less ma -- jes -- ty. Amen.

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
