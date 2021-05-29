package gg.jte.website;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import gg.jte.resolve.DirectoryCodeResolver;
import io.javalin.Javalin;
import io.javalin.core.JavalinConfig;
import io.javalin.http.Context;
import io.javalin.http.staticfiles.Location;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UncheckedIOException;
import java.nio.file.Path;

public class Main {
    private static final boolean devSystem = System.getProperty("environment") == null;

    public static void main(String[] args) {
        TemplateEngine templateEngine = createTemplateEngine();

        Javalin app = Javalin.create(Main::initConfig).start(7000);
        app.get("/", ctx -> render(ctx, templateEngine));
    }

    private static void initConfig(JavalinConfig config) {
        config.addStaticFiles("/assets", "assets", Location.EXTERNAL);
    }

    private static TemplateEngine createTemplateEngine() {
        DirectoryCodeResolver codeResolver = new DirectoryCodeResolver(Path.of("src", "main", "jte"));
        if (devSystem) {
            TemplateEngine templateEngine = TemplateEngine.create(codeResolver, ContentType.Html);
            templateEngine.setBinaryStaticContent(true);
            return templateEngine;
        } else {
            return TemplateEngine.createPrecompiled(Path.of("jte-classes"), ContentType.Html);
        }
    }

    private static void render(Context ctx, TemplateEngine templateEngine) {
        Utf8ByteOutput output = new Utf8ByteOutput();
        templateEngine.render("home.jte", new Page(), output);

        HttpServletResponse response = ctx.res;

        response.setContentLength(output.getContentLength());
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);

        try (OutputStream os = response.getOutputStream()) {
            output.writeTo(os);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
}
