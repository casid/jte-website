package gg.jte.website;

import io.javalin.Javalin;
import io.javalin.core.JavalinConfig;
import io.javalin.http.Context;
import io.javalin.http.staticfiles.Location;

public class Main {

    private static final TemplateRenderer renderer = new TemplateRenderer();

    public static void main(String[] args) {
        Javalin app = Javalin.create(Main::initConfig).start(7000);
        app.get("/", ctx -> render(ctx, new Page()));
    }

    private static void initConfig(JavalinConfig config) {
        config.addStaticFiles("/assets", "assets", Location.EXTERNAL);
    }

    private static void render(Context ctx, Page page) {
        renderer.render(page, ctx.res);
    }
}
