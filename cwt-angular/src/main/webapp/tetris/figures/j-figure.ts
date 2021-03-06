import {Figure} from "./figure";
import {Grid} from "../grid/grid";
import {Cell} from "../grid/cell";

export class JFigure extends Figure {

    private centerIndex : number = 0;

    constructor(color: String, grid: Grid) {
        super(color, grid);
        this.initCenterIndex();
    }

    createFigure(grid: Grid): Cell[] {
        let cells = new Array();

        let middleOfGrid = Math.ceil(grid.getNumberOfCellsHorizontal() / 2);

        for (let i = 0; i < 4; i++) {
            if (i == 3) {
                cells.push(new Cell(middleOfGrid - 1, i - 1, this.getColor(), grid.getCellWidth()));
            } else {
                cells.push(new Cell(middleOfGrid, i, this.getColor(), grid.getCellWidth()));
            }
        }
        return cells;
    }

    initCenterIndex(): void {
        this.setCenterIndex(1);
    }

    rotateFigure(clone: any): void {
        switch (this.getRotateCounter()) {

            case 0:
                for (let i = 0; i < this.getCells().length - 1; i++) {
                    if (i === clone.centerIndex) continue;
                    this.getCells()[i].setXPos(clone.cells[clone.indexOfSmallestXPosition].xPos + i);
                    this.getCells()[i].setYPos(clone.cells[clone.indexOfSmallestYPosition].yPos + 1);

                }
                this.getCells()[this.getCells().length - 1].setXPos(clone.cells[clone.cells.length - 1].xPos);
                this.getCells()[this.getCells().length - 1].setYPos(clone.cells[clone.indexOfSmallestYPosition].yPos);

                break;

            case 1:
                for (let i = 0; i < this.getCells().length - 1; i++) {
                    if (i === clone.centerIndex) continue;
                    this.getCells()[i].setXPos(clone.cells[clone.indexOfSmallestXPosition].xPos + 1);
                    this.getCells()[i].setYPos(clone.cells[clone.indexOfSmallestYPosition].yPos + i);
                }
                this.getCells()[this.getCells().length - 1].setXPos(clone.cells[clone.indexOfHighestXPosition].xPos);
                this.getCells()[this.getCells().length - 1].setYPos(clone.cells[clone.cells.length - 1].yPos);

                break;

            case 2:
                for (let i = 0; i < this.getCells().length - 1; i++) {
                    if (i === clone.centerIndex) continue;
                    this.getCells()[i].setXPos(clone.cells[clone.indexOfHighestXPosition].xPos - i);
                    this.getCells()[i].setYPos(clone.cells[clone.indexOfHighestYPosition].yPos - 1);

                }
                this.getCells()[this.getCells().length - 1].setXPos(clone.cells[clone.cells.length - 1].xPos);
                this.getCells()[this.getCells().length - 1].setYPos(clone.cells[clone.indexOfHighestYPosition].yPos);
                break;

            case 3:
                for (let i = 0; i < this.getCells().length - 1; i++) {
                    if (i === clone.centerIndex) continue;
                    this.getCells()[i].setXPos(clone.cells[clone.indexOfHighestXPosition].xPos - 1);
                    this.getCells()[i].setYPos(clone.cells[clone.indexOfHighestYPosition].yPos - i);
                }
                this.getCells()[this.getCells().length - 1].setXPos(clone.cells[clone.indexOfSmallestXPosition].xPos);
                this.getCells()[this.getCells().length - 1].setYPos(clone.cells[clone.cells.length - 1].yPos);
                this.setRotateCounter(-1);

                break;
        }
    }

    public setCenterIndex(index: number) {
        this.centerIndex = index;
    }

    public getCenterIndex(): number {
        return this.centerIndex;
    }

}