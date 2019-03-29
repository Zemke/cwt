import {Component, HostListener, OnInit} from '@angular/core';
import {RequestService} from "../_services/request.service";
import {Tournament} from "../custom";
import {CanDeactivateGuard, Deactivatable} from "../_services/can-deactivate-guard";
import {Observable} from "rxjs";
import {Toastr} from "../_services/toastr";

@Component({
    selector: 'cwt-admin-tournament-review',
    template: require('./admin-tournament-review.component.html'),
    providers: [CanDeactivateGuard]
})
export class AdminTournamentReviewComponent implements OnInit, Deactivatable {

    tournaments: Tournament[];
    selectedTournament: number;
    tournamentBeingEdited: number;
    reviewBeingEdited: String;

    constructor(private requestService: RequestService, private toastr: Toastr) {
    }

    ngOnInit(): void {
        this.requestService.get<Tournament[]>("tournament")
            .subscribe(res => this.tournaments = res.sort((a, b) => new Date(b.created).getFullYear() - new Date(a.created).getFullYear()))
    }

    canDeactivate(): Observable<boolean> | Promise<boolean> | boolean {
        return this.confirmUnsavedChanges();
    }

    @HostListener('window:beforeunload', ['$event'])
    confirmPageLeave($event: Event) {
        $event.returnValue = this.confirmUnsavedChanges();
        if (!$event.returnValue) $event.preventDefault();
    }

    confirmUnsavedChanges(): boolean {
        if (this.tournamentBeingEdited == null) return true;
        return this.tournaments.find(t => t.id === this.tournamentBeingEdited).review !== this.reviewBeingEdited
            ? confirm("You have unsaved changes. Do you really want to leave?")
            : true;
    }

    selectTournament(tournamentId: string) {
        if (!this.confirmUnsavedChanges()) {
            this.selectedTournament = this.tournamentBeingEdited;
            return;
        }

        this.tournamentBeingEdited = parseInt(tournamentId);
        this.reviewBeingEdited = this.tournaments.find(t => t.id === this.tournamentBeingEdited).review;
    }

    submit() {
        this.requestService.put<Tournament>(`tournament/${this.tournamentBeingEdited}`, {review: this.reviewBeingEdited} as Tournament)
            .subscribe(() => {
                this.toastr.success("Successfully saved.");
                this.tournaments[this.tournaments.findIndex(t => t.id === this.tournamentBeingEdited)].review =
                    this.reviewBeingEdited;
            })
    }
}
