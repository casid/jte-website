package gg.jte.website;

public class Page {
    private final long created = System.nanoTime();

    public String getTemplate() {
        return "home.jte";
    }

    public String getRenderTime() {
        long duration = System.nanoTime() - created;
        double millis = duration / 1000000.0;

        return Math.round(millis * 1000.0) / 1000.0 + " milliseconds";
    }
}
