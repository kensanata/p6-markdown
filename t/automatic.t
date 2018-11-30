# -*- perl6 -*-
# Copyright (C) 2018  Alex Schroeder <alex@gnu.org>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

use Test;
use JSON::Fast;
use Text::Markdown;

sub load_tests {
  my $spec = "t/common-markdown-spec-0.28.json";
  return from-json($spec.IO.slurp);
}

sub normalize (Str $html is copy --> Str) {
  $html ~~ s/ \n $ //;
  return $html;
}

my @tests = load_tests.List; # this .List is required for the moment

# for @tests -> %test {
hyper for @tests.hyper(:batch(1)) -> %test {
  my $name = %test<example> ~ ". (" ~ %test<section> ~ ")";
  my $input = %test<markdown>;
  %test<output> = parse-markdown($input).to-html;
  %test<correct> = normalize(%test<html>);
}

@tests.map: {
  is(.<output>, .<correct>, .<name>);
}

done-testing();
