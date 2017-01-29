import {Injectable} from "@angular/core";
import {BrowserWindowRef} from "../_utils/browser-window-ref";

@Injectable()
export class AppleStandaloneService {

    public isAppleStandalone: boolean;

    constructor(private browserWindowRef: BrowserWindowRef) {
        this.isAppleStandalone =
            !!(this.browserWindowRef.window.navigator && (this.browserWindowRef.window.navigator as any).standalone);
    }
}