sapphire
=======

* http://github.com/MarcusTheBold/Sapphire

DESCRIPTION:
============

Web Automated Acceptance Testing Framework for non-techies

VERBS:
=========
`Scenario` Description of the contained tests `Scenario "Homepage | Searching" do`

`Background` Sets up a test, rune one time before one or more Given/When/Then pairs `Background "User is on homepage" do ... end`

`Given` Sets up a test, run before EVERY when/then `Given "user is on home page" do ... end`

`When` Sets up a test, run only for that one test `When "user clicks save button" do ... end`

`Then` The assertion for a Given/When combo, test to make sure the results of the When are correct `Then "users data is saved" do ... end`

`Use` Let the script know what user to run with `Use ConfiguredUser`

`Start` Starts a Browser `Start ConfiguredBrowser With GoogleUrl`

`Complete` Calls the complete method on a page `Complete Google`

`Navigate` Navigates to a given page `Nagivate To Google`

`Click` Clicks a link/button/etc `Click :home_button`

`Should` Asserts that something is true `Should Show Google

`Show` Checks that you are on the right page, or that the right text is in an html element, or that an html element is on the screen `Should Show Google` `Should Show :name_textbox => "Bob"` `Should Show :error_image`

`Exit` Closes a browser `Exit Browser`

`Track` Stores a piece of information to be used later in a test `Track For :customer_id`

`Write` Executes a sql statement to write to the database `Write NewProduct With :id => Tracker(:product_id)`

`Set` Set the value of an html element `Set :name_textbox => "Bob"`

`Find` Executes a sql statement to query the database `Find Customer With :id => Tracker(:customer_id)`

`MouseOver` Mouse Over an item on the screen `MouseOver :options_list`

`Error` Same as show `Should Error With :user_name_error => 'Please enter a username.'`




INSTALL:
========

  gem install sapphire

LICENSE:
========

(The MIT License)

Copyright (c) 2011 - 2012 Sapphire Project

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