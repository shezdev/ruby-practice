# See https://ruby-doc.org/core-2.3.3/Regexp.html
=begin

A Regexp holds a regular expression, used to match a pattern against strings.
Regexps are created using the /.../ and %r{...} literals, and by the Regexp::new constructor.

Regular expressions (regexps) are patterns which describe the contents of a string.
They’re used for testing whether a string contains a given pattern, or extracting
the portions that match.

They are created with the /pattern/ and %r{pattern} literals or the Regexp.new constructor.

A regexp is usually delimited with forward slashes (/). For example:

/hay/ =~ 'haystack'   #=> 0
/y/.match('haystack') #=> #<MatchData "y">


=end
