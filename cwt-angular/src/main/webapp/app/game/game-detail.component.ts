import {Component} from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {RequestService} from "../_services/request.service";
import {
    Comment,
    CommentDto,
    GameDetailDto,
    JwtUser,
    PlayoffTreeBetDto,
    Rating,
    RatingDto,
    RatingType,
    User
} from "../custom";
import {AuthService} from "../_services/auth.service";
import {finalize} from "rxjs/operators";
import {BetResult, BetService} from "../_services/bet.service";
import {PlayoffsService} from "../_services/playoffs.service";

@Component({
    selector: 'cwt-game-detail',
    template: require('./game-detail.component.html')
})
export class GameDetailComponent {

    submittingComment: boolean;
    submittingRating: RatingType;
    game: GameDetailDto;
    newComment: CommentDto;
    authenticatedUser: JwtUser;
    betResult: BetResult;
    gameWasPlayed: boolean;

    constructor(private requestService: RequestService, private route: ActivatedRoute,
                private authService: AuthService, private betService: BetService,
                private playoffService: PlayoffsService) {
    }

    public get winningUser(): User {
        return this.game.scoreHome > this.game.scoreAway ? this.game.homeUser : this.game.awayUser;
    }

    get authenticatedUserRatings(): RatingType[] {
        return this.authenticatedUser
            ? this.game.ratings.filter(r => r.user.id === this.authenticatedUser.id).map(r => r.type)
            : [];
    }

    get ratings(): { [key in RatingType]: Rating[] } {
        return {
            DARKSIDE: this.game.ratings.filter(r => r.type === "DARKSIDE"),
            LIGHTSIDE: this.game.ratings.filter(r => r.type === "LIGHTSIDE"),
            LIKE: this.game.ratings.filter(r => r.type === "LIKE"),
            DISLIKE: this.game.ratings.filter(r => r.type === "DISLIKE"),
        };
    }

    public ngOnInit(): void {
        this.route.paramMap.subscribe(routeParam => {
            this.requestService.get<GameDetailDto>(`game/${+routeParam.get('id')}`)
                .subscribe(res => {
                    this.game = res;
                    this.gameWasPlayed = this.playoffService.gameWasPlayed(this.game);

                    if (!this.gameWasPlayed) {
                        return;
                    }

                    this.game.comments = this.game.comments.sort((c1, c2) => c1 > c2 ? 1 : -1);

                    if (this.game.playoff != null) {
                        this.requestService.get<PlayoffTreeBetDto[]>(`game/${+routeParam.get('id')}/bets`)
                            .subscribe(res => this.betResult = this.betService.createBetResult(res));
                    }
                });
        });

        this.authenticatedUser = this.authService.getUserFromTokenPayload();
        if (this.authenticatedUser) this.initNewComment();
    }

    public submitComment(): void {
        this.submittingComment = true;
        this.requestService.post<Comment>(`game/${this.game.id}/comment`, this.newComment)
            .pipe(finalize(() => this.submittingComment = false))
            .subscribe(res => {
                this.game.comments.unshift(res);
                this.initNewComment();
            });
    }

    rate(ratingType: RatingType): void {
        this.submittingRating = ratingType;
        const payload: RatingDto = {type: ratingType, user: this.authenticatedUser.id};
        this.requestService.post<Rating>(`game/${this.game.id}/rating`, payload)
            .pipe(finalize(() => this.submittingRating = null))
            .subscribe(res => this.game.ratings.push(res));
    }

    private initNewComment() {
        this.newComment = {user: this.authenticatedUser.id, body: null};
    }
}
