use inc::Module::Install;

name 'Algorithm-UniqueSubstring';
all_from 'lib/Algorithm/UniqueSubstring.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';

auto_set_repository;
auto_include;

WriteAll;
