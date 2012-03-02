module Sapphire
  module Testing
    class HtmlReporter < Reporter

      def initialize()
        @failures = []
        @example_group_number = 0
        @passing_count = 0
        @failing_count = 0
        @pending_count = 0
        @broken_count = 0
        @test_count = 0
        @output = $stdout
      end

      def TestStarted(test)

      end

      def TestPassed(test)
        @passing_count = @passing_count + 1
        @output.puts "    <dd class=\"spec passed\"><span class=\"passed_spec_name\">#{test.text}</span></dd>"
      end

      def TestFailed(test)

        failure_style = 'failed'
        @output.puts "    <script type=\"text/javascript\">makeRed('rspec-header');</script>" unless @header_red
        @header_red = true
        @output.puts "    <script type=\"text/javascript\">makeRed('example_group_#{@example_group_number}');</script>" unless @example_group_red
        @example_group_red = true
        @output.puts "    <dd class=\"spec #{failure_style}\">"
        @output.puts "      <span class=\"failed_spec_name\">#{test.text}</span>"
        @output.puts "      <div class=\"failure\" id=\"failure_#{@test_count}\">"

        if test.messages.is_a? Array
          message_block = ""
          test.messages.each do |message|
            message_block += message + "<br>"
          end
          @output.puts "        <div class=\"message\"><pre>#{message_block}</pre></div>"
        else
          @output.puts "        <div class=\"message\"><pre>#{test.messages}</pre></div>"
        end

        test.stack.each do |line|
          if (!line.include? "sapphire")
            @output.puts "        <div class=\"backtrace\"><pre>#{line}</pre></div>"
          end
        end

        @output.puts "      </div>"
        @output.puts "    </dd>"
      end

      def TestPending(test)
        @output.puts "    <script type=\"text/javascript\">makeYellow('rspec-header');</script>" unless @header_red
        @output.puts "    <script type=\"text/javascript\">makeYellow('example_group_#{@example_group_number}');</script>" unless @example_group_red
        @output.puts "    <dd class=\"spec not_implemented\"><span class=\"not_implemented_spec_name\">#{test.text} (PENDING: ### Not Yet Implemented ###)</span></dd>"
      end

      def TestBroken(test)
        @output.puts "    <script type=\"text/javascript\">makeOrange('rspec-header');</script>" unless @header_red
        @output.puts "    <script type=\"text/javascript\">makeOrange('example_group_#{@example_group_number}');</script>" unless @example_group_red
        @output.puts "    <dd class=\"spec not_implemented\"><span class=\"not_implemented_spec_name\">#{test.text} (BROKEN: ### Broken ###)</span></dd>"
      end

      def TestingComplete
        @end = Time.now

        totals = "#{@test_count} example#{'s' unless @test_count == 1}, #{@failure_count} failure#{'s' unless @failure_count == 1}"
        totals << ", #{@pending_count} pending" if @pending_count > 0
        totals << ", #{@broken_count} broken" if @broken_count > 0

        @output.puts "<script type=\"text/javascript\">document.getElementById('duration').innerHTML = \"Finished in <strong>#{(@end - @start).round(2).to_s} seconds</strong>\";</script>"
        @output.puts "<script type=\"text/javascript\">document.getElementById('totals').innerHTML = \"#{totals}\";</script>"
        @output.puts "</div>"
        @output.puts "</div>"
        @output.puts "</body>"
        @output.puts "</html>"
      end

      def BeginTesting
        @start = Time.now
        @output.puts html_header
        @output.puts report_header
      end

      def ScenarioStart(scenario)
        @example_group_red = false
        @example_group_number += 1
        unless @example_group_number == 1
          @output.puts "  </dl>"
          @output.puts "</div>"
        end
        @output.puts "<div class=\"example_group\">"
        @output.puts "  <dl>"
        @output.puts "  <dt id=\"example_group_#{@example_group_number}\">#{scenario.text}</dt>"
      end

      def OutputResults()

      end

      def ScenarioComplete(scenario)

      end

      def html_header
          <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>RSpec results</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Expires" content="-1" />
  <meta http-equiv="Pragma" content="no-cache" />
  <style type="text/css">
  body {
    margin: 0;
    padding: 0;
    background: #fff;
    font-size: 80%;
  }
  </style>
  <script type="text/javascript">
    // <![CDATA[
#{global_scripts}
    // ]]>
  </script>
  <style type="text/css">
#{global_styles}
  </style>
</head>
<body>
EOF
        end

        def report_header
          <<-EOF
<div class="rspec-report">

<div id="rspec-header">
  <div id="label">
    <h1>RSpec Code Examples</h1>
  </div>

  <div id="summary">
    <p id="totals">&nbsp;</p>
    <p id="duration">&nbsp;</p>
  </div>
</div>

<div class="results">
EOF
        end

        def global_scripts
          <<-EOF
function moveProgressBar(percentDone) {
  document.getElementById("rspec-header").style.width = percentDone +"%";
}
function makeRed(element_id) {
  document.getElementById(element_id).style.background = '#C40D0D';
  document.getElementById(element_id).style.color = '#FFFFFF';
}

function makeYellow(element_id) {
  if (element_id == "rspec-header" && document.getElementById(element_id).style.background != '#C40D0D')
  {
    document.getElementById(element_id).style.background = '#FAF834';
    document.getElementById(element_id).style.color = '#000000';
  }
  else
  {
    document.getElementById(element_id).style.background = '#FAF834';
    document.getElementById(element_id).style.color = '#000000';
  }
}
EOF
        end

        def global_styles
          <<-EOF
#rspec-header {
  background: #65C400; color: #fff; height: 4em;
}

.rspec-report h1 {
  margin: 0px 10px 0px 10px;
  padding: 10px;
  font-family: "Lucida Grande", Helvetica, sans-serif;
  font-size: 1.8em;
  position: absolute;
}

#summary {
  margin: 0; padding: 5px 10px;
  font-family: "Lucida Grande", Helvetica, sans-serif;
  text-align: right;
  top: 0px;
  right: 0px;
  float:right;
}

#summary p {
  margin: 0 0 0 2px;
}

#summary #totals {
  font-size: 1.2em;
}

.example_group {
  margin: 0 10px 5px;
  background: #fff;
}

dl {
  margin: 0; padding: 0 0 5px;
  font: normal 11px "Lucida Grande", Helvetica, sans-serif;
}

dt {
  padding: 3px;
  background: #65C400;
  color: #fff;
  font-weight: bold;
}

dd {
  margin: 5px 0 5px 5px;
  padding: 3px 3px 3px 18px;
}

dd.spec.passed {
  border-left: 5px solid #65C400;
  border-bottom: 1px solid #65C400;
  background: #DBFFB4; color: #3D7700;
}

dd.spec.failed {
  border-left: 5px solid #C20000;
  border-bottom: 1px solid #C20000;
  color: #C20000; background: #FFFBD3;
}

dd.spec.not_implemented {
  border-left: 5px solid #FAF834;
  border-bottom: 1px solid #FAF834;
  background: #FCFB98; color: #131313;
}

dd.spec.pending_fixed {
  border-left: 5px solid #0000C2;
  border-bottom: 1px solid #0000C2;
  color: #0000C2; background: #D3FBFF;
}

.backtrace {
  color: #000;
  font-size: 12px;
}

a {
  color: #BE5C00;
}

/* Ruby code, style similar to vibrant ink */
.ruby {
  font-size: 12px;
  font-family: monospace;
  color: white;
  background-color: black;
  padding: 0.1em 0 0.2em 0;
}

.ruby .keyword { color: #FF6600; }
.ruby .constant { color: #339999; }
.ruby .attribute { color: white; }
.ruby .global { color: white; }
.ruby .module { color: white; }
.ruby .class { color: white; }
.ruby .string { color: #66FF00; }
.ruby .ident { color: white; }
.ruby .method { color: #FFCC00; }
.ruby .number { color: white; }
.ruby .char { color: white; }
.ruby .comment { color: #9933CC; }
.ruby .symbol { color: white; }
.ruby .regex { color: #44B4CC; }
.ruby .punct { color: white; }
.ruby .escape { color: white; }
.ruby .interp { color: white; }
.ruby .expr { color: white; }

.ruby .offending { background-color: gray; }
.ruby .linenum {
  width: 75px;
  padding: 0.1em 1em 0.2em 0;
  color: #000000;
  background-color: #FFFBD3;
}
EOF
        end
    end
  end
end