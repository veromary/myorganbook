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
        title = "Adoro (te) Devote"
        poet = "Thomas Aquinas"
%        meter = "translation G M Hopkins"
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
       a2( a2) e fis2 g2( g) fis1
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
 A -- do -- ro de -- vo -- te, la -- tens De -- i -- tas,
     Quæ sub his fi -- gu -- ris ve -- re la -- ti -- tas; 
     Ti -- bi se cor me -- um to -- tum sub -- ji -- cit,  
    Qui -- a te con -- tem -- plans to -- tum de -- fi -- cit.    

      }

verseii = \lyricmode {
    \set stanza = "2. "
 
Vi -- sus, tac -- tus, gus -- tus in te fal -- li -- tur,  
      Sed au -- di -- tu so -- lo tu -- to cre -- di -- tur.      
     Cre -- do quid -- quid di -- xit De -- i Fi -- li -- us;     
      Nil hoc ver -- bo ve -- ri -- tá -- tis ve -- ri -- us.     

}

verseiii = \lyricmode {
    \set stanza = "3. "

       In cru -- ce la -- te -- bat so -- la De -- i -- tas,      
     At hic la -- tet si -- mul et Hu -- ma -- ni -- tas,     
    Am -- bo ta -- men cre -- dens at -- que con -- fi -- tens,   
     Pe -- to quod pe -- ti -- vit la -- tro pœ -- ni -- tens.    

}


verseiv = \lyricmode {
    \set stanza = "4. "

    Pla -- gas, si -- cut Tho -- mas, non in -- tu -- e -- or:    
       De -- um ta -- men me -- um te con -- fi -- te -- or.      
     Fac me ti -- bi sem -- per ma -- gis cre -- de -- re,    
     In te spem ha -- be -- re, te di -- li -- ge -- re.      
}


versev = \lyricmode {
    \set stanza = "5. "

        O me -- mo -- ri -- a -- le mor -- tis Do -- mi -- ni!
    Pa -- nis vi -- vus, vi -- tam præ -- stans ho -- mi -- ni!
      Præ -- sta me -- æ men -- ti de te ví -- ve -- re,      
      Et te il -- li sem -- per dul -- ce sa -- pe -- re.     

}

versevi = \lyricmode {
    \set stanza = "6. "

        Pi -- e Pe -- li -- ca -- ne, Je -- su Do -- mi -- ne,
      Me im -- mun -- dum mun -- da tu -- o san -- gui -- ne:
      Cu -- jus u -- na stil -- la sal -- vum fa -- ce -- re      
    To -- tum mun -- dum quit ab om -- ni sce -- le -- re.    

}

versevii = \lyricmode {
   \set stanza = "7. "

     Je -- su, quem ve -- la -- tum nunc as -- pi -- ci -- o,
      O -- ro, fi -- at il -- lud quod tam si -- ti -- o:     
       Ut te re -- ve -- la -- ta cer -- nens fa -- ci -- e,      
     Vi -- su sim be -- á -- tus tu -- æ glo -- ri -- æ. A -- men     

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
          \new Lyrics \lyricsto "altverse" \versevi
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
          \new Lyrics \lyricsto "lastverse" \versevii
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
