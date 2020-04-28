import {Injectable} from "@angular/core";
import {JwtTokenPayload, JwtUser} from "../custom";

@Injectable()
export class AuthService {

    private static readonly AUTH_TOKEN_STORAGE_KEY = 'auth-token';

    public readonly authState: Promise<JwtUser | null>;
    public resolveAuthState: (token: string | null) => void;

    constructor() {
        this.authState = new Promise((resolve, _) =>
            this.resolveAuthState = token => resolve(token ? this.readToken(token).context.user : null));
    }

    public storeToken(token: string): void {
        return localStorage.setItem(AuthService.AUTH_TOKEN_STORAGE_KEY, token);
    }

    public getToken(): string {
        return localStorage.getItem(AuthService.AUTH_TOKEN_STORAGE_KEY);
    }

    public voidToken(): void {
        return localStorage.removeItem(AuthService.AUTH_TOKEN_STORAGE_KEY);
    }

    /**
     * Deprecated in favor of {@link authState}.
     *
     * @Deprecated
     */
    public getUserFromTokenPayload(): JwtUser {
        const tokenPayload: JwtTokenPayload = this.readToken(this.getToken());
        return tokenPayload && tokenPayload.context
            ? tokenPayload.context.user
            : null;
    }

    private readToken(token: string): JwtTokenPayload {
        return token ? JSON.parse(atob(token.split('.')[1])) : null
    }

    public validateToken() {
        try {
            const token = this.getToken();
            const readToken = token && this.readToken(token);
            return readToken.context
                && readToken.context.user
                && readToken.context.user.email
                && readToken.context.user.username
                && readToken.context.user.id;
        } catch (e) {
            return false;
        }
    }
}
