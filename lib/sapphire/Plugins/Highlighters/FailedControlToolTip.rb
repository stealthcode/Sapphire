module Sapphire
  module Plugins

    class FailedControlToolTip < Plugin

      def initialize

        observes :class => DSL::ControlEvaluation,
                 :method => :Passed

      end

      def Before(instance, method, args)
        return if ENV["highlighter"] != "true"

        control = args[0]
        discriminator = control.found_by_type
        selector = control.found_by_value

        begin
          query = Query(discriminator, selector)

          #js = "var wrapper = document.createElement('div');
          #      var toolTip = document.createElement('div');
          #      toolTip.innerHTML = 'Test!';
          #      wrapper.style.position = 'relative';
          #      toolTip.style.position = 'absolute';
          #      toolTip.style.bottom = '100%';
          #      toolTip.style.left = '50%';
          #      toolTip.style.marginLeft = '-150px';
          #      toolTip.style.width = '100px';
          #      toolTip.style.backgroundColor = '#eee;'
          #      toolTip.style.border = '1px solid #555;'
          #      toolTip.style.borderRadius = '5px';
          #      toolTip.style.padding = '5px';
          #      var myDiv = #{query};
          #      wrapper.appendChild(toolTip);
          #      wrapper.appendChild(myDiv.cloneNode(true));
          #      myDiv.parentNode.replaceChild(wrapper, myDiv);"
          #
          #$driver.ExecuteScript(js)

          $driver.ExecuteScript "var tooltip=function(){
                                 var id = 'tt';
                                 var top = 3;
                                 var left = 3;
                                 var maxw = 300;
                                 var speed = 10;
                                 var timer = 20;
                                 var endalpha = 95;
                                 var alpha = 0;
                                 var tt,t,c,b,h;
                                 var ie = document.all ? true : false;
                                 return{
                                  show:function(obj, v,w){
                                   if(tt == null){
                                    var myDiv = obj;
                                    tt = document.createElement('div');
                                    tt.setAttribute('id',id);
                                    tt.style.top = myDiv.style.top - 50;
                                    tt.style.left = myDiv.style.left;
                                    t = document.createElement('div');
                                    t.setAttribute('id',id + 'top');
                                    c = document.createElement('div');
                                    c.setAttribute('id',id + 'cont');
                                    b = document.createElement('div');
                                    b.setAttribute('id',id + 'bot');
                                    tt.appendChild(t);
                                    tt.appendChild(c);
                                    tt.appendChild(b);
                                    document.body.appendChild(tt);
                                   }
                                   tt.style.display = 'block';
                                   c.innerHTML = v;
                                   tt.style.width = w ? w + 'px' : 'auto';
                                   if(!w && ie){
                                    t.style.display = 'none';
                                    b.style.display = 'none';
                                    tt.style.width = tt.offsetWidth;
                                    t.style.display = 'block';
                                    b.style.display = 'block';
                                   }
                                  if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
                                  h = parseInt(tt.offsetHeight) + top;
                                  }
                                 };
                                }();" if !$toolTipInserted
          $toolTipInserted = true

          $driver.executeScript("tooltip.show(#{query})")
        rescue
        end

      end

      def Query(discriminator, selector)

        if(discriminator == :id)
          return "document.getElementById('#{selector}')"
        elsif (discriminator == :name )
          return "document.getElementByName('#{selector}')"
        elsif (discriminator == :xpath)
          return "document.evaluate( '#{selector}', document, null, XPathResult.ANY_TYPE, null ).iterateNext()"
        end
      end

      #def self.IsObserver()
      #  true
      #end

    end

  end
end