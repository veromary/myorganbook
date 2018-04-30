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
        title = "Tantum ergo"
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
       c2. b2 c g' f4
       g2.( g2) e d( d4)
       e2( e1)( e2)(
       e2) d c a
       c2 d( d) e2( 
       e2.)( e2) b2. c4
       }

ten = \relative c' {
       \voiceThree
       a2. g2( g) c2( c4)(
       c2.) d2 c( c) b4
       c2( c1) b2(
       b2)( b) a g4 f
       a2 b a b(
       b2.) a2( a2.)( a4)
       }

bass = \relative c {
       \voiceFour
       s1 s4 e2( e) d4
       e2.( e2) f g2( g4)
       c2 a1 e2 
       d2 c( c) d
       a'2 g f e
       d2. c2 a2.( a4)
       }

altb = \relative c' {
      \voiceTwo
      c2( c4) b2 c( c)( c4)
      g'2. f2 e d2.
      e2 f( f) e(
      e2)( e) a,2( a)
      c2( c1) d2
      c2.( c2) b2. c4
      a2.( a4) b
}

tenb = \relative c' {
      \voiceThree
      a2( a4) f2 e2( e)( e4)
      g2. c2( c) g2.
      a2( a) c b(
      b) a g f
      e( e1)( e2)(
      e2.) a2( a2.)( a4)
      f2.( f4) g
}

basb = \relative c {
      \voiceFour
      a2 d4( d2) c b a4
      e'2. d2 c( c2.)
      c2 d( d) e 
      d c( c)( c)
      b2 a1 b2
      c2.( c2) d2. a'4
      d,2. e2
}

verba = \lyricmode {
     \set stanza = "1. "
Tan -- tum er -- go sa -- cra -- men -- tum
Ve -- ne -- re -- mur cer -- nu -- i,
Et an -- ti -- quum do -- cu -- men -- tum
No -- vo ce -- dat ri -- tu -- i:
Prae -- stet fi -- des sup -- ple -- men -- tum
Sen -- su -- um de -- fe -- ctu -- i.
      }

verseii = \lyricmode {
    \set stanza = "2. "
 Ge -- ni -- to -- ri Ge -- ni -- to -- que
Laus et ju -- bi -- la -- ti -- o,
Sa -- lus ho -- nor, vir -- tus quo -- que
Sit et be -- ne -- di -- cti -- o:
Pro -- ce -- den -- ti ab u -- tro -- que
Com -- par sit lau -- da -- ti -- o.
A -- men.
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
%        \transpose c bes,
        <<
	\new ChoirStaff <<
	    \set Score.midiInstrument = "Pipe Organ"
	    %\set Score.midiInstrument = "Choir Aahs"
	\new Staff = "plainchant" <<
          \clef treble
          \global 
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
%          \new Lyrics \lyricsto "melody" \verseiii
%          \new Lyrics \lyricsto "melody" \versev
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
%         \transpose c bes,
        <<
	         \new ChoirStaff <<
          \new Staff <<
          \global
          \clef treble
          \new Voice = "altverse" { \chantamen }
          \new Lyrics \lyricsto "altverse" \verseii
%          \new Lyrics \lyricsto "altverse" \verseiv
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
