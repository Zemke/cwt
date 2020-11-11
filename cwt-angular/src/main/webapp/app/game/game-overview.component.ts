import {Component, Inject, Input, OnInit} from '@angular/core';
import {RequestService} from "../_services/request.service";
import {GameDetailDto, PageDto, Rating, RatingType, StreamDto} from "../custom";
import {APP_CONFIG, AppConfig} from "../app.config";
import {finalize} from "rxjs/operators";

@Component({
    selector: 'cwt-game-overview',
    template: require('./game-overview.component.html'),
    styles: [`
        .twitch-active {
            opacity: .25;
            transition: opacity .8s;
        }
    `]
})
export class GameOverviewComponent implements OnInit {

    @Input() user: number;

    pageOfGames: PageDto<GameDetailDto> = <PageDto<GameDetailDto>> {size: 10, start: 0};
    loading: boolean;
    twitchActive = false
    streams: StreamDto[];

    constructor(private requestService: RequestService, @Inject(APP_CONFIG) public appConfig: AppConfig) {
    }

    ngOnInit(): void {
        this.load();
    }

    sort(sortable: string, sortAscending: boolean) {
        this.pageOfGames.sortBy = sortable;
        this.pageOfGames.sortAscending = sortAscending;
        this.pageOfGames.start = 0;
        this.load();
    }

    goTo(start: number) {
        this.pageOfGames.start = start;
        this.load();
    }

    load() {
        this.loading = true;
        const queryParam = {
            ...(this.user != null && {user: this.user}),
            ...this.pageOfGames
        };
        this.requestService.getPaged<GameDetailDto>('game', queryParam)
            .pipe(finalize(() => this.loading = false))
            .subscribe(pageOfGames => this.pageOfGames = pageOfGames);
    }

    loadTwitchies() {
        if (this.streams?.length) return;
        this.requestService.get<StreamDto[]>('stream')
            .subscribe(res => this.streams = res)
        // todo list in template
    }


    filterRatings(ratings: Rating[], type: RatingType): Rating[] {
        return ratings.filter(r => r.type === type);
    }
}
