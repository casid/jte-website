package gg.jte.website;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import gg.jte.resolve.DirectoryCodeResolver;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UncheckedIOException;
import java.nio.file.Path;

public class TemplateRenderer {
    private final TemplateEngine templateEngine;

    public TemplateRenderer() {
        DirectoryCodeResolver codeResolver = new DirectoryCodeResolver(Path.of("src", "main", "jte"));
        if (Config.devSystem) {
            templateEngine = TemplateEngine.create(codeResolver, ContentType.Html);
            templateEngine.setBinaryStaticContent(true);
        } else {
            templateEngine = TemplateEngine.createPrecompiled(Path.of("jte-classes"), ContentType.Html);
        }
    }

    public void render(Page page, HttpServletResponse response) {
        Utf8ByteOutput output = new Utf8ByteOutput();
        templateEngine.render(page.getTemplate(), page, output);

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
