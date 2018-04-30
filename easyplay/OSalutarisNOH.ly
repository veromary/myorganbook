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
    print-first-page-number = ##t
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
        title = "O salutaris Hostia"
        poet = ""
%        meter = "translation G M Hopkins"
        composer = "arr Mar. de Jong"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2011 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

global = {
       \key bes \major
}

chant = \relative c' {
        \voiceOne
        \time 18/4
	r4 f f( g) bes( a g) f( ees) g( f) g( a g) f ees f2
	\time 11/4
        f4 a bes c bes( a) g( f) g bes2
        bes4 g bes f f( g) g( f) ees f2
	\time 13/4
	ees4 g( f) g( bes) bes( a) g( f) d ees f2
	\bar "||"
        } 	


chantamen = \relative c' {
        \voiceOne
        \time 18/4
	r4 f f( g) bes( a g) f( ees) g( f) g( a g) f ees f2
	\time 11/4
        f4 a bes c bes( a) g( f) g bes2
        bes4 g bes f f( g) g( f) ees f2
	\time 13/4
	ees4 g( f) g( bes) bes( a) g( f) d ees f2
	\bar "||"
        f4( g f) ees2( f1) \bar "|."
        } 	

alt = \relative c' {
       \voiceTwo
	d2( d)( d2.)( d2) c2 ees2. c2( c)
	s4 d2 ees2.( ees2)( ees4) d2(
        s4 d2.) ees2 d2.( d2)
        bes4( bes2) c d( d) bes a
       }

ten = \relative c' {
       \voiceThree
       bes2( bes)( bes2.)( bes2)( bes)( bes2.) g2 f2.(
       f2) g2.( g2) bes4 d2
       s4 g,2.( g2) bes2. a2
       g4 ees2 f g( g) ees c
       }

bass = \relative c' {
       \voiceFour
       s2 a2 g2. ees2( ees) c2. bes2 a
       s4 bes2( bes2.) c2( c4) g'2
       s4 bes,2. c2 ees2. d2(
       d4) c2 a g bes c f,
       }

altb = \relative c' {
      \voiceTwo	
        d2( d)( d2.) c2 ees2 d2. c2( c)(
        c4) f2 ees2. c2. d2(
        s4 d2.) c2 d2. c2(
        c4) ees2( ees) f d bes c( c2.) bes2 c4 bes a2
}

tenb = \relative c' {
      \voiceThree
 bes2 a2 g2.( g2) bes2( bes2.)( bes2) a2(
      a4) f2 g2. f2. g2
       s4 ees2. f2( f2.) g2(
       g4)( g2) bes2( bes2)( bes)) g a bes2. g2 f c
}

basb = \relative c {
      \voiceFour
      bes2( bes)( bes2.) c2( c) ees2. f2( f)
      ees4 d2 c2. a g2( 
      s4 g2.) a2 bes2.( bes2)(
      bes4) c2( c) d ees f( f) ees2 d4 c bes a g f2
}

verba = \lyricmode {
     \set stanza = "1. "
O sa -- _ lu -- tá -- ris hó -- sti -- a,
Quae coe -- li pan -- dis ó -- sti -- um,
Bel -- la pre -- munt ho -- stí -- li -- a,
Da ro -- bur, fer au -- xí -- li -- um.
      }

verseii = \lyricmode {
    \set stanza = "2. "
     U -- ni _ tri -- nó -- que Dó -- mi -- no,
     Sit sem -- pi -- tér -- na gló -- ri -- a:
     Qui vi -- tam si -- ne tér -- mi -- no
     No -- bis do -- net in pá -- tri -- a.  A -- men.
}

\score {
        \transpose bes g
        <<
	\new ChoirStaff <<
	    \set Score.midiInstrument = "Church Organ"
	    %\set Score.midiInstrument = "Choir Aahs"
	\new Staff = "plainchant" <<
          \clef treble
          \global 
          \tempo 4 = 120
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
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
         \transpose bes g
        <<
	         \new ChoirStaff <<
          \new Staff <<
%\set Score.midiInstrument = "Church Organ"
\set Score.midiInstrument = "Drawbar Organ"
          \global
          \clef treble
          \new Voice = "altverse" { \chantamen }
          \new Lyrics \lyricsto "altverse" \verseii
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
 


\markup
{
    \column
    {
	\line{\italic Text: Thomas Aquinas}
%%\line{\italic Music: }
%\line{\italic Arrangement: Mar. de Jong (?)}
%	%\line{\italic {Words and Music:} }
%	%\line{\italic {Tune Name:} }
	\line{\italic {Original Key:} B flat}
	\line{\italic Source: Nova Organi Harmonia}
    }
}
