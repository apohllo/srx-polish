Feature: sentence splitter
  Scenario: splitting text
    Given a text
      """
      W październiku 1890 r. dwóch żołnierzy dokonało
      rewolty, np. Andrzej i P. Woźny.
      """
    When the text is split
    Then the following sentences should be detected
      | sentence                                                                         |
      #----------------------------------------------------------------------------------#
      | W październiku 1890 r. dwóch żołnierzy dokonało rewolty, np. Andrzej i P. Woźny. |

    Given a text
      """
      Wiosna, lato, itd. A wczoraj mieliśmy jesień.
      """
    When the text is split
    Then the following sentences should be detected
      | sentence                   |
      #----------------------------#
      | Wiosna, lato, itd.         |
      | A wczoraj mieliśmy jesień. |

    Given a text
      """
      Andrzej G. (20 l.). A z nim sześciu mężczyzn.
      """
    When the text is split
    Then the following sentences should be detected
      | sentence                   |
      #----------------------------#
      | Andrzej G. (20 l.).        |
      | A z nim sześciu mężczyzn.  |
