# `Text::Markdown`, a Markdown parsing module for Perl6 [![Build Status](https://travis-ci.org/retupmoca/p6-markdown.svg?branch=master)](https://travis-ci.org/retupmoca/p6-markdown)

This module parses Markdown and generates HTML from it. It can be used
to extract certain elements from a MD document or to generate other
kind of things.  


Example Usage
-------------

    use Text::Markdown;
    my $md = Text::Markdown.new($raw-md);
    say $md.render;

or

    use Text::Markdown;
    my $md = parse-markdown($raw-md);
    say $md.to_html;

## Dependencies

Depends
on
[`HTML::Escape`](https://github.com/moznion/p6-HTML-Escape). Install
it locally with 

	zef install HTML::Escape
	
## Who

Initial version by [Andrew Egeler](https://github.com/retupmoca), with
extensive additions by [JMERELO](https://github.com/JJ)
and [Altai-man](https://github.com/Altai-man)

## Want to lend a hand?

Check out the [contributing guidelines](CONTRIBUTING.md). All
contributions are welcome, and will be addressed.
