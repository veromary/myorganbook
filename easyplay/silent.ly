\version "2.12.2"

\paper {
        #(set-paper-size "a5")
  myStaffSize = #26
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ myStaffSize 26)))
}


\header {
        title = "Silent Night"
}

melody = \relative c'' {
	\clef treble
	\key c \major
	\time 6/8
        \easyHeadsOn
        g8.( a16) g8 e4. g8.( a16) g8 e4.
	d'4 d8 b4. c4 c8 g4.
	a4 a8 c8.( b16) a8 g8. a16 g8 e4.
	a4 a8 c8. b16 a8 g8. a16 g8 e4.
	d'4 d8 f8. d16 b8 c4.( e)
	c8( g) e g8. f16 d8 c2.
}

firstVerse = \lyricmode {
Si -- lent night, ho -- ly night,
All is calm, all is bright;
Round yon Vir -- gin, mo -- ther and Child,
Ho -- ly in -- fant so ten -- der and mild,
Sleep in hea -- ven -- ly peace,
Sleep in hea -- ven -- ly peace.
}

\score {
	\new Staff <<
	\new Voice = "one" {
		\melody
	}
	\new Lyrics \lyricsto "one" \firstVerse
	>>
	\midi { }
	\layout{
	}
}
