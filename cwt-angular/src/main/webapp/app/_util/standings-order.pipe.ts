import {Pipe, PipeTransform} from '@angular/core';
import {GameMinimalDto, StandingDto} from "../custom";

@Pipe({
    name: 'cwtStandingsOrder'
})
export class StandingsOrderPipe implements PipeTransform {

    transform(standings: StandingDto[], gamesOfGroup: GameMinimalDto[]): StandingDto[] {
        return standings.sort()
            .sort((a, b) => {
                const theirGame = gamesOfGroup.find(g =>
                    (g.homeUser.id === a.user.id && g.awayUser.id === b.user.id)
                    || (g.homeUser.id === b.user.id && g.awayUser.id === a.user.id));

                if (theirGame == null) {
                    return 0;
                } else if (a.user.id === theirGame.homeUser.id) {
                    return theirGame.scoreHome > theirGame.scoreAway ? -1 : +1;
                } else {
                    return theirGame.scoreAway > theirGame.scoreHome ? -1 : +1;
                }
            })
            .sort((a, b) => b.roundRatio - a.roundRatio)
            .sort((a, b) => b.gameRatio - a.gameRatio)
            .sort((a, b) => b.points - a.points);
    }
}
