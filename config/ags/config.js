import { bar } from "./bar/main.js";
import { launcher } from "./launcher/main.js";

App.config ({
    style: "./bar/style.css",
    windows: [
        bar(),
        launcher,
    ]
})
