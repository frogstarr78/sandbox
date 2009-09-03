  <div id="content">
<span class="comment"># Example demonstrating &quot;around&quot; advice that traces calls to all methods in</span>
<span class="comment"># classes Foo and Bar</span>

<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">Foo</span>
    <span class="keyword">def </span><span class="method">initialize</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Inside:   Foo#initialize: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
    <span class="keyword">def </span><span class="method">do_it</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Inside:   Foo#do_it: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>

  <span class="keyword">module </span><span class="module">BarModule</span>
    <span class="keyword">def </span><span class="method">initialize</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Inside:   BarModule#initialize: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
    <span class="keyword">def </span><span class="method">do_something_else</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Inside:   BarModule#do_something_else: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>

  <span class="keyword">class </span><span class="class">Bar</span>
    <span class="ident">include</span> <span class="constant">BarModule</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Before advising the methods:</span><span class="punct">&quot;</span>
<span class="ident">foo1</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Foo</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a1</span><span class="punct">,</span> <span class="symbol">:a2</span>
<span class="ident">foo1</span><span class="punct">.</span><span class="ident">do_it</span> <span class="symbol">:b1</span><span class="punct">,</span> <span class="symbol">:b2</span>

<span class="ident">bar1</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Bar</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a3</span><span class="punct">,</span> <span class="symbol">:a4</span>
<span class="ident">bar1</span><span class="punct">.</span><span class="ident">do_something_else</span> <span class="symbol">:b3</span><span class="punct">,</span> <span class="symbol">:b4</span>

<span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Aspects</span>

<span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:around</span><span class="punct">,</span> <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="symbol">:all_methods</span><span class="punct">,</span> <span class="symbol">:for_types</span> <span class="punct">=&gt;</span> <span class="punct">[</span><span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Foo</span><span class="punct">,</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Bar</span><span class="punct">],</span>
    <span class="symbol">:method_options</span> <span class="punct">=&gt;</span> <span class="symbol">:exclude_ancestor_methods</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">execution_point</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="keyword">begin</span>
    <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Entering: <span class="expr">#{execution_point.target_type.name}</span>#<span class="expr">#{execution_point.method_name}</span>: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="ident">execution_point</span><span class="punct">.</span><span class="ident">proceed</span>
  <span class="keyword">ensure</span>
    <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Leaving:  <span class="expr">#{execution_point.target_type.name}</span>#<span class="expr">#{execution_point.method_name}</span>: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">After advising the methods. Notice that #intialize isn't advised:</span><span class="punct">&quot;</span>
<span class="ident">foo2</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Foo</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a5</span><span class="punct">,</span> <span class="symbol">:a6</span>
<span class="ident">foo2</span><span class="punct">.</span><span class="ident">do_it</span> <span class="symbol">:b5</span><span class="punct">,</span> <span class="symbol">:b6</span>

<span class="ident">bar1</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Bar</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a7</span><span class="punct">,</span> <span class="symbol">:a8</span>
<span class="ident">bar1</span><span class="punct">.</span><span class="ident">do_something_else</span> <span class="symbol">:b7</span><span class="punct">,</span> <span class="symbol">:b8</span>

<span class="comment"># The &quot;begin/ensure/end&quot; idiom shown causes the advice to return the correct value; the result</span>
<span class="comment"># of the &quot;proceed&quot;, rather than the value returned by &quot;p&quot;!</span>
<span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:around</span><span class="punct">,</span> <span class="symbol">:invocations_of</span> <span class="punct">=&gt;</span> <span class="symbol">:initialize</span><span class="punct">,</span> <span class="symbol">:for_types</span> <span class="punct">=&gt;</span> <span class="punct">[</span><span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Foo</span><span class="punct">,</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Bar</span><span class="punct">],</span>  
    <span class="symbol">:restricting_methods_to</span> <span class="punct">=&gt;</span> <span class="symbol">:private_methods</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">execution_point</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="keyword">begin</span>
    <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Entering: <span class="expr">#{execution_point.target_type.name}</span>#<span class="expr">#{execution_point.method_name}</span>: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="ident">execution_point</span><span class="punct">.</span><span class="ident">proceed</span>
  <span class="keyword">ensure</span>
    <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Leaving:  <span class="expr">#{execution_point.target_type.name}</span>#<span class="expr">#{execution_point.method_name}</span>: args = <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">After advising the private methods. Notice that #intialize is advised:</span><span class="punct">&quot;</span>
<span class="ident">foo2</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Foo</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a9</span><span class="punct">,</span> <span class="symbol">:a10</span>
<span class="ident">foo2</span><span class="punct">.</span><span class="ident">do_it</span> <span class="symbol">:b9</span><span class="punct">,</span> <span class="symbol">:b10</span>

<span class="ident">bar1</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Bar</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:a11</span><span class="punct">,</span> <span class="symbol">:a12</span>
<span class="ident">bar1</span><span class="punct">.</span><span class="ident">do_something_else</span> <span class="symbol">:b11</span><span class="punct">,</span> <span class="symbol">:b12</span>

</code></pre><h3>&#8220;Enhancing&#8221; <code>method_missing</code> Without Overriding</h3>
<p>Here is an example of &#8220;advising&#8221; <code>method_missing</code> to add behavior, rather than overriding it, which can increase the risk of collisions with overrides from other toolkits:</p>
<pre class="ruby"><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="comment"># Example demonstrating &quot;around&quot; advice for method_missing. This is a technique for</span>
<span class="comment"># avoiding collisions when different toolkits want to override method_missing in the</span>
<span class="comment"># same classes, e.g., Object. Using around advice as shown allows a toolkit to add </span>
<span class="comment"># custom behavior while invoking the &quot;native&quot; method_missing to handle unrecognized</span>
<span class="comment"># method calls.</span>
<span class="comment"># Note that it is essential to use around advice, not before or after advice, because</span>
<span class="comment"># neither can prevent the call to the &quot;wrapped&quot; method_missing, which is presumably</span>
<span class="comment"># not what you want.</span>
<span class="comment"># In this (contrived) example, an Echo class uses method_missing to simply echo</span>
<span class="comment"># the method name and arguments. An aspect is used to intercept any calls to a </span>
<span class="comment"># fictitious &quot;log&quot; method and handle those in a different way.</span>

<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">Echo</span>
    <span class="keyword">def </span><span class="method">method_missing</span> <span class="ident">sym</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Echoing: <span class="expr">#{sym.to_s}</span>: <span class="expr">#{args.join(&quot; &quot;)}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
    <span class="keyword">def </span><span class="method">respond_to?</span> <span class="ident">sym</span><span class="punct">,</span> <span class="ident">include_private</span> <span class="punct">=</span> <span class="constant">false</span>
      <span class="constant">true</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Before advising Echo:</span><span class="punct">&quot;</span>
<span class="ident">echo1</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Echo</span><span class="punct">.</span><span class="ident">new</span>
<span class="ident">echo1</span><span class="punct">.</span><span class="ident">say</span> <span class="punct">&quot;</span><span class="string">hello</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">world!</span><span class="punct">&quot;</span>
<span class="ident">echo1</span><span class="punct">.</span><span class="ident">log</span> <span class="punct">&quot;</span><span class="string">something</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">interesting...</span><span class="punct">&quot;</span>
<span class="ident">echo1</span><span class="punct">.</span><span class="ident">shout</span> <span class="punct">&quot;</span><span class="string">theater</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">in</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">a</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">crowded</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">firehouse!</span><span class="punct">&quot;</span>

<span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Aspects</span><span class="punct">::</span><span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:around</span><span class="punct">,</span> 
  <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="symbol">:method_missing</span><span class="punct">,</span> <span class="symbol">:for_type</span> <span class="punct">=&gt;</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Echo</span><span class="punct">,</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">join_point</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="ident">sym</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="keyword">if</span> <span class="ident">sym</span> <span class="punct">==</span> <span class="symbol">:log</span> 
    <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">--- Sending to log: <span class="expr">#{args.join(&quot; &quot;)}</span></span><span class="punct">&quot;</span> 
  <span class="keyword">else</span>
    <span class="ident">join_point</span><span class="punct">.</span><span class="ident">proceed</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">After advising Echo:</span><span class="punct">&quot;</span>
<span class="ident">echo2</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Echo</span><span class="punct">.</span><span class="ident">new</span>
<span class="ident">echo2</span><span class="punct">.</span><span class="ident">say</span> <span class="punct">&quot;</span><span class="string">hello</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">world!</span><span class="punct">&quot;</span>
<span class="ident">echo2</span><span class="punct">.</span><span class="ident">log</span> <span class="punct">&quot;</span><span class="string">something</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">interesting...</span><span class="punct">&quot;</span>
<span class="ident">echo2</span><span class="punct">.</span><span class="ident">shout</span> <span class="punct">&quot;</span><span class="string">theater</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">in</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">a</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">crowded</span><span class="punct">&quot;,</span> <span class="punct">&quot;</span><span class="string">firehouse!</span><span class="punct">&quot;</span>

</code></pre><h3>&#8220;Wrapping&#8221; an Exception: Rescuing one type and raising another</h3>
<p>While it&#8217;s tempting to try this with :after_raising advice, this won&#8217;t work, because you can&#8217;t change the control flow with any form of advice, except for :around advice. (See, however, feature request #19119.) Here is the idiom to use.</p>
<pre class="ruby"><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="comment"># Example demonstrating &quot;wrapping&quot; an exception; rescuing an exception and </span>
<span class="comment"># throwing a different one. A common use for this is to map exceptions across</span>
<span class="comment"># &quot;domain&quot; boundaries, e.g., persistence and application logic domains. </span>
<span class="comment"># Note that you must use :around advice, since :after_raising cannot change</span>
<span class="comment"># the control flow.</span>
<span class="comment"># (However, see feature request #19119)</span>

<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">Exception1</span> <span class="punct">&lt;</span> <span class="constant">Exception</span><span class="punct">;</span> <span class="keyword">end</span>
  <span class="keyword">class </span><span class="class">Exception2</span> <span class="punct">&lt;</span> <span class="constant">Exception</span><span class="punct">;</span> <span class="keyword">end</span>
  <span class="keyword">class </span><span class="class">NewException</span> <span class="punct">&lt;</span> <span class="constant">Exception</span><span class="punct">;</span> <span class="keyword">end</span>

  <span class="keyword">class </span><span class="class">Raiser</span>
    <span class="keyword">def </span><span class="method">raise_exception1</span>
      <span class="keyword">raise</span> <span class="constant">Exception1</span><span class="punct">.</span><span class="ident">new</span><span class="punct">(&quot;</span><span class="string">one</span><span class="punct">&quot;)</span>
    <span class="keyword">end</span>
    <span class="keyword">def </span><span class="method">raise_exception2</span>
      <span class="keyword">raise</span> <span class="constant">Exception2</span><span class="punct">.</span><span class="ident">new</span><span class="punct">(&quot;</span><span class="string">two</span><span class="punct">&quot;)</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Aspects</span><span class="punct">::</span><span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:around</span><span class="punct">,</span> 
  <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="punct">/</span><span class="regex">^raise_exception</span><span class="punct">/,</span> <span class="symbol">:in_type</span> <span class="punct">=&gt;</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Raiser</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="keyword">begin</span>
    <span class="ident">jp</span><span class="punct">.</span><span class="ident">proceed</span>
  <span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Exception1</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
    <span class="keyword">raise</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">NewException</span><span class="punct">.</span><span class="ident">new</span><span class="punct">(&quot;</span><span class="string">Old exception message was <span class="escape">\&quot;</span><span class="expr">#{e.message}</span><span class="escape">\&quot;</span></span><span class="punct">&quot;)</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">The raised Aquarium::Exception2 raised here won't be intercepted:</span><span class="punct">&quot;</span>
<span class="keyword">begin</span>
  <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Raiser</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">raise_exception2</span>
<span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Exception2</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Rescued exception: <span class="expr">#{e.class}</span> with message: <span class="expr">#{e}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">The raised Aquarium::Exception1 raised here will be intercepted and Aquarium::NewException will be raised:</span><span class="punct">&quot;</span>
<span class="keyword">begin</span>
  <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Raiser</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">raise_exception1</span>
<span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">NewException</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Rescued exception: <span class="expr">#{e.class}</span> with message: <span class="expr">#{e}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>
</code></pre><h3>&#8220;Hack&#8221; to Create a Reusable Aspect that Is Defined When a Module is Included in Another</h3>
<p>It&#8217;s actually harder than it should be to define a reusable aspect, because the aspect is evaluated when it&#8217;s defined, which means the pointcut needs to be known at that time. Feature request #19122 will address this issue. For now, here&#8217;s a hack that works around the limitation. Make sure you heed the warning!</p>
<pre class="ruby"><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="comment"># Example demonstrating a hack for defining a reusable aspect in a module</span>
<span class="comment"># so that the aspect only gets created when the module is included by another</span>
<span class="comment"># module or class.</span>
<span class="comment"># Hacking like this defies the spirit of Aquarium's goal of being &quot;intuitive&quot;,</span>
<span class="comment"># so I created a feature request #19122 to address this problem.</span>
<span class="comment">#</span>
<span class="comment"># WARNING: put the &quot;include ...&quot; statement at the END of the class declaration,</span>
<span class="comment"># as shown below. If you put the include statement at the beginning, as you</span>
<span class="comment"># normally wouuld for including a module, it won't advice any join points, </span>
<span class="comment"># because no methods will have been defined at that point!!</span>
 
<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">module </span><span class="module">Reusables</span>
    <span class="keyword">module </span><span class="module">TraceMethods</span>
      <span class="keyword">def </span><span class="method">self.append_features</span> <span class="ident">mod</span>
        <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Aspects</span><span class="punct">::</span><span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:around</span><span class="punct">,</span> 
            <span class="symbol">:type</span> <span class="punct">=&gt;</span> <span class="ident">mod</span><span class="punct">,</span> <span class="symbol">:methods</span> <span class="punct">=&gt;</span> <span class="symbol">:all</span><span class="punct">,</span> <span class="symbol">:method_options</span> <span class="punct">=&gt;</span> <span class="punct">[</span><span class="symbol">:exclude_ancestor_methods</span><span class="punct">]</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">object</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
          <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Entering: </span><span class="punct">&quot;+</span><span class="ident">jp</span><span class="punct">.</span><span class="ident">target_type</span><span class="punct">.</span><span class="ident">name</span><span class="punct">+&quot;</span><span class="string">#</span><span class="punct">&quot;+</span><span class="ident">jp</span><span class="punct">.</span><span class="ident">method_name</span><span class="punct">.</span><span class="ident">to_s</span><span class="punct">+&quot;</span><span class="string">: args = </span><span class="punct">&quot;+</span><span class="ident">args</span><span class="punct">.</span><span class="ident">inspect</span>
          <span class="ident">jp</span><span class="punct">.</span><span class="ident">proceed</span>
          <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Leaving:  </span><span class="punct">&quot;+</span><span class="ident">jp</span><span class="punct">.</span><span class="ident">target_type</span><span class="punct">.</span><span class="ident">name</span><span class="punct">+&quot;</span><span class="string">#</span><span class="punct">&quot;+</span><span class="ident">jp</span><span class="punct">.</span><span class="ident">method_name</span><span class="punct">.</span><span class="ident">to_s</span><span class="punct">+&quot;</span><span class="string">: args = </span><span class="punct">&quot;+</span><span class="ident">args</span><span class="punct">.</span><span class="ident">inspect</span>
        <span class="keyword">end</span>
      <span class="keyword">end</span>
    <span class="keyword">end</span>    
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="keyword">class </span><span class="class">NotTraced1</span>
  <span class="keyword">def </span><span class="method">doit</span><span class="punct">;</span> <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">NotTraced1#doit</span><span class="punct">&quot;;</span> <span class="keyword">end</span>
<span class="keyword">end</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">You will be warned that no join points in NotTraced2 were matched.</span><span class="punct">&quot;</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This happens because the include statement and hence the aspect evaluation happen BEFORE any methods are defined!</span><span class="punct">&quot;</span>
<span class="keyword">class </span><span class="class">NotTraced2</span>
  <span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Reusables</span><span class="punct">::</span><span class="constant">TraceMethods</span>
  <span class="keyword">def </span><span class="method">doit</span><span class="punct">;</span> <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">NotTraced2#doit</span><span class="punct">&quot;;</span> <span class="keyword">end</span>
<span class="keyword">end</span>
<span class="keyword">class </span><span class="class">Traced1</span>
  <span class="keyword">def </span><span class="method">doit</span><span class="punct">;</span> <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Traced1#doit</span><span class="punct">&quot;;</span> <span class="keyword">end</span>
  <span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Reusables</span><span class="punct">::</span><span class="constant">TraceMethods</span>
<span class="keyword">end</span>
<span class="keyword">class </span><span class="class">Traced2</span>
  <span class="keyword">def </span><span class="method">doit</span><span class="punct">;</span> <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Traced1#doit</span><span class="punct">&quot;;</span> <span class="keyword">end</span>
  <span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Reusables</span><span class="punct">::</span><span class="constant">TraceMethods</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string"></span><span class="punct">&quot;</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">No method tracing:</span><span class="punct">&quot;</span>
<span class="constant">NotTraced1</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">doit</span>
<span class="constant">NotTraced1</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">doit</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string"></span><span class="punct">&quot;</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Method tracing:</span><span class="punct">&quot;</span>
<span class="constant">Traced1</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">doit</span>
<span class="constant">Traced2</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">doit</span>
</code></pre><h3>Aspect Design</h3>
<p>The <span class="caps">AOP</span> community is still discovering good design principles. However, simple extensions of good <span class="caps">OOD</span> principles are an important step. Many of those principles focus on minimal coupling between components and, in particular, coupling through abstractions, rather than concrete details.</p>
<p>In this example, we demonstrate how one module defines a pointcut representing an object&#8217;s state changes. An &#8220;observer&#8221; aspect watches for those changes and prints a message when updates occur. Hence, the example demonstrates one implementation of the Observer Pattern.</p>
<p>Notice how the aspect is independent of the details of the pointcut, so it won&#8217;t require change as the observed class evolves.</p>
<pre class="ruby"><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="comment"># Example demonstrating emerging ideas about good aspect-oriented design. Specifically, this </span>
<span class="comment"># example follows ideas of Jonathan Aldrich on &quot;Open Modules&quot;, where a &quot;module&quot; (in the generic</span>
<span class="comment"># sense of the word...) is responsible for defining and maintaining the pointcuts that it is </span>
<span class="comment"># willing to expose to potential aspects. Aspects are only allowed to advise the module through</span>
<span class="comment"># the pointcut. (Enforcing this constraint is TBD)</span>
<span class="comment"># Griswold, Sullivan, and collaborators have expanded on these ideas. See their IEEE Software,</span>
<span class="comment"># March 2006 paper.</span>

<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">ClassWithStateAndBehavior</span>
    <span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">DSL</span>
    <span class="keyword">def </span><span class="method">initialize</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="attribute">@state</span> <span class="punct">=</span> <span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">Initializing: <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
    <span class="ident">attr_accessor</span> <span class="symbol">:state</span>
  
    <span class="comment"># Two alternative versions of the following pointcut would be </span>
    <span class="comment"># STATE_CHANGE = pointcut :method =&gt; :state=</span>
    <span class="comment"># STATE_CHANGE = pointcut :attribute =&gt; :state, :attribute_options =&gt; [:writers]</span>
    <span class="comment"># Note that only matching on the attribute writers is important, especially</span>
    <span class="comment"># given the advice block below, because if the reader is allowed to be advised,</span>
    <span class="comment"># we get an infinite recursion of advice invocation! The correct solution is</span>
    <span class="comment"># the planned extension of the pointcut language to support condition tests for</span>
    <span class="comment"># context. I.e., we don't want the advice applied when it's already inside advice.</span>
    <span class="constant">STATE_CHANGE</span> <span class="punct">=</span> <span class="ident">pointcut</span> <span class="symbol">:writing</span> <span class="punct">=&gt;</span> <span class="symbol">:state</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Aspects</span>

<span class="comment"># Observe state changes in the class, using the class-defined pointcut.</span>
<span class="comment"># Two ways of referencing the pointcut are shown. The first assumes you know the particular</span>
<span class="comment"># pointcuts you care about. The second is more general; it uses the recently-introduced</span>
<span class="comment"># :named_pointcut feature to search for all pointcuts matching a name in a set of types.</span>

<span class="ident">observer1</span> <span class="punct">=</span> <span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:after</span><span class="punct">,</span> 
  <span class="symbol">:pointcut</span> <span class="punct">=&gt;</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">ClassWithStateAndBehavior</span><span class="punct">::</span><span class="constant">STATE_CHANGE</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">State has changed. </span><span class="punct">&quot;</span>
  <span class="ident">state</span> <span class="punct">=</span> <span class="ident">obj</span><span class="punct">.</span><span class="ident">state</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">  New state is <span class="expr">#{state.nil? ? 'nil' : state.inspect}</span></span><span class="punct">&quot;</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">  Equivalent to *args: <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>  

<span class="ident">observer2</span> <span class="punct">=</span> <span class="constant">Aspect</span><span class="punct">.</span><span class="ident">new</span> <span class="symbol">:after</span><span class="punct">,</span> <span class="symbol">:named_pointcuts</span> <span class="punct">=&gt;</span> <span class="punct">{</span><span class="symbol">:matching</span> <span class="punct">=&gt;</span> <span class="punct">/</span><span class="regex">CHANGE</span><span class="punct">/,</span> 
    <span class="symbol">:within_types</span> <span class="punct">=&gt;</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">ClassWithStateAndBehavior</span><span class="punct">}</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">State has changed. </span><span class="punct">&quot;</span>
  <span class="ident">state</span> <span class="punct">=</span> <span class="ident">obj</span><span class="punct">.</span><span class="ident">state</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">  New state is <span class="expr">#{state.nil? ? 'nil' : state.inspect}</span></span><span class="punct">&quot;</span>
  <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">  Equivalent to *args: <span class="expr">#{args.inspect}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>  

<span class="ident">object</span> <span class="punct">=</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">ClassWithStateAndBehavior</span><span class="punct">.</span><span class="ident">new</span><span class="punct">(</span><span class="symbol">:a1</span><span class="punct">,</span> <span class="symbol">:a2</span><span class="punct">,</span> <span class="symbol">:a3</span><span class="punct">)</span>
<span class="ident">object</span><span class="punct">.</span><span class="ident">state</span> <span class="punct">=</span> <span class="punct">[</span><span class="symbol">:b1</span><span class="punct">,</span> <span class="symbol">:b2</span><span class="punct">]</span></code></pre><h3>Design by Contract</h3>
<p>It is easy to use <span class="keyword">Aquarium</span> to implement a &#8220;contract&#8221; for a Module, in the sense of Bertrand Meyer&#8217;s &#8220;Design by Contract&#8221;. In fact, there is a simple DbC module (not a complete implementation&#8230;) in the <a href="rdoc/files/lib/aquarium/extras_rb.html">extras</a>, which this example uses:</p>
<pre class="ruby"><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="comment"># Example demonstrating &quot;Design by Contract&quot;, Bertrand Meyer's idea for programmatically-</span>
<span class="comment"># specifying the contract of use for a class or module and testing it at runtime (usually</span>
<span class="comment"># during the testing process)</span>
<span class="comment"># This example is adapted from spec/extras/design_by_contract_spec.rb.</span>
<span class="comment"># Note: the DesignByContract module adds the #precondition, #postcondition, and #invariant</span>
<span class="comment"># methods shown below to Object and they use &quot;self&quot; as the :object to advise.  </span>
 
<span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium/extras/design_by_contract</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">PreCond</span>
    <span class="keyword">def </span><span class="method">action</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">inside :action</span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
  
    <span class="ident">precondition</span> <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="symbol">:action</span><span class="punct">,</span> <span class="symbol">:message</span> <span class="punct">=&gt;</span> <span class="punct">&quot;</span><span class="string">Must pass more than one argument.</span><span class="punct">&quot;</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
      <span class="ident">args</span><span class="punct">.</span><span class="ident">size</span> <span class="punct">&gt;</span> <span class="number">0</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>
  
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This call will fail because the precondition is not satisfied:</span><span class="punct">&quot;</span>
<span class="keyword">begin</span>
  <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">PreCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">action</span>
<span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Extras</span><span class="punct">::</span><span class="constant">DesignByContract</span><span class="punct">::</span><span class="constant">ContractError</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
  <span class="ident">p</span> <span class="ident">e</span><span class="punct">.</span><span class="ident">inspect</span>
<span class="keyword">end</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This call will pass because the precondition is satisfied:</span><span class="punct">&quot;</span>
<span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">PreCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">action</span> <span class="symbol">:a1</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">PostCond</span>
    <span class="keyword">def </span><span class="method">action</span> <span class="punct">*</span><span class="ident">args</span>
      <span class="ident">args</span><span class="punct">.</span><span class="ident">empty?</span> <span class="punct">?</span> <span class="ident">args</span><span class="punct">.</span><span class="ident">dup</span> <span class="punct">:</span> <span class="ident">args</span> <span class="punct">+</span> <span class="punct">[</span><span class="symbol">:a</span><span class="punct">]</span>
    <span class="keyword">end</span>
  
    <span class="ident">postcondition</span> <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="symbol">:action</span><span class="punct">,</span> 
      <span class="symbol">:message</span> <span class="punct">=&gt;</span> <span class="punct">&quot;</span><span class="string">Must return a copy of the input args with :a appended to it.</span><span class="punct">&quot;</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
      <span class="ident">jp</span><span class="punct">.</span><span class="ident">context</span><span class="punct">.</span><span class="ident">returned_value</span><span class="punct">.</span><span class="ident">size</span> <span class="punct">==</span> <span class="ident">args</span><span class="punct">.</span><span class="ident">size</span> <span class="punct">+</span> <span class="number">1</span> <span class="punct">&amp;&amp;</span> <span class="ident">jp</span><span class="punct">.</span><span class="ident">context</span><span class="punct">.</span><span class="ident">returned_value</span><span class="punct">[-</span><span class="number">1</span><span class="punct">]</span> <span class="punct">==</span> <span class="symbol">:a</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">These two calls will fail because the postcondition is not satisfied:</span><span class="punct">&quot;</span>
<span class="keyword">begin</span>
  <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">PostCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">action</span>
<span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Extras</span><span class="punct">::</span><span class="constant">DesignByContract</span><span class="punct">::</span><span class="constant">ContractError</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
  <span class="ident">p</span> <span class="ident">e</span><span class="punct">.</span><span class="ident">inspect</span>
<span class="keyword">end</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This call will pass because the postcondition is satisfied:</span><span class="punct">&quot;</span>
<span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">PostCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">action</span>  <span class="symbol">:x1</span><span class="punct">,</span> <span class="symbol">:x2</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">class </span><span class="class">InvarCond</span>
    <span class="keyword">def </span><span class="method">initialize</span> 
      <span class="attribute">@invar</span> <span class="punct">=</span> <span class="number">0</span>
    <span class="keyword">end</span>
    <span class="ident">attr_reader</span> <span class="symbol">:invar</span>
    <span class="keyword">def </span><span class="method">good_action</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">inside :good_action</span><span class="punct">&quot;</span>
    <span class="keyword">end</span>
    <span class="keyword">def </span><span class="method">bad_action</span>
      <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">inside :bad_action</span><span class="punct">&quot;</span>
      <span class="attribute">@invar</span> <span class="punct">=</span> <span class="number">1</span>
    <span class="keyword">end</span>
  
    <span class="ident">invariant</span> <span class="symbol">:calls_to</span> <span class="punct">=&gt;</span> <span class="punct">/</span><span class="regex">action$</span><span class="punct">/,</span> <span class="symbol">:message</span> <span class="punct">=&gt;</span> <span class="punct">&quot;</span><span class="string">Must not change the @invar value.</span><span class="punct">&quot;</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">jp</span><span class="punct">,</span> <span class="ident">obj</span><span class="punct">,</span> <span class="punct">*</span><span class="ident">args</span><span class="punct">|</span>
      <span class="ident">obj</span><span class="punct">.</span><span class="ident">invar</span> <span class="punct">==</span> <span class="number">0</span>
    <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This call will fail because the invariant is not satisfied:</span><span class="punct">&quot;</span>
<span class="keyword">begin</span>
  <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">InvarCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">bad_action</span>
<span class="keyword">rescue</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Extras</span><span class="punct">::</span><span class="constant">DesignByContract</span><span class="punct">::</span><span class="constant">ContractError</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
  <span class="ident">p</span> <span class="ident">e</span><span class="punct">.</span><span class="ident">inspect</span>
<span class="keyword">end</span>
<span class="ident">p</span> <span class="punct">&quot;</span><span class="string">This call will pass because the invariant is satisfied:</span><span class="punct">&quot;</span>
<span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">InvarCond</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">good_action</span>
</code></pre><p>Other examples can be found in the <a href="rdoc/files/README.html"><span class="caps">README</span></a>.</p>
<h3>Testing Uses of Aspects</h3>
<p>Aspects are sometimes used for &#8220;fault injection&#8221;, to enable easier testing of error handling logic, and for stubbing expensive methods, using around advice. The latter technique complements mocking frameworks. You can see an example of stubbing the expensive <code>TypeUtils#descendents</code> in <code>Aquarium::TypeUtilsStub</code> (in <code>spec_example_types.rb</code>) and the use of it in <code>spec/aquarium/aspects/pointcut_spec.rb</code>.</p>
<h3>Mimicking <i>Introductions</i> (a.k.a. <i>Intertype Declarations</i>)</h3>
<p>AspectJ lets Java programmers add new methods and attributes to types. Ruby makes this easy however, so Aquarium doesn&#8217;t provide a similar facility. However, if you need to extend a set of types, Aquarium&#8217;s <code>TypeFinder</code> can be helpful, as shown here:</p>
<pre class="ruby"><code><span class="global">$LOAD_PATH</span><span class="punct">.</span><span class="ident">unshift</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span> <span class="punct">+</span> <span class="punct">'</span><span class="string">/../lib</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">aquarium</span><span class="punct">'</span>

<span class="keyword">module </span><span class="module">Aquarium</span>
  <span class="keyword">module </span><span class="module">TypeFinderIntroductionExampleTargetModule1</span>
  <span class="keyword">end</span>
  <span class="keyword">module </span><span class="module">TypeFinderIntroductionExampleTargetModule2</span>
  <span class="keyword">end</span>
  <span class="keyword">class </span><span class="class">TypeFinderIntroductionExampleTargetClass1</span>
  <span class="keyword">end</span>
  <span class="keyword">class </span><span class="class">TypeFinderIntroductionExampleTargetClass2</span>
  <span class="keyword">end</span>
  <span class="keyword">module </span><span class="module">TypeFinderIntroductionExampleModule</span>
    <span class="keyword">def </span><span class="method">introduced_method</span><span class="punct">;</span> <span class="keyword">end</span>
  <span class="keyword">end</span>
<span class="keyword">end</span>

<span class="ident">include</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">Finders</span>

<span class="comment"># First, find the types</span>

<span class="ident">found</span> <span class="punct">=</span> <span class="constant">TypeFinder</span><span class="punct">.</span><span class="ident">new</span><span class="punct">.</span><span class="ident">find</span> <span class="symbol">:types</span> <span class="punct">=&gt;</span> <span class="punct">/</span><span class="regex">Aquarium::TypeFinderIntroductionExampleTarget</span><span class="punct">/</span>

<span class="comment"># Now, iterate through them and &quot;extend&quot; them with the module defining the new behavior.</span>

<span class="ident">found</span><span class="punct">.</span><span class="ident">each</span> <span class="punct">{|</span><span class="ident">t</span><span class="punct">|</span> <span class="ident">t</span><span class="punct">.</span><span class="ident">extend</span> <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">TypeFinderIntroductionExampleModule</span> <span class="punct">}</span>

<span class="comment"># See if the &quot;introduced&quot; modules's method is there.</span>

<span class="punct">[</span><span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">TypeFinderIntroductionExampleTargetModule1</span><span class="punct">,</span> 
 <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">TypeFinderIntroductionExampleTargetModule2</span><span class="punct">,</span>
 <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">TypeFinderIntroductionExampleTargetClass1</span><span class="punct">,</span>
 <span class="constant">Aquarium</span><span class="punct">::</span><span class="constant">TypeFinderIntroductionExampleTargetClass2</span><span class="punct">].</span><span class="ident">each</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">t</span><span class="punct">|</span>
   <span class="ident">p</span> <span class="punct">&quot;</span><span class="string">type <span class="expr">#{t}</span>, method there? <span class="expr">#{t.methods.include?(&quot;introduced_method&quot;)}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>
</code></pre>
    
    <div id="footer">
    <div id="copyright">Copyright &copy; 2007-2008, Aquarium Development Team, All Rights Reserved</div>
    </div>
  </div>
</div>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-2456359-1";
urchinTracker();
</script>
</body>
</html>
