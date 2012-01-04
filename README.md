sapphire
=======

* http://github.com/MarcusTheBold/Sapphire

DESCRIPTION:
============

Web Automated Acceptance Testing Framework for non-techies

FEATURES/PROBLEMS:
==================

* FIX (list of features or problems)

SYNOPSIS:
=========
`Scenario` -- Description of the contained tests `Scenario "Homepage | Searching" do`

`Background` -- Sets up a test, rune one time before one or more Given/When/Then pairs `Background "User is on homepage" do ... end`

`Given` -- Sets up a test, run before EVERY when/then `Given "user is on home page" do ... end`

`When` -- Sets up a test, run only for that one test `When "user clicks save button" do ... end`

`Then` -- The assertion for a Given/When combo, test to make sure the results of the When are correct `Then "users data is saved" do ... end`

`Use` -- Let the script know what user to run with `Use ConfiguredUser`


REQUIREMENTS:
=============

* FIX (list of requirements)

INSTALL:
========

  gem install sapphire

LICENSE:
========

(The MIT License)

Copyright (c) 2011 FIXME full name

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.