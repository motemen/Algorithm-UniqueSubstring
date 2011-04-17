package Algorithm::UniqueSubstring;
use strict;
use warnings;
use Exporter::Lite;

our $VERSION = '0.01';

our @EXPORT = qw(unique_substrings);

sub unique_substrings {
    my @strings = @_;
    my @seqs = map { ref $_ eq 'ARRAY' ? [ @$_ ] : [ split //, $_ ] } @strings;

    my $root = {};
    for (0 .. $#strings) {
        my $string = $strings[$_];
        my $seq = $seqs[$_];
        while (@$seq) {
            _append($root, $seq, $string);
            shift @$seq;
        }
    }

    use YAML; warn YAML::Dump $root;
    return _scan_trie($root);
}

sub _scan_trie {
    my $root = shift;

    my $result = {};
    my @queue = ( [ $root, '' ] );

    while (my $pair = shift @queue) {
        my ($node, $depth) = @$pair;
        while (my ($ch, $child) = each %{ $node->{children} }) {
            if ($child->{_count} == 1) {
                my $string = ${ $child->{_string} };
                push @{ $result->{ $string } ||= [] }, $depth . $ch;
            }
            push @queue, [ $child, $depth . $ch ];
        }
    }

    return $result;
}

sub _append {
    my ($root, $seq, $string) = @_;
    foreach (@$seq) {
        $root = $root->{children}->{$_} ||= {};
        $root->{_count}++;
        $root->{_string} = \$string;
    }
}

1;

__END__

=head1 NAME

Algorithm::UniqueSubstring -

=head1 SYNOPSIS

  use Algorithm::UniqueSubstring;

=head1 DESCRIPTION

Algorithm::UniqueSubstring is

=head1 AUTHOR

motemen E<lt>motemen@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
