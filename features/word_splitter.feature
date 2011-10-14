Feature: word splitter
  Scenario: splitting a sentence
    Given a sentence 'My home is my castle.'
    When the sentence is split
    Then the following segments should be detected
      | segment | type  |
      #-----------------#
      | My      | word  |
      | ' '     | other |
      | home    | word  |
      | ' '     | other |
      | is      | word  |
      | ' '     | other |
      | my      | word  |
      | ' '     | other |
      | castle  | word  |
      | .       | punct |

    Given a sentence 'W dniu 14/12/2011 nastąpił napad na bank!'
    When the sentence is split
    Then the following non-blank segments should be detected
      | segment    | type   |
      #---------------------#
      | W          | word   |
      | dniu       | word   |
      | 14/12/2011 | number |
      | nastąpił   | word   |
      | napad      | word   |
      | na         | word   |
      | bank       | word   |
      | !          | punct  |

    Given a sentence 'Użytkownik o loginie ania8 zalogował się 7 listopada.'
    When the sentence is split
    Then the following non-blank segments should be detected
      | segment    | type   |
      #---------------------#
      | Użytkownik | word   |
      | o          | word   |
      | loginie    | word   |
      | ania8      | word   |
      | zalogował  | word   |
      | się        | word   |
      | 7          | number |
      | listopada  | word   |
      | .          | punct  |

    Given a sentence 'Czy wrona, kruk i gawron to polskie ptaki?'
    When the sentence is split
    Then the following non-blank segments should be detected
      | segment    | type   |
      #---------------------#
      | Czy        | word   |
      | wrona      | word   |
      | ,          | punct  |
      | kruk       | word   |
      | i          | word   |
      | gawron     | word   |
      | to         | word   |
      | polskie    | word   |
      | ptaki      | word   |
      | ?          | punct  |

    Given a sentence 'Czy 10 000 000$ to duża kwota?'
    When the sentence is split
    Then the following non-blank segments should be detected
      | segment    | type   |
      #---------------------#
      | Czy        | word   |
      | 10 000 000 | number |
      | $          | graph  |
      | to         | word   |
      | duża       | word   |
      | kwota      | word   |
      | ?          | punct  |
