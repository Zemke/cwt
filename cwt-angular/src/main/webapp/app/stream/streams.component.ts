import {Component, OnInit} from '@angular/core';
import {RequestService} from "../_services/request.service";
import {ChannelDto, StreamDto} from "../custom";
import {Utils} from "../_util/utils";
import {merge} from "rxjs";
import {finalize} from "rxjs/operators";
import {AuthService} from "../_services/auth.service";

@Component({
    selector: 'cwt-streams',
    template: require('./streams.component.html')
})
export class StreamsComponent implements OnInit {

    streams: StreamDto[] = [];
    loading: boolean;
    sortColumn: keyof StreamDto = "createdAt";
    sortAscending: boolean = false;
    displayChannelCreationButton: boolean = false;

    constructor(private requestService: RequestService, private utils: Utils, private authService: AuthService) {
    }

    async ngOnInit() {
        this.loading = true;

        merge(
            this.requestService.get<StreamDto[]>('stream', {'new': 'false'}),
            this.requestService.get<StreamDto[]>('stream', {'new': 'true'}),
        )
            .pipe(finalize(() => this.loading = false))
            .subscribe(res => {
                this.streams = this.utils.mergeDistinctBy<StreamDto>(this.streams, res, 'id');
                this.sortBy(this.sortColumn);
            });

        const authUser = await   this.authService.authState;
        if (authUser) {
            this.requestService.get<ChannelDto[]>('channel', {user: `${authUser.id}`})
                .pipe(finalize(() => this.loading = false))
                .subscribe(res => this.displayChannelCreationButton = !res.length);
        }
    }

    sortBy(sortColumn: keyof StreamDto) {
        if (sortColumn === this.sortColumn) {
            this.sortAscending = !this.sortAscending;
        } else {
            this.sortAscending = false;
            this.sortColumn = sortColumn;
        }

        if (this.sortColumn === 'createdAt') {
            this.streams.sort((a, b) => new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime());
        } else if (this.sortColumn === 'channel') {
            this.streams.sort((a, b) => a.channel.title.localeCompare(b.channel.title));
        } else if (this.sortColumn === 'viewCount') {
            this.streams.sort((a, b) => a.viewCount > b.viewCount ? 1 : -1);
        } else if (this.sortColumn === 'duration') {
            this.streams.sort((a, b) => this.utils.parseTwitchDurationFormat(a.duration) > this.utils.parseTwitchDurationFormat(b.duration) ? 1 : -1);
        }

        if (!this.sortAscending) this.streams.reverse();
    }
}
