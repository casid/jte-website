@param gg.jte.website.Page page

<!DOCTYPE html>
<html lang="en">
<head>
    <title>jte</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fast and lightweight template engine for Java">
    <link rel="icon" type="image/svg+xml" href="/assets/favicon.svg">
    <style type="text/css">
        html {
            height: 100%;
        }
        body {
            font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji;
            color: #fff;
            height: 100%;
            margin: 0;
            background-image: linear-gradient(#02aab0, #00cdac);
            background-repeat: no-repeat;
            background-attachment: fixed;
            line-height: 160%;
            padding: 0 10px;
            box-sizing: border-box;
        }
        .header {
            text-align: center;
        }
        h1 {
            font-weight: 500;
            line-height: 120%;
            margin-top: 30pt;
        }
        .header h1 {
            margin-top: 0;
        }
        .content {
            text-align: center;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        .footer {
            margin-top: 40pt;
            margin-bottom: 40pt;
            text-align: center;
        }
        a {
            color: #fff;
        }
        ul {
            text-align: left;
            width:auto;
            display: inline-block;
            padding: 0 20pt;
            margin: 0;
        }
        p, pre {
            text-align: left;
            max-width: 696px;
            width: 100%;
            box-sizing: border-box;
            margin-left: auto;
            margin-right: auto;
        }
        pre {
            padding: 5px 12px;
            background-color: #02aab0;
            overflow: auto;
        }
    </style>
</head>

<body>
    <a href="https://github.com/casid/jte" class="github-corner" aria-label="View source on GitHub"><svg width="80" height="80" viewBox="0 0 250 250" style="fill:#151513; color:#fff; position: fixed; top: 0; border: 0; right: 0;" aria-hidden="true"><path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path><path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"></path><path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"></path></svg></a><style>.github-corner:hover .octo-arm{animation:octocat-wave 560ms ease-in-out}@keyframes octocat-wave{0%,100%{transform:rotate(0)}20%,60%{transform:rotate(-25deg)}40%,80%{transform:rotate(10deg)}}@media (max-width:500px){.github-corner:hover .octo-arm{animation:none}.github-corner .octo-arm{animation:octocat-wave 560ms ease-in-out}}</style>

    <div class="header">
        <a href="https://github.com/casid/jte"><img alt="jte" src="/assets/jte-no-bg.svg" width="164" height="164"></a>
        <h1>A fast and lightweight<br>template engine for Java</h1>
        <img alt="jte in action" src="https://raw.githubusercontent.com/casid/jte/master/jte-intellij.gif" style="max-width:100%; margin-top: 30px; box-shadow: 0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);" width="696" height="312">
    </div>

    <div class="content">
        <h1>Why jte?</h1>
        <ul>
            <li>Compile time checked and context-sensitive</li>
            <li><a href="https://plugins.jetbrains.com/plugin/14521-jte">IntelliJ plugin</a> offering completion and refactoring support</li>
            <li>Hot reloading of templates during development</li>
            <li>Intuitive, easy to learn <a href="https://github.com/casid/jte/blob/master/DOCUMENTATION.md">syntax</a></li>
            <li>Blazing fast execution (<a href="https://github.com/casid/jte#performance">~100k renders/s</a> on a MacBook Pro 2015)</li>
            <li>Very small footprint (just one external dependency for HTML escaping)</li>
        </ul>

        <h1>🚀 Getting started</h1>
        <p>Create a new file <i>src/main/jte/hello.jte</i>:</p>
        <pre>&#x40;param String name
Hello &#36;{name}!
The current timestamp is &#36;{System.currentTimeMillis()}.</pre>
        <p>Add maven dependency</p>
        <pre>&lt;dependency&gt;
    &lt;groupId>gg.jte&lt;/groupId&gt;
    &lt;artifactId&gt;jte&lt;/artifactId&gt;
    &lt;version&gt;1.6.0&lt;/version&gt;
&lt;/dependency&gt;</pre>

        <p>Render the template:</p>
        <pre>// Tell jte where your template files are located
var codeResolver = new DirectoryCodeResolver(Path.of("src", "main", "jte"));

// Create the template engine (usually once per application)
var templateEngine = TemplateEngine.create(codeResolver, ContentType.Html);

// Render
var output = new StringOutput();
templateEngine.render("hello.jte", "World", output);
System.out.println(output);</pre>
        <p>Run the program and you should see this console output:</p>
        <pre>Hello World!
The current timestamp is ${System.currentTimeMillis()}.</pre>
        <p>Congratulations! You got jte up and running 🤘.</p>

        <h1>📚 Further reading</h1>
        <ul>
            <li><a href="https://github.com/casid/jte/blob/master/DOCUMENTATION.md">Official documentation</a></li>
            <li><a href="https://javalin.io/tutorials/jte">Simple webserver tutorial</a></li>
        </ul>
    </div>

    <div class="footer">
        <a href="https://github.com/casid/jte">jte</a> rendered this site in ${page.getRenderTime()}.<br>
        Running on <a href="https://javalin.io/">Javalin</a>.<br>
    </div>
</body>

</html>