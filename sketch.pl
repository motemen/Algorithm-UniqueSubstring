use common::sense;
use lib 'lib';
use Algorithm::UniqueSubstring;
use Data::Dumper;

warn Dumper unique_substrings('abcd', 'abde');
# $VAR1 = {
#           'abde' => [
#                       'e',
#                       'bd',
#                       'de',
#                       'abd',
#                       'bde',
#                       'abde'
#                     ],
#           'abcd' => [
#                       'c',
#                       'cd',
#                       'bc',
#                       'abc',
#                       'bcd',
#                       'abcd'
#                     ]
#         };

warn Dumper unique_substrings('abcd', 'abde', 'abdf');
# $VAR1 = {
#           'abde' => [
#                       'e',
#                       'de',
#                       'bde',
#                       'abde'
#                     ],
#           'abdf' => [
#                       'f',
#                       'df',
#                       'bdf',
#                       'abdf'
#                     ],
#           'abcd' => [
#                       'c',
#                       'cd',
#                       'bc',
#                       'abc',
#                       'bcd',
#                       'abcd'
#                     ]
#         };

warn Dumper unique_substrings('abcde', 'abde');
# $VAR1 = {
#           'abde' => [
#                       'bd',
#                       'abd',
#                       'bde',
#                       'abde'
#                     ],
#           'abcde' => [
#                        'c',
#                        'cd',
#                        'bc',
#                        'cde',
#                        'abc',
#                        'bcd',
#                        'abcd',
#                        'bcde',
#                        'abcde'
#                      ]
#         };
