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
