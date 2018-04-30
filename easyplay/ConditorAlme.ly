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
        title = "Conditor alme"
        poet = ""
%        meter = "translation G M Hopkins"
        composer = "arr Jul. Van Nuffel"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2011 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

global = {
       \key e \major
}

chant = \relative c'' {
        \voiceOne
        \time 8/4
        gis4 e gis b b cis a b b cis a b a gis fis gis
        b a fis gis a gis fis e e gis a b a gis fis gis
	\bar "||"
        } 	


chantamen = \relative c'' {
        \voiceOne
        \time 8/4
        gis4 e gis b b cis a b b cis a b a gis fis gis
        b a fis gis a gis fis e e gis a b a gis fis gis
	\bar "||"
        gis( a gis) fis( gis) \bar "|."
        } 	

alt = \relative c' {
       \voiceTwo
       s4 e2 dis4 e( e2) dis4
       e2. cis2 dis2( dis4)
       e2. cis2 dis2 e4(
       e2.) cis2 dis( dis4)
       }

ten = \relative c' {
       \voiceThree
       s4 cis2 gis fis gis4( 
       gis4) a2 fis2 b gis4(
       gis4) fis2 a b cis4
       b4 gis2 fis a gis4
       }

altb = \relative c' {
      \voiceTwo	
      e4( e2) dis4 e4( e2) dis4
      e4( e2)( e) dis e4
      dis4 cis2( cis) dis s4
      s4 cis1( cis2) b4
      }

tenb = \relative c' {
      \voiceThree
      b4( b1) a2 gis4
      s4 a2( a)( a) b4
      gis4 fis2( fis)( fis) gis4
      e4( e2)( e2) dis2( dis4)
}

basb = \relative c {
      \voiceFour
      e4 gis1 fis2 gis4(
      gis4)( gis2) fis2( fis) e4(
      e4) fis2 a,2 b2 cis4( 
      cis) a2 fis a gis4
}

altc = \relative c' {
     \voiceTwo
     s4 e2 dis4 e4( e2) dis4
     e4( e2)( e2) dis e4
    dis4 cis2( cis) dis s4
    s4 cis2( cis)( cis) b4
    cis2.( cis4) b4
}

tenc = \relative c' {
   \voiceThree
   s4 cis2 gis fis s4
   s4 a2( a)( a) b4
   gis4 fis2( fis)( fis) gis4
   e4( e2)( e) dis( dis4)
   fis2. dis4( dis)
}

basc = \relative c' {
   \voiceFour
   s1 s2. gis4(
   gis4)( gis2) fis2( fis) e4(
   e4) fis2 a,2 b cis4( 
   cis4) a2 fis a2 gis4
   a2.( a4) gis4
}

verba = \lyricmode {
     \set stanza = "1. "
Con -- di -- tor al -- me si -- de -- rum,
Ae -- ter -- na lux cre -- den -- ti -- um,
Chri -- ste re -- demp -- tor om -- ni -- um,
Ex -- au -- di pre -- ces sup -- pli -- cum.
      }

verseii = \lyricmode {
    \set stanza = "2. "
    Qui con -- do -- lens in -- te -- ri -- tu
    Mor -- tis pe -- ri -- re sae -- cu -- lum,
    Sal -- va -- sti mun -- dum lan -- gui -- dum,
    Do -- nans re -- is re -- me -- di -- um.
     }

verseiii = \lyricmode {
   \set stanza = "3. "
   Ver -- gen -- te mun -- di ve -- spe -- re,
   U -- ti spon -- sus de tha -- la -- mo,
   E -- gres -- sus ho -- ne -- stis -- si -- ma
   Vir -- gi -- nis  ma -- tris clau -- su -- la.
}

verseiv = \lyricmode {
   \set stanza = "4. "
   Cu -- ius for -- ti po -- ten -- ti -- ae
   Ge -- nu cur -- van -- tur om -- ni -- a,
   Cae -- le -- sti -- a ter -- re -- stri -- a,
   Nu -- tu fa -- ten -- tu sub -- di -- ta.
}

versev = \lyricmode {
   \set stanza = "5. "
   Te de -- pre -- ca -- mur a -- gi -- e,
   Ven -- tu -- re ju -- dex sae -- cu -- li,
  Con -- ser -- va nos in tem -- po -- re
  Ho -- stis a cae -- lo per -- fi -- di.
}

lastverse = \lyricmode {
   \set stanza = "6. "
   Laus, ho -- nor, vir -- tus, glo -- ri -- a
   De -- o Pa -- tri et Fi -- li -- o,
San -- cto si -- mul Pa -- ra -- cli -- to,
in sae -- cu -- lo -- rum sae -- cu -- la.  A -- men.
}

\score {
        \transpose e c
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
         \new Lyrics \lyricsto "melody" \verseiii
         \new Lyrics \lyricsto "melody" \versev
         \new Voice = "alto" << \alt >>
                  >>
	\new Staff = bass <<
          \global
             \clef bass
            \new Voice = "tenors" << \ten >> 
    %        \new Voice = "bass" << \bass >>
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
         \transpose e c
        <<
	         \new ChoirStaff <<
          \new Staff <<
%\set Score.midiInstrument = "Church Organ"
\set Score.midiInstrument = "Drawbar Organ"
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
         \transpose e c
        <<
	         \new ChoirStaff <<
          \new Staff <<
%\set Score.midiInstrument = "Church Organ"
\set Score.midiInstrument = "Drawbar Organ"
          \global
          \clef treble
          \new Voice = "altverse" { \chantamen }
          \new Lyrics \lyricsto "altverse" \lastverse
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
 


\markup
{
    \column
    {
	\line{\italic Text: 7th Century}
%%\line{\italic Music: }
%\line{\italic Arrangement: Mar. de Jong (?)}
%	%\line{\italic {Words and Music:} }
%	%\line{\italic {Tune Name:} }
	\line{\italic {Original Key:} E}
	\line{\italic Source: Nova Organi Harmonia}
    }
}
